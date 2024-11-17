; Load our settings from here

@HOOK 0x004F446C _Init_Game_Hook_Load ; For rules.ini stuff
@HOOK 0x00525A9F _OptionsClass__Load_Settings ; For redalert.ini and some spawn.ini stuff
@HOOK 0x00551A87 _Startup_Function_Hook_Early_Load ; for some spawn.ini stuff
@HOOK 0x0053D081 _Map_Load_Before_Hook ; For map loading stuff
@HOOK 0x0053A568 _Map_Load_Late_Hook  ; For map loading stuff
@HOOK 0x00537E08 _Load_Game_Before_Hook ; For savegame loading stuff
@HOOK 0x00538F07 _Load_Game_Late_Hook  ; For savegame loading stuff
@HOOK 0x0055B84B _Ore_Mine_Foundation_Voodoo
@HOOK 0x00408005 _FRAG1_Data_Voodoo
@HOOK 0x00536AB5 _RulesClass__AI_Load
@HOOK 0x0053D6AA _Custom_Missions_Load_Map_Specific_Tutorial_Text
@HOOK 0x00538CE1 _Custom_Missions_Load_Game_Map_Specific_Tutorial_Text
@JMP 0x004F406D  _Init_Game_Early_Hook ; For loading REDALERT.INI stuff early
@JMP 0x004F4462 0x004F446C ; Don't call OptionsClass::Load_Settings() again, patch calls it at start of Init_Game()

str_sprintf_format3 db"cmu%02dea",0
str_s_format  db"%s",0

sprintf_buffer3 TIMES 512 db 0
sprintf_key_buffer TIMES 512 db 0
strdup_text_buffer TIMES 512 db 0
MissionCounter    dd    0
TutorialINIPointer dd 0
tutorial_text_buffer  TIMES 512 db 0
FileClass_TutorialText  TIMES 128 db 0
CCINIClass_TutorialText TIMES 128 db 0
NextCampaignMissionBuf TIMES 128 db 0
MapSelectionAnimationBuf TIMES 128 db 0
MapSelectABuf TIMES 128 db 0
MapSelectBBuf TIMES 128 db 0
MapSelectCBuf TIMES 128 db 0
ChronoReinforceTanks dd 0
UseAtomWhiteScreenEffectInMP dd 0
UseSinglePlayerAtomDamage dd 0
AtomRadius dd 0


extraremaptable TIMES 3600 db 0

%define colorwhiteoffset    0
%define colorblackoffset    282
%define colourflamingblueoffset 564
%define colourtruegreyoffset 846
%define colourdirtygreenoffset 1128

SetProcessAffinityMask dd 0

Toggle_Feature_DeadPlayersRadar db 0
Toggle_Feature_ForcedAlliances db 0
Toggle_Feature_MouseWheelScrolling db 0


SingleplayerAIObeyPrerequisites db 0
ForceSingleCPU db 0
FastAMBuildSpeed db 0
EnableWOL db 0
spawner_aftermath db 0
ShortGame db 0
NoTeslaZapEffectDelay db 0
SouthAdvantageFix db 0
NoScreenShake db 0
BuildOffAlly db 0
TechCenterBugFix db 0
AllyReveal db 0
MCVUndeploy db 0
buildingcrewstuckfix dd 0
magicbuildfix db 0
infantryrangeexploitfix db 0
OreMineFoundation dd 0
FRAG1AnimData dd 0
colorremapsidebarcameoicons db 0
UseBetaDestroyer db 0
UseBetaCruiser db 0
UseBetaSubmarine db 0
UseBetaGunboat db 0
ForceAMUnitsInMissions db 0
AftermathFastBuildSpeed    db 0
VideoInterlaceMode    dd 2
SkipScoreScreen db 0
RandomStartingSong db 0

