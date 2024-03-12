;void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void *(*free_fct)(void*);

;r9 will be the elem we compare and remove if needed
;r8 will be the previous elem in the list
;r10 will be the head of the list

section .text
	global ft_list_remove_if
	extern free

ft_list_remove_if:

	;store the list head pointer address in the stack
	;store the list head in r8 and copy it in r9
	;store the free_fct in r11
	push rdi 
	mov r8, [rdi]
	mov r9, r8
	mov r10, r8

	;at this point r8 = r9 = r10 = *begin_list and [rsp] = begin_list

	;check if we are at the end of the list if we are => return
	;compare r9->data to data_ref (rsi) using cmp function (rdx)
	;if the result is zero we need to remove the elem
	;else continue to the next elem
	.cmp:
		test r9, r9
		jz .return
		mov rdi, [r9]
		push rcx
		call rdx
		pop rcx
		test rax, rax
		jz .remove_elem
	.next_elem:
		mov r8, r9
		mov r9, [r9+8]

		;at this point r9 = r8->next and r10 = *begin_list
		jmp .cmp

	;store the next elem address in rbx
	;if r9 == r10 we are at the first elem and need to update r10
	;else we need to update r8 next value
	;then we can free the elem (stored in rbx) and update r9
	.remove_elem:
		mov rbx, [r9+8]
		cmp r10, r9
		jz .update_head
		mov qword [r8+8], rbx
		.free_elem:
			push rdx
			push rsi
			push rcx
			mov rdi, [r9]
			call rcx
			mov rdi, r9
			call free wrt ..plt
			mov r9, rbx
			pop rcx
			pop rsi
			pop rdx
			jmp .cmp
		.update_head:
			mov r10, rbx
			jmp .free_elem

	;pop the list head pointer from the stack and update its value
	;return to the caller
	.return:
		pop rdi
		mov qword [rdi], r10
		ret
