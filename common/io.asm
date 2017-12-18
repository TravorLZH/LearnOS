; Print hexadecimal from DX
print_hex:
	pusha
	mov	si,HEX_OUT + 2
next_char:
	mov	bx,dx
	and	bx,0xf000
	shr	bx,4
	add	bh,0x30
	cmp	bh,0x39
	jg	add_7
add_char_hex:
	mov	al,bh
	mov	[si],bh
	inc	si
	shl	dx,4
	or	dx,dx
	jnz	next_char
	mov	bx,HEX_OUT
	call	print_string
	popa
	ret
add_7:
	add	bh,0x7
	jmp	add_char_hex
HEX_OUT	db	'0x0000',0

; Read Character from keyboard
; Returns: AL the character read from keyboard
read_char:
	mov	ah,0
	int	16h
	ret
