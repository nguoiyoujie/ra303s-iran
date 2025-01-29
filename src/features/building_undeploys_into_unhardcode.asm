;----------------------------------------------------------------
; src/features/building_undeploys_into_unhardcode.asm
;
; Implements customization of buillding undeploys.
; 
; This function is enabled by including the following key in Rules.ini. 
;   Rules.ini > [<BuildingType>] > UndeploysInto=<UnitType>
;
; No compatibility issues is expected.
;
;----------------------------------------------------------------

@LJMP 0x004588BB, _BuildingClass_Active_Click_With_ConYardUnhardcode
@LJMP 0x0045A712, _BuildingClass_What_Action_ConYardUnhardcode
@LJMP 0x0045B991, _BuildingClass_Can_Enter_Cell_ConYardUnhardcode

@LJMP 0x0045C1F8, _BuildingClass_Mission_Deconstruct_MCVUnhardcode1
@LJMP 0x0045C51C, _BuildingClass_Mission_Deconstruct_MCVUnhardcode2
@LJMP 0x0045c5BB, _BuildingClass_Mission_Deconstruct_MCVUnhardcode3

@LJMP 0x0045EAEC, _BuildingClass_Can_Player_Move_ConYardUnhardcode

[section .data] 
Cache_BuildingType_UndeploysInto       db 0


[section .text] 
;Replaces the FACT check with a UndeploysInto=xx check
_BuildingClass_Active_Click_With_ConYardUnhardcode:
    movzx eax,al
    BuildingTypeClass.FromIndex(eax,eax)
    cmp  al,0
    je   0x0045898D
    mov  al, byte [eax + BuildingTypeClass.Offset.UndeploysInto]
    cmp  al,0
    jle  0x0045898D 
    jmp  0x004588C7

;Replaces the FACT check with a UndeploysInto=xx check
_BuildingClass_What_Action_ConYardUnhardcode:
    ; note: preserve FACT's interaction with Is_MCV_Deploy()
    movzx edx,ah
    push edi
    BuildingTypeClass.FromIndex(edx,edi)
    BuildingTypeClass.FactoryType.Get(edi,dl)
    cmp  dl,RTTIType.BuildingType
    pop  edi    
    ;cmp  edx,BuildingType.FACT
    jnz  .Continue
.Check_Is_MCV_Deploy:
    test byte [Globals___Rule_IsMCVDeploy_Address],Globals___Rule_IsMCVDeploy_BitMask
    jz   0x0045A723
.Continue:
    BuildingTypeClass.FromIndex(edx,edx)
    cmp  dl,0
    je   0x0045A723
    mov  dl, byte [edx + BuildingTypeClass.Offset.UndeploysInto]
    cmp  dl, 0
    jle  0x0045A723
    jmp  0x0045A725

_BuildingClass_Can_Enter_Cell_ConYardUnhardcode:
; Allows the code to check only one cell, instead of all cells in the foundation
    movzx eax,al
    BuildingTypeClass.FromIndex(eax,eax)
    cmp  al,0
    je   0x0045BA00
    mov  al, byte [eax + BuildingTypeClass.Offset.UndeploysInto]
    cmp  al, 0
    jle  0x0045BA00
    jmp  0x0045B999

_BuildingClass_Mission_Deconstruct_MCVUnhardcode1:
    movzx eax,al
    BuildingTypeClass.FromIndex(eax,eax)
    cmp  al,0
    je   0x0045C1FE
    mov  al, byte [eax + BuildingTypeClass.Offset.UndeploysInto]
    cmp  al, 0
    jle  0x0045C1FE
    jmp  0x0045C3EF
    
_BuildingClass_Mission_Deconstruct_MCVUnhardcode2:
    movzx eax,al
    BuildingTypeClass.FromIndex(eax,eax)
    cmp  al,0
    je   0x0045C746
    mov  al, byte [eax + BuildingTypeClass.Offset.UndeploysInto]
    ; value will be used in _BuildingClass_Mission_Deconstruct_MCVUnhardcode3
    mov  byte [Cache_BuildingType_UndeploysInto], al
    cmp  al, 0
    jle  0x0045C746
    jmp  0x0045C528

_BuildingClass_Mission_Deconstruct_MCVUnhardcode3:
    xor  edx,edx
    mov  dl,byte [Cache_BuildingType_UndeploysInto]
    jmp  0x0045C5C0

_BuildingClass_Can_Player_Move_ConYardUnhardcode:
    movzx eax,al
    BuildingTypeClass.FromIndex(eax,eax)
    cmp  al,0
    je   .NoUndeploy
    mov  al,byte [eax + BuildingTypeClass.Offset.UndeploysInto]
    cmp  al,0
    jg  .Undeploy
.NoUndeploy:
    xor  eax,eax
    jmp  0x0045EAFA
.Undeploy:
    mov  eax,1
    jmp  0x0045EAFA

