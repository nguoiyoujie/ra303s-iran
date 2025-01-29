;
; Copyright (c) 2012, 2013 Toni Spets <toni.spets@iki.fi>
;
; Permission to use, copy, modify, and distribute this software for any
; purpose with or without fee is hereby granted, provided that the above
; copyright notice and this permission notice appear in all copies.
;
; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
;

; Spawn code for CnCNet, reads SPAWN.INI for options

%define GetCommandLineA                             0x005E5904
%define calloc                                      0x005E1EF6
%define operator_new                                0x005BBF80
%define DynamicVectorClass__Add                     0x004B9DA0
%define nameTags                                    0x0068043A
%define GameActive                                  0x00669924
%define MessageListClass__Init                      0x00505244
%define inet_addr                                   0x005E59B8
%define _Buffer_Clear                               0x005C4DE0
%define pWinsock_this                               0x0069172C
%define chatColor                                   0x0067F313
%define TechLevel                                   0x006016C8
%define Version107InMix                             0x00680538

%define GameFlags                                   0x00669908

%define NetPort                                     0x00609DBC
%define htonl                                       0x005E5A30
%define time_                                       0x005CEDA1

@LJMP 0x004F44DC, Select_Game
; these force the game to use the actual port for sending and receiving packets rather than the default 1234
@LJMP 0x005A8ADF, SendFix
@LJMP 0x005A8A75, ReceiveFix
@LJMP 0x0052971B, _Wait_For_Players_Hack_Wait_Time

;@SJMP  0x0052A2DB, 0x0052A2E0
;@SJMP  0x0052BF02, 0x0052BF0B ; Make version protocol 0 netcode also use frame limiter
@LJMP 0x004A7D3D, _Main_Loop_Use_Normal_Gamespeed_Code_With_Other_Network_Protocols
@LJMP 0x005292E5, _Queue_AI_Multiplayer_Do_Timing_Related_Code_With_Other_Network_Protocols

_Queue_AI_Multiplayer_Do_Timing_Related_Code_With_Other_Network_Protocols:
    cmp  byte [spawner_is_active], 0 ; if spawner is active jump over version protocol check
    jnz  .Ret

    cmp  byte [0x0067F2B5], 2
    jnz  0x00529317

.Ret:
jmp        0x005292EE

_Main_Loop_Use_Normal_Gamespeed_Code_With_Other_Network_Protocols:
    mov  byte dh, [0x0067F2B5]
    cmp  byte [spawner_is_active], 0 ; if spawner isn't active do normal code
    jz   .Ret
    cmp  byte dh, 2 ; if protocol version isn't 2 jump to protocol 2 speed
    jnz  0x004A7D82

.Ret:
    cmp  dh, 2
    jmp  0x004A7D46

struc NetAddress
    .port:      RESD 1
    .ip:        RESD 1
    .zero:      RESW 1
endstruc

struc Player
    .name       RESB 12
    .address    RESB NetAddress_size
    .side       RESB 1
    .color      RESB 1
    .pad        RESB 5
endstruc

struc Session
    .type       RESB 1
    .protocol   RESB 1
    .mission    RESD 1
    .bases      RESD 1
    .credits    RESD 1
    .oreRegen   RESD 1
    .crates     RESD 1
    .unk1       RESD 1
    .unitCount  RESD 1
    .aiPlayers  RESD 1
    .scenario   RESB 44
endstruc

struc sockaddr_in
    .sin_family RESW 1
    .sin_port   RESW 1
    .sin_addr   RESD 1
    .sin_zero   RESB 8
endstruc

%define game Globals___Session_Type

[section .data]
SpectatorsArray  TIMES 32 db 0
tunnel_ip dd 0
tunnel_port dd 0
tunnel_id dd 0
var_dword:          dd 0
HumanPlayers        dd 0 ; Need to read it from here for spawner stats

[section .text]
; args: <section>, <key>, <default>
%macro spawn_INI_Get_Bool 3
    call_INIClass__Get_Bool CCINIClass_Spawn, {%1}, {%2}, {%3}
%endmacro

