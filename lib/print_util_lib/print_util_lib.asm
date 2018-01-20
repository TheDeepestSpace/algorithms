;------------------------------------------------------------------------------
; Object file	:	print_util_lib.o
; Version		:	0.0
; Created date 	:	2018-01-20
; Last update	:	2018-01-20
; Author		:	Boris
; Description	:	???
;
; Assemble		: see ../makefile
;------------------------------------------------------------------------------

section .data

									; for print_endl
									; -----------------------------------------
	endl: db 0x0a,0x0e				; end of line string declaration
	endl_len: equ $-endl			; end of line string length declaration

section .text
	global print_endl				; declaring global access for print_endl

;------------------------------------------------------------------------------
; print_endl	:	prints line feed and carriage return characters to stdout
; updated		:	2018-01-16
; in			:	[none]
; out			:	[none]
; modifies		:	[none]
; calls			:	[none]
;

print_endl:
	push eax						;
	push ebx						; preserving registers
	push ecx						;
	
	mov eax,0x04					;
	mov ebx,0x01					;
	mov ecx,endl					; printing endl string to stdout
	mov edx,endl_len				;
	int 0x80						;

	pop ecx							;
	pop ebx							; preserving registers
	pop eax							;
	ret								; returning contro	
