;----------------------------------------------------------------
; src/fixes/invisible_explosions_fix.asm
;
; Fix an invisible explosion by setting a certain constructor flag to 0. The flag is Ground level animation. It is possible the animation may be hidden behind other layers when it was used
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

@SETB 0x00405E90 0x00

; old solution
;@HOOK 0x00405E8B _AnimTypeClass__fn_init_FRAG1_Constructor

;_AnimTypeClass__fn_init_FRAG1_Constructor:
;    push 0               ; __int32
;    push 0               ; __int32
;    push 0               ; __int32
;    jmp  0x00405E91
