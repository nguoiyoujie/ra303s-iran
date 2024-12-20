;----------------------------------------------------------------
; src/features/infantry_response.asm
;
; Allows infantry voices to be customized by INI.
;
; This function is enabled by defining ResponseSelect=, ResponseMove=, or ResponseAttack= in the infantry type definitions
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

@HOOK 0x0056586D _TechnoClass__Player_Assign_Mission_CheckIfInfiltrate
@HOOK 0x004EBECD _InfantryClass__Take_Damage_RememberID
@HOOK 0x004EBF33 _InfantryClass__Take_Damage_ReportDeath1
@HOOK 0x004EBF68 _InfantryClass__Take_Damage_ReportDeath2
@HOOK 0x004EBF9F _InfantryClass__Take_Damage_ReportDeath3
@HOOK 0x004EBFD6 _InfantryClass__Take_Damage_ReportDeath4
@HOOK 0x004EC002 _InfantryClass__Take_Damage_ReportDeath5
@HOOK 0x004EF463 _InfantryClass__Response_Select_CustomVoice
@HOOK 0x004EF6C3 _InfantryClass__Response_Move_CustomVoice
@HOOK 0x004EF92B _InfantryClass__Response_Attack_CustomVoice

Temp.DeathInfantryID db 0
Temp.UseResponseInvade db 0


_TechnoClass__Player_Assign_Mission_CheckIfInfiltrate:
    mov  byte[Temp.UseResponseInvade],0
    cmp  byte[ebp-0xc],MissionType.MISSION_CAPTURE
    je   .SetInvade
    cmp  byte[ebp-0xc],MissionType.MISSION_SABOTAGE
    je   .SetInvade
    jmp  .Retn
.SetInvade:
    mov  byte[Temp.UseResponseInvade],1
.Retn:
    mov  edx,dword[esi+0x11]
    mov  eax,esi
    jmp  0x00565872


_InfantryClass__Take_Damage_RememberID:
    movsx eax,al
    mov  byte[Temp.DeathInfantryID],al
    cmp  eax,5
    jmp  0x004EBED3


_InfantryClass__Take_Damage_ReportDeath1:
    ; edx is the sound, eax and ecx are available
    mov  al,byte[Temp.DeathInfantryID] ; ID
    movsx eax,al
    InfantryTypeClass.FromIndex(eax,ecx) 
    InfantryTypeClass.Report_Death1.Get(ecx,eax)
    test eax,eax
    jz   .Retn
    lea  ecx,[ecx+InfantryTypeClass.Offset.Report_Death1_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    xor  edx,edx
    mov  dx,word[ecx+eax*2]
.Retn:
    mov  ecx,0xFFFFFFFF
    jmp  0x004EBF38


_InfantryClass__Take_Damage_ReportDeath2:
    ; edx is the sound, eax and ecx are available
    mov  al,byte[Temp.DeathInfantryID] ; ID
    movsx eax,al
    InfantryTypeClass.FromIndex(eax,ecx) 
    InfantryTypeClass.Report_Death2.Get(ecx,eax)
    test eax,eax
    jz   .Retn
    lea  ecx,[ecx+InfantryTypeClass.Offset.Report_Death2_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    xor  edx,edx
    mov  dx,word[ecx+eax*2]
.Retn:
    mov  ecx,0xFFFFFFFF
    jmp  0x004EBF6D


_InfantryClass__Take_Damage_ReportDeath3:
    ; edx is the sound, eax and ecx are available
    mov  al,byte[Temp.DeathInfantryID] ; ID
    movsx eax,al
    InfantryTypeClass.FromIndex(eax,ecx) 
    InfantryTypeClass.Report_Death3.Get(ecx,eax)
    test eax,eax
    jz   .Retn
    lea  ecx,[ecx+InfantryTypeClass.Offset.Report_Death3_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    xor  edx,edx
    mov  dx,word[ecx+eax*2]
.Retn:
    mov  ecx,0xFFFFFFFF
    jmp  0x004EBFA4


_InfantryClass__Take_Damage_ReportDeath4:
    ; ebx is the sound, eax and ecx are available
    mov  al,byte[Temp.DeathInfantryID] ; ID
    movsx eax,al
    InfantryTypeClass.FromIndex(eax,ecx) 
    InfantryTypeClass.Report_Death4.Get(ecx,eax)
    test eax,eax
    jz   .Retn
    lea  ecx,[ecx+InfantryTypeClass.Offset.Report_Death4_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    xor  ebx,ebx
    mov  bx,word[ecx+eax*2]
.Retn:
    mov  ecx,0xFFFFFFFF
    jmp  0x004EBFDB


_InfantryClass__Take_Damage_ReportDeath5:
    ; edx is the sound, eax and ecx are available
    mov  al,byte[Temp.DeathInfantryID] ; ID
    movsx eax,al
    InfantryTypeClass.FromIndex(eax,ecx) 
    InfantryTypeClass.Report_Death5.Get(ecx,eax)
    test eax,eax
    jz   .Retn
    lea  ecx,[ecx+InfantryTypeClass.Offset.Report_Death5_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    xor  edx,edx
    mov  dx,word[ecx+eax*2]
.Retn:
    mov  ecx,0xFFFFFFFF
    jmp  0x004EC007


_InfantryClass__Response_Select_CustomVoice:
    push eax
    mov  al,byte[eax+0x196] ; ID
    movsx eax,al
    InfantryTypeClass.FromIndex(eax,edx) 
    InfantryTypeClass.Response_Select.Get(edx,eax)
    test eax,eax
    jz   .Retn
    pop  ecx
    lea  ecx,[edx+InfantryTypeClass.Offset.Response_Select_Data]
    jmp  0x004EF5B6

.Retn:
    pop  eax
    test byte[eax+0x192],0x10 ; IsCivilian
    jmp  0x004EF46A


_InfantryClass__Response_Move_CustomVoice:
    push eax
    mov  al,byte[eax+0x196] ; ID
    movsx eax,al
    InfantryTypeClass.FromIndex(eax,edx) 
    cmp  byte[Temp.UseResponseInvade],1
    jne  .UseMove

.UseInvade:
    InfantryTypeClass.Response_Invade.Get(edx,eax)
    test eax,eax
    jz   .UseMove
    pop  ecx
    lea  ecx,[edx+InfantryTypeClass.Offset.Response_Invade_Data]
    jmp  0x004EF826

.UseMove:
    InfantryTypeClass.Response_Move.Get(edx,eax)
    test eax,eax
    jz   .Retn
    pop  ecx
    lea  ecx,[edx+InfantryTypeClass.Offset.Response_Move_Data]
    jmp  0x004EF826

.Retn:
    pop  eax
    test byte[eax+0x192],0x10 ; IsCivilian
    jmp  0x004EF6CA


_InfantryClass__Response_Attack_CustomVoice:
    push eax
    mov  al,byte[eax+0x196] ; ID
    movsx eax,al
    InfantryTypeClass.FromIndex(eax,edx) 
    InfantryTypeClass.Response_Attack.Get(edx,eax)
    test eax,eax
    jz   .Retn
    pop  ecx
    lea  ecx,[edx+InfantryTypeClass.Offset.Response_Attack_Data]
    jmp  0x004EFA70

.Retn:
    pop  eax
    test byte[eax+0x192],0x10 ; IsCivilian
    jmp  0x004EF932