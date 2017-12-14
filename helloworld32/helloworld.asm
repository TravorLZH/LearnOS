[org	0x7C00]

	mov	bp,0x9000	; Set the stack.
	mov	sp,bp

	call	clear_screen
	mov	bx, MSG_REAL_MODE
	;call	print_string

	call	switch_to_pm	; Note that we never return from here.
	mov	bx, ERR_PM
	call	print_string
	jmp	$

%INCLUDE	"../common/io.asm"
%INCLUDE	"../common32/gdt.asm"
%INCLUDE	"../common32/print.asm"
%INCLUDE	"../common32/protectedmode.asm"

[bits	32]
; This is where we arrive after switching to add initializing protected mode.
BEGIN_PM:

	mov	ebx,MSG_PROT_MODE
	call	print_string_pm	; Use our 32-bit print routine.

	jmp	$					; Hang.

; Global varibales
MSG_REAL_MODE	db	"Started in 16-bit Real Mode",0
MSG_PROT_MODE	db	"Successfully landed in 32-bit Protected Mode",0
ERR_PM			db	"Failed to enter 32-bit protected mode",0

; Bootsector padding
times	510-($-$$)	db	0
dw	0xAA55
