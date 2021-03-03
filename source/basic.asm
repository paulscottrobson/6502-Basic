;
;	Automatically generated
;
	.include "main/01common.inc"
	.include "main/02macros.inc"
	.include "main/03data.inc"
	.include "main/imath/intmacros.inc"
	.include "main/main.inc"
	.include "assembler/assembler.inc"
	.include "device/device.inc"
	.include "error/error.inc"
	.include "error/errorhandler.inc"
	.include "floatingpoint/floatingpoint.inc"
	.include "interaction/interaction.inc"
	.include "string/memory.inc"
	.include "string/string.inc"
	.include "tokeniser/tokeniser.inc"
	.include "variable/variable.inc"
	.section code
section_start_main:
	.send code
	.include "main/main.asm"
	.section code
section_end_main:
	.send code
	.section code
section_start_assembler:
	.send code
	.include "assembler/assembler.asm"
	.section code
section_end_assembler:
	.send code
	.section code
section_start_device:
	.send code
	.include "device/device.asm"
	.section code
section_end_device:
	.send code
	.section code
section_start_error:
	.send code
	.include "error/error.asm"
	.section code
section_end_error:
	.send code
	.section code
section_start_floatingpoint:
	.send code
	.include "floatingpoint/floatingpoint.asm"
	.section code
section_end_floatingpoint:
	.send code
	.section code
section_start_interaction:
	.send code
	.include "interaction/interaction.asm"
	.section code
section_end_interaction:
	.send code
	.section code
section_start_string:
	.send code
	.include "string/string.asm"
	.section code
section_end_string:
	.send code
	.section code
section_start_tokeniser:
	.send code
	.include "tokeniser/tokeniser.asm"
	.section code
section_end_tokeniser:
	.send code
	.section code
section_start_variable:
	.send code
	.include "variable/variable.asm"
	.section code
section_end_variable:
	.send code
