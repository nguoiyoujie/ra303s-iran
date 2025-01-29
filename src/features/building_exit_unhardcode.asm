;----------------------------------------------------------------
; src/features/building_exit_unhardcode.asm
;
; Unit exit logic takes unhardcoded building logic into account
;
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

@LJMP 0x00458DCD, _BuildingClass__Exit_Object_InfantryUnit_Unhardcode
@LJMP 0x00458C8F, _BuildingClass__Exit_Object_Vessel_Unhardcode
@LJMP 0x0045C0BA, _BuildingClass__Mission_Deconstruction_DetachShips_Unhardcode
@LJMP 0x0045E457, _BuildingClass__Crew_Type_Unhardcode


_BuildingClass__Exit_Object_InfantryUnit_Unhardcode:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRefinery.Get(edi,al) ; Refinery
    test al,al
    jnz  .Refinery
    BuildingTypeClass.FactoryType.Get(edi,al) ; Barracks / War Factory
    cmp  al,RTTIType.InfantryType
    je   .Barracks
    cmp  al,RTTIType.UnitType
    jne  .Normal
.WarFactory:
    pop  edi
    jmp  0x00458EC7
.Refinery:
    pop  edi
    jmp  0x00458DEC
.Barracks:
    pop  edi
    jmp  0x004590B8
.Normal:
    pop  edi
    jmp  0x004592BC


_BuildingClass__Exit_Object_Vessel_Unhardcode:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.FactoryType.Get(edi,al) 
    cmp  al,RTTIType.VesselType
    jne  .Normal
.Shipyard:
    pop  edi
    jmp  0x00458C9F
.Normal:
    pop  edi
    jmp  0x00459582


_BuildingClass__Mission_Deconstruction_DetachShips_Unhardcode:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.FactoryType.Get(edi,al) 
    cmp  al,RTTIType.VesselType
    jne  .Normal
.Shipyard:
    pop  edi
    jmp  0x0045C0F5
.Normal:
    pop  edi
    jmp  0x0045C176


_BuildingClass__Crew_Type_Unhardcode:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsSilo.Get(edi,al) ; Silo
    test al,al
    jnz  .Silo
    BuildingTypeClass.IsKennel.Get(edi,al) ; Kennel
    test al,al
    jnz  .Kennel
    BuildingTypeClass.FactoryType.Get(edi,al) ; Barracks / Construction Yard
    cmp  al,RTTIType.InfantryType
    je   .Barracks
    cmp  al,RTTIType.BuildingType
    jne  .Normal
.Yard:
    pop  edi
    jmp  0x0045E4B1
.Silo:
    pop  edi
    jmp  0x0045E47E
.Kennel:
    pop  edi
    jmp  0x0045E516
.Barracks:
    pop  edi
    jmp  0x0045E550
.Normal:
    pop  edi
    jmp  0x0045E566

