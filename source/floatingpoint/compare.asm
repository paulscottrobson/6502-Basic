; ************************************************************************************************
; ************************************************************************************************
;
;		Name:		compare.asm
;		Purpose:	Comparison for floats
;		Created:	22nd February 2021
;		Author:		Paul Robson (paul@robsons.org.uk)
;
; ************************************************************************************************
; ************************************************************************************************

		.section code		
		
; ************************************************************************************************
;
;				  Compare two floats TOS, return $FF,$00,$01 in X, SP to/from in A
;									(non destructive of values)
;
; ************************************************************************************************

FLTCompare:	;; <fCompare>
		debug
		jmp 	FLTCompare

		.send code		
		
