;----------------------------------------------------------------
; src/fixes/submarine_decloak_skip_campaign.asm
;
; In Singleplayer, submarines resurface if the owning house has no structures left. In some missions this has an odd effect on the player who operates only submarines.
; Now, only AI submarines will resurface.
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------
@HACK 0x004D4AE8,0x004D4AF0,_HouseClass__AI_Submarine_Decloak_Check
    cmp  byte[Globals___Session_Type],GameType.GAME_NORMAL
    je   0x004D4C67
.Ret:
    test eax,eax
    jnz  0x004D4C67
    jmp  0x004D4AF0
@ENDHACK
