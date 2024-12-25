;----------------------------------------------------------------
; src/features/loading/loading_rules.asm
;
; Load setting keys from rules.ini. Some of the logic may be called again when loading from map
;
;----------------------------------------------------------------
@HOOK 0x004F446C _Init_Game_Hook_Load ; For one-time rules.ini stuff. Intended for logic that should load only on startup and not per map.
@HOOK 0x00536AB5 _RulesClass__AI_Load ; it doesn't matter if we hook RulesClass::AI or RulesClass::General, the loaidng is contiguous. Intended for logic that should load per map.

; only loaded once on game init, not per map
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


; loaded per map
_RulesClass__AI_Load:
    Save_Registers

    ; [General]
.DeathReport1:
    call_INIClass__Get_String esi, str_General, str_DeathReport1, 0, ObjectTypeClass.StringBuffer, ObjectTypeClass.StringBuffer.Length
    mov  eax, ObjectTypeClass.StringBuffer
    cmp  byte[eax],0
    je   .DeathReport2
    GetVocArrayFromString Rules.General.DeathReport1_Data,16
    mov  [Rules.General.DeathReport1],eax

.DeathReport2:
    call_INIClass__Get_String esi, str_General, str_DeathReport2, 0, ObjectTypeClass.StringBuffer, ObjectTypeClass.StringBuffer.Length
    mov  eax, ObjectTypeClass.StringBuffer
    cmp  byte[eax],0
    je   .DeathReport3
    GetVocArrayFromString Rules.General.DeathReport2_Data,16
    mov  [Rules.General.DeathReport2],eax

.DeathReport3:
    call_INIClass__Get_String esi, str_General, str_DeathReport3, 0, ObjectTypeClass.StringBuffer, ObjectTypeClass.StringBuffer.Length
    mov  eax, ObjectTypeClass.StringBuffer
    cmp  byte[eax],0
    je   .DeathReport4
    GetVocArrayFromString Rules.General.DeathReport3_Data,16
    mov  [Rules.General.DeathReport3],eax

.DeathReport4:
    call_INIClass__Get_String esi, str_General, str_DeathReport4, 0, ObjectTypeClass.StringBuffer, ObjectTypeClass.StringBuffer.Length
    mov  eax, ObjectTypeClass.StringBuffer
    cmp  byte[eax],0
    je   .DeathReport5
    GetVocArrayFromString Rules.General.DeathReport4_Data,16
    mov  [Rules.General.DeathReport4],eax

.DeathReport5:
    call_INIClass__Get_String esi, str_General, str_DeathReport5, 0, ObjectTypeClass.StringBuffer, ObjectTypeClass.StringBuffer.Length
    mov  eax, ObjectTypeClass.StringBuffer
    cmp  byte[eax],0
    je   .DeathReport
    GetVocArrayFromString Rules.General.DeathReport5_Data,16
    mov  [Rules.General.DeathReport5],eax

.DeathReport:
    call_INIClass__Get_String esi, str_General, str_DeathReport, 0, ObjectTypeClass.StringBuffer, ObjectTypeClass.StringBuffer.Length
    mov  eax, ObjectTypeClass.StringBuffer
    cmp  byte[eax],0
    je   .TanyaDeathReport
    GetVocArrayFromString Rules.General.DeathReport_Data,16
    mov  [Rules.General.DeathReport],eax

.TanyaDeathReport:
    call_INIClass__Get_String esi, str_General, str_TanyaDeathReport, 0, ObjectTypeClass.StringBuffer, ObjectTypeClass.StringBuffer.Length
    mov  eax, ObjectTypeClass.StringBuffer
    cmp  byte[eax],0
    je   .DogDeathReport
    GetVocArrayFromString Rules.General.TanyaDeathReport_Data,16
    mov  [Rules.General.TanyaDeathReport],eax

.DogDeathReport:
    call_INIClass__Get_String esi, str_General, str_DogDeathReport, 0, ObjectTypeClass.StringBuffer, ObjectTypeClass.StringBuffer.Length
    mov  eax, ObjectTypeClass.StringBuffer
    cmp  byte[eax],0
    je   .AI
    GetVocArrayFromString Rules.General.DogDeathReport_Data,16
    mov  [Rules.General.DogDeathReport],eax

.AI:
    ; [AI]
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