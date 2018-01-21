;------------------------------------------------------------------------------
; Executable file	:	main
; Version			:	0.0
; Created date		:	2018-01-16
; Last update		:	2018-01-21
; Author			:	Boris
; Description		:	???
;
; Assemble			:	see makefile
;------------------------------------------------------------------------------

extern print_time
extern print_endl
extern print_string

section .data
	string_to_print: dd 0x06,0x1c,0x01f0,0x1fc0,0x01fff000
	string_to_print_len equ 0x05


section .text
	global _start					; declaring starting point

_start:
	call print_time					; executing print_time
	call print_endl					; executing print_endl

	mov ebx,0x0a
	mov esi,string_to_print
	mov ecx,string_to_print_len
	call print_string
	call print_endl

	call print_time					; executing print_time [1]
	call print_endl					; executing print_endl [1]

	mov al,0x01						; setting syscall code 'exit'
	mov bl,0x0						; setting return code
	int 0x80						; performing interrupt