; args: <section>, <key>, <default>
%macro spawn_INI_Get_Int 3
    call_INIClass__Get_Int CCINIClass_Spawn, {%1}, {%2}, {%3}
%endmacro

; args: <section>, <key>, <default>, <dst>, <dst_len>
%macro spawn_INI_Get_String 5
    call_INIClass__Get_String CCINIClass_Spawn, {%1}, {%2}, {%3}, {%4}, {%5}
%endmacro

%macro New_Player 0
    mov  eax,1
    mov  edx, Player_size
    call calloc
    add  eax, 0xC
    call IPXAddressClass__IPXAddressClass
    sub  eax, 0xC
%endmacro

Initialize_Spawn:
%push
    push ebp
    mov  ebp, esp

%define plr ebp-4
%define buf ebp-36
%define sect ebp-68

    sub  esp,68

    ; check -SPAWN exists
    call GetCommandLineA

    mov  edx, str_arg_Spawn
    call _stristr
    test eax,eax
    je   .exit_error

    cmp  [nameTags], dword 0
    je   .first_run

    mov  eax,0
    jmp  .exit

.first_run:

    call_CCINIClass__Load str_ini_Spawn, CCFileClass_Spawn, CCINIClass_Spawn

    ; Set spawner_is_running global variable to 'true'
    mov  byte [spawner_is_active], 1

    ; load settings from ini
    mov  [game + Session.type], byte 5 ; Set to type skirmish

    mov  [game + Session.protocol], byte 2
    mov  [game + Session.mission], dword 0

    ; tunnel ip
    lea  eax, [buf]
    spawn_INI_Get_String str_Tunnel, str_Ip, str_EmptyString, eax, 32

    lea  eax, [buf]
    push eax
    call inet_addr
    mov  [tunnel_ip], eax

    ; tunnel port
    spawn_INI_Get_Int str_Tunnel, str_Port, 0
    AND  eax, 0xFFFF
    push eax
    call htonl
    mov  [tunnel_port], eax

    ; tunnel id
    spawn_INI_Get_Int str_Settings, str_Port, 0
    AND  eax, 0xFFFF
    push eax
    call htonl
    mov  [tunnel_id], eax

    ; spawn locations
    spawn_INI_Get_Int str_SpawnLocations, str_Multi1, -1
    mov  dword [multi1_Spawn], eax

    spawn_INI_Get_Int str_SpawnLocations, str_Multi2, -1
    mov  dword [multi2_Spawn], eax

    spawn_INI_Get_Int str_SpawnLocations, str_Multi3, -1
    mov  dword [multi3_Spawn], eax

    spawn_INI_Get_Int str_SpawnLocations, str_Multi4, -1
    mov  dword [multi4_Spawn], eax

    spawn_INI_Get_Int str_SpawnLocations, str_Multi5, -1
    mov  dword [multi5_Spawn], eax

    spawn_INI_Get_Int str_SpawnLocations, str_Multi6, -1
    mov  dword [multi6_Spawn], eax

    spawn_INI_Get_Int str_SpawnLocations, str_Multi7, -1
    mov  dword [multi7_Spawn], eax

    spawn_INI_Get_Int str_SpawnLocations, str_Multi8, -1
    mov  dword [multi8_Spawn], eax

    ; multi1-8 colours
    spawn_INI_Get_Int str_HouseColors, str_Multi1, 0xFF
    mov  byte [Multi1_Colour], al

    spawn_INI_Get_Int str_HouseColors, str_Multi2, 0xFF
    mov  byte [Multi2_Colour], al

    spawn_INI_Get_Int str_HouseColors, str_Multi3, 0xFF
    mov  byte [Multi3_Colour], al

    spawn_INI_Get_Int str_HouseColors, str_Multi4, 0xFF
    mov  byte [Multi4_Colour], al

    spawn_INI_Get_Int str_HouseColors, str_Multi5, 0xFF
    mov  byte [Multi5_Colour], al

    spawn_INI_Get_Int str_HouseColors, str_Multi6, 0xFF
    mov  byte [Multi6_Colour], al

    spawn_INI_Get_Int str_HouseColors, str_Multi7, 0xFF
    mov  byte [Multi7_Colour], al

    spawn_INI_Get_Int str_HouseColors, str_Multi8, 0xFF
    mov  byte [Multi8_Colour], al

    ; multi1-8 countries
    spawn_INI_Get_Int str_HouseCountries, str_Multi1, 0xFF
    mov  byte [Multi1_Country], al

    spawn_INI_Get_Int str_HouseCountries, str_Multi2, 0xFF
    mov  byte [Multi2_Country], al

    spawn_INI_Get_Int str_HouseCountries, str_Multi3, 0xFF
    mov  byte [Multi3_Country], al

    spawn_INI_Get_Int str_HouseCountries, str_Multi4, 0xFF
    mov  byte [Multi4_Country], al

    spawn_INI_Get_Int str_HouseCountries, str_Multi5, 0xFF
    mov  byte [Multi5_Country], al

    spawn_INI_Get_Int str_HouseCountries, str_Multi6, 0xFF
    mov  byte [Multi6_Country], al

    spawn_INI_Get_Int str_HouseCountries, str_Multi7, 0xFF
    mov  byte [Multi7_Country], al

    spawn_INI_Get_Int str_HouseCountries, str_Multi8, 0xFF
    mov  byte [Multi8_Country], al

    ; multi1-8 handicaps
    spawn_INI_Get_Int str_HouseHandicaps, str_Multi1, 0xFF
    mov  byte [Multi1_Handicap], al

    spawn_INI_Get_Int str_HouseHandicaps, str_Multi2, 0xFF
    mov  byte [Multi2_Handicap], al

    spawn_INI_Get_Int str_HouseHandicaps, str_Multi3, 0xFF
    mov  byte [Multi3_Handicap], al

    spawn_INI_Get_Int str_HouseHandicaps, str_Multi4, 0xFF
    mov  byte [Multi4_Handicap], al

    spawn_INI_Get_Int str_HouseHandicaps, str_Multi5, 0xFF
    mov  byte [Multi5_Handicap], al

    spawn_INI_Get_Int str_HouseHandicaps, str_Multi6, 0xFF
    mov  byte [Multi6_Handicap], al

    spawn_INI_Get_Int str_HouseHandicaps, str_Multi7, 0xFF
    mov  byte [Multi7_Handicap], al

    spawn_INI_Get_Int str_HouseHandicaps, str_Multi8, 0xFF
    mov  byte [Multi8_Handicap], al

    ; Spectators
    spawn_INI_Get_Bool str_IsSpectator, str_Multi1, 0
    mov  byte [SpectatorsArray+0x0C], al

    spawn_INI_Get_Bool str_IsSpectator, str_Multi2, 0
    mov  byte [SpectatorsArray+0x0D], al

    spawn_INI_Get_Bool str_IsSpectator, str_Multi3, 0
    mov  byte [SpectatorsArray+0x0E], al

    spawn_INI_Get_Bool str_IsSpectator, str_Multi4, 0
    mov  byte [SpectatorsArray+0x0F], al

    spawn_INI_Get_Bool str_IsSpectator, str_Multi5, 0
    mov  byte [SpectatorsArray+0x10], al

    spawn_INI_Get_Bool str_IsSpectator, str_Multi6, 0
    mov  byte [SpectatorsArray+0x11], al

    spawn_INI_Get_Bool str_IsSpectator, str_Multi7, 0
    mov  byte [SpectatorsArray+0x12], al

    spawn_INI_Get_Bool str_IsSpectator, str_Multi8, 0
    mov  byte [SpectatorsArray+0x13], al

    ; generic stuff
    spawn_INI_Get_Int str_Settings, str_Port, 1234
    cmp  dword [tunnel_port],0
    JNE  .nosetport
    mov  [NetPort], eax
