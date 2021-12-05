	.file	"play.c"
	.text
	.globl	HEAP_SPACE
	.section	.rodata
	.align 4
	.type	HEAP_SPACE, @object
	.size	HEAP_SPACE, 4
HEAP_SPACE:
	.long	2000000
	.comm	initial_below_head,8,8
	.comm	below_head,8,8
	.comm	initial_above_head,8,8
	.comm	above_head,8,8
	.globl	steps_count
	.bss
	.align 4
	.type	steps_count, @object
	.size	steps_count, 4
steps_count:
	.zero	4
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$2000000, %eax
	cltq
	movl	$1, %esi
	movq	%rax, %rdi
	call	calloc@PLT
	movq	%rax, below_head(%rip)
	movq	below_head(%rip), %rax
	movq	%rax, initial_below_head(%rip)
	movq	below_head(%rip), %rax
	movl	$2000000, %edx
	movslq	%edx, %rdx
	subq	$1, %rdx
	addq	%rdx, %rax
	movq	%rax, above_head(%rip)
	movq	above_head(%rip), %rax
	movq	%rax, initial_above_head(%rip)
	movq	below_head(%rip), %rax
	movb	$2, (%rax)
	movq	below_head(%rip), %rdx
	movl	$2000000, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	cltq
	addq	%rdx, %rax
	movb	$3, (%rax)
	movq	above_head(%rip), %rax
	movb	$2, (%rax)
	movq	below_head(%rip), %rax
	addq	$1, %rax
	movq	%rax, below_head(%rip)
	movq	below_head(%rip), %rax
	movb	$0, (%rax)
	nop
.L2:
	movq	below_head(%rip), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L3
	movl	steps_count(%rip), %eax
	addl	$1, %eax
	movl	%eax, steps_count(%rip)
	movq	below_head(%rip), %rax
	movb	$1, (%rax)
	movq	below_head(%rip), %rax
	addq	$1, %rax
	movq	%rax, below_head(%rip)
	movq	below_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$3, %al
	je	.L4
	movq	above_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$3, %al
	jne	.L5
.L4:
	movl	$-1, %edi
	call	exit@PLT
.L5:
	movq	above_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$2, %al
	jne	.L6
	movq	below_head(%rip), %rax
	movb	$0, (%rax)
	jmp	.L21
.L6:
	movq	above_head(%rip), %rdx
	movq	below_head(%rip), %rax
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
	movq	above_head(%rip), %rax
	addq	$1, %rax
	movq	%rax, above_head(%rip)
	jmp	.L21
.L3:
	movq	below_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$1, %al
	jne	.L45
	movl	steps_count(%rip), %eax
	addl	$1, %eax
	movl	%eax, steps_count(%rip)
	movq	below_head(%rip), %rax
	subq	$1, %rax
	movq	%rax, below_head(%rip)
	movq	above_head(%rip), %rax
	subq	$1, %rax
	movq	%rax, above_head(%rip)
	movq	above_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$3, %al
	jne	.L9
	movl	$-1, %edi
	call	exit@PLT
.L9:
	movq	above_head(%rip), %rax
	movb	$1, (%rax)
	movq	below_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$2, %al
	jne	.L46
	movq	below_head(%rip), %rax
	addq	$1, %rax
	movq	%rax, below_head(%rip)
	movq	below_head(%rip), %rax
	movb	$0, (%rax)
	jmp	.L46
.L45:
	nop
.L8:
.L21:
	movq	below_head(%rip), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L12
	movl	steps_count(%rip), %eax
	addl	$1, %eax
	movl	%eax, steps_count(%rip)
	movq	below_head(%rip), %rax
	movb	$1, (%rax)
	movq	below_head(%rip), %rax
	addq	$1, %rax
	movq	%rax, below_head(%rip)
	movq	below_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$3, %al
	je	.L13
	movq	above_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$3, %al
	jne	.L14
.L13:
	movl	$-1, %edi
	call	exit@PLT
.L14:
	movq	above_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$2, %al
	jne	.L15
	movq	below_head(%rip), %rax
	movb	$0, (%rax)
	jmp	.L11
.L15:
	movq	above_head(%rip), %rdx
	movq	below_head(%rip), %rax
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
	movq	above_head(%rip), %rax
	addq	$1, %rax
	movq	%rax, above_head(%rip)
	jmp	.L11
.L12:
	movq	below_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$1, %al
	jne	.L47
	movl	steps_count(%rip), %eax
	addl	$1, %eax
	movl	%eax, steps_count(%rip)
	movq	below_head(%rip), %rax
	movb	$1, (%rax)
	movq	below_head(%rip), %rax
	addq	$1, %rax
	movq	%rax, below_head(%rip)
	movq	below_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$3, %al
	je	.L17
	movq	above_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$3, %al
	jne	.L18
.L17:
	movl	$-1, %edi
	call	exit@PLT
.L18:
	movq	above_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$2, %al
	jne	.L19
	movq	below_head(%rip), %rax
	movb	$0, (%rax)
	jmp	.L21
.L19:
	movq	above_head(%rip), %rdx
	movq	below_head(%rip), %rax
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
	movq	above_head(%rip), %rax
	addq	$1, %rax
	movq	%rax, above_head(%rip)
	jmp	.L21
.L46:
	nop
	jmp	.L11
.L47:
	nop
