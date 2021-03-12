; ************************************************************************************************
; ************************************************************************************************
;
;		Name:		x16break.asm
;		Purpose:	Break check X16
;		Created:	12th March 2021
;		Author:		Paul Robson (paul@robsons.org.uk)
;
; ************************************************************************************************
; ************************************************************************************************

		.section code	

; ************************************************************************************************
;
;								Break Check (must preserve Y)
;
; ************************************************************************************************

X16Break: ;; <break>
		jsr 	$FFE1
		beq 	_IsBreak
		rts
_IsBreak:
		.throw 	Break

		.send 	code		
