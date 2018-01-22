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
; modifies			:	???
; calls				:	???

insertion_sort:
	push esi
	push eax
	push ebx
	push ecx
	push edx
	push edi

	mov ebx,0x01
.loop_1:
	cmp ebx,ecx
	ja .done
	mov edx,[esi+ebx*4]
	dec ebx
	mov eax,ebx
	inc ebx
.loop_2:
	cmp eax,0xffffffff
	je .after_1
	cmp [esi+eax*4],edx
	jbe .after_1

	mov edi,[esi+eax*4]
	mov [esi+eax*4+4],edi
	dec eax
	jmp .loop_2
.after_1:
	mov [esi+eax*4+4],edx
	inc ebx
	jmp .loop_1
.done:
	pop edi
	pop edx
	pop ecx
	pop ebx
	pop eax
	pop esi
	ret