.nosetport:

    spawn_INI_Get_Bool str_Settings, str_Bases, 1
    mov  [game + Session.bases], eax

    spawn_INI_Get_Int str_Settings, str_Credits, 10000
    mov  [game + Session.credits], eax

    spawn_INI_Get_Bool str_Settings, str_OreRegenerates, 0
    mov  [game + Session.oreRegen], eax
    test eax,eax
    je   .noregen
    mov  [GameFlags], dword 0xC0

.noregen:

    spawn_INI_Get_Bool str_Settings, str_Crates, 0
    mov  [game + Session.crates], eax

    spawn_INI_Get_Int str_Settings, str_UnitCount, 0
    mov  [game + Session.unitCount], eax

    spawn_INI_Get_Int str_Settings, str_AIPlayers, 0
    mov  [game + Session.aiPlayers], eax

    spawn_INI_Get_Int str_Settings, str_Seed, 0
    mov  [Globals___Seed], eax
    mov  [Globals___CustomSeed], eax

    spawn_INI_Get_Bool str_Settings, str_SlowUnitBuild, 0
    test eax,eax

    mov  [Globals___UnitBuildPenalty], dword 0x64

    je   .nopenalty
    mov  [Globals___UnitBuildPenalty], dword 0xFA
.nopenalty:

    spawn_INI_Get_Bool str_Settings, str_CaptureTheFlag, 0
    test eax,eax
    je   .noctf
    mov  edx, [GameFlags]
    OR   edx, 8
    mov  [GameFlags], edx
    mov  [game + Session.bases], dword 1
