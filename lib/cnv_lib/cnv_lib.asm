;------------------------------------------------------------------------------
; Object file	:	cnv_lib.o
; Version		:	0.0
; Created date 	:	2018-01-20
; Last update	:	2018-01-21
; Author		:	Boris
; Description	:	???
;
; Assemble		: 	see ../makefile
;------------------------------------------------------------------------------


section .data

									; for cnv_long
									;------------------------------------------
	cnv_long_str: 					; empty string to hold convertion string
									; of 32 NILs, 1 linefeed and 
									; 1 carriage return
				db 0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
				db 0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
				db 0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
				db 0x0,0x0
	cnv_long_str_len: equ $-cnv_long_str	; length of cnv_long_str

section .text
	global cnv_long					; declaring global access for cnv_long

;------------------------------------------------------------------------------
; cnv_long	:	converts number to provided base and stores in a string
; updated	:	2018-01-16
; in		:	eax - number to convert
;				bl	- base
; out		:	esi - pointer to output string
;				cl	- string length
; modifies	:	[none]
; calls		:	[none]
;

cnv_long:
	push eax						;
	push edx						; preserving registers
	push ebx						;

	mov esi,cnv_long_str+cnv_long_str_len-1	; setting esi string pointer to the
											; end of string
	mov cl,0x0						; setting output string length (lf & cr)
	and ebx,0x0f					; masking out first byte of ebx register
.cnv:
	xor edx,edx						; emptying edx (remainder register)
	div ebx							; deviding eax by ebx, remainder in edx
	add dl,'0'						; makinf digit an ascii char e.g. 1 -> '1'
	inc cl							; increment string size counter
	cmp dl,'9'						; check if base >10
	jbe .append						; go to storing portion of the algorithms 
									; if no
	add dl,'a'-'9'					; else get a corresponding letter
.append:
	mov byte[esi],dl				; store digit in string
	dec esi							; move string pointer one up
	cmp ax,0						; check if number is fully converted
	jnz .cnv						; go to .cnz if not

	inc esi
	pop ebx							;
	pop edx							; preserving registers
	pop eax							;
	ret								; returning control
