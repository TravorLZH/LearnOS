	mov	ah,0Eh

	mov	al,'H'
	int	10h
	mov	al,'e'
	int	10h
	mov	al,'l'
	int	10h
	mov	al,'l'
	int	10h
	mov	al,'o'
	int	10h
	mov	al,' '
	int	10h
	mov	al,'w'
	int	10h
	mov	al,'o'
	int	10h
	mov	al,'r'
	int	10h
	mov	al,'l'
	int	10h
	mov	al,'d'
	int	10h
	mov	al,'!'

	jmp	$

	times	510-($-$$)	db	0
	dw	0xAA55