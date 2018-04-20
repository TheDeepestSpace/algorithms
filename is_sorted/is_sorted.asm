;------------------------------------------------------------------------------
; Executable file	:	is_sorted
; Version			:	0.0
; Created date 		:	2018-02-10
; Last update		:	2018-02-17
; Author			:	Boris
; Description		:	???
;
; Assemble			:	see makefile
;------------------------------------------------------------------------------

extern check_sorted

section .data
%include "string.txt"				; include text file with array values
	string_to_check_len equ 0x06	; define length of that array

	str_sorted: db 'sorted',10,13	; define 'sorted' string
	str_sorted_len equ $-str_sorted	; define length of 'sorted' string

	str_unsorted: db 'unsorted',10,13	; define 'unsorted' string
	str_unsorted_len equ $-str_unsorted	; define length of 'unsorted' string


section .text
	global _start					; declaring starting point

_start:

	mov ebx,0x0a					; specifying base 10 in ebx
	mov esi,string_to_check			; moving string pointer to esi
	mov ecx,string_to_check_len		; moving string length to ecx

	call check_sorted				; make call to check_sort routine

	mov eax,0x04					; set sys_write syscall code
	mov ebx,0x02					; set std_out file for write
	jnc .unsorted					; go to .unsorted subroutine if carry flag
									; (modified by check_sort) is not set

	mov ecx,str_sorted				; set output buffer to value of str_sorted
	mov edx,str_sorted_len			; set length of output buffer to
									; str_sorted_len
	jmp .int						; go to .int subroutine
.unsorted:
	mov ecx,str_unsorted			; set output buffer to value of
									; str_unsorted
	mov edx,str_unsorted_len		; set length of output buffer to
									; str_unsorted_len
.int:
	int 0x80						; perform interrupt

	mov al,0x01						; setting syscall code 'exit'
	mov bl,0x0						; setting return code
	int 0x80						; performing interrupt
