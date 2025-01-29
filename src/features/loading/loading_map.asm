;----------------------------------------------------------------
; src/features/loading/loading_map.asm
;
; Load setting keys from Mission Maps
;
;----------------------------------------------------------------

@LJMP 0x0053D081, _Map_Load_Before_Hook ; For map loading stuff
@LJMP 0x0053A568, _Map_Load_Late_Hook  ; For map loading stuff
@LJMP 0x0053D6AA, _Custom_Missions_Load_Map_Specific_Tutorial_Text
@LJMP 0x00538CE1, _Custom_Missions_Load_Game_Map_Specific_Tutorial_Text
@LJMP 0x0055B84B, _Ore_Mine_Foundation_Voodoo ; retrieve address
@LJMP 0x00408005, _FRAG1_Data_Voodoo ; retrieve address


_Map_Load_Before_Hook:
    call 0x0053AA94 ; Clear_Scenario(void)
    Save_Registers

    cmp  byte [spawner_is_active],1
    jz   .Dont_Clear_Savegame_Values
    ; disable some spawn.INI and rules.ini stuff that could be loaded
    ; e.g. from savegame
    call Clear_Extended_Savegame_Values

.Dont_Clear_Savegame_Values:

    mov  dword [Rules.AI.EasyAIGoldValue],-1
    mov  dword [Rules.AI.EasyAIGemValue],-1
    mov  dword [Rules.AI.NormalAIGoldValue],-1
    mov  dword [Rules.AI.NormalAIGemValue],-1
    mov  dword [Rules.AI.HardAIGoldValue],-1
    mov  dword [Rules.AI.HardAIGemValue],-1
    mov  dword [Rules.AI.BuildRadarWithoutAirThreatCheck],-1
    mov  dword [Rules.AI.SingleplayerAIObeyPrerequisites],0
    ; Reset credit display to 0
    mov  dword [0x0066984E],0
    ; Remove any active Chrono Vortex
    mov  eax,Vortex___ChronalVortex
    call ChronalVortexClass__Stop
    ; Ore Mine foundation fix code, 
    mov  eax,dword [OreMineFoundation]
    mov  dword [eax],0x1000080 ; Set to normal, bugged Ore Mine foundation
    cmp  byte [Globals___Session_Type],GameType.GAME_SKIRMISH
    jne  .No_Skirmish_Mine_Fix
    mov  dword [eax],0x800080 ; Set to fixed Ore Mine foundation

.No_Skirmish_Mine_Fix:
    cmp  byte [Globals___Session_Type],GameType.GAME_NORMAL
    jne  .No_Skirmish_Mine_Fix2
    mov  dword [eax],0x800080 ; Set to fixed Ore Mine foundation

.No_Skirmish_Mine_Fix2:
    cmp  byte [spawner_is_active],0
    je   .No_Skirmish_Mine_Fix3
    mov  dword [eax],0x800080 ; Set to fixed Ore Mine foundation

.No_Skirmish_Mine_Fix3:
    Restore_Registers
    jmp  0x0053D086


_Map_Load_Late_Hook:
    Save_Registers

    ; Enable AM units in single player if option is turned on
    cmp  byte [Globals___Session_Type],GameType.GAME_NORMAL
    jne  .Dont_Force_AM_Units_In_Missions
    cmp  byte [RedAlert.Options.ForceAMUnitsInMissions],1
    jne  .Dont_Force_AM_Units_In_Missions
    call 0x004AC024 ; Is_Aftermath_Installed(void)
    cmp  dword eax,1
    jne  .Dont_Force_AM_Units_In_Missions
    mov  dword [Globals___NewUnitsEnabled],1 ; NewUnitsEnabled

