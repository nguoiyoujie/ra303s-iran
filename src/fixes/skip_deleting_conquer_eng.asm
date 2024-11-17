;----------------------------------------------------------------
; src/fixes/skip_deleting_conquer_eng.asm
;
; Skips the deletion of the conquer.eng file
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------
@HOOK 0x00551D27 _WinMain_Delete_Conquer_Eng_Skip

_WinMain_Delete_Conquer_Eng_Skip:
    jmp  0x00551D4B
