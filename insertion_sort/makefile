insertion_sort: \
	insertion_sort.o \
	../lib/time_lib/time_lib.o \
	../lib/print_util_lib/print_util_lib.o \
	../lib/cnv_lib/cnv_lib.o \
	../lib/sort_lib/insertion_sort/insertion_sort_lib.o \
	../lib/sort_lib/sort_util/sort_util.o
	ld -m elf_i386 -o insertion_sort \
	insertion_sort.o \
	../lib/time_lib/time_lib.o \
	../lib/print_util_lib/print_util_lib.o \
	../lib/cnv_lib/cnv_lib.o \
	../lib/sort_lib/insertion_sort/insertion_sort_lib.o \
	../lib/sort_lib/sort_util/sort_util.o
insertion_sort.o: insertion_sort.asm
	nasm -f elf -g -F dwarf insertion_sort.asm -l insertion_sort.lst
