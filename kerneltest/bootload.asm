[org	0x7C00]
bootloader_start:
	mov	[bootdrive],dl
	mov	bx,bootingmsg
	call	print_string
	mov	bp,0x8000
	mov	sp,bp
	
	;mov	ah,0x02	; read sectors into memory
	mov	bx,0x9000
	mov	dh,1
	;mov	al,1
	;mov	ch,0
	;mov	cl,2
	;mov	dh,0
	mov	dl,[bootdrive]
	;int	0x13
	call	disk_load
	jne	.failed
	mov	ah,0Eh
	mov	al,'S'
	jmp	0x9000
.failed:
	mov	ah,0Eh
	mov	al,'E'
	int	10h
	jmp	$
	bootdrive	db	0
	bootingmsg	db	"Booting into kernel",0xD,0xA,0
%include	"../common/print.asm"
%include	"../common/crlf.asm"
%include	"../common/disk.asm"
	times	510-($-$$)	db	0
	dw	0xAA55