FixFormationSpeed db 0
GameLanguage dd 1
DebugLogging db 1
CounterstrikeEnabled db 1
AftermathEnabled db 1
NoCDMode db 1
UseSmallInfantry db 0
DisplayOriginalMultiplayerMaps db 1
DisplayCounterstrikeMultiplayerMaps db 1
DisplayAftermathMultiplayerMaps db 1
ParabombsInMultiplayer    db 0
AlternativeRifleSound db 0
UseGrenadeThrowingSound db 0
UseBetaTeslaTank db 0
KeySidebarToggle dw 0
KeyMapSnapshot dw 0
GenerateMemoryDump    db 0
UseDOSInterfaceMod db 0
spawner_is_active  dd 0


stringtableoffset_newinfantrytypes  dd -1
stringtableoffset_newunittypes      dd -1
stringtableoffset_newaircrafttypes  dd -1
stringtableoffset_newvesseltypes    dd -1
stringtableoffset_newbuildingtypes  dd -1

%macro Initialize_Remap_Table 1
    xor  eax,eax

.Loop_Initialize_Remap_Table_%1:
    mov  byte [extraremaptable+2+%1+eax],al
    inc  eax
    cmp  byte AL,0                          ;loop 256 times
    jnz  .Loop_Initialize_Remap_Table_%1

    mov  eax,258

.Loop_Initialize_Black_Part_%1:
    mov  byte [extraremaptable+%1+eax],00
    inc  eax
    cmp  eax,268
    jnz  .Loop_Initialize_Black_Part_%1
%endmacro

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
    mov  dword [ChronoReinforceTanks],eax

    mov  dword eax,[TutorialINIPointer]
    call_INIClass__Get_Bool eax,str_Basic,str_UseAtomWhiteScreenEffectInMP,0
    mov  dword [UseAtomWhiteScreenEffectInMP],eax

    mov  dword eax,[TutorialINIPointer]
    call_INIClass__Get_Bool eax,str_Basic,str_UseSinglePlayerAtomDamage,0
    mov  dword [UseSinglePlayerAtomDamage],eax

    mov  dword eax,[TutorialINIPointer]
    call_INIClass__Get_Bool eax,str_Basic,str_UseCustomTutorialText,0


    cmp  byte AL,1 ; if using custom tutorial text in map/mission file
    jz   .Dont_Load_TUTORIAL_INI_Text


    mov  eax,[FileClass_TutorialText]
    test eax,eax

    mov  edx,0x005EC00F ; "TUTORIAL.INI"
    mov  eax,FileClass_TutorialText
    call CCFileClass__CCFileClass

    ; check ini exists
    mov  eax,FileClass_TutorialText
    xor  edx,edx
;    je File_Not_Available ; on file not available

    ; initialize CCINIClass
    mov  eax,CCINIClass_TutorialText
    call CCINIClass__CCINIClass

    ; load FileClass to CCINIClass
    mov  edx,FileClass_TutorialText
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

_Init_Game_Early_Hook:
    call 0x004F8664 ; Init_Keys(void)
    mov eax,0x00668188 ; offset GameOptionsClass Options
    call 0x00525A24 ; OptionsClass::Load_Settings(void)
    jmp 0x004F4072    
    
_Load_Game_Late_Hook:
    Save_Registers

    ; Enable AM units for skirmish savegames
    cmp  byte [Globals___Session_Type],GameType.GAME_SKIRMISH
    jne  .No_Enable_New_Units
    call 0x004AC024 ; Is_Aftermath_Installed(void)
    cmp  dword eax,1
    jne  .No_Enable_New_Units

    mov  dword [Globals___NewUnitsEnabled],1

.No_Enable_New_Units:

    ; Enable AM units in single player if option is turned on
    cmp  byte [Globals___Session_Type],GameType.GAME_NORMAL
    jne  .Dont_Force_AM_Units_In_Missions
    cmp  byte [ForceAMUnitsInMissions],1
    jne  .Dont_Force_AM_Units_In_Missions
    call 0x004AC024 ; Is_Aftermath_Installed(void)
    cmp  dword eax,1
    jne  .Dont_Force_AM_Units_In_Missions

    mov  dword [Globals___NewUnitsEnabled],1

.Dont_Force_AM_Units_In_Missions:

    Restore_Registers
    call INIClass__~INIClass
    jmp  0x00538F0C

