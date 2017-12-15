LOCAL_INCLUDE=include
CFLAGS=-I$(LOCAL_INCLUDE) -m32 -ffreestanding -nostdlib
all: os.img
kernel_entry.o:	kernel_entry.asm
	@echo "Assembling kernel_entry.asm"
	@nasm -felf kernel_entry.asm -o kernel_entry.o
api.o:	api.c $(LOCAL_INCLUDE)/api.h
	@echo "Compiling api.c"
	@gcc $(CFLAGS) -c api.c
basic.o:	basic.c $(LOCAL_INCLUDE)/basic.h
	@echo "Compiling basic.c"
	@gcc $(CFLAGS) -c basic.c -o basic.o
libbc.a:	basic.o api.o
	@echo "Linking static library libbc.a"
	@ar rc libbc.a api.o basic.o
kernel.o:	kernel.c
	@echo "Compiling kernel.c"
	@gcc $(CFLAGS) -c kernel.c
kernel.bin:	kernel.o kernel_entry.o libbc.a
	@echo "Linking target kernel.bin"
	@ld -melf_i386 -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o libbc.a --oformat binary
bootload.bin: bootload.asm
	@echo "Assembling target bootload.bin"
	@nasm -fbin bootload.asm -o bootload.bin
os.img: kernel.bin bootload.bin
	@echo "Creating OS image"
	@cat bootload.bin kernel.bin > os.img
clean:
	rm *.o
	rm *.a
	rm *.bin
	rm *.img