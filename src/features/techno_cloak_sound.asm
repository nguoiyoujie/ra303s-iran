;----------------------------------------------------------------
; src/features/techno_cloak_sound.asm
;
; Customize cloaking sounds.
; 
; This function is enabled by setting the TechnoType to CloakSound=<some voctype>.
;
; No compatibility issues is expected.
;
;----------------------------------------------------------------

@HACK 0x00566EB2,0x00566EB7,_TechnoClass__Do_Cloak_CustomSound
    mov  dword[edx+0xD],ecx
    AbstractClass.RTTI.Get(ebx,al)
    cmp  al,RTTIType.Infantry
    je   .CheckInfantry  
    cmp  al,RTTIType.Unit
    je   .CheckUnit  
    cmp  al,RTTIType.Building
    je   .CheckBuilding  
    cmp  al,RTTIType.Aircraft
    je   .CheckAircraft      
    cmp  al,RTTIType.Vessel
    je   .CheckVessel
    jmp  0x00566EB7

.CheckInfantry:
    InfantryClass.Class.Get(ebx,edx)
    InfantryTypeClass.FromIndex(edx,ecx)
    TechnoTypeClass.CloakSound.Get(ecx,al)
    test al,al
    jz   0x00566EB7
    movzx eax,al
    mov  dword ecx,-1
    jmp  0x00566ED1

.CheckUnit:
    UnitClass.Class.Get(ebx,edx)
    UnitTypeClass.FromIndex(edx,ecx)
    TechnoTypeClass.CloakSound.Get(ecx,al)
    test al,al
    jz   0x00566EB7
    movzx eax,al
    mov  dword ecx,-1
    jmp  0x00566ED1

.CheckBuilding:
    BuildingClass.Class.Get(ebx,edx)
    BuildingTypeClass.FromIndex(edx,ecx)
    TechnoTypeClass.CloakSound.Get(ecx,al)
    test al,al
    jz   0x00566EB7
    movzx eax,al
    mov  dword ecx,-1
    jmp  0x00566ED1

.CheckAircraft:
    AircraftClass.Class.Get(ebx,edx)
    AircraftTypeClass.FromIndex(edx,ecx)
    TechnoTypeClass.CloakSound.Get(ecx,al)
    test al,al
    jz   0x00566EB7
    movzx eax,al
    mov  dword ecx,-1
    jmp  0x00566ED1

.CheckVessel:
    VesselClass.Class.Get(ebx,edx)
    VesselTypeClass.FromIndex(edx,ecx)
    TechnoTypeClass.CloakSound.Get(ecx,al)
    test al,al
    jz   0x00566EBB ; special for subs 
    movzx eax,al
    mov  dword ecx,-1
    jmp  0x00566ED1
@ENDHACK


@HACK 0x00566DFD,0x00566E02,_TechnoClass__Do_Uncloak_CustomSound
    mov  dword[edx+0xD],ecx
    AbstractClass.RTTI.Get(ebx,al)
    cmp  al,RTTIType.Infantry
    je   .CheckInfantry  
    cmp  al,RTTIType.Unit
    je   .CheckUnit  
    cmp  al,RTTIType.Building
    je   .CheckBuilding  
    cmp  al,RTTIType.Aircraft
    je   .CheckAircraft      
    cmp  al,RTTIType.Vessel
    je   .CheckVessel
    jmp  0x00566E12

.CheckInfantry:
    InfantryClass.Class.Get(ebx,edx)
    InfantryTypeClass.FromIndex(edx,ecx)
    TechnoTypeClass.CloakSound.Get(ecx,al)
    test al,al
    jz   0x00566E12
    movzx eax,al
    mov  dword ecx,-1
    jmp  0x00566E1C

.CheckUnit:
    UnitClass.Class.Get(ebx,edx)
    UnitTypeClass.FromIndex(edx,ecx)
    TechnoTypeClass.CloakSound.Get(ecx,al)
    test al,al
    jz   0x00566E12
    movzx eax,al
    mov  dword ecx,-1
    jmp  0x00566E1C

.CheckBuilding:
    BuildingClass.Class.Get(ebx,edx)
    BuildingTypeClass.FromIndex(edx,ecx)
    TechnoTypeClass.CloakSound.Get(ecx,al)
    test al,al
    jz   0x00566E12
    movzx eax,al
    mov  dword ecx,-1
    jmp  0x00566E1C

.CheckAircraft:
    AircraftClass.Class.Get(ebx,edx)
    AircraftTypeClass.FromIndex(edx,ecx)
    TechnoTypeClass.CloakSound.Get(ecx,al)
    test al,al
    jz   0x00566E12
    movzx eax,al
    mov  dword ecx,-1
    jmp  0x00566E1C

.CheckVessel:
    VesselClass.Class.Get(ebx,edx)
    VesselTypeClass.FromIndex(edx,ecx)
    TechnoTypeClass.CloakSound.Get(ecx,al)
    test al,al
    jz   0x00566E06 ; special for subs 
    movzx eax,al
    mov  dword ecx,-1
    jmp  0x00566E1C
@ENDHACK
