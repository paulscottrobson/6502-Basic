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

TokTest:	;; <test>
			ldx 	#$FF
			txs
			set16 	codePtr,TokenText1
			jsr 	Tokenise

TokStop:	ldx 	#0
_TokCheck:	lda 	TokenBytes1,x
			cmp 	tokenBuffer,x
_TokFail:	bne 	_TokFail
			inx
			cmp 	#$80
			bne 	_TokCheck			
			jmp 	$FFFF
			
			.include "../../generated/toktest.inc"

		.send code
