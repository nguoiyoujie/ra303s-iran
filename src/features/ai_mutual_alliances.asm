;----------------------------------------------------------------
; src/features/ai_mutual_alliances.asm
;
; Introduces INI controls for allowing AI to respond to player request for mutual alliances.
; Also allows suppression of Computer_Paranoid, for use in multiplayer games with pre-determined alliances.
; Note that this behaviour can affect Map Actions that uses make and break alliances!  
; 
; This function is enabled by by filling in one or more of the following INI keys:
;   Rules.ini/Map > [AI] > ComputerParanoidForceDisabledSkirmish - Computer_Paranoid() will do nothing
;   Rules.ini/Map > [AI] > ForcedAlliances - Suppresses ally requests (forced_alliances.asm). Also disables Computer_Paranoid()
;   Rules.ini/Map > [AI] > FixAIAlly - Allows players to ally with AI. AI will mutually ally with player.
;   Rules.ini/Map > [AI] > FixAIParanoid - Suppress Computer_Paranoid() when an alliance is made between players
; 
; This function is enabled by default for skirmish mode is not controllable.
;
; No compatibility issues is expected as these AI customizations was not a feature of the unmodified game.
;
;----------------------------------------------------------------

@HOOK 0x004D6102 _HouseClass__Make_Ally_Computer_Paranoid_Call_Patch_Out
@HOOK 0x004DE5D2 _HouseClass__Is_Allowed_To_Ally_AI_Player_Fix
@HOOK 0x004BD1DD _EventClass__Execute_Make_Ally
;@HOOK 0x004D84C4 _HouseClass__MPlayer_Defeated_Check_AI_Allies ; What does this do other than making skirmish games never end as long as AI exist?
@HOOK 0x004DE640 _HouseClass__Computer_Paranoid_Force_Disabled_Skirmish
@HOOK 0x004D62DD _HouseClass__Make_Ally_Show_Computer_Has_Allied


; Suppress IsHuman check, allowing AI alliances to be published to the in-game UI message system
_HouseClass__Make_Ally_Show_Computer_Has_Allied:
    jmp  0x004D62E3


; On certain conditions, force Computer_Paranoid() to return without performing any work
_HouseClass__Computer_Paranoid_Force_Disabled_Skirmish:
    cmp  byte [Globals___Session_Type],GameType.GAME_SKIRMISH
    jz   .Ret

    cmp  byte [Toggle_Feature_ComputerParanoidForceDisabledSkirmish],1
    jz   .Ret

    cmp  byte [Toggle_Feature_ForcedAlliances],1
    jz   .Ret

    jmp  .Normal_Ret

    retn

.Normal_Ret:
    push ebp
    mov  ebp,esp
    push ebx
    push ecx
    jmp  0x004DE645 ; continue with function

.Ret:
    retn


; Suppresses game over if enemy AI is still alive. Could be useful in coop games
_HouseClass__MPlayer_Defeated_Check_AI_Allies:
    cmp  byte [Globals___Session_Type],GameType.GAME_SKIRMISH
    jz   .Ret

    test byte [eax+42h],2
    jz   0x004D84CD
.Ret:
    jmp  0x004D84CA


; Mutual alliance toggle. AI will return the favor when Player makes an ally request to it
_EventClass__Execute_Make_Ally:
    push eax
    push edx
    call HouseClass__Make_Ally

    cmp  byte [Globals___Session_Type],GameType.GAME_SKIRMISH
    je   .Apply_Fix_For_Skirmish

    cmp  byte [Toggle_Fix_AIAlly],0
    jz   .Ret

.Apply_Fix_For_Skirmish:
    pop  eax ; Pop registers in reverse order, HouseType
    call HouseClass__As_Pointer
    mov  ecx,eax  ; now contains new HouseClass
    pop  eax ; HouseClass
    push ecx
    call HouseClass__HousesType
    mov  edx,eax ; now contains new HouseType
    pop  eax ; now conains new HouseClass

    test byte [eax+42h],2
    jnz  .Ret2

    call HouseClass__Make_Ally
    jmp  0x004BD1E2

.Ret:
    add  esp,8
    jmp  0x004BD1E2

.Ret2:
    jmp  0x004BD1E2


; Suppress IsHuman check, allowing the player to ally the AI
_HouseClass__Is_Allowed_To_Ally_AI_Player_Fix:
    cmp  byte [Globals___Session_Type],GameType.GAME_SKIRMISH
    je   .Allow_AI_Ally

    cmp  byte [Toggle_Fix_AIAlly],1
    jz   .Allow_AI_Ally

    cmp  dword eax,0
    jz   0x004DE5D8
    test byte [eax+42h],2
    jnz  0x004DE5E2 ; Assemble jmp here to fix?
    jmp  0x004DE5D8

.Allow_AI_Ally:
    jmp  0x004DE5E2


; Suppress Computer_Paranoid() call when a human alliance is made
_HouseClass__Make_Ally_Computer_Paranoid_Call_Patch_Out:
    cmp  byte [Globals___Session_Type],GameType.GAME_SKIRMISH
    je   .Jump_Over

    cmp  byte [Toggle_Fix_AIParanoid],1
    jz   .Jump_Over

    call HouseClass__Computer_Paranoid

.Jump_Over:
    jmp  0x004D6107 ; Jump over
