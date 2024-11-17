;----------------------------------------------------------------
; src/fixes/cloaked_units_shadow_fix.asm
;
; Fix shadows on cloaked units appearing green instead of translucent
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------
@HOOK 0x005672D9 _Green_Shadow_On_Cloaked_Units_Fix

_Green_Shadow_On_Cloaked_Units_Fix:

    push 0x00657EE4
    mov  esi, dword [ebp-24h]
    push esi
    mov  eax,dword [ebp+9h]
    push 1130h
    jmp  0x005672EA
