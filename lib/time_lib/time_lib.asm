;------------------------------------------------------------------------------
; Object file	:	time_lib.o
; Version		:	0.0
; Created date 	:	2018-01-20
; Last update	:	2018-01-21
; Author		:	Boris
; Description	:	???
;
; Assemble		:	see ../makefile
;					need cnv_lib.o
;------------------------------------------------------------------------------


extern cnv_long						; bring in cnv_long from cnv_lib.o

section .bss

									; for print_time 
									; ----------------------------------------
	timeval_buf: resb 8				; reserve pointer for timeval structure
									; struct timeval {
									;	time_t		tv_sec; /* 4 bytes */
									;	suseconds_t	tv_usec; /* 4 bytes  */
									; }

section .data
	global print_time				; declaring global access for print_time

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
