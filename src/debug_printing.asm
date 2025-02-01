
%define    AssertionFailed        0x005F588C

[section .rdata]
str_fopenmode db"a+",0
str_debuglog db"DebugLog.txt",0
str_assertlog db"Assert.txt",0
str_formatstring db"%s",0
str_test db"test",0
str_test2 db"test2",0

; args: <output file>,<format>,<vargs>
%macro Debug_Log 3
    Save_Registers

    push %3
    push %2
    push %1

    mov  edx,str_fopenmode
    pop  eax
    call fopen
    mov  ebx,eax
    push ebx
    call fprintf
    add  esp,0xC
    mov  eax,ebx
    call fclose

    Restore_Registers
%endmacro


@HACK 0x005CDF08,0x005CDF21,_assert_Debug
    mov  edx,str_fopenmode
    push str_assertlog
    call fopen
    mov  ebx,eax
    push eax
    push ecx
    push ebx
    push edx
    push AssertionFailed
    push ebx
    call fprintf
    add  esp,0x14
    mov  eax,ebx
    call fclose
    jmp  0x005CDF21
@ENDHACK


@HACK 0x0059E770,0x0059E776,_OutputDebugStringW95_Hook
    pop  eax
    Debug_Log str_debuglog,eax,0
    sub  esp,4
    retn
@ENDHACK


@HACK 0x005A822D,0x005A8234,_WinsockInterfaceClass__Init_Debug2
    Debug_Log str_debuglog,eax,0
    jmp  0x005A8234
@ENDHACK


@HACK 0x005A81FA,0x005A8201,_WinsockInterfaceClass__Init_Debug
    Debug_Log str_debuglog,eax,0
    jmp  0x005A8201
@ENDHACK


@HACK 0x005A84F1,0x005A84F8,_WinsockInterfaceClass__Set_Socket_Options_Debug2
    Debug_Log str_debuglog,eax,0
    jmp  0x005A84F8
@ENDHACK


@HACK 0x005A84A8,0x005A84AF,_WinsockInterfaceClass__Set_Socket_Options_Debug
    Debug_Log str_debuglog,eax,0
    jmp  0x005A84AF
@ENDHACK


@HACK 0x005A87DB,0x005A87E2,_UDPInterfaceClass__Open_Socket_Debug
    Debug_Log str_debuglog,eax,0
    jmp  0x005A87E2
@ENDHACK


@HACK 0x005D2A8C,0x005D2A93,_WinModemClass__Serial_Port_Open_Debug2
    Debug_Log str_debuglog,eax,0
    jmp  0x005D2A93
@ENDHACK


@HACK 0x005D2A18,0x005D2A1F,_WinModemClass__Serial_Port_Open_Debug
    Debug_Log str_debuglog,eax,0
    jmp  0x005D2A1F
@ENDHACK


@HACK 0x005BBE3F,0x005BBE46,_WinTimerClass__WinTimerClass_Debug
    Debug_Log str_debuglog,eax,0
    jmp  0x005BBE46
@ENDHACK


@HACK 0x005A8F6A,0x005A8F71,_IPXInterfaceClass__Open_Socket_Debug5
    Debug_Log str_debuglog,eax,0
    jmp  0x005A8F71
@ENDHACK


@HACK 0x005A8F22,0x005A8F29,_IPXInterfaceClass__Open_Socket_Debug4
    Debug_Log str_debuglog,eax,0
    jmp  0x005A8F29
@ENDHACK


@HACK 0x005A8EDA,0x005A8EE1,_IPXInterfaceClass__Open_Socket_Debug3
    Debug_Log str_debuglog,eax,0
    jmp  0x005A8EE1
@ENDHACK


@HACK 0x005A8E72,0x005A8E79,_IPXInterfaceClass__Open_Socket_Debug2
    Debug_Log str_debuglog,eax,0
    jmp  0x005A8E79
@ENDHACK


@HACK 0x005A8E00,0x005A8E07,_IPXInterfaceClass__Open_Socket_Debug
    Debug_Log str_debuglog,eax,0
    jmp  0x005A8E07 ; 0x005A8DEA
@ENDHACK


@HACK 0x005C4720,0x005C4727,_IconCacheClass__Draw_It_Debug
    Debug_Log str_debuglog,eax,0
    jmp  0x005C4727
@ENDHACK


@HACK 0x005B3914,0x005B391A,_WWDebugString_Hook
    Debug_Log str_debuglog,eax,0
    retn
@ENDHACK


@HACK 0x005CD97B,0x005CD980,_Printf_Hook
    mov  edx,[esp+8]
    Debug_Log str_debuglog,edx,edi
.Ret:
    push ebx
    push edx
    sub  esp,4
    jmp  0x005CD980
@ENDHACK


;Mono_PrintF() 0x005C3548: arg 1 = format, arg 2 = varargs
@HACK 0x005C3548,0x005C35CF,_Mono_Printf_Redirect
    mov  eax,[esp+8]
    mov  ecx,[esp+12]
    Debug_Log str_debuglog,ecx,ebx
    sub  esp,4
    retn
@ENDHACK


@HACK 0x0052C2B8,0x0052C2BF,_Print_CRCs_Debug_On_Check
    ; do cmp
    cmp  byte[RedAlert.Options.DebugLogging],1
    jz   .Debug_On
    retn
.Debug_On:
    Debug_Log str_debuglog,str_test2,0
    push ebp
    mov  ebp,esp
    push ebx
    push ecx
    push edx
    push esi
    jmp  0x0052C2BF
@ENDHACK

