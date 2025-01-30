;----------------------------------------------------------------
; src/features/infantry_response.asm
;
; Allows infantry voices to be customized by INI.
;
; This function is enabled by defining ResponseSelect=, ResponseMove=, or ResponseAttack= in the infantry type definitions
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------
[section .data] 
Temp.DeathInfantryID db 0
Temp.ResponseMission db 0


; used for Infantry, Unit and Vessel
@HACK 0x0056586D,0x00565872,_TechnoClass__Player_Assign_Mission_CheckIfInfiltrate
    mov  dl,byte[ebp-0xC]
    mov  byte[Temp.ResponseMission],dl
    mov  edx,dword[esi+0x11]
    mov  eax,esi
    jmp  0x00565872
@ENDHACK


@HACK 0x004EBECD,0x004EBED3,_InfantryClass__Take_Damage_RememberID
    movzx eax,al
    mov  byte[Temp.DeathInfantryID],al
    cmp  eax,5
    jmp  0x004EBED3
@ENDHACK


; %1 - deathtyppe: 1 to 5
; %2 - register to place the result, unmodified if no custom deathreport is found. Expects ebx or edx
%macro GetCustomInfDeathReport 2
    ; eax and ecx are available
    mov  al,byte[Temp.DeathInfantryID] ; ID
    movzx eax,al
    InfantryTypeClass.FromIndex(eax,ecx) 
    InfantryTypeClass.DeathReport%1.Get(ecx,eax)
    test eax,eax
    jz   %%CheckDeathReport
    lea  ecx,[ecx+InfantryTypeClass.Offset.DeathReport%1_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  %2,word[ecx+eax*2]
    jmp  %%Retn
  %%CheckDeathReport:
    InfantryTypeClass.DeathReport.Get(ecx,eax)
    test eax,eax
    jz   %%CheckSpecialInfantry
    lea  ecx,[ecx+InfantryTypeClass.Offset.DeathReport_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  %2,word[ecx+eax*2]
    jmp  %%Retn
  %%CheckSpecialInfantry:
    cmp  byte[Temp.DeathInfantryID],InfantryType.E7
    je   %%CheckSpecialTanyaDeathReport
    cmp  byte[Temp.DeathInfantryID],InfantryType.DOG
    je   %%CheckSpecialDogDeathReport
    jmp  %%CheckGeneralDeathReportNum
  %%CheckSpecialTanyaDeathReport:
    mov  eax,[Rules.General.TanyaDeathReport]
    test eax,eax
    jz   %%Retn
    lea  ecx,[Rules.General.TanyaDeathReport_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  %2,word[ecx+eax*2]
    jmp  %%Retn
  %%CheckSpecialDogDeathReport:
    mov  eax,[Rules.General.DogDeathReport]
    test eax,eax
    jz   %%Retn
    lea  ecx,[Rules.General.DogDeathReport_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  %2,word[ecx+eax*2]
    jmp  %%Retn
  %%CheckGeneralDeathReportNum:
    mov  eax,[Rules.General.DeathReport%1]
    test eax,eax
    jz   %%CheckGeneralDeathReport
    lea  ecx,[Rules.General.DeathReport%1_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  %2,word[ecx+eax*2]
    jmp  %%Retn
  %%CheckGeneralDeathReport:
    mov  eax,[Rules.General.DeathReport]
    test eax,eax
    jz   %%Retn
    lea  ecx,[Rules.General.DeathReport_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  %2,word[ecx+eax*2]
    jmp  %%Retn
  %%Retn:
%endmacro


@HACK 0x004EBF33,0x004EBF38,_InfantryClass__Take_Damage_DeathReport1
    GetCustomInfDeathReport 1,dx
    movzx edx,dx
    mov  ecx,0xFFFFFFFF
    jmp  0x004EBF38
@ENDHACK


@HACK 0x004EBF68,0x004EBF6D,_InfantryClass__Take_Damage_DeathReport2
    GetCustomInfDeathReport 2,dx
    movzx edx,dx
    mov  ecx,0xFFFFFFFF
    jmp  0x004EBF6D
@ENDHACK


@HACK 0x004EBF9F,0x004EBFA4,_InfantryClass__Take_Damage_DeathReport3
    GetCustomInfDeathReport 3,dx
    movzx edx,dx
    mov  ecx,0xFFFFFFFF
    jmp  0x004EBFA4
@ENDHACK



@HACK 0x004EBFD6,0x004EBFDB,_InfantryClass__Take_Damage_DeathReport4
    ; ebx is the sound
    GetCustomInfDeathReport 4,bx
    movzx ebx,bx
    mov  ecx,0xFFFFFFFF
    jmp  0x004EBFDB
@ENDHACK


@HACK 0x004EC002,0x004EC007,_InfantryClass__Take_Damage_DeathReport5
    GetCustomInfDeathReport 5,dx
    movzx edx,dx
    mov  ecx,0xFFFFFFFF
    jmp  0x004EC007
@ENDHACK


@HACK 0x004EF463,0x004EF46A,_InfantryClass__Response_Select_CustomVoice
    push eax
    mov  al,byte[eax+0x196] ; ID
    movzx eax,al
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
@ENDHACK


@HACK 0x004EF6C3,0x004EF6CA,_InfantryClass__Response_Move_CustomVoice
    push eax
    mov  al,byte[eax+0x196] ; ID
    movzx eax,al
    InfantryTypeClass.FromIndex(eax,edx) 
    cmp  byte[Temp.ResponseMission],MissionType.MISSION_CAPTURE
    je   .UseInvade
    cmp  byte[Temp.ResponseMission],MissionType.MISSION_SABOTAGE
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
@ENDHACK


@HACK 0x004EF92B,0x004EF932,_InfantryClass__Response_Attack_CustomVoice
    push eax
    mov  al,byte[eax+0x196] ; ID
    movzx eax,al
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
@ENDHACK

