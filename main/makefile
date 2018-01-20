main: main.o ../lib/time_lib/time_lib.o
	ld -m elf_i386 -o main main.o ../lib/time_lib/time_lib.o
main.o: main.asm
	nasm -f elf -g -F dwarf main.asm -l main.lst