.noctf:

    spawn_INI_Get_Bool str_Settings, str_ShroudRegrows, 0
    test eax,eax
    je   .noregrow
    mov  edx, [GameFlags]
    OR   edx, 1
    mov  [GameFlags], edx
.noregrow:

    spawn_INI_Get_Int str_Settings, str_TechLevel, 10
    mov  [TechLevel], eax

    spawn_INI_Get_Int str_Settings, str_AIDifficulty, 2

    cmp  eax, 2
    JL   .diff_easy
    JG   .diff_hard

    ; 2 = normal
    mov  [Globals___Scen_Difficulty], byte 1
    mov  [Globals___Scen_CDifficulty], byte 1
    jmp  .diff_end

.diff_easy:
    ; <2 = easy
    mov  [Globals___Scen_Difficulty], byte 0
    mov  [Globals___Scen_CDifficulty], byte 2

    jmp  .diff_end

.diff_hard:
    ; >2 = hard
    mov  [Globals___Scen_Difficulty], byte 2
    mov  [Globals___Scen_CDifficulty], byte 0

.diff_end:

    ; Note: works only in session type 4
    spawn_INI_Get_Bool str_Settings, str_Aftermath, 0
    mov  [Globals___NewUnitsEnabled], eax
    mov  [Version107InMix], eax
    mov  byte [RedAlert.Options.AftermathEnabled], AL

    ; create self
    New_Player
    mov  [plr], eax

    ; copy name
    lea  eax, [buf]
    spawn_INI_Get_String str_Settings, str_Name, str_EmptyString, eax, 32

    lea  eax, [buf]
    push eax
    mov  eax, [plr]
    add  eax, Player.name
    push eax
    call _strcpy

    spawn_INI_Get_Int str_Settings, str_Side, 0
    mov  ebx, [plr]
    mov  [ebx + Player.side], AL

    spawn_INI_Get_Int str_Settings, str_Color, 0
    mov  ebx, [plr]
    mov  [ebx + Player.color], AL
    mov  [chatColor], AL

    lea  edx, [plr]
    mov  eax, nameTags
    call DynamicVectorClass__Add

    ; copy opponents
    xor  ecx,ecx

