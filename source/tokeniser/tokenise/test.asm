; ************************************************************************************************
; ************************************************************************************************
;
;		Name:		test.asm
;		Purpose:	Tokenise testing code.
;		Created:	8th March 2021
;		Author:		Paul Robson (paul@robsons.org.uk)
;
; ************************************************************************************************
; ************************************************************************************************

		.section code

; ************************************************************************************************
;
;								Tokenise testing code.
;
; ************************************************************************************************

TokTest:	
			set16 	codePtr,ttestCode
			jsr 	Tokenise
TokStop:	.debug
			jmp 	TokStop
			lda 	tokenBuffer

ttestCode:	.byte 	ttEnd-ttestCode-1
			.text 	'ab ac( ad$ ae$( a0# a9#('
ttEnd:			
			.word 	$FFFF


		.send code
