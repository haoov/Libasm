; int ft_atoi_base(char *str, char *base)

section .text
	global ft_atoi_base
	extern ft_strlen

ft_atoi_base:
	mov rdx, 1

ft_atoi_base_check_base:
	test rsi, rsi
	jz ft_atoi_base_error ; if (base == NULL) return 0
	push rdi ; save str
	mov rdi, rsi ; rdi = base
	call ft_strlen
	cmp rax, 2
	jl ft_atoi_base_error ; if (ft_strlen(base) < 2) return 0
	mov rcx, rax ; rcx = ft_strlen(base)
	mov r9, rcx ; r9 = rcx

ft_atoi_base_check_base_loop:
	mov al, [rdi+rcx*1] ; al = *(base + rcx * 1)
	cmp al, [rdi]
	je ft_atoi_base_advance ; if (al == 0) exit the loop
	cmp al, 43
	je ft_atoi_base_error ; if (al == '+') return 0
	cmp al, 45
	je ft_atoi_base_error ; if (al == '-') return 0
	cmp al, 32
	je ft_atoi_base_error ; if (al == ' ') return 0
	cmp al, 9
	jl ft_atoi_base_value_ok ; if (al < 9) continue
	cmp al, 13
	jg ft_atoi_base_value_ok ; if (al > 13) continue
	jmp ft_atoi_base_error ; else return 0 

ft_atoi_base_base_value_ok:
	dec rcx ; ++rcx
	jmp ft_atoi_base_check_base_loop

ft_atoi_base_advance:
	xor rcx, rcx ; rcx = 0
	pop rdi ; rdi = str
	
ft_atoi_base_skip_whitespaces:
	mov al, [rdi+rcx*1] ; al = *(str + rcx * 1)
	inc rcx ; ++rcx
	cmp al, 32
	je ft_atoi_base_skip_whitespaces ; if (al == ' ') next iteration
	cmp al, 9
	jl ft_atoi_base_skip_whitespaces ; if (al < 9) next iteration
	cmp al, 13
	jg ft_atoi_base_skipwhitespaces ; if (al > 13) next iteration
	dec rcx ; --rcx

ft_atoi_base_sign:
	mov al, [rdi+rcx*1] ; al = (*str + rcx * 1)
	inc rcx ; ++rcx
	cmp al, 43
	je ft_atoi_base_sign ; if (al == '+') next iteration
	cmp al, 45
	jne ft_atoi_base_compute ; if (al != '-') exit the loop
	neg rdx ; rdx *= -1
	jmp ft_atoi_base_sign ; next iteration

ft_atoi_base_compute:
	dec rcx ; --rcx

ft_atoi_base_compute_loop:
	mov al, [rdi+rcx*1]
	inc rcx
	test al, al
	jz ft_atoi_base_return
	jmp ft_atoi_base_get_index

ft_atoi_base_get_index:
	

ft_atoi_base_error:
	xor rax, rax
	rtn

ft_atoi_base_return:
	rtn


















