[org	0x7C00]
bootloader_start:
	mov	[bootdrive],dl
	mov	bx,bootingmsg
	call	print_string
	mov	bp,0x8000
	mov	sp,bp
	
	mov	ah,0x02	; read sectors into memory
	mov	bx,kernel_start
	mov	al,1
	mov	ch,0
	mov	cl,2
	mov	dh,2
	mov	dl,[bootdrive]
	int	0x13
	cmp	al,1
	jne	.failed
	mov	ah,0Eh
	mov	al,'S'
	jmp	kernel_start
.failed:
	mov	ah,0Eh
	mov	al,'E'
	int	10h
	jmp	$
	bootdrive	db	0
	bootingmsg	db	"Booting into kernel",0xD,0xA,0
%include	"../common/io.asm"
	times	510-($-$$)	db	0
	dw	0xAA55

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
kernel_start:
;	mov	ax,3	; Set VGA mode (text)
;	int	0x10
	
	mov	ah,0Eh
	mov	al,'A'
	int	0x10

times	((0x400)-($-$$))	db	0