;char *ft_strdup(const char *s1)

section .text
	global ft_strdup
	extern ft_strlen
	extern ft_strcpy
	extern malloc

ft_strdup:
	call ft_strlen ; get the length of the string
	mov rcx, rax ; save the length in rcx
	inc rcx ; add 1 to the length for the null terminator
	test rax, rax ; check if the string is empty
	jnz ft_strdup_allocate ; if (rax != 0) goto ft_strdup_allocate
	ret ; else return NULL

ft_strdup_allocate: ; allocate memory for the new string
	push rdi ; save ths string memory location on the stack
	mov rdi, rcx ; set the size of the memory to allocate
	call malloc wrt ..plt ; allocate the memory
	test rax, rax ; check if malloc failed
	jnz ft_strdup_copy ; if malloc succeeded, jump to ft_strdup_copy
	ret ; else return NULL

ft_strdup_copy: ; copy the string
	pop rsi ; get the string memory location
	mov rdi, rax ; set the destination memory location
	call ft_strcpy ; copy the string
	ret ; return the new string