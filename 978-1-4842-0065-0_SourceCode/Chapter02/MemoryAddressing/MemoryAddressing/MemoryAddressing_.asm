	.model flat,call

; Simple lookup table (.const section data is read only)
	
			.const
FibVals		dword 0, 1, 1, 2, 3, 5, 8, 13
			dword 21, 34, 55, 89, 144, 233, 377, 610


NumFibVals_ dword ($ - FibVals) / sizeof dword	
			public NumFibVals_


; extern "C" int MemoryAddressing_(int i, int* v1, int* v2, int* v3, int* v4);
;
; Description:	This function demonstrates various addressing modes
;				that can be used to access operands in memory.
;
; Returns:  0 = error (invalid table index)
;			1 = success

		.code
MemoryAddressing_ proc
	push ebp
	mov ebp,esp
	push ebx
	push esi
	push edi

; Make sure 'i' is valid
	xor eax,eax
	mov ecx,[ebp+8]
	cmp ecx,0
	jl InvalidIndex
	cmp ecx,[NumFibVals_]
	jge InvalidIndex

; Example #1 - base register
	mov ebx,offset FibVals		;ebx = FibVals
	mov esi,[ebp+8]				;esi = i
	shl esi,2					;esi = i * 4
	add ebx,esi					;ebx = FibVals + i * 4
	mov eax,[ebx]				;Load table value
	mov edi,[ebp+12]
	mov [edi],eax				;Save to 'v1'

InvalidIndex:
	pop edi
	pop esi
	pop ebx
	pop ebp
	ret
