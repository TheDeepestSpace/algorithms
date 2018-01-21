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
	endl: db 0x0a,0x0e				; end of line string declaration
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
;

print_string: 
	push eax
	push ebx
	push ecx
	push esi

.loop:
	cmp ecx,0
	je .done

	push esi

	push ecx

	mov eax,dword[esi]
	call cnv_long

	push ebx
	push ecx

	push 0x09
	mov eax,0x04
	mov ebx,0x01
	mov ecx,esp 
	mov edx,0x01
	int 0x80
	add esp,0x4

	pop ecx

	mov eax,0x04
	mov ebx,0x01
	mov dl,cl
	mov ecx,esi
	int 0x80
	
	pop ebx
	pop ecx
	dec ecx

	pop esi
	add esi,0x04
	jmp .loop
.done:
	
	pop esi
	pop ecx
	pop ebx
	pop eax
	ret


