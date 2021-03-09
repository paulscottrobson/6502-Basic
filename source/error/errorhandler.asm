; ************************************************************************************************
; ************************************************************************************************
;
;		Name:		errorhandler.asm
;		Purpose:	Handles errors.
;		Created:	21st February 2021
;		Reviewed: 	7th March 2021
;		Author:		Paul Robson (paul@robsons.org.uk)
;
; ************************************************************************************************
; ************************************************************************************************

		.section code

; ************************************************************************************************
;
;										Handle error X
;
; ************************************************************************************************

ErrorHandler:		
		set16 	temp0,ErrorTextList 		; list of length-prefixed strings, scan down them.
_EHFind:dex									; errors start at 1
		beq 	_EHFound
		ldy 	#0 							; goto next text message, add length + 1 to the pointer.
		sec
		lda 	temp0
		adc 	(temp0),y
		sta 	temp0
		bcc 	_EHFind
		inc 	temp0+1
		jmp 	_EHFind
_EHFound:
		.main_printstring 					; print the string "temp0" now points to.
		ldy 	#0 							; in a line, e.g. the offset to next is non zero.
		lda 	(codePtr),y
		beq 	_EHNoLine

		set16 	temp0,EHAtMsg 				; print " @ "
		.main_printstring	

		ldy 	#1 							; set up line number in TOS
		ldx 	#0
		lda 	(codePtr),y
		sta 	esInt0,x
		iny
		lda 	(codePtr),y
		sta 	esInt1,x
		lda 	#0
		sta 	esInt2,x
		sta 	esInt3,x
		set16 	temp0,convertBuffer 		; convert to string and print
		ldy 	#10 						; in base 10.
		lda 	#0							; stack position zero.
		.main_inttostr
		.main_printstring		
_EHNoLine: 									

_EHHalt:jmp 	_EHHalt

EHAtMsg:
		.text 	3," @ "
;
;		List of error messages in order.
;
		.include "../generated/errortext.inc"

		.send code

; ************************************************************************************************
;
;									Changes and Updates
;
; ************************************************************************************************
;
;		Date			Notes
;		==== 			=====
;		07-Mar-21 		Pre code read v0.01
;
; ************************************************************************************************
