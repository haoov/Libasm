section .text
	global ft_strcpy

ft_strcpy:
	mov rax, rdi ; save the address of the destination string
	xor rcx, rcx ; set the counter to zero

ft_strcpy_loop:
	mov al, [rsi + rcx*1] ; load the first byte of the source string
	mov [rdi + rcx*1], al ; store it in the destination string
	inc rcx ; increment the counter
	test al, al ; check if the byte is zero
	jnz ft_strcpy_loop ; if not, repeat the process
	mov rax, rdi ; if yes, return the address of the destination string
	ret ; return
