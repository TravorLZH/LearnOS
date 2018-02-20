harddisk_bootloader:
	mov	ax,0x7C0
	mov	ds,ax

	mov	bx,content
	call	print_string
	jmp	$

print_string:
	mov	ah,0Eh
.rep:
	mov	al,[bx]
	add	bx,1
	cmp	al,0
	je	.done
	int	10h
	jmp	.rep
.done:
	ret

content	db	"Hello world",0xD,0xA,0

	times	510-($-$$)	db	0
	dw	0xAA55
