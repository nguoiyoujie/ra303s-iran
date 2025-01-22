;----------------------------------------------------------------
; src/features/building_construction_yard_unhardcode.asm
;
; AI has special logic reserved for the Construction Yard. For example, 
; it will always try to repair it, and it will never sell it.
;
; This logic now applies to all buildings with FactoryType=BuildingType
;
; This function is enabled by setting [BuildingType] > FactoryType=BuildingType
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

@HOOK 0x0045ED9C _BuildingClass__Read_INI_Repair_Yard_Unhardcode
@HOOK 0x00460139 _BuildingClass__Repair_AI_Dont_Sell_Yard_Unhardcode
@HOOK 0x004604C3 _BuildingClass__Animation_AI_Yard_Unhardcode
@HOOK 0x004A5BF5 _Keyboard_Process__Yard_Unhardcode
@HOOK 0x004A5CA2 _Keyboard_Process__MCV_Unhardcode


_BuildingClass__Read_INI_Repair_Yard_Unhardcode:
    movzx edx,dl
    push edi
    BuildingTypeClass.FromIndex(edx,edi)
    BuildingTypeClass.FactoryType.Get(edi,dl)
    cmp  dl,RTTIType.BuildingType
    pop  edi
.Yard:
    je   0x0045EDA4
.NotAYard:
    jmp  0x0045EDAB


_BuildingClass__Repair_AI_Dont_Sell_Yard_Unhardcode:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.FactoryType.Get(edi,al)
    cmp  al,RTTIType.BuildingType
    pop  edi
.Yard:
    je   0x00460176
.NotAYard:
    jmp  0x00460141


_BuildingClass__Animation_AI_Yard_Unhardcode:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.FactoryType.Get(edi,al)
    cmp  al,RTTIType.BuildingType
    pop  edi
.Yard:
    je   0x004604CB
.NotAYard:
    jmp  0x004604E2


_Keyboard_Process__Yard_Unhardcode:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.FactoryType.Get(edi,al)
    cmp  al,RTTIType.BuildingType
    pop  edi
.Yard:
    je   0x004A5BFD
.NotAYard:
    jmp  0x004A5B8F


_Keyboard_Process__MCV_Unhardcode:
    movzx eax,al
    push edi
    UnitTypeClass.FromIndex(eax,edi)
    UnitTypeClass.DeploysInto.Get(edi,al)
    test al,al
    pop  edi
.Deployer:
    jnz  0x004A5CAA
.NotADeployer:
    jmp  0x004A5C3C