_Load_Game_Before_Hook:
    Save_Registers

    ;Remove any active Chrono Vortex
    mov  eax,Vortex___ChronalVortex
    call ChronalVortexClass__Stop

    ; Ore Mine foundation fix code
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

    cmp  dword [spawner_is_active],0
    jz   .No_Skirmish_Mine_Fix3

    mov  dword [eax],0x800080 ; Set to fixed Ore Mine foundation

.No_Skirmish_Mine_Fix3:

    ; FRAG1 explosion anim fix code
    mov  eax,dword [FRAG1AnimData]
    mov  byte [eax],0xC3 ; Set to normal, bugged FRAG1 anim data

    cmp  byte [Globals___Session_Type],GameType.GAME_SKIRMISH
    je   .Fix_FRAG1
    cmp  byte [Globals___Session_Type],GameType.GAME_NORMAL
    je   .Fix_FRAG1
    cmp  dword [spawner_is_active],1
    je   .Fix_FRAG1

    jmp  .Dont_Fix_FRAG1

.Fix_FRAG1:

    mov  byte [eax],0xC1 ; Set to fixed FRAG1 anim data

.Dont_Fix_FRAG1:

    Restore_Registers
    call 0x004A765C ; Call_Back(void)
    jmp  0x00537E0D

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

_Map_Load_Before_Hook:
    call 0x0053AA94 ; Clear_Scenario(void)
    Save_Registers

    cmp  dword [spawner_is_active],1
    jz   .Dont_Clear_Savegame_Values

    ; disable some spawn.INI and rules.ini stuff that could be loaded
    ; e.g. from savegame

    call Clear_Extended_Savegame_Values

.Dont_Clear_Savegame_Values:

    mov  dword [Integer_Feature_EasyAIGoldValue],-1
    mov  dword [Integer_Feature_EasyAIGemValue],-1
    mov  dword [Integer_Feature_NormalAIGoldValue],-1
    mov  dword [Integer_Feature_NormalAIGemValue],-1
    mov  dword [Integer_Feature_HardAIGoldValue],-1
    mov  dword [Integer_Feature_HardAIGemValue],-1
    mov  dword [Toggle_Fix_BuildRadarWithoutAirThreatCheck],-1
    mov  dword [SingleplayerAIObeyPrerequisites],0

    ; Set current credit count to be displayed on the credits tab to 0
    mov  dword [0x0066984E],0

    ;Remove any active Chrono Vortex
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

    cmp  dword [spawner_is_active],0
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
    cmp  byte [ForceAMUnitsInMissions],1
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

%define        ebp_RedAlertINI        [ebp-0x74]

_OptionsClass__Load_Settings:
    call 0x004F3660
    Save_Registers

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_ForceSingleCPU,0
    mov  [ForceSingleCPU],al

    cmp  al,0
    jz   .Dont_Set_Single_CPU

    call Set_Single_CPU_Affinity

