;------------------------------------------------------------------------------
; Executable file	:	is_sorted
; Version			:	0.0
; Created date 		:	2018-02-10
; Last update		:	2018-02-10
; Author			:	Boris
; Description		:	???
;
; Assemble			:	see makefile
;------------------------------------------------------------------------------

extern check_sorted

section .data
%include "string.txt"
	string_to_check_len equ 0x06

	str_sorted: db 'sorted',10,13
	str_sorted_len equ $-str_sorted

	str_unsorted: db 'unsorted',10,13
	str_unsorted_len equ $-str_unsorted


section .text
	global _start					; declaring starting point

_start:

	mov ebx,0x0a					; specifying base 10 in ebx
	mov esi,string_to_check			; moving string pointer to esi
	mov ecx,string_to_check_len		; moving string length to ecx

	call check_sorted

	mov eax,0x04
	mov ebx,0x02
	jnc .unsorted

	mov ecx,str_sorted
	mov edx,str_sorted_len
	jmp .int
.unsorted:
	mov ecx,str_unsorted
	mov edx,str_unsorted_len
.int:
	int 0x80
	
	mov al,0x01						; setting syscall code 'exit'
	mov bl,0x0						; setting return code
	int 0x80						; performing interrupt
