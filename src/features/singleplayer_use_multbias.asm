;----------------------------------------------------------------
; src/features/singleplayer_use_multbias.asm
;
; Normally, in Normal games, the house specific bias is not used in multiplier calculations. This allows Singleplayer houses to use the multiplier effects
; Skirmish and Multiplayer games continue to use the house's ActLike house as the value source, because stats are copied from the 8 houses. Singleplayer games use its own house ID. 
; 
; This function is enabled by default.
; 
; No compatibility issues is expected as these AI customizations was not a feature of the unmodified game. Care should be taken when maps are supplied with Mult values that otherwise are inert.
;
;----------------------------------------------------------------

@LJMP 0x004D2DAE, _HouseClass__Assign_Handicap__Singleplayer_Mode_Use_Mult

_HouseClass__Assign_Handicap__Singleplayer_Mode_Use_Mult:
    jnz  0x004D2DB4 ; multiplayer mode
    mov  dword eax,[eax+1] ; use HouseClass:ID
    jmp  0x004D2DBA ; back to multiplayer mode calculation, using ID instead of ActsLike


