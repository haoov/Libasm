; void ft_list_sort(t_list **begin_list, int (*cmp)());

section .text
	global ft_list_sort
	extern ft_list_size

ft_swap_values:
	mov rax, [rdi]
	mov rdx, [rsi]
	mov qword [rdi], rdx
	mov qword [rsi], rax
	ret

ft_list_sort:
	push rdi
	test rdi, rdi
	jz .return
	test rsi, rsi
	jz .return
	mov r8, [rdi]
	mov rdi, r8
	call ft_list_size
	cmp rax, 2
	jl .return
	mov rcx, rax
	mov r11, rsi
	.main_loop:
		mov r9, r8
		.cmp_loop:
			mov r10, [r9+8]
			test r10, r10
			jz .next
			push rcx
			push r8
			push r9
			push r10
			push r11
			mov rdi, [r9]
			mov rsi, [r10]
			call r11
			pop r11
			pop r10
			pop r9
			pop r8
			pop rcx
			cmp rax, 0
			jg .swap
			mov r9, [r9+8]
			jmp .cmp_loop
		.swap:
			mov rdi, r9
			mov rsi, r10
			call ft_swap_values
			mov r9, [r9+8]
			jmp .cmp_loop
		.next:
			loop .main_loop
	.return:
		pop rdi
		ret
