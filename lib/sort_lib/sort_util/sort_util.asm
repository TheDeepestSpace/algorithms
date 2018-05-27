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
; modifies		:	CF
; calls			:	???
;

check_sorted:
	push eax						; preserve registers
	push ebx						;

	xor ebx,ebx						; xor out ebx
	dec ecx							; decrement string length counter
.loop:
	cmp ebx,ecx						; compare string traverser with length
	je .sorted						; go to .sorted if they are equial
	mov eax,[esi+ebx*4]				; move current dword to eax
	cmp eax,[esi+ebx*4+4]			; compare eax against next dword
	ja .unsorted					; go to .unsorted if eax is above
	inc ebx							; increment string traverser
	jmp .loop						; go to .loop
.unsorted:
	clc								; clear carry flag
	jmp .done						; go to .done
.sorted:
	stc								; set carry flag
	jmp .done						; go to .done
.done:
	pop ebx							; retrieving registers
	pop eax							;

	ret								; returning control
