; ************************************************************************************************
; ************************************************************************************************
;
;		Name:		tokentext.asm
;		Purpose:	Text tables for tokens
;		Created:	7th March 2021
;		Author:		Paul Robson (paul@robsons.org.uk)
;
; ************************************************************************************************
; ************************************************************************************************

		.section code

; ************************************************************************************************
;
;										Token text.
;
; ************************************************************************************************

TokenTableAddress:
		.word 	Group0Text
		.word 	Group1Text
		.word 	Group2Text
		.word 	Group3Text

		.include "../generated/tokentext0.inc"
		.include "../generated/tokentext1.inc"
		.include "../generated/tokentext2.inc"
		.include "../generated/tokentext3.inc"

		.send 	code