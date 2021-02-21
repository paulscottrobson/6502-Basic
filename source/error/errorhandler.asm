; ************************************************************************************************
; ************************************************************************************************
;
;		Name:		errorhandler.asm
;		Purpose:	Handles errors.
;		Created:	21st February 2021
;		Author:		Paul Robson (paul@robsons.org.uk)
;
; ************************************************************************************************
; ************************************************************************************************

		.section code

ErrorHandler:
		lda 	#$EE
		tay
		debug
_EHHalt:jmp 	_EHHalt
				
		.send code

