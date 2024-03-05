section .text
	global ft_strcpy

ft_strcpy:
	mov rax, rdi ; save the address of the destination string

ft_strcpy_loop:
	mov al, [rsi] ; load the first byte of the source string
	mov [rdi], al ; store it in the destination string
	inc rsi ; move to the next byte of the source string
	inc rdi ; move to the next byte of the destination string
	test al, al ; check if the byte is zero
	jnz ft_strcpy_loop ; if not, repeat the process
	mov rax, rdi ; if yes, return the address of the destination string
	ret ; return
