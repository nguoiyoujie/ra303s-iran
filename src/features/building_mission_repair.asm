;----------------------------------------------------------------
; src/features/building_mission_repair.asm
;
; The Construction Yard plays an animation when this mission is applied to it. Now, all FactoryType=BuildingType buildings can play the same animation
;
; This function is enabled by having more buildings with FactoryType=BuildingType. Remember to set the relevant animation frames
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

;Overrides the structure type check with a FactoryType=xx check
@HACK 0x0045CF1B,0x0045CF22,_BuildingClass_Mission_Repair_Replace_TypeCheck_with_FactoryTypeCheck
    movzx eax,al
    BuildingTypeClass.FromIndex(eax,eax)
    cmp  byte[eax+BuildingTypeClass.Offset.FactoryType],RTTIType.BuildingType 
    jz   0x0045CF57 ; is a conyard
    jmp  0x0045CF6D
@ENDHACK


@HACK 0x0045CF94,0x0045CFA0,_BuildingClass_Mission_Repair_RepairBay_Unhardcode
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRepairPad.Get(edi,al)
    test al,al
    pop  edi
.RepairPad:
    jnz  0x0045D2FF
.NotARepairPad:
    jmp  0x0045CFA0
@ENDHACK


@HACK 0x0045D376,0x0045D3B5,_BuildingClass_Mission_Repair_Helipad_Airfield_Unhardcode
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsHelipad.Get(edi,al)
    test al,al
    jnz  .CanReload
    BuildingTypeClass.IsAirfield.Get(edi,al)
    test al,al
    jz   .Normal
.CanReload:
    pop  edi
    jmp  0x0045D6C8
.Normal:
    pop  edi
    jmp  0x0045D3B5
@ENDHACK
