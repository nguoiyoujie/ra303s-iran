;----------------------------------------------------------------
; src/features/loading/loading_spawn.asm
;
; Load setting keys from spawn.ini (used for multiplayer settings)
;
;----------------------------------------------------------------

@HACK 0x00551A87,0x00551A8D,_Startup_Function_Hook_Early_Load ; for some spawn.ini stuff
    xor  edx,edx
    mov  [0x006ABBC8],edx
    Save_Registers

    call_CCINIClass__Load str_ini_Spawn,CCFileClass_Spawn,CCINIClass_Spawn

    call_INIClass__Get_Bool CCINIClass_Spawn,str_Settings,str_Aftermath,0
    mov  [Spawn.Settings.Aftermath],al

    Restore_Registers
    mov  ebx,[0x006ABC10]
    jmp  0x00551A8D
    retn
@ENDHACK
