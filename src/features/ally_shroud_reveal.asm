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

@HOOK 0x004B07E0 _DisplayClass__Map_Cell_Share_Shroud
@HOOK 0x00561385 _TechnoClass__Revealed_Reveal_Other_Player_Buildings

_TechnoClass__Revealed_Reveal_Other_Player_Buildings:
    push ebx
    push eax
    push edx

    mov  ebx,[esi+11h]
    mov  eax,esi
    xor  edx,edx
    call dword [ebx+98h]

    pop  edx
    pop  eax
    pop  ebx

    cmp  dword [Globals___ScenarioInit],1
    jmp  0x00561392

_DisplayClass__Map_Cell_Share_Shroud:
    cmp  byte [Globals___Session_Type],GameType.GAME_NORMAL
    jz   .Shroud_Share

    cmp  byte [Globals___Session_Type],GameType.GAME_SKIRMISH
    jz   .Shroud_Share

    cmp  byte [AllyReveal],1
    jz   .Shroud_Share

    jmp  .No_Shroud_Share

.Shroud_Share:
    jmp  0x004B07E9

.No_Shroud_Share:
    jmp  0x004B0800
