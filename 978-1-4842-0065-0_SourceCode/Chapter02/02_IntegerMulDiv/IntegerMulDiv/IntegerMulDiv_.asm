	.model flat,c
	.code

; Returns:	0	Error	(divisor is zero)
;			1	Success	(divisor is zero)
;
; Computes:	*prod = a * b;
;			*quo = a / b;
;			*rem = a % d

IntegerMulDiv_ proc

; Function prolog
	push ebp
	mov ebp,esp
	push ebx

; Make sure the divisor is not zero
	xor eax,eax	