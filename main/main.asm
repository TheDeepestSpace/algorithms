;------------------------------------------------------------------------------
; Executable file	:	main
; Version			:	0.0
; Created date		:	2018-01-16
; Last update		:	2018-01-20
; Author			:	Boris
; Description		:	???
;
; Assemble			:	see makefile
;------------------------------------------------------------------------------

extern print_time
extern print_endl


section .text
	global _start					; declaring starting point

_start:
	call print_time					; executing print_time
	call print_endl					; executing print_endl

	call print_time					; executing print_time [1]
	call print_endl					; executing print_endl [1]

	mov al,0x01						; setting syscall code 'exit'
	mov bl,0x0						; setting return code
	int 0x80						; performing interrupt
