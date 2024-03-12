section .text
	global ft_strcpy

ft_strcpy:
	xor rcx, rcx ; set the counter to zero
	.copy:
		mov al, [rsi+rcx] ; load the first byte of the source string
		mov [rdi+rcx], al ; store it in the destination string
		test al, al ; check if the byte is zero
		jz .exit ; if not, repeat the process
		inc rcx ; increment the counter
		jmp .copy
	.exit:
		mov rax, rdi
		ret
