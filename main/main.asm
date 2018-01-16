section .text
	global _start

_start:

	mov al,0x00000001
	mov bl,0x00000000
	int 0x80
