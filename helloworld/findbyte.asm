;
; A simple boot sector program that demonstrates addressing.
;
	mov	ah,0Eh

	; First attempt
	mov	al,the_secret
	int	10h	; Does it print an X
	; Second attempt
	mov	al,[the_secret]
	int	10h	; Does it print an X
	; Third attempt
	mov	bx,the_secret
	add	bx,0x7c00
	mov	al,[bx]
	int	10h	; Does it print an X
	; Fourth attempt
	mov	al,[0x7c1e]
	int	10h
	mov	cx,0x7c00
	mov	dx,$$
	cmp	cx,dx
	jne	xend
	mov	al,'Y'
	int	10h
xend:
	jmp	$
	
the_secret:
	db	"X"

	times	510-($-$$)	db	0
	dw	0xAA55