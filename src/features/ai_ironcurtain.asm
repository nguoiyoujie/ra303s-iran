;----------------------------------------------------------------
; src/features/ai_ironcurtain.asm
;
; AI will use the Iron Curtain
;
;----------------------------------------------------------------

cextern Coord___Coord_Cell
cextern HouseClass__Place_Special_Blast

[section .text]
IronCurtainCheck:
    ; esi=techno, ebp+0x8=source
    AbstractClass.RTTI.Get(esi,bl)
    cmp  bl,RTTIType.Infantry
    je   .CheckInfantry  
    cmp  bl,RTTIType.Unit
    je   .CheckUnit  
    cmp  bl,RTTIType.Building
    je   .CheckBuilding  
    cmp  bl,RTTIType.Aircraft
    je   .CheckAircraft      
    cmp  bl,RTTIType.Vessel
    je   .CheckVessel
    jmp  .Ret

.CheckInfantry:
    InfantryClass.Class.Get(esi,ebx)
    InfantryTypeClass.FromIndex(ebx,eax)
    test byte[eax+TechnoTypeClass.Offset.ToProtectWithSpecials],1<<(TechnoTypeClass.Bit.ToProtectWithSpecials-1)
    jnz  .HouseCheck
    jmp  .Ret

.CheckUnit:
    UnitClass.Class.Get(esi,ebx)
    UnitTypeClass.FromIndex(ebx,eax)
    test byte[eax+TechnoTypeClass.Offset.ToProtectWithSpecials],1<<(TechnoTypeClass.Bit.ToProtectWithSpecials-1)
    jnz  .HouseCheck
    jmp  .Ret

.CheckBuilding:
    BuildingClass.Class.Get(esi,ebx)
    BuildingTypeClass.FromIndex(ebx,eax)
    test byte[eax+TechnoTypeClass.Offset.ToProtectWithSpecials],1<<(TechnoTypeClass.Bit.ToProtectWithSpecials-1)
    jnz  .HouseCheck
    jmp  .Ret

.CheckAircraft:
    AircraftClass.Class.Get(esi,ebx)
    AircraftTypeClass.FromIndex(ebx,eax)
    test byte[eax+TechnoTypeClass.Offset.ToProtectWithSpecials],1<<(TechnoTypeClass.Bit.ToProtectWithSpecials-1)
    jnz  .HouseCheck
    jmp  .Ret

.CheckVessel:
    VesselClass.Class.Get(esi,ebx)
    VesselTypeClass.FromIndex(ebx,eax)
    test byte[eax+TechnoTypeClass.Offset.ToProtectWithSpecials],1<<(TechnoTypeClass.Bit.ToProtectWithSpecials-1)
    jnz  .HouseCheck
    jmp  .Ret

.HouseCheck:
    mov  byte al,[esi+TechnoClass.Offset.House]
    movzx eax,al
    HouseClass.FromIndex(eax,edx)
    test byte[edx+HouseClass.Offset.IsHuman],1<<(HouseClass.Bit.IsHuman-1)
    jnz  .Ret
    test dword[edx+HouseClass.Offset.SpecialScan],1<<(SpecialType.IRON_CURTAIN-1)
    jz   .Ret
    mov  byte al,[edx+HouseClass.Offset.SuperWeapon7]
    and  eax,0xA ; IsReady | IsPresent
    cmp  eax,0xA
    jne  .Ret
    push edx
    ; Place_Special_Blast on the unit
    mov  eax,[esi+AbstractClass.Offset.Coord]
    call Coord___Coord_Cell
    movzx ebx,ax
    pop  eax
    mov  edx,SpecialType.IRON_CURTAIN-1
    call HouseClass__Place_Special_Blast
.Ret:
    ret
