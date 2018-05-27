;------------------------------------------------------------------------------
; Object file	:	sort_util.o
; Version		:	0.0
; Created date 	:	2018-02-10
; Last update 	:	2018-02-10
; Author		:	Boris
; Description	:	???
;
; Assemble		:	see ../../makefile
;------------------------------------------------------------------------------

section .text
	global check_sorted				; declaring global access for
									; check_sorted

;------------------------------------------------------------------------------
; check_sorted	:	checks if given string of dwords is sorted in ascending order
; updated		:	2018-02-10
; in			:	esi - string pointer
;					ecx - string length
; out			:	CF  - 0x0 or 0x01
; modifies		:	???
; calls			:	???
;

check_sorted:
	push eax
	push ebx

	xor ebx,ebx
	dec ecx
.loop:
	cmp ebx,ecx
	je .sorted
	mov eax,[esi+ebx*4]
	cmp eax,[esi+ebx*4+4]
	ja .unsorted
	inc ebx
	jmp .loop
.unsorted:
	clc
	jmp .done
.sorted:
	stc
	jmp .done
.done:
	pop ebx
	pop eax

	ret
