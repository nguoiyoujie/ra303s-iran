;----------------------------------------------------------------
; src/features/loading/load_both_movies.asm
;
; In the original game, only if MOVIES1.MIX is not present, then MOVIES2.MIX is loaded. This was because the movie mixes game in separate CD-ROMS.
; This selection is no longer needed, so we just go ahead and load both mixes.
; 
; This function is not configurable at the moment
; No compatibility issues is expected. 
;
;----------------------------------------------------------------

@HACK 0x004F80D4,0x004F80DD,_Init_Secondary_Mixfiles_Movies1_Check_NOP
    mov  eax,0x24
    jmp  0x004F80DD
@ENDHACK


@HACK 0x004F80F5,0x004F80FC,_Init_Secondary_Mixfiles_Movies1_Jump_NOP
    mov  eax,0x24
    jmp  0x004F80FC
@ENDHACK

