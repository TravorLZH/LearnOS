AS=yasm

.PHONY: clean all run disk

all:	floppy.img disk.img
floppy.img:	setup.bin diskboot.bin
	cat setup.bin diskboot.bin > $@
disk:	disk.img

disk.img:
	dd if=/dev/zero of=disk.img bs=1 count=512
run:
	qemu-system-i386 -fda floppy.img -hda disk.img
%.bin:	%.asm
	$(AS) -fbin -o $@ $^
clean:
	rm -f *.img *.bin
