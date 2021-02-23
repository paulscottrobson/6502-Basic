; ************************************************************************************************
; ************************************************************************************************
;
;		Name:		importexport.asm
;		Purpose:	Import/Export float from tokenised form.
;		Created:	22nd February 2021
;		Author:		Paul Robson (paul@robsons.org.uk)
;
; ************************************************************************************************
; ************************************************************************************************

;
;		Import tokenised FP at (codePtr),y into stack at A
;
FPImport:	;; <importtoken>
		debug
		jmp 	FPImport