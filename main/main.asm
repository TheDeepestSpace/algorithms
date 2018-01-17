;------------------------------------------------------------------------------
; Executable file	:	main
; Version			:	0.0
; Created date		:	2018-01-16
; Last update		:	2018-01-16
; Author			:	Boris
; Description		:	???
;
; Assemble			:	see makefile
;------------------------------------------------------------------------------

section .bss
	timeval_buf: resb 8				; reserve pointer for timeval structure
									; struct timeval {
									;	time_t		tv_sec; /* 4 bytes */
									;	suseconds_t	tv_usec; /* 4 bytes  */
									; }

section .data
	cnv_long_str: 					; empty string to hold convertion string
									; of 32 NILs, 1 linefeed and 
									; 1 carriage return
				db 0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
				db 0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
				db 0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
				db 0x0,0x0
	cnv_long_str_len: equ $-cnv_long_str	; length of cnv_long_str
	endl: db 0x0a,0x0e				; end of line string declaration
	endl_len: equ $-endl			; end of line string length declaration

section .text
	global _start					; declaring starting point

_start:
	call print_time					; executing print_time
	call print_endl					; executing print_endl

	call print_time
	call print_endl

	mov al,0x01						; setting syscall code 'exit'
	mov bl,0x0						; setting return code
	int 0x80						; performing interrupt

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
	ret								; returning control


;------------------------------------------------------------------------------
; print_time	:	prints timeval concatenated in decimal format to stdout
; updated		:	2018-01-16
; in			:	[none]
; out			:	[none]
; modifies		:	[none]
; calls			:	cnv_long
;

print_time:
	push eax						;
	push ebx						;
	push ecx						; preserving registers
	push edx						;
	push esi						;

	mov al,0x4e						; sys_gettimeofday code
	mov ebx,timeval_buf				; supplying timeval pointer
	int 0x80						; making call to kernel

	mov eax,dword[timeval_buf]		; loading first part of timeval to eax
	mov bl,0x0a						; loading decimal base to bl
	call cnv_long					; executing conversion function

	mov eax,0x04					;
	mov ebx,0x01					;
	mov dl,cl						; printing generated string to stdout
	mov ecx,esi						;
	int 0x80						;

	mov eax,dword[timeval_buf+4]	; loading second part of timeval to eax
	mov bl,0x0a						; loading decimal base do bl
	call cnv_long					; executing convertion function

	mov eax,0x04					;
	mov ebx,0x01					;
	mov dl,cl						; printing generated string to stdout
	mov ecx,esi						;
	int 0x80						;

	pop esi							;
	pop edx							;
	pop ecx							; preserving registers
	pop ebx							;
	pop eax							;
	ret								; returning control


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
	mov cl,0x01						; setting output string length (lf & cr)
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
	
	pop ebx							;
	pop edx							; preserving registers
	pop eax							;
	ret								; returning control
