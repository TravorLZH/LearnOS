[org	0x7C00]
; Read some sectors from the boot disk using our disk_read function
	mov	[BOOT_DRIVE],dl	; BIOS stores our boot drive in Dl, so it's
						; best to remember this for later.
	mov	bx,READING_DISK
	call	print_string
	call	CRLF
	mov	bp,0x8000		; Here we set our stack safely out of the
	mov	sp,bp			; way, at 0x8000
	
	mov	bx,0x9000		; Load two sectors to 0x0000(ES):0x9000(BS)
	mov	dh,2			; from the boot disk
	mov	dl,[BOOT_DRIVE]
	call	disk_load
	
	mov	dx,[0x9000]		; Print out the first loaded word, which
	call	print_hex	; We expect to be 0xDADA, sored
						; at address 0x9000
	call	CRLF
	mov	dx,[0x9000+512]	; Also, print the first word from the 2nd loaded sector: shoutld be 0xFACE
	call	print_hex
	call	CRLF
	jmp	$
	
%include	"../common/io.asm"
%include	"../common/disk.asm"

; Global variables
BOOT_DRIVE:	db	0
READING_DISK	db	"Getting data from hard disk...",0

; Bootsector padding
times	510-($-$$)	db	0
dw	0xAA55

; We know that BIOS will load only the first 512-byte sector from the disk,
; so if we purposely add a few more sectors to our code by repeating some
; familiar numbers, we can prove to ourselfs that we actually loaded those
; additional two sectors from the disk we booted from.
times	256	dw	0xDADA
times	256	dw	0xFACE