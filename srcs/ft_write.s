;size_t ft_write(int fildes, const void *buf, size_t nbyte);

section .text
	global ft_write
	extern __errno_location

ft_write:
	mov rax, 1 ; syscall number for write
	syscall ; call kernel
	cmp rax, 0 ; check if syscall failed
	jl ft_write_error ; if syscall failed, jump to ft_write_error
	ret ; return

ft_write_error:
	neg rax ; negate rax to get the error number
	mov rdi, rax ; store the error number in errno
	call __errno_location wrt ..plt ; call the libc function to get errno variables address
	mov [rax], rdi ; store the error number in errno
	mov rax, -1 ; set rax to -1 to indicate an error
	ret ; return