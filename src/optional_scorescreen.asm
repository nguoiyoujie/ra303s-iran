

; RedAlert.Options.SkipScoreScreen
@HACK 0x00540670,0x00540678,_Campaign_Do_Win_Score_Screen
    cmp  byte[RedAlert.Options.SkipScoreScreen],1
    jnz  .No_Early_Ret
    retn
.No_Early_Ret:
    push ebp
    mov  ebp,esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    jmp  0x00540678
@ENDHACK


@HACK 0x00546678,0x00546680,_Multiplayer_Score_Presentation_Start
    cmp  byte[RedAlert.Options.SkipScoreScreen],1
    jnz  .No_Early_Ret
    retn
.No_Early_Ret:
    push ebp
    mov  ebp,esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    jmp  0x00546680
@ENDHACK