.next_opp:
    add  ecx,1
    lea  eax, [sect]
    call_sprintf eax, str_fmt_Other, ecx

    push ecx
    lea  eax, [buf]
    push 32
    push eax
    mov  ecx, str_EmptyString
    mov  ebx, str_Name
    lea  edx, [sect]
    mov  eax, CCINIClass_Spawn
    call INIClass__Get_String
    pop  ecx

    test eax,eax
    ; if no name present for this section, this is the last
    je   .last_opp

    push ecx

    ; name found, create player
    New_Player
    mov  [plr], eax

    ; also make sure we're in online mode if more players than self
    mov  [game + Session.type], byte 4

    ; copy name
    lea  eax, [buf]
    push eax
    mov  eax, [plr]
    add  eax, Player.name
    push eax
    call _strcpy

    ; set side
    mov  ecx, -1
    mov  ebx, str_Side
    lea  edx, [sect]
    mov  eax, CCINIClass_Spawn
    call INIClass__Get_Int

    cmp  eax,-1
    je   .next_opp

    mov  ebx, [plr]
    mov  [ebx + Player.side], AL

    ; set color
    mov  ecx, -1
    mov  ebx, str_Color
    lea  edx, [sect]
    mov  eax, CCINIClass_Spawn
    call INIClass__Get_Int

    cmp  eax,-1
    je   .next_opp

    mov  ebx, [plr]
    mov  [ebx + Player.color], AL

    ; ip
    lea  eax, [buf]
    push 32
    push eax
    mov  ecx, str_EmptyString
    mov  ebx, str_Ip
    lea  edx, [sect]
    mov  eax, CCINIClass_Spawn
    call INIClass__Get_String

    lea  eax, [buf]
    push eax
    call inet_addr

    mov  ebx, [plr]
    mov  [ebx + Player.address + NetAddress.zero], word 0
    mov  [ebx + Player.address + NetAddress.ip], eax

    ; port
    mov  ecx, 1234
    mov  ebx, str_Port
    lea  edx, [sect]
    mov  eax, CCINIClass_Spawn
    call INIClass__Get_Int

    mov  ebx, [plr]
    AND  eax, 0xFFFF

    push eax
    call htonl

    mov  [ebx + Player.address + NetAddress.port], eax

    ; add to nameTags vector
    lea  edx, [plr]
    mov  eax, nameTags
    call DynamicVectorClass__Add

    pop  ecx

    jmp  .next_opp

.last_opp:

    ; Copy the amount of human players for spawner stats
    mov  eax, dword [0x0068044A]
    mov  dword [HumanPlayers], eax

    ; force gamespeed to fastest
    spawn_INI_Get_Int str_Settings, str_GameSpeed, 1
    mov  dword   [0x00668188], eax

    ; start game
    mov  [GameActive], dword 1


    ; initialize network
    cmp  byte [game + Session.type], 4
    JNE  .nonet

    spawn_INI_Get_Int str_Settings, str_NetworkVersionProtocol, 0
    mov  [game + Session.protocol], al

    mov  eax,1
    mov  edx, 0x471
    call calloc
    mov  [pWinsock_this], eax

    call UDPInterfaceClass__UDPInterfaceClass

    mov  eax, [pWinsock_this]
    call WinsockInterfaceClass__Init

    xor  edx,edx
    mov  eax, [pWinsock_this]
    call UDPInterfaceClass__Open_Socket

    mov  eax, [pWinsock_this]
    call WinsockInterfaceClass__Start_Listening

    mov  eax, [pWinsock_this]
    call WinsockInterfaceClass__Discard_In_Buffers

    mov  eax, [pWinsock_this]
    call WinsockInterfaceClass__Discard_Out_Buffers

    call NetDlg___Init_Network

    ; Added this to hopefully correct any timing issues
    spawn_INI_Get_Int str_Settings, str_MaxAhead, 15
    mov  [Globals___Session_MaxAhead], eax

    spawn_INI_Get_Int str_Settings, str_FrameSendRate, 3
    mov  [Globals___Session_FrameSendRate], eax

    mov  ecx, 0x2E8
    mov  ebx, 0FFFFFFFFh
    mov  edx, 0x19
    mov  eax, Globals___Ipx
    call IPXManagerClass__Set_Timing

