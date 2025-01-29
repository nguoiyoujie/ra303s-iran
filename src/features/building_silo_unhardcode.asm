;----------------------------------------------------------------
; src/features/building_silo_unhardcode.asm
;
; Customizable silo function, with 5 frames depicting its relative filled state.
;
; This function is enabled by setting [BuildingType] > IsSilo=yes
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

@LJMP 0x004558FF, _BuildingClass__Shape_Number_Silo_Unhardcode
@LJMP 0x004D5F67, _HouseClass__Silo_Redraw_Check_Unhardcode


_BuildingClass__Shape_Number_Silo_Unhardcode:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsSilo.Get(edi,al)
    test al,al
    pop  edi
.Silo:
    jnz  0x0045590B
.NotASilo:
    jmp  0x004559DC


_HouseClass__Silo_Redraw_Check_Unhardcode:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsSilo.Get(edi,al)
    test al,al
    pop  edi
.Silo:
    jnz  0x004D5F6F
.NotASilo:
    jmp  0x004D5F7F

