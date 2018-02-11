all: cnv_lib/cnv_lib.o time_lib/time_lib.o print_util_lib/print_util_lib.o sort_lib/sort_util/sort_util.o sort_lib/insertion_sort/insertion_sort_lib.o

cnv_lib/cnv_lib.o: cnv_lib/cnv_lib.asm
	nasm -f elf -g -F dwarf cnv_lib/cnv_lib.asm -l cnv_lib/cnv_lib.lst

time_lib/time_lib.o: time_lib/time_lib.asm
	nasm -f elf -g -F dwarf time_lib/time_lib.asm -l time_lib/time_lib.lst

print_util_lib/print_util_lib.o: print_util_lib/print_util_lib.asm
	nasm -f elf -g -F dwarf print_util_lib/print_util_lib.asm -l print_util_lib/print_util_lib.lst

sort_lib/sort_util/sort_util.o: sort_lib/sort_util/sort_util.asm
	nasm -f elf -g -F dwarf sort_lib/sort_util/sort_util.asm -l sort_lib/sort_util/sort_util.lst

sort_lib/insertion_sort/insertion_sort_lib.o: sort_lib/insertion_sort/insertion_sort_lib.asm
	nasm -f elf -g -F dwarf sort_lib/insertion_sort/insertion_sort_lib.asm -l sort_lib/insertion_sort/insertion_sort_lib.lst
