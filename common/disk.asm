; Reading disk: Load DH sectors to ES:BX from drive DL
disk_load:
	push	dx	; Store DX on stack so later we can recall
				; how many sectors were request to be read,
				; even if it is altered in the meantime
	mov	bx,LOADING_DISK
	call	print_string
	call CRLF
	mov	al,dh	; Read DH sectors
	mov	ah,0x02	; BIOS read sector function
	mov	ch,0	; Select cylinder 0
	mov	dh,0	; Select head 0
	mov	cl,2	; Select the 2nd sector (the one after boot sector)
	int	13h		; Now issue the BIOS interrupt to do the actual read.

	jc	disk_error	; jc is another jumping instruction, that jumps only if the carry flag is set.
	
	; This jumps if what BIOS reported as the number of sectors
	; actually read in al is not equal to the number expected
	pop	dx
	cmp	dh,al
	jne	disk_error2
	mov	bx,DISK_SUCCESS
	call	print_string
	call	CRLF
	ret

disk_error:
	mov	bx,DISK_ERROR_MSG
	call	print_string
	call	CRLF
	jmp	$

disk_error2:
	mov	bx,DISK_ERROR_MSG2
	call	print_string
	call	CRLF
	jmp	$
; Variables
DISK_SUCCESS	db	"SUCCESS",0
LOADING_DISK	db	"Loading disk...",0
DISK_ERROR_MSG	db	"ERROR: Failed to read disk",0
DISK_ERROR_MSG2	db	"ERROR: Failed to load disk data",0