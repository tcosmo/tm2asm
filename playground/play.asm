%define empty_symbol 0x2

section .text
  global _start

  halt:
    xor     rdi, rdi
    mov     rax, 0x3c
    syscall

  halt_error:
    xor     rdi, rdi
    not     rdi
    mov     rax, 0x3c
    syscall

%macro  tm_read_write_move_jump 0-4
  ; moving right
  %ifidn %3, R
    ; write %0
    pop   r8
    push  %2
    
    ; move right
    cmp   [rbx], r10
    je   .empty_heap_%1
    mov r11, [rbx]
    push  r11
    jmp   %4
    .empty_heap_%1:
      push  0
    jmp   %4
  %else
    pop   r8

    ; write %2
    inc   rbx
    mov   r9, %2
    mov   [rbx], r9

    ; move left
    cmp   [rsp], r10
    jne   %4
    push  0
    jmp   %4
  %endif

%endmacro
  A:
    mov     r9, [rsp]
    test    [rsp], r9
    jz      .read0
    jmp     .read1

    .read0: ;1RB
      tm_read_write_move_jump 0,1,R,B
    
    .read1: ;1LC
      tm_read_write_move_jump 1,1,L,C

  B:
    mov     r9, [rsp]
    test    [rsp], r9
    jz      .read0
    jmp     .read1

    .read0: ;1RC
      tm_read_write_move_jump 0,1,R,C

    .read1: ;1RB
      tm_read_write_move_jump 1,1,R,B

  C:
    mov     r9, [rsp]
    test    [rsp], r9
    jz      .read0
    jmp     .read1

    .read0: ;1RD
      tm_read_write_move_jump 0,1,R,D

    .read1: ;0LE
      tm_read_write_move_jump 1,0,L,E

    D:
      mov     r9, [rsp]
      test    [rsp], r9
      jz      .read0
      jmp     .read1

      .read0: ;1LA
        tm_read_write_move_jump 0,1,L,A

      .read1: ;1LD
        tm_read_write_move_jump 1,1,L,D

    E:
      mov     r9, [rsp]
      test    [rsp], r9
      jz      .read0
      jmp     .read1

      .read0: ;1RH
        tm_read_write_move_jump 0,1,R,halt

      .read1: ;0LA
        tm_read_write_move_jump 1,0,L,A
  

  ; we use our heap as a second stack
  init_heap:
    ;; sys_brk(0)
    mov   rax, 12         ; 12 is SYS_brk (/usr/include/asm/unistd_64.h)
    mov   rdi, 0          ; rdi for first syscall arg in the 64-bit ABI, not rbx
    syscall               ; syscall, not int 0x80, for the 64-bit ABI

    mov   rbx, rax

    ;; sys_brk(old_break + 2M)
    lea   rdi, [rax + 20000000]  ; add 2M bytes to the break point
    mov   rax, 12
    syscall               ; set the new breakpoint

    mov   [rbx], r10

    ret


  _start:
    mov     r10, empty_symbol
    call    init_heap
    push    empty_symbol ; empty stack
    push    0
    jmp     A
    