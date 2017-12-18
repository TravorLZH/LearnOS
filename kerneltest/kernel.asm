[org	0x9000]	; This kernel will be loaded at address 0x9000
	mov	bx,kern_msg
	call	print_string
	jmp	$

	kern_msg	db	"Hello from kernel",0xD,0xA,0

%include	"../common/print.asm"