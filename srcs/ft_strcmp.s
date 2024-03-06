section .text
	global ft_strcmp

ft_strcmp:
	xor rcx, rcx ; rcx = 0

ft_strcmp_loop:
	mov al, [rdi + rcx] ; al = *s1
	mov bl, [rsi + rcx] ; bl = *s2
	inc rcx ; rcx++
	test al, al ; if al == 0
	jz ft_strcmp_return ; return rax
	test bl, bl ; if bl == 0
	jz ft_strcmp_return ; return rax
	cmp al, bl ; compare *s1 and *s2
	je ft_strcmp_loop ; if *s1 == *s2, continue

ft_strcmp_return:
	sub al, bl ; al = *s1 - *s2
	movsx rax, al ; rax = signed al
	ret ; return rax