.Dont_Force_AM_Units_In_Missions:
    ; FRAG1 explosion anim fix code
    mov  eax,dword [FRAG1AnimData]
    mov  byte [eax],0xC3 ; Set to normal, bugged FRAG1 anim data
    cmp  byte [Globals___Session_Type],GameType.GAME_SKIRMISH
    je   .Fix_FRAG1
    cmp  byte [Globals___Session_Type],GameType.GAME_NORMAL
    je   .Fix_FRAG1
    cmp  byte [spawner_is_active],1
    jz   .Fix_FRAG1
    jmp  .Dont_Fix_FRAG1

.Fix_FRAG1:
    mov  byte [eax],0xC1 ; Set to fixed FRAG1 anim data

.Dont_Fix_FRAG1:
    Restore_Registers
    call 0x0053A5C8 ; Fill_In_Data(void)
    jmp  0x0053A56D


_Custom_Missions_Load_Game_Map_Specific_Tutorial_Text:
    Save_Registers

    lea  eax,[ebp-16Ch] ; ScenarioFileClass
    call Read_Map_Specific_Tutorial_Text

    Restore_Registers
    lea  edx,[ebp-16Ch]
    jmp  0x00538CE7


_Custom_Missions_Load_Map_Specific_Tutorial_Text:
    Save_Registers

    lea  eax,[ebp-8Ch] ; ScenarioFileClass
    call Read_Map_Specific_Tutorial_Text

    Restore_Registers
    lea  edx,[ebp-8Ch]
    jmp  0x0053D6B0


Read_Map_Specific_Tutorial_Text:
;    push 512             ; dst len
;    push tutorial_text_buffer             ; dst
;    mov ecx,0x005EC00F   ; default,"TUTORIAL.INI"
;    mov ebx,str_customtutorialFile   ; key,"CustomTutorialFile"
;    mov edx,str_Basic  ; section,"Basic"
;;    lea     eax,[ebp-8Ch] ; ScenarioFileClass
;    call INIClass__Get_String

    mov  dword [TutorialINIPointer],eax ; Set INI file to scenario

    ; Load map name buffer for next mission in campaign for custom campaigns
    push 128 ; dst len
    lea  ebx,[NextCampaignMissionBuf]
    push ebx ; dst
    mov  ecx,str_EmptyString ; offset empty_string
    mov  ebx,str_NextMissionInCampaign   ; key
    mov  edx,str_Basic  ; section,"Basic"
    mov  dword eax,[TutorialINIPointer]
    call INIClass__Get_String

    ; Load map select A buffer for next mission in campaign for custom campaigns
    push 128 ; dst len
    lea  ebx,[MapSelectABuf]
    push ebx ; dst
    mov  ecx,str_EmptyString ; offset empty_string
    mov  ebx,str_MapSelectA   ; key
    mov  edx,str_Basic  ; section,"Basic"
    mov  dword eax,[TutorialINIPointer]
    call INIClass__Get_String

    ; Load  map select B buffer for next mission in campaign for custom campaigns
    push 128 ; dst len
    lea  ebx,[MapSelectBBuf]
    push ebx ; dst
    mov  ecx,str_EmptyString ; offset empty_string
    mov  ebx,str_MapSelectB   ; key
    mov  edx,str_Basic  ; section,"Basic"
    mov  dword eax,[TutorialINIPointer]
    call INIClass__Get_String

    ; Load  map select C buffer for next mission in campaign for custom campaigns
    push 128 ; dst len
    lea  ebx,[MapSelectCBuf]
    push ebx ; dst
    mov  ecx,str_EmptyString ; offset empty_string
    mov  ebx,str_MapSelectC   ; key
    mov  edx,str_Basic  ; section,"Basic"
    mov  dword eax,[TutorialINIPointer]
    call INIClass__Get_String

    ; Load map selection animation buffer for the current mission
    push 128 ; dst len
    lea  ebx,[MapSelectionAnimationBuf]
    push ebx ; dst
    mov  ecx,str_EmptyString ; offset empty_string
    mov  ebx,str_MapSelectionAnimation   ; key
    mov  edx,str_Basic  ; section,"Basic"
    mov  dword eax,[TutorialINIPointer]
    call INIClass__Get_String

    ; Read ScenarioNumber from map file
    ; args: <INIClass>, <section>, <key>, <default>, <dst>
    mov  ecx,-1
    mov  ebx,str_ScenarioNumber
    mov  edx,str_Basic  ; section,"Basic"
    mov  dword eax,[TutorialINIPointer]
    call INIClass__Get_Int

    cmp  eax,-1
    jz   .Dont_Set_Scenario_Number

    mov  [Globals___Scen_Scenario],eax

