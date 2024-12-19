;----------------------------------------------------------------
; src/features/type_extensions/early_rules_ini_load.asm
;
; Early hooks to intercept rules loading. This allows spawner-specific files to be loaded in place of the usual rules.
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;
;----------------------------------------------------------------

@HOOK 0x004F4094 _Init_Game_Early_RULES_INI_Load
@HOOK 0X004F419C _Init_Game_Patch_Out_Later_RULES_INI_Load

_Init_Game_Patch_Out_Later_RULES_INI_Load:
    mov  eax,1
    jmp  0x004F41BA

_Init_Game_Early_RULES_INI_Load:
    Save_Registers

    call GetCommandLineA

    mov  edx,str_arg_Spawn
    call _stristr
    test eax,eax

    je   .Ret_RULES_INI

    mov  edx,str_xdp_Spawn
    jmp  .Past_Checking_For_Spawner_Active

.Ret_RULES_INI:
    mov  edx,str_ini_Rules

.Past_Checking_For_Spawner_Active:

    lea  eax,[ebp-0xD4]
    call CCFileClass__CCFileClass
    xor  ebx,ebx
    mov  edx,eax
    mov  eax,Globals___RuleINI
    call CCINIClass__Load

    ; Call functions to load lists for certain unhardcoding features
    mov  eax,Globals___RuleINI
    call Rules_INI_Load_Sound_Effects_List

.Ret:
    Restore_Registers
    mov  edx,HouseType.Count ; was 14h
    jmp  0x004F4099
