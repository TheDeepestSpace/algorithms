insertion_sort: insertion_sort.o
	ld -m elf_i386 -o insertion_sort insertion_sort.o
insertion_sort.o: insertion_sort.asm
	nasm -f elf -g -F dwarf insertion_sort.asm -l insertion_sort.lst