.Dont_Set_Single_CPU:

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_MouseWheelScrolling,0
    mov  [Toggle_Feature_MouseWheelScrolling],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_DisplayCounterstrikeMultiplayerMaps,1
    mov  [DisplayCounterstrikeMultiplayerMaps],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_DisplayAftermathMultiplayerMaps,1
    mov  [DisplayAftermathMultiplayerMaps],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_DisplayOriginalMultiplayerMaps,1
    mov  [DisplayOriginalMultiplayerMaps],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_UseSmallInfantry,0
    mov  [UseSmallInfantry],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_AftermathEnabled,1
    mov  [AftermathEnabled],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_CounterstrikeEnabled,1
    mov  [CounterstrikeEnabled],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_NoCD,1
    mov  [NoCDMode],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_DebugLogging,1
    mov  [DebugLogging],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Int eax,str_Options,str_VideoInterlaceMode,2 ; 2 = deinterlace videos
    mov  [VideoInterlaceMode],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_SkipScoreScreen,0
    mov  [SkipScoreScreen],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_RandomStartingSong,0
    mov  [RandomStartingSong],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_AlternativeRifleSound,0
    mov  [AlternativeRifleSound],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_UseGrenadeThrowingSound,0
    mov  [UseGrenadeThrowingSound],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_UseBetaTeslaTank,0
    mov  [UseBetaTeslaTank],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_UseBetaDestroyer,0
    mov  [UseBetaDestroyer],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_UseBetaCruiser,0
    mov  [UseBetaCruiser],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_UseBetaSubmarine,0
    mov  [UseBetaSubmarine],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_UseBetaGunboat,0
    mov  [UseBetaGunboat],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_GenerateMemoryDump,0
    mov  [GenerateMemoryDump],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_ForceAMUnitsInMissions,0
    mov  [ForceAMUnitsInMissions],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_FastAMBuildSpeed,0
    mov  [FastAMBuildSpeed],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_ColorRemapSidebarIcons,0
    mov  [colorremapsidebarcameoicons],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_UseDOSInterfaceMod,0
    mov  [UseDOSInterfaceMod],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_EnableWOL,0
    mov  [EnableWOL],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Int eax,str_WinHotkeys,str_KeySidebarToggle,9
    mov  [KeySidebarToggle],ax

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Int eax,str_WinHotkeys,str_KeyMapSnapshot,0
    mov  [KeyMapSnapshot],ax


    Restore_Registers
    jmp  0x00525AA4

_Startup_Function_Hook_Early_Load:
    xor  edx,edx
    mov  [0x006ABBC8],edx
    Save_Registers

    call_CCINIClass__Load str_ini_Spawn,CCFileClass_Spawn,CCINIClass_Spawn

    call_INIClass__Get_Bool CCINIClass_Spawn,str_Settings,str_Aftermath,0
    mov  [spawner_aftermath],al

    Restore_Registers
    mov  ebx,[0x006ABC10]
    jmp  0x00551A8D
    retn

_Init_Game_Hook_Load:
    push ecx
    push ebx
    push edx
    push eax

    call_INIClass__Get_Bool Globals___RuleINI,str_Aftermath,str_AftermathFastBuildSpeed,0
    mov  [AftermathFastBuildSpeed],al

    call_INIClass__Get_Bool Globals___RuleINI,str_General,str_FixFormationSpeed,0
    mov  [FixFormationSpeed],al

    call_INIClass__Get_Bool Globals___RuleINI,str_General,str_ParabombsInMultiplayer,0
    mov  [ParabombsInMultiplayer],al

    call_INIClass__Get_Bool Globals___RuleINI,str_General,str_EvacInMP,1
    mov  [Toggle_Feature_EvacInMP],al

    call_INIClass__Get_Bool Globals___RuleINI,str_General,str_RemapJammedBuildings,0
    mov  [Toggle_Feature_RemapJammedBuildings],al
    
    call_INIClass__Get_Bool Globals___RuleINI,str_AI,str_FixAIParanoid,0
    mov  [Toggle_Fix_AIParanoid],al

    call_INIClass__Get_Bool Globals___RuleINI,str_AI,str_FixAIAlly,0
    mov  [Toggle_Fix_AIAlly],al

    call_INIClass__Get_Bool Globals___RuleINI,str_AI,str_FixAISendingTanksTopLeft,0
    mov  [Toggle_Fix_AISendingTanksToTopLeft],al

    call_INIClass__Get_Bool Globals___RuleINI,str_AI,str_ComputerParanoidForceDisabledSkirmish,1
    mov  [Toggle_Feature_ComputerParanoidForceDisabledSkirmish],al