.nonet:

    ; Initialize some stuff for statistics code
    xor  eax, eax
    call time_
    mov  [Internet___PlanetWestwoodStartTime], eax

    spawn_INI_Get_Int str_Settings, str_GameID, 0
    mov  [Internet___PlanetWestwoodGameID], eax

    ; Init random number generator and related data
    call Init___Random

    ; fade to black
    xor  ebx,ebx
    mov  eax, Globals___BlackPalette
    mov  edx, 0xF
    call PaletteClass__Set

    mov  eax,Globals___HiddenPage
    call GraphicBufferClass__Lock

    push 0
    push Globals___HiddenPage
    call _Buffer_Clear
    add  esp,8

    mov  eax,Globals___HiddenPage
    call GraphicBufferClass__Unlock

    mov  eax,Globals___VisiblePage
    call GraphicBufferClass__Lock

    push 0
    push Globals___VisiblePage
    call _Buffer_Clear
    add  esp,8

    mov  eax,Globals___VisiblePage
    call GraphicBufferClass__Unlock

    lea  eax, [Globals___Scen_ScenarioName]
    spawn_INI_Get_String str_Settings, str_Scenario, str_EmptyString, eax, 32

    ; copy secnario name
    lea  eax, [buf]
    spawn_INI_Get_String str_Settings, str_Scenario, str_EmptyString, eax, 32

    ; Initialize MapName char array for spawner stats
    lea  eax, [buf]
    call_CCINIClass__Load eax, CCFileClass_Map, CCINIClass_Map

    call_INIClass__Get_String CCINIClass_Map, str_Basic, str_Name, str_EmptyString, 0x0067F2D6, 0x2A

    spawn_INI_Get_Bool str_Settings, str_AftermathFastBuildSpeed, 0
    mov  [Rules.Aftermath.AftermathFastBuildSpeed], al

    spawn_INI_Get_Bool str_Settings, str_FixFormationSpeed, 0
    mov  [Rules.General.FixFormationSpeed], al

    spawn_INI_Get_Bool str_Settings, str_FixRangeExploit, 0
    mov  byte [Spawn.Settings.FixRangeExploit], al

    spawn_INI_Get_Bool str_Settings, str_FixMagicBuild, 0
    mov  byte [Spawn.Settings.FixMagicBuild], al

    spawn_INI_Get_Bool str_Settings, str_ParabombsInMultiplayer, 0
    mov  [Rules.General.ParabombsInMultiplayer], al

    spawn_INI_Get_Bool str_Settings, str_FixAIAlly, 0
    mov  [Rules.AI.FixAIAlly], al

    spawn_INI_Get_Bool str_Settings, str_MCVUndeploy, 0
    mov  [Spawn.Settings.MCVUndeploy], al

    spawn_INI_Get_Bool str_Settings, str_AllyReveal, 0
    mov  [Spawn.Settings.AllyReveal], al

    spawn_INI_Get_Bool str_Settings, str_ForcedAlliances, 0
    mov  [Spawn.Settings.ForcedAlliances], al

    spawn_INI_Get_Bool str_Settings, str_TechCenterBugFix, 0
    mov  [Spawn.Settings.TechCenterBugFix], al

    spawn_INI_Get_Bool str_Settings, str_BuildOffAlly, 0
    mov  [Rules.General.BuildOffAlly], al

    spawn_INI_Get_Bool str_Settings, str_SouthAdvantageFix, 0
    mov  [Spawn.Settings.SouthAdvantageFix], al

    spawn_INI_Get_Bool str_Settings, str_NoScreenShake, 0
    mov  [Rules.General.NoScreenShake], al

    spawn_INI_Get_Bool str_Settings, str_NoTeslaZapEffectDelay, 0
    mov  [Rules.General.NoTeslaZapEffectDelay], al

    spawn_INI_Get_Bool str_Settings, str_ShortGame, 0
    mov  [Spawn.Settings.ShortGame], al

    spawn_INI_Get_Bool str_Settings, str_DeadPlayersRadar, 0
    mov  [Spawn.Settings.DeadPlayersRadar], al

    ; For an AI paranoid setting?
