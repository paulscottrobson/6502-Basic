; ************************************************************************************************
; ************************************************************************************************
;
;		Name:		check.asm
;		Purpose:	Various checking 
;		Created:	25th February 2021
;		Author:		Paul Robson (paul@robsons.org.uk)
;
; ************************************************************************************************
; ************************************************************************************************

		.section code		
		
; ************************************************************************************************
;
;								Check and consume right bracket
;	
; ************************************************************************************************

CheckRightParen:
		lda 	(codePtr),y
		iny
		cmp 	#TKW_RPAREN
		bne 	_CRPError
		rts
_CRPError:
		error 	MissingRP

; ************************************************************************************************
;
;								Check and consume comma
;	
; ************************************************************************************************

CheckComma:
		lda 	(codePtr),y
		iny
		cmp 	#TKW_COMMA
		bne 	_CCError
		rts
_CCError:
		error 	MissingComma

		.send code		
		