;------------------------------------------------------------------------------
; Object file	:	insertion_sort_lib.o
; Version		:	0.0
; Created date 	:	2018-01-20
; Last update	:	2018-01-20
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
	push ecx




	pop esi
	pop ecx
	ret
