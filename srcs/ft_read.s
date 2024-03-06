;size_t ft_read(int fildes, void *buf, size_t nbyte);

section .text
	global ft_read
	extern __errno_location

ft_read:
	mov rax, 0 ; syscall number for read
	syscall ; call the kernel
	cmp rax, 0 ; check if there was an error
	jl ft_read_error ; if there was an error, jump to ft_read_error
	ret ; return

ft_read_error:
	neg rax ; negate rax to get the error number
	mov rdi, rax ; move the error number to rdi
	call __errno_location wrt ..plt ; call __errno_location to get errnos address
	mov [rax], rdi ; set errno to the error number
	mov rax, -1 ; set rax to -1
	ret ; return