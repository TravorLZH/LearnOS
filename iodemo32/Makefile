CFLAGS=-m32 -ffreestanding
all: os.img
kernel.o:	kernel.c
	@echo "Compiling kernel.c"
	@gcc $(CFLAGS) -c kernel.c
kernel.bin:	kernel.o kernel_entry.o
	@echo "Linking target kernel.bin"
	@ld -melf_i386 -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary
os.img: kernel.bin bootload.bin
	@echo "Creating OS image"
	@cat bootload.bin kernel.bin > os.img
clean:
	rm *.bin
	rm *.img