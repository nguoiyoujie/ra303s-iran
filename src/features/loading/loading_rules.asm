;----------------------------------------------------------------
; src/features/loading/loading_rules.asm
;
; Load setting keys from rules.ini. Some of the logic may be called again when loading from map
;
;----------------------------------------------------------------
@HOOK 0x004F446C _Init_Game_Hook_Load ; For rules.ini stuff
@HOOK 0x00536AB5 _RulesClass__AI_Load


_Init_Game_Hook_Load:
    push ecx
    push ebx
    push edx
    push eax

    call_INIClass__Get_Bool Globals___RuleINI,str_Aftermath,str_AftermathFastBuildSpeed,0
    mov  [Rules.Aftermath.AftermathFastBuildSpeed],al

    call_INIClass__Get_Bool Globals___RuleINI,str_General,str_FixFormationSpeed,0
    mov  [Rules.General.FixFormationSpeed],al

    call_INIClass__Get_Bool Globals___RuleINI,str_General,str_ParabombsInMultiplayer,0
    mov  [Rules.General.ParabombsInMultiplayer],al

    call_INIClass__Get_Bool Globals___RuleINI,str_General,str_EvacInMP,1
    mov  [Rules.General.EvacInMP],al

    call_INIClass__Get_Bool Globals___RuleINI,str_General,str_RemapJammedBuildings,0
    mov  [Rules.General.RemapJammedBuildings],al
    
    call_INIClass__Get_Bool Globals___RuleINI,str_General,str_FixWideAreaDamage,0
    mov  [Rules.General.FixWideAreaDamage],al

    ; move to _RulesClass__AI_Load?
    call_INIClass__Get_Bool Globals___RuleINI,str_AI,str_FixAIParanoid,0
    mov  [Rules.AI.FixAIParanoid],al

    call_INIClass__Get_Bool Globals___RuleINI,str_AI,str_FixAIAlly,0
    mov  [Rules.AI.FixAIAlly],al

    call_INIClass__Get_Bool Globals___RuleINI,str_AI,str_FixAISendingTanksTopLeft,0
    mov  [Rules.AI.FixAISendingTanksTopLeft],al

    call_INIClass__Get_Bool Globals___RuleINI,str_AI,str_ComputerParanoidForceDisabledSkirmish,1
    mov  [Rules.AI.ComputerParanoidForceDisabledSkirmish],al

    call _InitializeExtendedColors

    pop  eax
    pop  edx
    pop  ebx
    pop  ecx

    mov  eax,1
    jmp  0x004F4471


_RulesClass__AI_Load:
    Save_Registers

    call_INIClass__Get_Int esi,str_AI,str_EasyAIGoldValue,[Rules.AI.EasyAIGoldValue]
    mov  [Rules.AI.EasyAIGoldValue],eax

    call_INIClass__Get_Int esi,str_AI,str_EasyAIGemValue,[Rules.AI.EasyAIGemValue]
    mov  [Rules.AI.EasyAIGemValue],eax

    call_INIClass__Get_Int esi,str_AI,str_NormalAIGoldValue,[Rules.AI.NormalAIGoldValue]
    mov  [Rules.AI.NormalAIGoldValue],eax

    call_INIClass__Get_Int esi,str_AI,str_NormalAIGemValue,[Rules.AI.NormalAIGemValue]
    mov  [Rules.AI.NormalAIGemValue],eax

    call_INIClass__Get_Int esi,str_AI,str_HardAIGoldValue,[Rules.AI.HardAIGoldValue]
    mov  [Rules.AI.HardAIGoldValue],eax

    call_INIClass__Get_Int esi,str_AI,str_HardAIGemValue,[Rules.AI.HardAIGemValue]
    mov  [Rules.AI.HardAIGemValue],eax

    call_INIClass__Get_Bool esi,str_AI,str_BuildRadarWithoutAirThreatCheck,[Rules.AI.BuildRadarWithoutAirThreatCheck]
    mov  [Rules.AI.BuildRadarWithoutAirThreatCheck],eax

    call_INIClass__Get_Bool esi,str_AI,str_SingleplayerAIObeyPrerequisites,[Rules.AI.SingleplayerAIObeyPrerequisites]
    mov  [Rules.AI.SingleplayerAIObeyPrerequisites],eax

    call_INIClass__Get_Int esi,str_General,str_AtomRadius,-1
    mov  [Rules.General.AtomRadius],eax
    
    call_INIClass__Get_Bool esi,str_General,str_NoScreenShake, 0
    mov  [Rules.General.NoScreenShake], al

    call_INIClass__Get_Bool esi,str_General,str_NoTeslaZapEffectDelay, 0
    mov  [Rules.General.NoTeslaZapEffectDelay], al

    call_INIClass__Get_Bool esi,str_General,str_BuildOffAlly, 0
    mov  [Rules.General.BuildOffAlly], al

.Ret:
    Restore_Registers
    mov  ebx,0x005EFD21; offset aDefenselimit
    jmp  0x00536ABA
