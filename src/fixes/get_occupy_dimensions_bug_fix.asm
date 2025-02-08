;----------------------------------------------------------------
; src/fixes/get_occupy_dimensions_bug_fix.asm
;
; DisplayClass::Get_Occupy_Dimensions() has a mistake where the list is checked against NULL, and continues execution if it is null, when it should be otherwise
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

@SET 0x004AFFD6,{jz 0x004B0064} ; DisplayClass::Get_Occupy_Dimensions()
