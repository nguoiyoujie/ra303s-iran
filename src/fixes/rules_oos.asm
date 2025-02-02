;----------------------------------------------------------------
; src/fixes/rules_oos.asm
;
; Inherited commentary from Iran's version
;
; Fix RulesClass data (data loaded from rules.ini) Out of Sync desync while playing online after playing certain mod maps and then playing a normal map.
; This bug happens because Westwood geniuses load the default values once, then use the previous value as default while reading rules.ini when the previous value
; wasn't found. Because Westwood left out a few values in rules.ini that are loaded by this default value, the game will load the previous value of a mod map that does
; specify any value left out by Westwood's rules.ini in their mod map, and if this value is different from the game's default. E.g.:
;
; Rules.ini doesn't contain value herp=, but a mod map does, and the game does try to load herp=, because it isn't found the default value is loaded instead. The first
; time this happens is when rules.ini is loaded at startup, it will be initialized to the previous variable's value which is specified RulesClass' constructor. Once this 
; mod map is loaded however, the value will be set to the mod map's. Whenever the game loads rules.ini again it will load the default value because rules.ini doesn't
; contain herp=, THIS DEFAULT VALUE IS THE PREVIOUS VALUE OF THE VARIABLE WHICH NOW IS THE MOD MAPS' VALUE. So everytime rules.ini is loaded again the value of herp= will
; stay the mod map's value. Because this value is different from the default rules.ini the game goes out of sync with people who have the normal rules.ini value.
;
; Westwood coding at its finest. This fix loads FunkyFr3sh's OOS-FIX.ini before any other file while loading a scenario. His file contains everything that rules.ini
; implicitly loads (by not specifying every value and having the game use defaults) but his file explictly states every value the game uses. This explicitly mentioning
; every value fixes the bug because no wrong default value is loaded.
;
; /Inherit
;
; Modified rules are not necessarily cleared after a game. Maps act as overrides, but do not necessarily override every part of the rules.
; This causes issues where rule modifications from a different map spill over to the next. If the next map is a mulitplayer game, this is a cause of desyncs.
; This fix, combined with OOS-FIX.ini file, bypasses the bug by forcing a reload of the file.
;
; In the light that new INI keys are created for extended functions, this might warrant a review for its sufficiency.
; 
; This function is enabled by default and is not controllable.
;
;----------------------------------------------------------------

cextern CCFileClass__CCFileClass
cextern CCINIClass__Load
cextern RulesClass__General
cextern RulesClass__Recharge
cextern RulesClass__AI
cextern RulesClass__Powerups
cextern RulesClass__Land_Types
cextern RulesClass__Themes
cextern RulesClass__IQ
cextern RulesClass__Objects
cextern RulesClass__Difficulty
cextern Globals___RuleINI
cextern Globals___Rule

cextern str_ini_OOSFix


@HACK 0x00538B73,0x00538B7D,_Load_Game_Load_OOS_FIX_INI
    Save_Registers
    cmp  byte[spawner_is_active],1
    jz   .Ret
    mov  edx,str_ini_OOSFix
    mov  eax,CCFileClass_OOSFix
    call CCFileClass__CCFileClass
    mov  eax,CCINIClass_OOSFix
    call CCINIClass__CCINIClass
    xor  ebx,ebx
    mov  edx,CCFileClass_OOSFix
    mov  eax,CCINIClass_OOSFix
    call CCINIClass__Load
    mov  eax,CCINIClass_OOSFix
    call 0x00463BD4
    cmp  eax,0x1539DF28
    jnz  .Ret
    mov  byte[0x00665E02],0x55 ; EngineerDamage
    mov  byte[0x00665E04],0x40 ; EngineerCaptureLevel
    mov  edx,CCINIClass_OOSFix
    mov  eax,Globals___Rule
    call RulesClass__General
    mov  edx,CCINIClass_OOSFix
    mov  eax,Globals___Rule
    call RulesClass__Recharge
    mov  edx,CCINIClass_OOSFix
    mov  eax,Globals___Rule
    call RulesClass__AI
    mov  edx,CCINIClass_OOSFix
    mov  eax,Globals___Rule
    call RulesClass__Powerups
    mov  edx,CCINIClass_OOSFix
    mov  eax,Globals___Rule
    call RulesClass__Land_Types
    mov  edx,CCINIClass_OOSFix
    mov  eax,Globals___Rule
    call RulesClass__Themes
    mov  edx,CCINIClass_OOSFix
    mov  eax,Globals___Rule
    call RulesClass__IQ
    mov  edx,CCINIClass_OOSFix
    mov  eax,Globals___Rule
    call RulesClass__Objects
    mov  edx,CCINIClass_OOSFix
    mov  eax,Globals___Rule
    call RulesClass__Difficulty
.Ret:
    Restore_Registers
    mov  edx,Globals___RuleINI
    mov  eax,Globals___Rule
    jmp  0x00538B7D
@ENDHACK


@HACK 0x0053D541,0x0053D546,_Read_Scenario_INI_Load_OOS_FIX_INI
    cmp  byte[spawner_is_active],1
    jz   .Ret
    mov  edx,str_ini_OOSFix
    mov  eax,CCFileClass_OOSFix
    call CCFileClass__CCFileClass
    mov  eax,CCINIClass_OOSFix
    call CCINIClass__CCINIClass
    xor  ebx,ebx
    mov  edx,CCFileClass_OOSFix
    mov  eax,CCINIClass_OOSFix
    call CCINIClass__Load
    mov  eax,CCINIClass_OOSFix
    call 0x00463BD4
    cmp  eax,0x1539DF28
    jnz  .Ret
    mov  byte[0x00665E02],0x55 ; EngineerDamage
    mov  byte[0x00665E04],0x40 ; EngineerCaptureLevel
    mov  edx,CCINIClass_OOSFix
    mov  eax,Globals___Rule
    call RulesClass__General
    mov  edx,CCINIClass_OOSFix
    mov  eax,Globals___Rule
    call RulesClass__Recharge
    mov  edx,CCINIClass_OOSFix
    mov  eax,Globals___Rule
    call RulesClass__AI
    mov  edx,CCINIClass_OOSFix
    mov  eax,Globals___Rule
    call RulesClass__Powerups
    mov  edx,CCINIClass_OOSFix
    mov  eax,Globals___Rule
    call RulesClass__Land_Types
    mov  edx,CCINIClass_OOSFix
    mov  eax,Globals___Rule
    call RulesClass__Themes
    mov  edx,CCINIClass_OOSFix
    mov  eax,Globals___Rule
    call RulesClass__IQ
    mov  edx,CCINIClass_OOSFix
    mov  eax,Globals___Rule
    call RulesClass__Objects
    mov  edx,CCINIClass_OOSFix
    mov  eax,Globals___Rule
    call RulesClass__Difficulty
.Ret:
    mov  edx,Globals___RuleINI
    mov  eax,Globals___Rule
    jmp  0x0053D546
@ENDHACK

