[org	0x7C00]
bootloader_start:
	mov	[bootdrive],dl
	mov	bx,bootingmsg
	call	print_string
	mov	bp,0x8000
	mov	sp,bp
	
	mov	bx,0x9000
	mov	dh,2
	mov	dl,[bootdrive]
	call	disk_load
	jmp	0x9000
	mov	ah,0Eh
	mov	al,'E'
	int	10h
	jmp	$
	bootdrive	db	0
	bootingmsg	db	"Booting into kernel",0xD,0xA,0
%include	"../common/io.asm"
%include	"../common/disk.asm"
	times	510-($-$$)	db	0
	dw	0xAA55