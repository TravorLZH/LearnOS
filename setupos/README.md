OS Setup demo
=======

This is the first bootloader I made that both reads and writes the disk. In case my floppy image contains two sectors. One for the floppy's boot. The other for the hard drive.

## How it works

At first, insert the floppy to the first drive (A:). Then the bootloader will read the second sector. At last write the data to the first sector of the hard drive which is the boot sector.

## Significance

This is a testing of disk operation for [TravorOS](https://github.com/TravorLZH/TravorOS). Now it's successful, so I can research more on virtual 8086 in my Operating System. Therefore I can access disk easily.
