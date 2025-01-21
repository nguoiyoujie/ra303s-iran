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

@HOOK 0x0057B953 _UnitClass_Try_To_Deploy_MCVUnhardcode
@HOOK 0x0057B9BC _UnitClass_Try_To_Deploy_ConstructionYardUnhardcode1
@HOOK 0x0057BA4D _UnitClass_Try_To_Deploy_ConstructionYardUnhardcode2
@HOOK 0x0057BB03 _UnitClass_Try_To_Deploy_ConstructionYardUnhardcode3

@HOOK 0x0057F4AD _UnitClass_What_Action_MCVUnhardcode
@HOOK 0x0057F509 _UnitClass_What_Action_ConstructionYardUnhardcode

@HOOK 0x0057FC97 _UnitClass_Mission_Guard_MCVUnhardcode

@HOOK 0x0057D9A6 _UnitClass_Mission_Unload_IsRotating_IsDriving_Check
@HOOK 0x0057DA64 _UnitClass_Mission_Unload_DeploysInto_Status2_Check
;@HOOK 0x0057D3C8 _UnitClass_Mission_Unload_MCVUnhardcode ; overlap with _UnitClass_Mission_Unload_PassengerUnhardcode

; TO-DO: MCV check on Mission_Hunt
; TO-DO: MCV check on TeamClass::TMission_Deploy

Cache_UnitType_DeploysInto       db 0

;Replaces the MCV check with a DeploysInto=xx check
_UnitClass_Try_To_Deploy_MCVUnhardcode:
    movzx eax,al
    UnitTypeClass.FromIndex(eax,eax)
    mov  al, byte [eax + UnitTypeClass.Offset.DeploysInto]
    mov  byte [Cache_UnitType_DeploysInto], al
    cmp  al, 0
    jle  0x0057BD03 
    jmp  0x0057B95F

_UnitClass_Try_To_Deploy_ConstructionYardUnhardcode1:
    xor  eax, eax
    mov  al, byte [Cache_UnitType_DeploysInto]
    jmp  0x0057B9C1

_UnitClass_Try_To_Deploy_ConstructionYardUnhardcode2:
    xor  eax, eax
    mov  al, byte [Cache_UnitType_DeploysInto]
    jmp  0x0057BA52

_UnitClass_Try_To_Deploy_ConstructionYardUnhardcode3:
    xor  edx, edx
    mov  dl, byte [Cache_UnitType_DeploysInto]
    jmp  0x0057BB08


;Replaces the MCV check with a DeploysInto=xx check
_UnitClass_What_Action_MCVUnhardcode:
    movzx eax,al
    UnitTypeClass.FromIndex(eax,eax)
    mov  al, byte [eax + UnitTypeClass.Offset.DeploysInto]
    mov  byte [Cache_UnitType_DeploysInto], al
    cmp  al, 0
    jle  0x0057F535
    jmp  0x0057F4B9

_UnitClass_What_Action_ConstructionYardUnhardcode:
    xor  eax, eax
    mov  al, byte [Cache_UnitType_DeploysInto]
    jmp  0x0057F50E


;Replaces the MCV check with a DeploysInto=xx check
_UnitClass_Mission_Guard_MCVUnhardcode:
    movzx eax,al
    UnitTypeClass.FromIndex(eax,eax)
    mov  al, byte [eax + UnitTypeClass.Offset.DeploysInto]
    ;mov  byte [Cache_UnitType_DeploysInto], al ; use only if Mission_Guard requires a reference
    cmp  al, 0
    jle  0x0057FD34
    jmp  0x0057FCA3


_UnitClass_Mission_Unload_IsRotating_IsDriving_Check:
    test byte [eax + 0xcd], 0xC0 ; originally only IsDriving is checked.
    jmp  0x0057D9AD

_UnitClass_Mission_Unload_DeploysInto_Status2_Check:
    test byte [eax + 0xcd], 0x10
    jnz  .StillDeploying
    jmp  0x0057DA66

.StillDeploying:
    mov  dword [eax + 0x2a],0x1 ; allow the code to try again
    jmp  0x0057DAB0


; Overlap with _UnitClass_Mission_Unload_PassengerUnhardcode
;Replaces the MCV check with a DeploysInto=xx check
;_UnitClass_Mission_Unload_MCVUnhardcode:
;    push eax
;    movzx eax,al
;    UnitTypeClass.FromIndex(eax,eax)
;    mov  al, byte [eax + UnitTypeClass.Offset.DeploysInto]
;    ;mov  byte [Cache_UnitType_DeploysInto], al
;    cmp  al, 0
;    pop  eax
;    jg   0x0057DA83
;    cmp  al, UnitType.MCV
;    jc   0x0057E246
;    jmp  0x0057D3D0


