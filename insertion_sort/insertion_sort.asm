;------------------------------------------------------------------------------
; Executable file	:	insertion_sort
; Version			:	0.0
; Created date 		:	2018-01-16
; Last update		:	2018-01-21
; Author			:	Boris
; Description		:	???
;
; Assemble			:	see makefile
;------------------------------------------------------------------------------

extern print_time
extern print_endl
extern print_string
extern insertion_sort

section .data
%include "string.txt"
	string_to_print_len equ 0x2710


section .text
	global _start					; declaring starting point

_start:

	mov ebx,0x0a					; specifying base 10 in ebx
	mov esi,string_to_print			; moving string pointer to esi
	mov ecx,string_to_print_len		; moving string length to ecx
	call print_string				; executing print_string
	call print_endl					; executing print_endl

	call print_time					; executing print_time
	call print_endl					; executing print_endl

	call insertion_sort				; executing insertion sort

	call print_time					; executing print_time [1]
	call print_endl					; executing print_endl [1]

	mov ebx,0x0a					; specifying base 10 in ebx
	mov esi,string_to_print			; moving string pointer to esi
	mov ecx,string_to_print_len		; moving string length to ecx
	call print_string				; executing print_string
	call print_endl					; executing print_endl

	mov al,0x01						; setting syscall code 'exit'
	mov bl,0x0						; setting return code
	int 0x80						; performing interrupt