.Dont_Set_Scenario_Number:

    mov  dword eax,[TutorialINIPointer]
    call_INIClass__Get_Bool eax,str_Basic,str_ChronoReinforceTanks,0
    mov  dword [Map.Basic.ChronoReinforceTanks],eax

    mov  dword eax,[TutorialINIPointer]
    call_INIClass__Get_Bool eax,str_Basic,str_UseAtomWhiteScreenEffectInMP,0
    mov  dword [Map.Basic.UseAtomWhiteScreenEffectInMP],eax

    mov  dword eax,[TutorialINIPointer]
    call_INIClass__Get_Bool eax,str_Basic,str_UseSinglePlayerAtomDamage,0
    mov  dword [Map.Basic.UseSinglePlayerAtomDamage],eax

    mov  dword eax,[TutorialINIPointer]
    call_INIClass__Get_Bool eax,str_Basic,str_UseCustomTutorialText,0

    cmp  byte AL,1 ; if using custom tutorial text in map/mission file
    jz   .Dont_Load_TUTORIAL_INI_Text

    mov  eax,[CCFileClass_TutorialText]
    test eax,eax

    mov  edx,0x005EC00F ; "TUTORIAL.INI"
    mov  eax,CCFileClass_TutorialText
    call CCFileClass__CCFileClass

    ; check ini exists
    mov  eax,CCFileClass_TutorialText
    xor  edx,edx
;    je File_Not_Available ; on file not available

    ; initialize CCINIClass
    mov  eax,CCINIClass_TutorialText
    call CCINIClass__CCINIClass

    ; load FileClass to CCINIClass
    mov  edx,CCFileClass_TutorialText
    mov  eax,CCINIClass_TutorialText
    call CCINIClass__Load

    mov  dword [TutorialINIPointer],CCINIClass_TutorialText

.Dont_Load_TUTORIAL_INI_Text:
    xor  edi,edi
    xor  esi,esi
    jmp  .LoopStart

.Loop:
    inc  edi
    add  esi,4
    cmp  edi,0E1h
    jge  .Out

.LoopStart:
    push edi             ; Format
    push 0x005EC01C    ; "%d"
    mov  eax,sprintf_key_buffer
    xor  ecx,ecx
    push eax             ; Dest
    mov  dword [esi+0x666304],ecx
    call _sprintf

    add  esp,0Ch
    mov  ebx,sprintf_key_buffer
    push 80h
    mov  eax,strdup_text_buffer
    mov  edx,0x005EC020 ; "Tutorial"
    push eax
    mov  ecx,str_EmptyString ; offset empty_string
    mov  eax,dword [TutorialINIPointer]
    call INIClass__Get_String
    test eax,eax
    jz   .Loop
    mov  eax,strdup_text_buffer
    call _strdup
    mov  dword [esi+0x666304],eax
    jmp  .Loop

.Out:
    retn


_FRAG1_Data_Voodoo:
    mov  edx,[0x00625B48]
    push edx
    lea  ecx,[eax+0x138]
    mov  dword [FRAG1AnimData],ecx
    mov  [eax+138h],cl
    pop  edx
    jmp  0x00408011


_Ore_Mine_Foundation_Voodoo:
    push ecx
    lea  ecx,[eax+0x139]
    mov  dword [OreMineFoundation],ecx
    mov  [eax+139h],edx
    pop  ecx
    jmp  0x0055B851
