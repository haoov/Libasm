section .data
	errno_location dq __errno_location ; store the address of __errno_location in a variable

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
	call [rel errno_location] ; call the libc function to set errno
	mov [rax], rdi ; store the error number in errno
	mov rax, -1 ; set rax to -1 to indicate an error
	ret ; return