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