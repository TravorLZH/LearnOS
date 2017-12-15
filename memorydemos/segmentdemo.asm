; A program that demonstrates segment offsetting
	mov	ah,0Eh
	
	mov	al,[the_secret]
	int	10h
	
	mov	bx,0x7c0
	mov	ds,bx
	mov	al,[the_secret]
	int	10h
	
	mov	al,[es:the_secret]
	int	10h
	
	mov	bx,0x7c0
	mov	es,bx
	mov	al,[es:the_secret]
	int	10h
	
	jmp	$
	
the_secret:
	db	"X"
	
	times	510-($-$$)	db	0
	dw	0xAA55