; size_t ft_list_size(t_list *begin_list);

section .text
	global ft_list_size

ft_list_size:
	xor rcx, rcx
	.count:
		test rdi, rdi
		jz .return
		inc rcx
		mov rdi, [rdi + 8]
	.return:
		inc rcx
		mov rax, rcx
		ret
