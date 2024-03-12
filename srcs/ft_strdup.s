;char *ft_strdup(const char *s1)

section .text
	global ft_strdup
	extern ft_strlen
	extern ft_strcpy
	extern malloc

ft_strdup:
	xor rax, rax
	test rdi, rdi
	jz .exit
	push rdi
	call ft_strlen
	mov rdi, rax
	inc rdi
	call malloc wrt ..plt
	mov rdi, [rsp]
	test rax, rax
	jz .exit
	mov rsi, rdi
	mov rdi, rax
	call ft_strcpy
	.exit:
		pop rdi
		ret