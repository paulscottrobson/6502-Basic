; ************************************************************************************************
; ************************************************************************************************
;
;		Name:		cold.asm
;		Purpose:	Cold start
;		Created:	10th March 2021
;		Author:		Paul Robson (paul@robsons.org.uk)
;
; ************************************************************************************************
; ************************************************************************************************

		.section code

ColdStartEntry:	;; <coldstart>
		ldx 	#$FF
		txs
		;
		;		Print the banner
		;
		.device_clear		
		ldy 	#255
_CSBanner:	
		iny
		lda 	Intro,y
		beq 	_CSStart		
		cmp 	#8
		bcc 	_CSInk
		.device_print
		jmp 	_CSBanner
_CSInk:	.device_ink
		jmp 	_CSBanner		
		;
		;		If coldstartnew = 0 then a NEW command is executed on cold start
		;		otherwise it just executes a CLEAR.		
		;
_CSStart:		
		.if coldstartnew == 1
		.main_new	
		.else
		.main_clear
		.endif
		;
		jmp 	WarmStartEntry

Intro:	.text 	6,"*** 6502 Extended BASIC ***",13,13
		.text 	3,"Written by Paul Robson 2021",13,13
		.text 	2,"Basic "
		.VersionText
		.text 	" ("
		.VersionDate
		.text 	")",13,13,0
		.send code
