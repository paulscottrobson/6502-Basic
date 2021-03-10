; ************************************************************************************************
; ************************************************************************************************
;
;		Name:		new.asm
;		Purpose:	New program
;		Created:	28th February 2021
;		Reviewed: 	7th March 2021
;		Author:		Paul Robson (paul@robsons.org.uk)
;
; ************************************************************************************************
; ************************************************************************************************

		.section code

; ************************************************************************************************
;
;										New command
;
; ************************************************************************************************

Command_New: ;; [new]
Command_XNew: ;; <new>

		jsr 	ResetCodeAddress 			; point to first line
		ldy 	#0 							; and zap it.
		tya
		sta 	(codePtr),y
		jsr 	CommandClear 				; clear everything down.
		jmp 	CommandEND 					; do END code, as there's nothing to run.

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
		