;  EXTRA COLOUR REMAP WHITE
    Initialize_Remap_Table colorwhiteoffset

    mov  byte [extraremaptable+0x0],0x0F
    mov  byte [extraremaptable+0x1],0x0F ; Name in radar logo color bits, this is for a yellow name

    ; Remap colours for name in the name list on the radar
    mov  byte [extraremaptable+268],0x0F
    mov  byte [extraremaptable+269],0x0E
    mov  byte [extraremaptable+270],0x0F
    mov  byte [extraremaptable+271],0x0E
    mov  byte [extraremaptable+272],0x0F
    mov  byte [extraremaptable+273],0x0E
    mov  byte [extraremaptable+274],0x0F
    mov  byte [extraremaptable+275],0x0E
    mov  byte [extraremaptable+276],0x0F
    mov  byte [extraremaptable+277],0x0E
    mov  byte [extraremaptable+278],0x0F
    mov  byte [extraremaptable+279],0x0E

    ; Remap colour on radar map
    mov  byte [extraremaptable+280],0x4F
    mov  byte [extraremaptable+281],0x4F

    ; Remap colours on units, from lighest shade to darkest
    mov  byte [extraremaptable+82],0x0F ; 15
    mov  byte [extraremaptable+83],0x0F ; 15
    mov  byte [extraremaptable+84],0x80 ; 128
    mov  byte [extraremaptable+85],0x80 ; 128
    mov  byte [extraremaptable+86],0x80 ; 128
    mov  byte [extraremaptable+87],0x84 ; 132
    mov  byte [extraremaptable+88],0x84 ; 132
    mov  byte [extraremaptable+89],0x85 ; 133
    mov  byte [extraremaptable+90],0x88 ; 136
    mov  byte [extraremaptable+91],0x89 ; 137
    mov  byte [extraremaptable+92],0x8A ; 138
    mov  byte [extraremaptable+93],0x8A ; 138
    mov  byte [extraremaptable+94],0x8B ; 139
    mov  byte [extraremaptable+95],0x8B ; 139
    mov  byte [extraremaptable+96],0x8D ; 141
    mov  byte [extraremaptable+97],0x8F ; 143

;  EXTRA COLOUR REMAP BLACK
    Initialize_Remap_Table colorblackoffset

    mov  byte [extraremaptable+colorblackoffset+0x0],0x0F
    mov  byte [extraremaptable+colorblackoffset+0x1],0x0F ; Name in radar logo color bits, this is for a yellow name

    ; Remap colours for name in the name list on the radar
    mov  byte [extraremaptable+colorblackoffset+268],0x12
    mov  byte [extraremaptable+colorblackoffset+269],0x12
    mov  byte [extraremaptable+colorblackoffset+270],0x12
    mov  byte [extraremaptable+colorblackoffset+271],0x12
    mov  byte [extraremaptable+colorblackoffset+272],0x12
    mov  byte [extraremaptable+colorblackoffset+273],0x12
    mov  byte [extraremaptable+colorblackoffset+274],0x12
    mov  byte [extraremaptable+colorblackoffset+275],0x12
    mov  byte [extraremaptable+colorblackoffset+276],0x12
    mov  byte [extraremaptable+colorblackoffset+277],0x12
    mov  byte [extraremaptable+colorblackoffset+278],0x12
    mov  byte [extraremaptable+colorblackoffset+279],0x12

    ; Remap colour on radar map
    mov  byte [extraremaptable+colorblackoffset+280],0x12
    mov  byte [extraremaptable+colorblackoffset+281],0x12

    ; Remap colours on units, from lighest shade to darkest
    mov  byte [extraremaptable+colorblackoffset+82],0x8A ; 138
    mov  byte [extraremaptable+colorblackoffset+83],0x8B ; 139
    mov  byte [extraremaptable+colorblackoffset+84],0x8C ; 140
    mov  byte [extraremaptable+colorblackoffset+85],0x8C ; 140
    mov  byte [extraremaptable+colorblackoffset+86],0x8D ; 141
    mov  byte [extraremaptable+colorblackoffset+87],0x8D ; 141
    mov  byte [extraremaptable+colorblackoffset+88],0x8E ; 142
    mov  byte [extraremaptable+colorblackoffset+89],0x8E ; 142
    mov  byte [extraremaptable+colorblackoffset+90],0x8F ; 143
    mov  byte [extraremaptable+colorblackoffset+91],0x8F ; 143
    mov  byte [extraremaptable+colorblackoffset+92],0x13 ; 19
    mov  byte [extraremaptable+colorblackoffset+93],0x12 ; 18
    mov  byte [extraremaptable+colorblackoffset+94],0x11 ; 17
    mov  byte [extraremaptable+colorblackoffset+95],0x11 ; 17
    mov  byte [extraremaptable+colorblackoffset+96],0x0C ; 12
    mov  byte [extraremaptable+colorblackoffset+97],0x0C ; 12

    ; EXTRA COLOUR REMAP FLAMING BLUE
    Initialize_Remap_Table colourflamingblueoffset

    ; Remap colours for name in the name list on the radar
