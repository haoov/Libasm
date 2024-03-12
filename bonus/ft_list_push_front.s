; void ft_list_push_front(t_list **begin_list, void *data);
; struct s_list {
; 	void *data;
; 	struct s_list *next;
; } t_list;

section .text
	global ft_list_push_front
	extern malloc

ft_list_new:
	push rsi
	mov rdi, 16
	call malloc wrt ..plt
	pop rsi
	test rax, rax
	jz .return_null
	mov qword [rax], rsi
	mov qword [rax + 8], 0
	.return_null:
		ret

ft_list_push_front:
	push rdi
	call ft_list_new
	pop rdi
	test rax, rax
	jz .return_null
	test rdi, rdi
	jz .return
	mov rbx, [rdi]
	mov [rax + 8], rbx
	.return:
		mov qword [rdi], rax
		ret
	.return_null:
		xor rax, rax
		ret
