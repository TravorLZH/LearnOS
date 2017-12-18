CRLF:
	mov	ah,0Eh
	mov	al,0xD
	int	10h
	mov	al,0xA
	int	10h
	ret
