;----------------------------------------------------------------
; src/features/prerequisitesystem/radar.asm
;
; Reimplements radar tracking functions to account for the new prerequisite system.
; 
; This function is enabled by default and is not controllable.
;----------------------------------------------------------------

@HACK 0x004D4EAA,0x004D4EB1,_HouseClass__AI_RadarMap_Check1
    push ecx
    HouseClass.Radar.Get(eax,cl)
    test cl,cl
    pop  ecx
    jmp  0x004D4EB1
@ENDHACK


@HACK 0x004D4E49,0x004D4E50,_HouseClass__AI_RadarMap_Check2
    push eax
    push ecx
    HouseClass.Radar.Get(eax,cl)
    test cl,cl
    pop  ecx
    pop  eax
    jmp  0x004D4E50
@ENDHACK


@HACK 0x004D4DDF,0x004D4DE4,_HouseClass__AI_RadarJammed_Check
    ; eax is the id // need to enforce 0xFF
    push ebx
    push ecx
    movzx eax,al
    BuildingTypeClass.FromIndex(eax,ebx)
    BuildingTypeClass.IsRadar.Get(ebx,cl)
    test cl,cl
    pop  ecx
    pop  ebx
    jz   0x004D4D77
    jmp  0x004D4DE4
@ENDHACK