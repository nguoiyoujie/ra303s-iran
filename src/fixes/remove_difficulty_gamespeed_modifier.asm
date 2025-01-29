;----------------------------------------------------------------
; src/fixes/remove_difficulty_gamespeed_modifier.asm
;
; In offline games speed gets multiplied with game/AI difficulty on top of the normal game speed (which you get set in the options menu). It is simply confusing.
; Patch this logic out so it always uses the normal speed.
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected from an adjustment to game speed.
;
;----------------------------------------------------------------

@LJMP 0x004A7DE3, _Main_Loop_Modify_Game_Speed_Based_On_Difficulty

_Main_Loop_Modify_Game_Speed_Based_On_Difficulty:
    mov  byte bh, 1
    test bh, bh
    jmp  0x004A7DE8
