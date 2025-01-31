;----------------------------------------------------------------
; src/fixes/invalid_team_crash_fix.asm
;
; Fixes crash when an invalid TeamType (-1) is invoked by Team-related triggers. This may be due to bad editing of the Triggers section in a map, or placed by an old editor (old editor has a bug where teamtype is written in a wrong space).
; The check is performed by checking specifically for -1. 
;
; This function is enabled by default and is not controllable.
;
;
; No compatibility issues is expected.
;----------------------------------------------------------------

; move EB 10 to EB 15 to short jump past the JMP function call
@SJMP 0x00554A2F,0x00554A46 ; Create Team
@SJMP 0x00554A67,0x00554A7E ; Destroy Team

@HACK 0x00554A98,0x00554A9E,_TActionClass__operator__Reinforcement_Team_Validity_Check_Fix
    cmp   edx,-1
    jz    0x00554AA8
    imul  edx,esi
    mov   eax,dword[eax+0x10]
    jmp   0x00554A9E
@ENDHACK
