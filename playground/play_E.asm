
[section .text]
[global _start]

 halt:
 xor rdi, rdi
 mov rax, 0x3c
 syscall

 halt_error:
 xor rdi, rdi
 not rdi
 mov rax, 0x3c
 syscall

 A:
 mov r9, [rsp]
 test [rsp], r9
 jz .read0
 jmp .read1

 .read0:


 pop r8
 push 1


 cmp [rbx], r10
 je .empty_heap_0
 mov r11, [rbx]
 push r11
 jmp B
 .empty_heap_0:
 push 0
 jmp B


 .read1:

 pop r8


 inc rbx
 mov r9, 1
 mov [rbx], r9


 cmp [rsp], r10
 jne C
 push 0
 jmp C


 B:
 mov r9, [rsp]
 test [rsp], r9
 jz .read0
 jmp .read1

 .read0:


 pop r8
 push 1


 cmp [rbx], r10
 je .empty_heap_0
 mov r11, [rbx]
 push r11
 jmp C
 .empty_heap_0:
 push 0
 jmp C


 .read1:


 pop r8
 push 1


 cmp [rbx], r10
 je .empty_heap_1
 mov r11, [rbx]
 push r11
 jmp B
 .empty_heap_1:
 push 0
 jmp B


 C:
 mov r9, [rsp]
 test [rsp], r9
 jz .read0
 jmp .read1

 .read0:


 pop r8
 push 1


 cmp [rbx], r10
 je .empty_heap_0
 mov r11, [rbx]
 push r11
 jmp D
 .empty_heap_0:
 push 0
 jmp D


 .read1:

 pop r8


 inc rbx
 mov r9, 0
 mov [rbx], r9


 cmp [rsp], r10
 jne E
 push 0
 jmp E


 D:
 mov r9, [rsp]
 test [rsp], r9
 jz .read0
 jmp .read1

 .read0:

 pop r8


 inc rbx
 mov r9, 1
 mov [rbx], r9


 cmp [rsp], r10
 jne A
 push 0
 jmp A


 .read1:

 pop r8


 inc rbx
 mov r9, 1
 mov [rbx], r9


 cmp [rsp], r10
 jne D
 push 0
 jmp D


 E:
 mov r9, [rsp]
 test [rsp], r9
 jz .read0
 jmp .read1

 .read0:


 pop r8
 push 1


 cmp [rbx], r10
 je .empty_heap_0
 mov r11, [rbx]
 push r11
 jmp halt
 .empty_heap_0:
 push 0
 jmp halt


 .read1:

 pop r8


 inc rbx
 mov r9, 0
 mov [rbx], r9


 cmp [rsp], r10
 jne A
 push 0
 jmp A




 init_heap:

 mov rax, 12
 mov rdi, 0
 syscall

 mov rbx, rax


 lea rdi, [rax + 2000000]
 mov rax, 12
 syscall

 mov [rbx], r10

 ret


 _start:
 mov r10, 0x2
 call init_heap
 push 0x2
 push 0
 jmp A

