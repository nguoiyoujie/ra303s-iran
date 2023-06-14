;----------------------------------------------------------------
; src/experimental/experiment_cnc_refinery.asm
;
; Attempt to have ore truck attach to the refinery, just like in Tiberium Dawn
; This is not yet a working prototype. Enable at your own risk
;
;----------------------------------------------------------------

@HOOK 0x00454C81 _BuildingClass_Refinery_HandleMessage_RADIO_IM_IN
;@HOOK 0x0057BD53 _UnitClass_PerCellProcess_Ignore_PCP_END
@HOOK 0x0057BD69 _UnitClass_PerCellProcess_Save_Contact_With_Whom
@HOOK 0x0057BDEA _UnitClass_PerCellProcess_HandleMessage_RADIO_ATTACH
@HOOK 0x0057A570 _UnitClass_HandleMessage_RADIO_BACKUP_NOW
@HOOK 0x0045CDA4 _BuildingClass_MissionHarvest_Initial_BSTATE_ACTIVE
@HOOK 0x0045CDD4 _BuildingClass_MissionHarvest_WaitForDock_BSTATE_AUX1
@HOOK 0x0045CEA2 _BuildingClass_MissionHarvest_Middle_BSTATE_AUX2
@HOOK 0x0045CEC0 _BuildingClass_MissionHarvest_DetachWhenDone

temp.This     dd 0
temp.Whom     dd 0

_BuildingClass_Refinery_HandleMessage_RADIO_IM_IN:
    inc  dword [Globals___ScenarioInit]
    mov  edx,0x2 ;BSTATE_ACTIVE
    mov  eax,esi
    call BuildingClass__Begin_Mode
    dec  dword [Globals___ScenarioInit]
    mov  dword ebx,[esi+0x11]
    mov  edx,0x2 ;MARK_CHANGE
    mov  eax,esi
    call dword [ebx+0x9c] ;Mark()
    mov  dword ebx,[esi+0x11]
    mov  edx,0x9 ; MISSION_HARVEST
    mov  eax,esi
    call dword [ebx+0xfc] ;Assign_Mission()
    mov  al,0x5 ; RADIO_ATTACH
    jmp  0x00454CA7

_UnitClass_PerCellProcess_Ignore_PCP_END:
    jmp  0x0057BD5D

_UnitClass_PerCellProcess_Save_Contact_With_Whom:
    mov  dword ebx,[ebp-0x1c]
    mov  dword [temp.This],ebx
    mov  dword ebx,[ebx+0x3a]
    mov  dword [temp.Whom],ebx
    test ecx,0x80
    jz   0x0057BDF4
    jmp  0x0057BD72

; also require edit to void UnitClass::Per_Cell_Process(bool center)
_UnitClass_PerCellProcess_HandleMessage_RADIO_ATTACH:
    cmp  al,0x1 ;RADIO_ROGER
    jc   0x0057BDBC
    jbe  0x0057BDF4
    cmp  al,0x5 ;RADIO_ATTACH
    jnz  0x0057BDBC
    mov  eax,temp.This
    mov  dword ebx,[temp.This]
    mov  dword ebx,[ebx+0x11]
    xor  edx,edx ;MARK_UP
    call dword [ebx+0x9c] ;Mark()
    mov  dword edx,[temp.This]
    mov  dword edx,[edx+0x11]
    mov  dword eax,[temp.This]
    call dword [edx+0x60] ;Limbo()
    mov  dword edx,[temp.This]
    mov  dword eax,[temp.Whom]
    lea  eax,[eax+0x53] 
    call 0x004623D0
    jmp  0x0057BDF4


_UnitClass_HandleMessage_RADIO_BACKUP_NOW:
    ;cmp  AL,0x1
    ;cmp  AL,0x5 ;RADIO_ATTACH
    ;jnz  0x0057A586
    ;mov  edx,0x8
    ;mov  dword edi,[esi+0x11]
    ;mov  ebx,ecx
    ;mov  eax,esi
    ;call dword [edi+0x15c]
    jmp  0x0057A586

; TO-DO: resolve errant Scatter before RADIO_IM_IN
; TO-DO: working credit line

_BuildingClass_MissionHarvest_Initial_BSTATE_ACTIVE:
    mov  edx,0x2 ;BSTATE_ACTIVE
    mov  eax,esi
    call BuildingClass__Begin_Mode
    mov  dword [esi+0x2a],0x1
    mov  eax,0x1
    jmp  0x0045CDB0

_BuildingClass_MissionHarvest_WaitForDock_BSTATE_AUX1:
    mov  edx,0x4 ;BSTATE_AUX1
    mov  eax,esi
    call BuildingClass__Begin_Mode
    mov  byte [esi+0xd6],bh
    mov  eax,0x1
    jmp  0x0045CDDF

_BuildingClass_MissionHarvest_Middle_BSTATE_AUX2:
    mov  edx,0x5 ;BSTATE_AUX2
    mov  eax,esi
    call BuildingClass__Begin_Mode
    mov  dword [esi+0x2a],0x3
    mov  eax,0x1
    jmp  0x0045CEAE

_BuildingClass_MissionHarvest_DetachWhenDone:
    push edi
    push esi
    mov  eax,esi
    add  eax,0x53
    mov  edi,[esi+0x11]
    mov  edx,0x1
    call 0x00462448 ;Detach_Object()
    mov  edx,eax
    mov  eax,esi
    call dword [edi+0x7c] ;Exit_Object()
    mov  ebx,edi
    mov  edx,0x5
    mov  eax,esi
    call dword [ebx+0xfc]
    pop  esi
    pop  edi
    jmp  0x0045CED0

