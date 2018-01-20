all: cnv_lib/cnv_lib.o time_lib/time_lib.o

cnv_lib/cnv_lib.o: cnv_lib/cnv_lib.asm
	nasm -f elf -g -F dwarf cnv_lib/cnv_lib.asm -l cnv_lib/cnv_lib.lst

time_lib/time_lib.o: time_lib/time_lib.asm
	nasm -f elf -g -F dwarf time_lib/time_lib.asm -l time_lib/time_lib.lst
