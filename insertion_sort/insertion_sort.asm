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
extern check_sorted

section .data
%include "string.txt"
	string_to_print_len equ 0x2710

	str_sorted: db 'sorted',10,13	; define 'sorted' string
	str_sorted_len equ $-str_sorted	; define length of 'sorted' string

	str_unsorted: db 'unsorted',10,13	; define 'unsorted' string
	str_unsorted_len equ $-str_unsorted	; define length of 'unsorted' string


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

	call check_sorted				; make call to check_sorted routine

	mov eax,0x04					; set sys_wraite syscall code
	mov ebx,0x02					; set std_out file fr write
	jnc .unsorted					; go to .unsorted if CF=0

	mov ecx,str_sorted				; set output buffer to value of str_sorted
	mov edx,str_sorted_len			; set length of output buffer to
									; str_sorted_len
	jmp .int						; go to .int
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
