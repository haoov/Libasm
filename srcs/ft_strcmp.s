section .text
	global ft_strcmp

ft_strcmp:
	push rbx ; save rbx
	xor rcx, rcx
	.cmp:
		mov al, [rdi + rcx] ; al = *s1
		mov bl, [rsi + rcx] ; bl = *s2
		test al, al ; if al == 0
		jz .exit ; return rax
		test bl, bl ; if bl == 0
		jz .exit ; return rax
		cmp al, bl ; if *s1 != *s2
		jne .exit ; return rax
		inc rcx
		jmp .cmp ; if *s1 == *s2, continue
	.exit:
		sub al, bl
		pop rbx ; restore rbx
		movsx rax, al ; rax = signed al
		ret ; return rax