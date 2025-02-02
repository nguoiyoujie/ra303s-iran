;----------------------------------------------------------------
; src/features/ally_shroud_reveal.asm
;
; Houses allied to the player originally reveal shroud only in singleplayer campaign.
; This can now be controlled for skirmish games (by default) and multiplayer.
;
; This function is enabled in multiplayer via:
;   Spawn.ini > [Settings] > AllyReveal=yes
;
; This function is enabled by default in skirmish and is not controllable.
;
;----------------------------------------------------------------

cextern Globals___ScenarioInit
cextern Globals___Session_Type

@HACK 0x004B07E0,0x004B07E7,_DisplayClass__Map_Cell_Share_Shroud
    cmp  byte[Globals___Session_Type],GameType.GAME_NORMAL
    jz   0x004B07E9 ; Shroud_Share
    cmp  byte[Globals___Session_Type],GameType.GAME_SKIRMISH
    jz   0x004B07E9
    cmp  byte[Spawn.Settings.AllyReveal],1
    jz   0x004B07E9
    jmp  0x004B0800 ; no Shroud_Share
@ENDHACK


@HACK 0x00561385,0x0056138B,_TechnoClass__Revealed_Reveal_Other_Player_Buildings
    push ebx
    push eax
    push edx
    mov  ebx,[esi+0x11]
    mov  eax,esi
    xor  edx,edx
    call dword[ebx+0x98]
    pop  edx
    pop  eax
    pop  ebx
    cmp  dword[Globals___ScenarioInit],1
    jmp  0x00561392
@ENDHACK
