; void ft_list_sort(t_list **begin_list, int (*cmp)());

section .text
	global ft_list_sort

ft_swap:
	mov rax, [rdi]
	mov rbx, [rsi]
	mov [rdi], rbx
	mov [rsi], rax
	ret

ft_list_sort:
	push rdi
	mov r8, [rdi]
	mov r10, rsi
	.main_loop:
		test r8, r8
		jz .return
		mov r9, [r8+8]
		.cmp_loop:
			test r9, r9
			jz .inc_main
			mov rdi, r8
			mov rsi, r9
			call r10
			cmp rax, 0
			jl .swap
			jmp .inc
			.swap:
				push r8
				push r9
				lea rdi, [rsp+8]
				mov rsi, rsp
				add rsp, 16
				call ft_swap
			.inc:
				mov r9, [r9+8]
				jmp .cmp_loop
		.inc_main:
			mov r8, [r8+8]
	.return:
		pop rdi
		ret