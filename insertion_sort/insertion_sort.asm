;------------------------------------------------------------------------------
; Executable file	:	insertion_sort
; Version			:	0.0
; Created date 		:	2018-01-16
; Last update		:	2018-01-16
; Author			:	Boris
; Description		:	???
;
; Assemble			:	see makefile
;------------------------------------------------------------------------------

section .text
	global _start		; declaring starting point

_start:

	mov al,0x00000001	; setting syscallcode 'exit'
	mov bl,0x00000000	; setting return code
	int 0x80			; performing interrupt
