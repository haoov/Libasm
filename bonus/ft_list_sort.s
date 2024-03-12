; void ft_list_sort(t_list **begin_list, int (*cmp)());

section .text
	global ft_list_sort

ft_list_sort:
	push rdi
	mov r8, [rdi]
	test r8, r8
	jz .return
	mov r10, rsi
	.cmp_loop:
		mov r9, [r8+8]
		test r9, r9
		jz .return
		mov rdi, [r8]
		mov rsi, [r9]
		call r10
		cmp rax, 0
		jg .swap
		mov r8, [r8+8]
		jmp .cmp_loop
		.swap:
			mov rax, [r8]
			mov rbx, [r9]
			mov qword [r8], rbx
			mov qword [r9], rax
			pop rdi
			mov r8, [rdi]
			push rdi
			jmp .cmp_loop
	.return:
		pop rdi
		ret
