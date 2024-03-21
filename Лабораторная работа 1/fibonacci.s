	.file	"fibonacci.c"
	.text
	.globl	fibonacci
	.type	fibonacci, @function
fibonacci:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	cmpl	$0, 8(%ebp)
	jne	.L2
	movl	8(%ebp), %eax
	cltd
	jmp	.L3
.L2:
	cmpl	$1, 8(%ebp)
	jne	.L4
	movl	8(%ebp), %eax
	cltd
	jmp	.L3
.L4:
	movl	8(%ebp), %eax
	subl	$1, %eax
	subl	$12, %esp
	pushl	%eax
	call	fibonacci
	addl	$16, %esp
	movl	%eax, %ebx
	movl	%edx, %esi
	movl	8(%ebp), %eax
	subl	$2, %eax
	subl	$12, %esp
	pushl	%eax
	call	fibonacci
	addl	$16, %esp
	addl	%ebx, %eax
	adcl	%esi, %edx
.L3:
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	fibonacci, .-fibonacci
	.ident	"GCC: (Ubuntu 4.9.2-10ubuntu13) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
