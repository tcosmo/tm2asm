#define BASE 2
#define SEP 3

#define HEAP_SPACE 2000000

#define STACK_ONLY 1
#define HEAP_ONLY_SBRK 2
#define HEAP_ONLY_CALLOC 3

#define MEMORY_MODE STACK_ONLY

#if MEMORY_MODE == STACK_ONLY
unsigned char tape[HEAP_SPACE];
#elif MEMORY_MODE == HEAP_ONLY_SBRK
#include <unistd.h>
#elif MEMORY_MODE == HEAP_ONLY_CALLOC
#include <stdlib.h>
#endif

unsigned char* initial_below_head;

unsigned char* below_head;

unsigned char* initial_above_head;
unsigned char* above_head;

int steps_count = 0;

#define DEBUG 1

#if DEBUG >= 1
#include <stdio.h>
#include <time.h>
#endif

#if DEBUG == 2
void print_tape() {
  unsigned char* beg = initial_below_head;
  while (beg < below_head) {
    beg += 1;
    char* s = " ";
    if (beg == below_head)
      s = ". ";
    printf("%d%s", *beg, s);
  }
  beg = above_head;
  while (beg < initial_above_head) {
    printf("%d ", *beg);
    beg += 1;
  }
  printf("\n");
}
#endif

#define WRITE_MOVE(write, move)                     \
  {                                                 \
    steps_count += 1;                               \
    if (move == 'R') {                              \
      *below_head = write;                          \
      below_head += 1;                              \
                                                    \
      if (*below_head == SEP || *above_head == SEP) \
        return -1;                                  \
                                                    \
      if (*above_head == BASE)                      \
        *below_head = 0;                            \
      else {                                        \
        *below_head = *above_head;                  \
        above_head += 1;                            \
      }                                             \
    } else {                                        \
      below_head -= 1;                              \
      above_head -= 1;                              \
                                                    \
      if (*above_head == SEP)                       \
        return -1;                                  \
                                                    \
      *above_head = write;                          \
      if (*below_head == BASE) {                    \
        below_head += 1;                            \
        *below_head = 0;                            \
      }                                             \
    }                                               \
  }

#if DEBUG == 2
#define WRITE_MOVE_GOTO(write, move, _goto)   \
  {                                           \
    WRITE_MOVE(write, move)                   \
    printf("%d\n %s\n", steps_count, #_goto); \
    print_tape();                             \
    getchar();                                \
    goto _goto;                               \
  }
#else
#define WRITE_MOVE_GOTO(write, move, _goto) \
  {                                         \
    WRITE_MOVE(write, move)                 \
    goto _goto;                             \
  }
#endif

int main() {
#if DEBUG == 1
  clock_t begin = clock();
#endif

#if MEMORY_MODE == STACK_ONLY
  below_head = tape;
#elif MEMORY_MODE == HEAP_ONLY_SBRK
  below_head = (unsigned char*)sbrk(HEAP_SPACE);
#elif MEMORY_MODE == HEAP_ONLY_CALLOC
  below_head = (unsigned char*)calloc(HEAP_SPACE, 1);
#endif
  initial_below_head = below_head;
  above_head = below_head + HEAP_SPACE - 1;
  initial_above_head = above_head;

  *(below_head) = BASE;
  *(below_head + HEAP_SPACE / 2) = SEP;
  *(above_head) = BASE;

  below_head += 1;
  *(below_head) = 0;
  goto A;

A:  // 1RB, 1LC
  if (*below_head == 0)
    WRITE_MOVE_GOTO(1, 'R', B);
  if (*below_head == 1)
    WRITE_MOVE_GOTO(1, 'L', C);

B:  // 1RC, 1RB
  if (*below_head == 0)
    WRITE_MOVE_GOTO(1, 'R', C);
  if (*below_head == 1)
    WRITE_MOVE_GOTO(1, 'R', B);

C:  // 1RD, 0LE
  if (*below_head == 0)
    WRITE_MOVE_GOTO(1, 'R', D);
  if (*below_head == 1)
    WRITE_MOVE_GOTO(0, 'L', E);

D:  // 1LA, 1LD
  if (*below_head == 0)
    WRITE_MOVE_GOTO(1, 'L', A);
  if (*below_head == 1)
    WRITE_MOVE_GOTO(1, 'L', D);

E:  // 1RH, 0LA
  if (*below_head == 0)
    WRITE_MOVE_GOTO(1, 'R', halt);
  if (*below_head == 1)
    WRITE_MOVE_GOTO(0, 'L', A);

halt:
#if DEBUG == 1
  printf("%d\n", steps_count);
  clock_t end = clock();
  double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
  printf("%lf\n", time_spent);
#endif
  return 0;
}