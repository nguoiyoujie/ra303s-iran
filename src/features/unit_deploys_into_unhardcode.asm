;----------------------------------------------------------------
; src/features/unit_deploys_into_unhardcode.asm
;
; Implements customization of unit deploys.
; 
; This function is enabled by including the following key in Rules.ini. 
;   Rules.ini > [<UnitType>] > DeploysInto=<BuildingType>
;
; No compatibility issues is expected.
;
;----------------------------------------------------------------

; TO-DO: MCV check on Mission_Hunt
; TO-DO: MCV check on TeamClass::TMission_Deploy

[section .data] 
Cache_UnitType_DeploysInto       db 0


[section .text] 
;Replaces the MCV check with a DeploysInto=xx check
@HACK 0x0057B953,0x0057B95F,_UnitClass_Try_To_Deploy_MCVUnhardcode
    movzx eax,al
    UnitTypeClass.FromIndex(eax,eax)
    mov  al,byte[eax+UnitTypeClass.Offset.DeploysInto]
    mov  byte[Cache_UnitType_DeploysInto],al
    cmp  al,0
    jle  0x0057BD03 
    jmp  0x0057B95F
@ENDHACK


;Replaces the MCV check with a DeploysInto=xx check
@HACK 0x0057E803,0x0057E80D,_UnitClass__Mission_Hunt_MCVUnhardcode
    movzx eax,al
    UnitTypeClass.FromIndex(eax,eax)
    mov  al,byte[eax+UnitTypeClass.Offset.DeploysInto]
    mov  byte[Cache_UnitType_DeploysInto],al
    cmp  al,0
    jle  0x0057E84C 
    jmp  0x0057E83E
@ENDHACK



@HACK 0x0057B9BC,_UnitClass_Try_To_Deploy_ConstructionYardUnhardcode1
    xor  eax,eax
    mov  al,byte[Cache_UnitType_DeploysInto]
    jmp  0x0057B9C1
@ENDHACK


@HACK 0x0057BA4D,0x0057BA52,_UnitClass_Try_To_Deploy_ConstructionYardUnhardcode2
    xor  eax,eax
    mov  al,byte[Cache_UnitType_DeploysInto]
    jmp  0x0057BA52
@ENDHACK


@HACK 0x0057BB03,0x0057BB08,_UnitClass_Try_To_Deploy_ConstructionYardUnhardcode3
    xor  edx,edx
    mov  dl,byte[Cache_UnitType_DeploysInto]
    jmp  0x0057BB08
@ENDHACK


;Replaces the MCV check with a DeploysInto=xx check
@HACK 0x0057F4AD,0x0057F4B9,_UnitClass_What_Action_MCVUnhardcode
    movzx eax,al
    UnitTypeClass.FromIndex(eax,eax)
    mov  al,byte[eax+UnitTypeClass.Offset.DeploysInto]
    mov  byte[Cache_UnitType_DeploysInto],al
    cmp  al,0
    jle  0x0057F535
    jmp  0x0057F4B9
@ENDHACK


@HACK 0x0057F509,0x0057F50E,_UnitClass_What_Action_ConstructionYardUnhardcode
    xor  eax,eax
    mov  al,byte[Cache_UnitType_DeploysInto]
    jmp  0x0057F50E
@ENDHACK


;Replaces the MCV check with a DeploysInto=xx check
@HACK 0x0057FC97,0x0057FCA3,_UnitClass__Mission_Guard_MCVUnhardcode
    movzx eax,al
    UnitTypeClass.FromIndex(eax,eax)
    mov  al,byte[eax+UnitTypeClass.Offset.DeploysInto]
    ;mov  byte[Cache_UnitType_DeploysInto],al ; use only if Mission_Guard requires a reference
    cmp  al,0
    jle  0x0057FD34
    jmp  0x0057FCA3
@ENDHACK

@SET 0x0057FCCC,{mov edx,0xE} ; MISSION_HUNT instead of MISSION_UNLOAD


@HACK 0x0057D9A6,0x0057D9AD,_UnitClass__Mission_Unload_IsRotating_IsDriving_Check
    test byte[eax+0xCD],0xC0 ; originally only IsDriving is checked.
    jmp  0x0057D9AD
@ENDHACK


@HACK 0x0057DA5D,0x0057DA66,_UnitClass__Mission_Unload_DeploysInto_Status2_Check
    test byte[eax+0xCD],0x10
    jnz  .StillDeploying
    jmp  0x0057DA66
.StillDeploying:
    mov  dword[eax+0x2A],0x1 ; allow the code to try again
    jmp  0x0057DAB0
@ENDHACK

;@HACK 0x0057D3C8,_UnitClass__Mission_Unload_MCVUnhardcode ; overlap with _UnitClass__Mission_Unload_PassengerUnhardcode
; Overlap with _UnitClass__Mission_Unload_PassengerUnhardcode
;Replaces the MCV check with a DeploysInto=xx check
;_UnitClass__Mission_Unload_MCVUnhardcode:
;    push eax
;    movzx eax,al
;    UnitTypeClass.FromIndex(eax,eax)
;    mov  al,byte[eax+UnitTypeClass.Offset.DeploysInto]
;    ;mov  byte[Cache_UnitType_DeploysInto],al
;    cmp  al,0
;    pop  eax
;    jg   0x0057DA83
;    cmp  al,UnitType.MCV
;    jc   0x0057E246
;    jmp  0x0057D3D0
;@ENDHACK

