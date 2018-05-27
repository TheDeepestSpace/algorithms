is_sorted: \
	is_sorted.o \
	../lib/sort_lib/sort_util/sort_util.o
	ld -m elf_i386 -o is_sorted \
	is_sorted.o \
	../lib/sort_lib/sort_util/sort_util.o
is_sorted.o: is_sorted.asm
	nasm -f elf -g -F dwarf is_sorted.asm -l is_sorted.lst
