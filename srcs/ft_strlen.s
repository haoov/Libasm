section .text
	global ft_strlen

ft_strlen:
	xor rcx, rcx ; zero out ecx
	mov rax, rdi ; get the first argument

ft_strlen_loop:
	mov dl, [rax + rcx] ; get the byte from the string
	test dl, dl ; check if it's null
	jz ft_strlen_return ; if it is, exit
	inc rcx ; increment the counter
	jmp ft_strlen_loop ; jump to the loop

ft_strlen_return:
	mov rax, rcx ; move the count to rax
	ret ; return
