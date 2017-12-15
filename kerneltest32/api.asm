[bits	32]
[global	_api_putchar]
; Function: _api_putchar(unsigned int address,char color,char c);
_api_putchar:
	push	ebp
	mov	ebp,esp
	mov	edx,[ebp+4]	; Get the video memory address
	mov	ah,[ebp+6]	; Get the character attribute
	mov	al,[ebp+7]	; Get the character
	cmp	al,0
	je	.fail
	mov	[edx],ax	; Move character and its attribute into video memory
	mov	eax,0
	jmp	.fin
.fail:
	mov	eax,1
.fin:
	mov	esp,ebp
	pop	ebp
	ret
