section .text
	global ft_atoi_base
	extern ft_strlen

; int ft_in_base(const char *base, char c)
ft_in_base:
	xor rcx, rcx ; init the counter
	.search:
		mov al, [rdi+rcx*1] ; load the current char
		inc rcx ; increment the counter
		test al, al
		jz .not_in_base ; if eof is reahed, return -1
		cmp rax, rsi
		je .in_base ; if the char is found, return the index
		jmp .search ; continue the search
	.in_base:
		dec rcx ; decrement the counter to get the index
		mov rax, rcx
		ret
	.not_in_base:
		mov rax, -1
		ret

; int ft_check_base(const char *base)
; the function will return 0 if the base is valid, 1 if the base is invalid
; the base is invalid if it is null, if it is too short (< 2),
; if it contains a '+' or a '-' or a whitespace or if it contains a duplicate
ft_check_base:
	test rdi, rdi
	jz .base_not_ok ; if the base is null, return 1
	call ft_strlen
	cmp rax, 2 ; if the base is too short, return 1
	jl .base_not_ok
	xor rcx, rcx ; init the counter
	.check:
		mov al, [rdi+rcx*1] ; load the current char
		inc rcx ; increment the counter
		cmp al, 0
		jz .base_ok ; if the end of the base is reached, return 0
		; save values onto the stack and increment the stack counter
		push rdi
		inc r10
		push rcx
		inc r10
		push rax
		inc r10
		; move base pointer to the next char to avoid comparing 
		; the current char with itself
		lea rdi, [rdi+rcx*1]
		mov rsi, rax ; move the current char to rsi
		call ft_in_base ; check if the current char is already in the base
		cmp rax, -1
		jne .base_not_ok ; if the char is already in the base, return 1
		; restore values from the stack and decrement the stack counter
		pop rax
		dec r10
		pop rcx
		dec r10
		pop rdi
		dec r10
		; if the current char is '+' or '-', return 1
		cmp al, 43
		je .base_not_ok
		cmp al, 45
		je .base_not_ok
		cmp al, 32
		je .base_not_ok
		; if the current char is a whitespace, return 1
		cmp al, 9
		jl .check ; if not a whitespace, continue the check
		cmp al, 13
		jg .check ; if not a whitespace, continue the check
	.base_not_ok:
		mov rax, 1
		ret
	.base_ok:
		xor rax, rax
		ret

; function to clean the stack, r10 must be set to the number of values to clean
; the function will save the next instruction address into r11
; then it will pop the values from the stack and decrement r10 until r10 is 0
; then it will restore the next instruction address from r11 and return
ft_clean_stack:
	pop r11
	.clean:
		test r10, r10
		jz .end_clean
		add rsp, 8
		dec r10
		jmp .clean
	.end_clean:
		push r11
		ret

; int ft_atoi_base(const char *str, const char *base)
; the function will return the integer value of the string str in the given base
ft_atoi_base:
	xor r10, r10 ; init the stack counter
	; save values onto the stack and increment the stack counter
	push rdi
	inc r10
	push rsi
	inc r10
	mov rdi, rsi ; move the base pointer to rdi
	call ft_check_base ; check if the base is valid
	cmp rax, 1
	je .return_0 ; if the base is invalid, return 0
	call ft_strlen
	mov r9, rax ; save the length of the base into r9
	; retrieve the values from the stack and decrement the stack counter
	pop rsi
	dec r10
	pop rdi
	dec r10
	xor rcx, rcx ; reset the counter
	.skip_whitespaces:
		mov al, [rdi+rcx*1] ; load the current char
		inc rcx
		test al, al
		jz .return_0 ; if eof is reached, return 0
		; if the current char is a whitespace, skip it
		cmp al, 32 
		je .skip_whitespaces
		cmp al, 9
		jl .end_skip
		cmp al, 13
		jg .end_skip
		jmp .skip_whitespaces
	.end_skip:
		dec rcx ; decrement the counter to get the index of the first non-whitespace char
		mov rbx, 1 ; set the sign to positive
	.sign:
		mov al, [rdi+rcx*1] ; load the current char
		inc rcx
		test al, al
		jz .return_0 ; if eof is reached, return 0
		cmp al, 43
		je .sign ; if the current char is '+', continue the sign check
		cmp al, 45
		jne .end_sign ; if the current char is not '+' or '-', end the sign check
		neg rbx ; if the current char is '-', set the sign to negative
		jmp .sign ; continue the sign check
	.end_sign:
		dec rcx ; decrement the counter to get the index of the first non-sign char
	.compute:
		mov al, [rdi+rcx*1] ; load the current char
		inc rcx
		test al, al
		jz .return ; if eof is reached, return the result
		; save values onto the stack and increment the stack counter
		push rdi
		inc r10
		push rsi
		inc r10
		push rcx
		inc r10
		push rax
		inc r10
		mov rdi, rsi ; move the base pointer to rdi
		mov rsi, rax ; move the current char to rsi
		call ft_in_base ; check if the current char is in the base
		cmp rax, -1
		je .return ; if the current char is not in the base, return the result
		mov r8, rax ; save the index of the current char into r8
		; restore values from the stack and decrement the stack counter
		pop rax
		dec r10
		pop rcx
		dec r10
		pop rsi
		dec r10
		pop rdi
		dec r10
		mov rax, rdx ; move the result to rax
		mul r9 ; multiply the result by the length of the base
		add rax, r8 ; add the index of the current char to the result
		mov rdx, rax ; move the result to rdx
		jmp .compute ; continue the computation
	.return:
		call ft_clean_stack ; clean the stack
		mov rax, rdx ; move the result to rax
		imul rax, rbx ; multiply the result by the sign
		ret ; return the result
	.return_0:
		call ft_clean_stack ; clean the stack
		xor rax, rax ; zero out rax
		ret ; return rax