;00667518  C0 C1 C2 C3 C4 C5 C7 C6  ????
;00667520  C5 C2 C2 A0            ???

    mov  byte [extraremaptable+colourflamingblueoffset+268],0xC0
    mov  byte [extraremaptable+colourflamingblueoffset+269],0xC1
    mov  byte [extraremaptable+colourflamingblueoffset+270],0xC2
    mov  byte [extraremaptable+colourflamingblueoffset+271],0xC3
    mov  byte [extraremaptable+colourflamingblueoffset+272],0xC4
    mov  byte [extraremaptable+colourflamingblueoffset+273],0xC5
    mov  byte [extraremaptable+colourflamingblueoffset+274],0xC7
    mov  byte [extraremaptable+colourflamingblueoffset+275],0xC6
    mov  byte [extraremaptable+colourflamingblueoffset+276],0xC5
    mov  byte [extraremaptable+colourflamingblueoffset+277],0xC2
    mov  byte [extraremaptable+colourflamingblueoffset+278],0xC2
    mov  byte [extraremaptable+colourflamingblueoffset+279],0xA0

    ; Remap colour on radar map
; 00667524  A0 C4                    ?

    mov  byte [extraremaptable+colourflamingblueoffset+280],0xA0
    mov  byte [extraremaptable+colourflamingblueoffset+281],0xC4

    ; Remap colours on units, from lighest shade to darkest
