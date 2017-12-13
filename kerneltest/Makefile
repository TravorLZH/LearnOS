all:
	$(MAKE) kernel.bin
	$(MAKE) bootload.bin
	$(MAKE) os.flp
kernel.bin: kernel.asm
	nasm -fbin kernel.asm -o kernel.bin
bootload.bin: bootload.asm
	nasm -fbin bootload.asm -o bootload.bin
os.flp: kernel.bin bootload.bin
	rm -f os.flp
	dd if=bootload.bin of=os.flp
	dd if=kernel.bin of=os.flp seek=1
clean:
	rm kernel.bin
	rm bootload.bin
	rm os.flp