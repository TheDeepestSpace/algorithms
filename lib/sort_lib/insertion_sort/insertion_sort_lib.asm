;------------------------------------------------------------------------------
; Object file	:	insertion_sort_lib.o
; Version		:	0.0
; Created date 	:	2018-01-20
; Last update	:	2018-01-22
; Author		:	Boris
; Description	:	???
;
; Assemble		: see ../../makefile
;------------------------------------------------------------------------------

section .text
	global insertion_sort			; declaring global access for 
									; insertion_sort

;------------------------------------------------------------------------------
; insertion_sort	:	sorts provided string of dwords in accending order
; updated			:	2018-01-20
; in				:	esi - array pointer
;						ecx	- array length
; out				:	exi - array pointer
; modifies			:	[none]
; calls				:	[none]
;

insertion_sort:
	push esi						;
	push eax						;
	push ebx						; preserving registers
	push ecx						;
	push edx						;
	push edi						;

	mov ebx,0x01					; setting start index counter to 1
.loop_1:
	cmp ebx,ecx						; check if index counter reached end of
									; string
	ja .done						; go to .done if so
	mov edx,[esi+ebx*4]				; copy current element to edx

	dec ebx							; 
	mov eax,ebx						; set subcounter to counter-1
	inc ebx							;
.loop_2:
	cmp eax,0xffffffff				; check if subcounter is -1
	je .after_1						; go to after-outer-loop subroutine 
	cmp [esi+eax*4],edx				; check if current element is less then
									; the one denoted by current subcounter
	jbe .after_1					; go to after-outer-loop subroutine

	mov edi,[esi+eax*4]				; move element denoted by subcounter to 
	mov [esi+eax*4+4],edi			; an element right after it
	dec eax							; decrement subcouter
	jmp .loop_2						; repeat inner loop
.after_1:
	mov [esi+eax*4+4],edx			; move current element to an element
									; right after the one denoted by subcounter
	inc ebx							; increment index counter
	jmp .loop_1						; repeat outer loop
.done:
	pop edi							;
	pop edx							;
	pop ecx							; retrieving registers
	pop ebx							;
	pop eax							;
	pop esi							;

	ret								; returning control