;    spawn_INI_Get_Bool Globals___RuleINI, str_AI, str_FixAIParanoid, 0
;    mov        [Rules.AI.FixAIParanoid], al


    ; Fixes
    mov  byte [Rules.AI.FixAISendingTanksTopLeft], 1
    mov  byte [Rules.General.EvacInMP], 0
    mov  byte [Toggle_Fix_NavalRepairExploit], 1

    ; Frag1 Explosion Anim fix should be enabled via loading.asm's hook for map start
    ; But enable it here just in case
    mov  eax, dword [FRAG1AnimData]
    mov  byte [eax], 0xC1 ; Fix invisible FRAG1 explosion

    ; Ore mine foundation fix should be enabled via loading.asm's hook for map start
    ; But enable it here just in case
    mov  eax, dword [OreMineFoundation]
    mov  dword [eax], 0x800080 ; Set to fixed Ore Mine foundation

    mov  byte [buildingcrewstuckfix], 1


    ; I have little knowledge what these values are, the first one pushed is screen height, sort of
    push 0x1E0
    push 0x6A
    push 0x14
    push 0
    push -1
    push -1
    push 0xE
    push 0x6A
    mov  ecx,0x6
    mov  ebx,0x10
    mov  eax,0x67F5A8
    mov  edx, 0
    call MessageListClass__Init

    spawn_INI_Get_Bool str_Settings, str_LoadSaveGame, 0
    cmp  al, 0
    jz   .Dont_Load_Save_Game

    spawn_INI_Get_Int str_Settings, str_SaveGameNumber, 1000

    mov  eax, 803
    call 0x00537D10 ; Load_Game
    test eax,eax
    je   .exit

    jmp  .Dont_Load_Scenario

.Dont_Load_Save_Game:

    spawn_INI_Get_Bool str_Settings, str_IsSinglePlayer, 0
    cmp  al, 0
    jz   .Dont_Set_Single_Player

    mov  byte [Globals___Session_Type], GameType.GAME_NORMAL

.Dont_Set_Single_Player:

    mov  edx, 1
    lea  eax, [buf]
    call Scenario___Start_Scenario
    test eax,eax
    je   .exit

.Dont_Load_Scenario:

    mov  eax, game
    call SessionClass__Create_Connections

    mov  eax,Globals___Map
    mov  edx,1
    call SidebarClass__Activate

    mov  eax,Globals___Map
    xor  edx,edx
    call GScreenClass__Flag_To_Redraw

    mov  eax,Globals___Map
    call GScreenClass__Render

    call Conquer___Call_Back ; callback (is this needed?)

    call 0x00528EDC ; queue ai

    call Conquer___Call_Back ; callback (is this needed?)

    ; Refresh screen again (don't think this is working)
    ; lovalmidas, 2023-06-10: Had a bug where GScreenClass__Flag_To_Redraw was pointing to same address as GScreenClass__Render. Should probably check again.
    mov  eax,Globals___Map
    xor  edx,edx
    call GScreenClass__Flag_To_Redraw

    mov  eax,Globals___Map
    call GScreenClass__Render

    mov  eax,1
    jmp  .exit

.exit_error:
    mov  eax,-1

.exit:
    mov  esp,ebp
    pop  ebp
    RETN
%pop

Select_Game:
    push ebp
    mov  ebp,esp
    push ebx
    push ecx
    push edx
    push esi
    push edi

    call Initialize_Spawn
    cmp  eax,-1

    ; if spawn not initialized, go to main menu
    je   0x004F44E4

    pop  edi
    pop  esi
    pop  edx
    pop  ecx
    pop  ebx
    pop  ebp
    RETN

SendFix:
    push ebx
    mov  ebx,dword [ebp-18h]
    mov  eax,[ebx]

    push eax
    call htonl

    test eax,eax
    JNE  .have_port
    mov  AX,1234
.have_port:
    pop  ebx
    jmp  0x005A8AE5

ReceiveFix:
    sub  esi,4
    lea  edx,[ebp-18h]

    ; cleanup crap from port as using it as dword
    mov  eax,[esi]
    AND  eax,0xFFFF0000
    mov  [esi],eax

    push edi
    mov  eax,ecx
    mov  ecx,2
    jmp  0x005A8A81

_Wait_For_Players_Hack_Wait_Time:
    cmp  byte [spawner_is_active], 0
    jz   .Ret
    mov  edx, 120 ; NOT HEX

.Ret:
    sub  eax, [ebx+1]
    cmp  eax, edx
    jmp  0x00529720
