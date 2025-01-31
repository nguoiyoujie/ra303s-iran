;----------------------------------------------------------------
; src/features/loading/loading_redalert.asm
;
; Load setting keys from RedAlert.ini
;
;----------------------------------------------------------------

@LJMP  0x004F406D,_Init_Game_Early_Hook ; For loading REDALERT.INI stuff early
@LJMP 0x00525A9F,_OptionsClass__Load_Settings ; For redalert.ini and some spawn.ini stuff
@SJMP  0x004F4462,0x004F446C ; Don't call OptionsClass::Load_Settings() again, patch calls it at start of Init_Game()

%define        ebp_RedAlertINI        [ebp-0x74] ; for _OptionsClass__Load_Settings

_Init_Game_Early_Hook:
    call 0x004F8664 ; Init_Keys(void)
    mov eax,0x00668188 ; offset GameOptionsClass Options
    call 0x00525A24 ; OptionsClass::Load_Settings(void)
    jmp 0x004F4072   


_OptionsClass__Load_Settings:
    call 0x004F3660
    Save_Registers

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_ForceSingleCPU,0
    mov  [RedAlert.Options.ForceSingleCPU],al

    cmp  al,0
    jz   .Dont_Set_Single_CPU

    call Set_Single_CPU_Affinity

.Dont_Set_Single_CPU:

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_MouseWheelScrolling,0
    mov  [RedAlert.Options.MouseWheelScrolling],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_DisplayCounterstrikeMultiplayerMaps,1
    mov  [RedAlert.Options.DisplayCounterstrikeMultiplayerMaps],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_DisplayAftermathMultiplayerMaps,1
    mov  [RedAlert.Options.DisplayAftermathMultiplayerMaps],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_DisplayOriginalMultiplayerMaps,1
    mov  [RedAlert.Options.DisplayOriginalMultiplayerMaps],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_UseSmallInfantry,0
    mov  [RedAlert.Options.UseSmallInfantry],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_AftermathEnabled,1
    mov  [RedAlert.Options.AftermathEnabled],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_CounterstrikeEnabled,1
    mov  [RedAlert.Options.CounterstrikeEnabled],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_NoCD,1
    mov  [RedAlert.Options.NoCDMode],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_DebugLogging,1
    mov  [RedAlert.Options.DebugLogging],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Int eax,str_Options,str_VideoInterlaceMode,2 ; 2 = deinterlace videos
    mov  [RedAlert.Options.VideoInterlaceMode],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_SkipScoreScreen,0
    mov  [RedAlert.Options.SkipScoreScreen],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_RandomStartingSong,0
    mov  [RedAlert.Options.RandomStartingSong],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_AlternativeRifleSound,0
    mov  [RedAlert.Options.AlternativeRifleSound],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_UseGrenadeThrowingSound,0
    mov  [RedAlert.Options.UseGrenadeThrowingSound],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_UseBetaTeslaTank,0
    mov  [RedAlert.Options.UseBetaTeslaTank],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_UseBetaDestroyer,0
    mov  [RedAlert.Options.UseBetaDestroyer],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_UseBetaCruiser,0
    mov  [RedAlert.Options.UseBetaCruiser],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_UseBetaSubmarine,0
    mov  [RedAlert.Options.UseBetaSubmarine],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_UseBetaGunboat,0
    mov  [RedAlert.Options.UseBetaGunboat],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_GenerateMemoryDump,0
    mov  [RedAlert.Options.GenerateMemoryDump],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_ForceAMUnitsInMissions,0
    mov  [RedAlert.Options.ForceAMUnitsInMissions],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_FastAMBuildSpeed,0
    mov  [RedAlert.Options.FastAMBuildSpeed],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_ColorRemapSidebarIcons,0
    mov  [RedAlert.Options.ColorRemapSidebarIcons],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_UseDOSInterfaceMod,0
    mov  [RedAlert.Options.UseDOSInterfaceMod],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Bool eax,str_Options,str_EnableWOL,0
    mov  [RedAlert.Options.EnableWOL],al

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Int eax,str_WinHotkeys,str_KeySidebarToggle,9
    mov  [RedAlert.WinHotKeys.KeySidebarToggle],ax

    lea  eax,ebp_RedAlertINI
    call_INIClass__Get_Int eax,str_WinHotkeys,str_KeyMapSnapshot,0
    mov  [RedAlert.WinHotKeys.KeyMapSnapshot],ax

    Restore_Registers
    jmp  0x00525AA4


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