.L11:
	movq	below_head(%rip), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L22
	movl	steps_count(%rip), %eax
	addl	$1, %eax
	movl	%eax, steps_count(%rip)
	movq	below_head(%rip), %rax
	movb	$1, (%rax)
	movq	below_head(%rip), %rax
	addq	$1, %rax
	movq	%rax, below_head(%rip)
	movq	below_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$3, %al
	je	.L23
	movq	above_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$3, %al
	jne	.L24
.L23:
	movl	$-1, %edi
	call	exit@PLT
.L24:
	movq	above_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$2, %al
	jne	.L25
	movq	below_head(%rip), %rax
	movb	$0, (%rax)
	jmp	.L36
.L25:
	movq	above_head(%rip), %rdx
	movq	below_head(%rip), %rax
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
	movq	above_head(%rip), %rax
	addq	$1, %rax
	movq	%rax, above_head(%rip)
	jmp	.L36
.L22:
	movq	below_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$1, %al
	jne	.L48
	movl	steps_count(%rip), %eax
	addl	$1, %eax
	movl	%eax, steps_count(%rip)
	movq	below_head(%rip), %rax
	subq	$1, %rax
	movq	%rax, below_head(%rip)
	movq	above_head(%rip), %rax
	subq	$1, %rax
	movq	%rax, above_head(%rip)
	movq	above_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$3, %al
	jne	.L28
	movl	$-1, %edi
	call	exit@PLT
.L28:
	movq	above_head(%rip), %rax
	movb	$0, (%rax)
	movq	below_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$2, %al
	jne	.L49
	movq	below_head(%rip), %rax
	addq	$1, %rax
	movq	%rax, below_head(%rip)
	movq	below_head(%rip), %rax
	movb	$0, (%rax)
	jmp	.L49
.L48:
	nop
.L27:
.L36:
	movq	below_head(%rip), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L31
	movl	steps_count(%rip), %eax
	addl	$1, %eax
	movl	%eax, steps_count(%rip)
	movq	below_head(%rip), %rax
	subq	$1, %rax
	movq	%rax, below_head(%rip)
	movq	above_head(%rip), %rax
	subq	$1, %rax
	movq	%rax, above_head(%rip)
	movq	above_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$3, %al
	jne	.L32
	movl	$-1, %edi
	call	exit@PLT
.L32:
	movq	above_head(%rip), %rax
	movb	$1, (%rax)
	movq	below_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$2, %al
	jne	.L2
	movq	below_head(%rip), %rax
	addq	$1, %rax
	movq	%rax, below_head(%rip)
	movq	below_head(%rip), %rax
	movb	$0, (%rax)
	jmp	.L2
.L31:
	movq	below_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$1, %al
	jne	.L50
	movl	steps_count(%rip), %eax
	addl	$1, %eax
	movl	%eax, steps_count(%rip)
	movq	below_head(%rip), %rax
	subq	$1, %rax
	movq	%rax, below_head(%rip)
	movq	above_head(%rip), %rax
	subq	$1, %rax
	movq	%rax, above_head(%rip)
	movq	above_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$3, %al
	jne	.L34
	movl	$-1, %edi
	call	exit@PLT
.L34:
	movq	above_head(%rip), %rax
	movb	$1, (%rax)
	movq	below_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$2, %al
	jne	.L36
	movq	below_head(%rip), %rax
	addq	$1, %rax
	movq	%rax, below_head(%rip)
	movq	below_head(%rip), %rax
	movb	$0, (%rax)
	jmp	.L36
.L49:
	nop
	jmp	.L30
.L50:
	nop
.L30:
	movq	below_head(%rip), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L37
	movl	steps_count(%rip), %eax
	addl	$1, %eax
	movl	%eax, steps_count(%rip)
	movq	below_head(%rip), %rax
	movb	$1, (%rax)
	movq	below_head(%rip), %rax
	addq	$1, %rax
	movq	%rax, below_head(%rip)
	movq	below_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$3, %al
	je	.L38
	movq	above_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$3, %al
	jne	.L39
.L38:
	movl	$-1, %edi
	call	exit@PLT
.L39:
	movq	above_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$2, %al
	jne	.L40
	movq	below_head(%rip), %rax
	movb	$0, (%rax)
	jmp	.L42
.L40:
	movq	above_head(%rip), %rdx
	movq	below_head(%rip), %rax
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
	movq	above_head(%rip), %rax
	addq	$1, %rax
	movq	%rax, above_head(%rip)
	jmp	.L42
.L37:
	movq	below_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$1, %al
	jne	.L51
	movl	steps_count(%rip), %eax
	addl	$1, %eax
	movl	%eax, steps_count(%rip)
	movq	below_head(%rip), %rax
	subq	$1, %rax
	movq	%rax, below_head(%rip)
	movq	above_head(%rip), %rax
	subq	$1, %rax
	movq	%rax, above_head(%rip)
	movq	above_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$3, %al
	jne	.L43
	movl	$-1, %edi
	call	exit@PLT
.L43:
	movq	above_head(%rip), %rax
	movb	$0, (%rax)
	movq	below_head(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$2, %al
	jne	.L2
	movq	below_head(%rip), %rax
	addq	$1, %rax
	movq	%rax, below_head(%rip)
	movq	below_head(%rip), %rax
	movb	$0, (%rax)
	jmp	.L2
.L51:
	nop
.L42:
	movl	$0, %edi
	call	exit@PLT
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
