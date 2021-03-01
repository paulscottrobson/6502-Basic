; ************************************************************************************************
; ************************************************************************************************
;
;		Name:		x16io.asm
;		Purpose:	Input/Output x16
;		Created:	28th February 2021
;		Author:		Paul Robson (paul@robsons.org.uk)
;
; ************************************************************************************************
; ************************************************************************************************

		.section code	

; ************************************************************************************************
;
;											Print CR/LF
;
; ************************************************************************************************

IONewLine: ;; <crlf>
		pha
		lda 	#13
		jsr 	IOPrintChar
		pla
		rts

; ************************************************************************************************
;
;											Print Tab
;
; ************************************************************************************************

IOTab: ;; <tab>
		pha
		lda 	#32
		jsr 	IOPrintChar
		pla
		rts

; ************************************************************************************************
;
;											Print A
;
; ************************************************************************************************

IOPrintChar: ;; <print>
		tax
		phy
		txa
		jsr 	$FFD2
		ply
		rts

		.send 	code
