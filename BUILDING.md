Building and Running the bootable images
=======
Before to do the following, you should have the following two softwares:

[Netwide Assembler](http://nasm.sourceforge.net "NASM's Official Website")

[Quick EMUlator](http://www.qemu.org "QEMU's Official Website")

You may gain the bootable images by:

> $ nasm -fbin foo.asm -o bar.flp

You may boot the image by using qemu:

> $ qemu-system-i386 -fda bar.flp

These are the steps I use to test a bootable image
