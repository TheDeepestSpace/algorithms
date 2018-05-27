;------------------------------------------------------------------------------
; Object file	:	print_util_lib.o
; Version		:	0.0
; Created date 	:	2018-01-20
; Last update	:	2018-01-21
; Author		:	Boris
; Description	:	???
;
; Assemble		: 	see ../makefile
;					need cnv_lib.o
;------------------------------------------------------------------------------

extern cnv_long						; bring in cnv_long fron cnv_lib.o

section .data

									; for print_endl
									; -----------------------------------------
	endl: db 0x0a					; end of line string declaration
	endl_len: equ $-endl			; end of line string length declaration

section .text
	global print_endl				; declaring global access for print_endl
	global print_string				; declaring global access for print_string

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

;------------------------------------------------------------------------------
; print_string	:	print string of dword-numbers to stdoutput in given base
;					notation
; updated		:	2018-01-21
; in			:	bl - base
;				:	esi - string porinter
; out			:	[none]
; modifies		:	[none]
; calls			:	cnv_long
;

print_string:
	push eax						;
	push ebx						; preserving rgisters
	push ecx						;
	push esi						;

.loop:
	cmp ecx,0						; checking if counter reached zero
	je .done						; go to .done subroutine if so

	push esi						; save string pointer
	push ecx						; save counter

	mov eax,dword[esi]				; move current dword to eax
	call cnv_long					; call cnv_long

	push ebx						; save base register
	push ecx						; save converted string length

	push 0x09						; put '\t' onto the stack
	mov eax,0x04					;
	mov ebx,0x01					;
	mov ecx,esp 					; print tab to stdout
	mov edx,0x01					;
	int 0x80						;
	add esp,0x4						; adjust stack pointer

	pop ecx							; restore converted string length

	mov eax,0x04					;
	mov ebx,0x01					;
	mov dl,cl						; print converted string to stdout
	mov ecx,esi						;
	int 0x80						;

	pop ebx							; restore string base
	pop ecx							; restore string counter
	dec ecx							; decrement it by one

	pop esi							; restore string pointer
	add esi,0x04					; move up by one dword
	jmp .loop						; continue to loop through the string
.done:

	pop esi							;
	pop ecx							; restoring registers
	pop ebx							;
	pop eax							;
	ret								; returnong control