;0066745E  A0 A1 C0 C1 C2 C3 C4 C5  ????
;00667466  C6 C6 C7 C7 AD AE AF AF       ???

    mov  byte [extraremaptable+colourflamingblueoffset+82],0xA0
    mov  byte [extraremaptable+colourflamingblueoffset+83],0xA1
    mov  byte [extraremaptable+colourflamingblueoffset+84],0xC0
    mov  byte [extraremaptable+colourflamingblueoffset+85],0xC1
    mov  byte [extraremaptable+colourflamingblueoffset+86],0xC2
    mov  byte [extraremaptable+colourflamingblueoffset+87],0xC3
    mov  byte [extraremaptable+colourflamingblueoffset+88],0xC4
    mov  byte [extraremaptable+colourflamingblueoffset+89],0xC5
    mov  byte [extraremaptable+colourflamingblueoffset+90],0xC6
    mov  byte [extraremaptable+colourflamingblueoffset+91],0xC6
    mov  byte [extraremaptable+colourflamingblueoffset+92],0xC7
    mov  byte [extraremaptable+colourflamingblueoffset+93],0xC7
    mov  byte [extraremaptable+colourflamingblueoffset+94],0xAD
    mov  byte [extraremaptable+colourflamingblueoffset+95],0xAE
    mov  byte [extraremaptable+colourflamingblueoffset+96],0xAF
    mov  byte [extraremaptable+colourflamingblueoffset+97],0xAF

    ; added by lovalmidas
    ; EXTRA COLOUR REMAP TRUE GREY
    Initialize_Remap_Table colourtruegreyoffset

    ; Remap colours for name in the name list on the radar
    mov  byte [extraremaptable+colourtruegreyoffset+268],0x84
    mov  byte [extraremaptable+colourtruegreyoffset+269],0x85
    mov  byte [extraremaptable+colourtruegreyoffset+270],0x86
    mov  byte [extraremaptable+colourtruegreyoffset+271],0x87
    mov  byte [extraremaptable+colourtruegreyoffset+272],0x88
    mov  byte [extraremaptable+colourtruegreyoffset+273],0x89
    mov  byte [extraremaptable+colourtruegreyoffset+274],0x8B
    mov  byte [extraremaptable+colourtruegreyoffset+275],0x8A
    mov  byte [extraremaptable+colourtruegreyoffset+276],0x88
    mov  byte [extraremaptable+colourtruegreyoffset+277],0x86
    mov  byte [extraremaptable+colourtruegreyoffset+278],0x86
    mov  byte [extraremaptable+colourtruegreyoffset+279],0x84

    ; Remap colour on radar map
    mov  byte [extraremaptable+colourtruegreyoffset+280],0x86
    mov  byte [extraremaptable+colourtruegreyoffset+281],0x89

    ; Remap colours on units, from lighest shade to darkest
    mov  byte [extraremaptable+colourtruegreyoffset+82],0x84
    mov  byte [extraremaptable+colourtruegreyoffset+83],0x85
    mov  byte [extraremaptable+colourtruegreyoffset+84],0x86
    mov  byte [extraremaptable+colourtruegreyoffset+85],0x87
    mov  byte [extraremaptable+colourtruegreyoffset+86],0x88
    mov  byte [extraremaptable+colourtruegreyoffset+87],0x89
    mov  byte [extraremaptable+colourtruegreyoffset+88],0x8A
    mov  byte [extraremaptable+colourtruegreyoffset+89],0x8A
    mov  byte [extraremaptable+colourtruegreyoffset+90],0x8B
    mov  byte [extraremaptable+colourtruegreyoffset+91],0x8C
    mov  byte [extraremaptable+colourtruegreyoffset+92],0x8D
    mov  byte [extraremaptable+colourtruegreyoffset+93],0x8D
    mov  byte [extraremaptable+colourtruegreyoffset+94],0x8E
    mov  byte [extraremaptable+colourtruegreyoffset+95],0x8E
    mov  byte [extraremaptable+colourtruegreyoffset+96],0x8F
    mov  byte [extraremaptable+colourtruegreyoffset+97],0x8F

    ; EXTRA COLOUR REMAP DIRTY GREEN
    Initialize_Remap_Table colourdirtygreenoffset

    ; Remap colours for name in the name list on the radar
    mov  byte [extraremaptable+colourdirtygreenoffset+268],0xFE
    mov  byte [extraremaptable+colourdirtygreenoffset+269],0xFD
    mov  byte [extraremaptable+colourdirtygreenoffset+270],0xFC
    mov  byte [extraremaptable+colourdirtygreenoffset+271],0xFB
    mov  byte [extraremaptable+colourdirtygreenoffset+272],0xFA
    mov  byte [extraremaptable+colourdirtygreenoffset+273],0xF9
    mov  byte [extraremaptable+colourdirtygreenoffset+274],0xF7
    mov  byte [extraremaptable+colourdirtygreenoffset+275],0xF8
    mov  byte [extraremaptable+colourdirtygreenoffset+276],0xFA
    mov  byte [extraremaptable+colourdirtygreenoffset+277],0xFB
    mov  byte [extraremaptable+colourdirtygreenoffset+278],0xFC
    mov  byte [extraremaptable+colourdirtygreenoffset+279],0xFE

    ; Remap colour on radar map
    mov  byte [extraremaptable+colourdirtygreenoffset+280],0xFB
    mov  byte [extraremaptable+colourdirtygreenoffset+281],0xFE

    ; Remap colours on units, from lighest shade to darkest
    mov  byte [extraremaptable+colourdirtygreenoffset+82],0xFE
    mov  byte [extraremaptable+colourdirtygreenoffset+83],0xFD
    mov  byte [extraremaptable+colourdirtygreenoffset+84],0xFE
    mov  byte [extraremaptable+colourdirtygreenoffset+85],0xFD
    mov  byte [extraremaptable+colourdirtygreenoffset+86],0xFC
    mov  byte [extraremaptable+colourdirtygreenoffset+87],0xFB
    mov  byte [extraremaptable+colourdirtygreenoffset+88],0xFA
    mov  byte [extraremaptable+colourdirtygreenoffset+89],0xF9
    mov  byte [extraremaptable+colourdirtygreenoffset+90],0xF8
    mov  byte [extraremaptable+colourdirtygreenoffset+91],0xF7
    mov  byte [extraremaptable+colourdirtygreenoffset+92],0xF6
    mov  byte [extraremaptable+colourdirtygreenoffset+93],0xF5
    mov  byte [extraremaptable+colourdirtygreenoffset+94],0xF4
    mov  byte [extraremaptable+colourdirtygreenoffset+95],0xF3
    mov  byte [extraremaptable+colourdirtygreenoffset+96],0xF2
    mov  byte [extraremaptable+colourdirtygreenoffset+97],0xF1



