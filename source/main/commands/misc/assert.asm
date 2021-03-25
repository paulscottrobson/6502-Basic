; ************************************************************************************************
; ************************************************************************************************
;
;		Name:		assert.asm
;		Purpose:	Assert command
;		Created:	26th February 2021
;		Reviewed: 	7th March 2021
;		Author:		Paul Robson (paul@robsons.org.uk)
;
; ************************************************************************************************
; ************************************************************************************************

		.section code

; ************************************************************************************************
;
;										Assert command
;
; ************************************************************************************************

Command_Assert: ;; [assert]
		jsr 	EvaluateRootInteger 		; what is being asserted.
		jsr 	MInt32Zero 					; is it true ?
		beq 	_CAError
		rts
_CAError:
		.throw 	Assert		

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
		