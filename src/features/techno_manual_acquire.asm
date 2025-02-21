;----------------------------------------------------------------
; src/features/techno_manual_acquire.asm
;
; Emulates Tanya's manual targeting. AI players will automatically target no matter what.
; 
; This function is enabled by setting the TechnoType to ManualAcquire=yes.
; This function is not enabled for BuildingTypes and AircraftTypes yet.
;
; No compatibility issues is expected.
;
;----------------------------------------------------------------

@HACK 0x004EF206,0x004EF20B,_InfantryClass__Greatest_Threat_ManualAcquire
    mov  edi,[edx]
    cmp  edi,-1
    je   0x004EF256
    push eax
    push ecx
    InfantryTypeClass.FromIndex([edx],ecx)
    TechnoTypeClass.ManualAcquire.Get(ecx,al)
    test al,al
    pop  ecx
    pop  eax
    jz   0x004EF261
    jmp  0x004EF22F ; retn
@ENDHACK


@HACK 0x00580F1C,0x00580F22,UnitClass__Greatest_Threat_ManualAcquire
    lea  ecx,[eax+UnitClass.Offset.Class]
    push ecx
    push edx
    push eax
    ;mov  ecx,[ecx]
    UnitTypeClass.FromIndex([ecx],edx)
    TechnoTypeClass.ManualAcquire.Get(edx,al)
    test al,al
    jz   .Continue
    pop  eax
    push eax
    TechnoClass.House.Get(eax,ecx)
    HouseClass.FromIndex(ecx,edx)
    HouseClass.IsHuman.Get(edx,al)
    test al,al
    jnz  .Ret
.Continue:
    pop  eax
    pop  edx
    pop  ecx
    jmp  0x00580F22
.Ret:
    pop  eax
    pop  edx
    pop  ecx
    xor  eax,eax
    jmp  0x00580FD1
@ENDHACK


@HACK 0x0058B701,0x0058B707,VesselClass__Greatest_Threat_ManualAcquire
    lea  ecx,[eax+VesselClass.Offset.Class]
    push ecx
    push edx
    push eax
    ;mov  ecx,[ecx]
    VesselTypeClass.FromIndex([ecx],edx)
    TechnoTypeClass.ManualAcquire.Get(edx,al)
    test al,al
    jz   .Continue
    pop  eax
    push eax
    TechnoClass.House.Get(eax,ecx)
    HouseClass.FromIndex(ecx,edx)
    HouseClass.IsHuman.Get(edx,al)
    test al,al
    jnz  .Ret
.Continue:
    pop  eax
    pop  edx
    pop  ecx
    jmp  0x0058B707
.Ret:
    pop  eax
    pop  edx
    pop  ecx
    xor  eax,eax
    jmp  0x0058B872
@ENDHACK
