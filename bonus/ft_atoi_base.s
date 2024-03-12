section .text
	global ft_atoi_base
	extern ft_strlen

ft_isspace:
	cmp byte [rdi], 32
	je .exit
	cmp byte [rdi], 9
	jl .exit_false
	cmp byte [rdi], 13
	jg .exit_false
	.exit:
		mov rax, 1
		ret
	.exit_false:
		xor rax, rax
		ret

; int ft_in_base(const char *base, char c)
ft_in_base:
	push rcx
	xor rcx, rcx ; init the counter
	.search:
		mov al, [rdi+rcx] ; load the current char
		test al, al ; test for '\0'
		jz .exit_failure
		cmp al, sil
		je .exit
		inc rcx
		jmp .search
	.exit_failure:
		pop rcx
		mov rax, -1
		ret
	.exit:
		mov rax, rcx
		pop rcx
		ret


ft_check_base:
	push rsi
	test rdi, rdi
	jz .exit_failure
	call ft_strlen
	cmp rax, 2
	jl .exit_failure
	.check:
		cmp byte [rdi], 0
		je .exit
		mov sil, byte [rdi]
		inc rdi
		call ft_in_base
		dec rdi
		cmp rax, -1
		jne .exit_failure
		cmp byte [rdi], 43
		je .exit_failure
		cmp byte [rdi], 45
		je .exit_failure
		call ft_isspace
		cmp rax, 1
		je .exit_failure
		inc rdi
		jmp .check
	.exit_failure:
		pop rsi
		mov rax, -1
		ret
	.exit:
		pop rsi
		xor rax, rax
		ret

ft_atoi_base:
	xor rdx, rdx
	mov r8, 1
	push rdi
	test rdi, rdi
	jz .exit_failure
	mov rdi, rsi
	call ft_check_base
	cmp rax, -1
	je .exit_failure
	mov rdi, rsi
	call ft_strlen
	mov rcx, rax
	pop rdi
	.skip_whitespaces:
		call ft_isspace
		cmp rax, 0
		je .sign
		inc rdi
		jmp .skip_whitespaces
	.sign:
		cmp byte [rdi], 45
		je .change_sign
		cmp byte [rdi], 43
		jne .compute
		inc rdi
		jmp .sign
		.change_sign:
			neg r8
			inc rdi
			jmp .sign
	.compute:
		cmp byte [rdi], 0
		je .exit
		push rdi
		push rsi
		mov sil, byte [rdi]
		mov rdi, [rsp]
		call ft_in_base
		pop rsi
		pop rdi
		cmp rax, -1
		je .exit
		mov r9, rax
		mov rax, rdx
		mul rcx
		add rax, r9
		mov rdx, rax
		inc rdi
		jmp .compute
	.exit_failure:
		pop rdi
		xor rax, rax
		ret
	.exit:
		mov rax, rdx
		imul rax, r8
		ret