;    mov        byte [extraremaptable+colourbrightyellowoffset+0x0],0x0F
;    mov        byte [extraremaptable+colourbrightyellowoffset+0x1],0x12 ; Name in radar logo color bits, this is for a yellow name

;    INIClass__Get_Int_

    pop  eax
    pop  edx
    pop  ebx
    pop  ecx

    mov  eax,1
    jmp  0x004F4471


Set_Single_CPU_Affinity:
    push str_dll_Kernel32
    call 0x005E5892 ; LoadLibraryA

    test eax,eax
    jz   .Crash


    push str_SetProcessAffinityMask
    push eax
    call 0x005E575A ; GetProcAddress

    test eax,eax
    jz   .Crash

    mov  [SetProcessAffinityMask],eax

    push 1
    call [0x005E65D0] ; [GetCurrentProcess]
    push eax

    call [SetProcessAffinityMask]

.Ret:
    retn

.Crash:
    int  3

_RulesClass__AI_Load:
    Save_Registers

    call_INIClass__Get_Int esi,str_AI,str_EasyAIGoldValue,[Integer_Feature_EasyAIGoldValue]
    mov  [Integer_Feature_EasyAIGoldValue],eax

    call_INIClass__Get_Int esi,str_AI,str_EasyAIGemValue,[Integer_Feature_EasyAIGemValue]
    mov  [Integer_Feature_EasyAIGemValue],eax

    call_INIClass__Get_Int esi,str_AI,str_NormalAIGoldValue,[Integer_Feature_NormalAIGoldValue]
    mov  [Integer_Feature_NormalAIGoldValue],eax

    call_INIClass__Get_Int esi,str_AI,str_NormalAIGemValue,[Integer_Feature_NormalAIGemValue]
    mov  [Integer_Feature_NormalAIGemValue],eax

    call_INIClass__Get_Int esi,str_AI,str_HardAIGoldValue,[Integer_Feature_HardAIGoldValue]
    mov  [Integer_Feature_HardAIGoldValue],eax

    call_INIClass__Get_Int esi,str_AI,str_HardAIGemValue,[Integer_Feature_HardAIGemValue]
    mov  [Integer_Feature_HardAIGemValue],eax

    call_INIClass__Get_Bool esi,str_AI,str_BuildRadarWithoutAirThreatCheck,[Toggle_Fix_BuildRadarWithoutAirThreatCheck]
    mov  [Toggle_Fix_BuildRadarWithoutAirThreatCheck],eax

    call_INIClass__Get_Bool esi,str_AI,str_SingleplayerAIObeyPrerequisites,[SingleplayerAIObeyPrerequisites]
    mov  [SingleplayerAIObeyPrerequisites],eax

    call_INIClass__Get_Int esi,str_General,str_AtomRadius,-1
    mov  dword [AtomRadius],eax
    
    call_INIClass__Get_Bool esi,str_General,str_NoScreenShake, 0
    mov  [NoScreenShake], al

    call_INIClass__Get_Bool esi,str_General,str_NoTeslaZapEffectDelay, 0
    mov  [NoTeslaZapEffectDelay], al

    call_INIClass__Get_Bool esi,str_General,str_BuildOffAlly, 0
    mov  [BuildOffAlly], al

.Ret:
    Restore_Registers
    mov  ebx,0x005EFD21; offset aDefenselimit
    jmp  0x00536ABA
