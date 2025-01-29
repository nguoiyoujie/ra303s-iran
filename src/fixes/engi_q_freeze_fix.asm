;----------------------------------------------------------------
; src/fixes/engi_q_freeze_fix.asm
;
; Fixes frozen movement
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

@LJMP 0x004C32C3, _FootClass__Detach_Botched_Loop_Increment_Fix

_FootClass__Detach_Botched_Loop_Increment_Fix:
    call 0x005C38B3 ; memmove_()
    inc  ecx
    jmp  0x004C32C8
