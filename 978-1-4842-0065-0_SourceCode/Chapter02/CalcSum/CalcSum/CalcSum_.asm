	.model flat,c
	.code

CalcSum_ proc

; Initialize a stack frame pointer
	push ebp
	mov ebp,esp

; Load the argument values
	mov eax,[ebp+8]		; eax = 'a'
	mov ecx,[ebp+12]	; ecx = 'b'
	mov edx,[ebp+16]	; edx = 'c'

; Calculate the sum
	add eax,ecx			; eax = 'a' + 'b'
	add eax,edx			; eax = 'a' + 'b' + 'c'

; Restore the caller's stack frame pointer
	pop ebp
	ret

CalcSum_ endp
	end
