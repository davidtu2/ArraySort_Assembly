TITLE Homework 5              (David Tu_Homework 5_Visual Studio 2013_ver2.asm)

; Program which sorts the array below into ascending order using indirect addressing
; David Tu
; Creation Date: 3/15/2016
; Revisions: Version 2
; Date: 3/15/2016
; Modified By: 3/24/2016

INCLUDE Irvine32.inc

.data
array BYTE 20,10,60,5,120,90,100,7,25,12

.code
main PROC
	mov esi, OFFSET array			;esi and edi will point to 20
	mov edi, OFFSET array
	add edi, TYPE array				;now edi should point to 10
	mov ecx, LENGTHOF array			;initialize counter to array's length - 1
	dec ecx						
	mov eax, 0						;initialize eax
L1:
	push ecx						;save counter
L2:
	mov al, [esi]
	cmp al,[edi]
	jbe L3							;jump if al <= [edi]
	xchg [edi], al					;if al > [edi], exchange them
	mov [esi], al					;move [edi] into [esi]
L3: 							
	inc edi							;move pointer to next element
	loop L2

	inc esi
	mov edi, esi					;have edi point one element over from esi
	add edi, TYPE array
	pop ecx							;restore counter
	loop L1

	mov esi, OFFSET array			;setup for DumpMem procedure
	mov ecx, LENGTHOF array
	mov ebx, TYPE array

	call DumpMem
	call WaitMsg
	exit
main ENDP
END main