;----------------------------------------------------------------
; src/features/houses_heliunit.asm
;
; Customizable helicopter unit that spawns with the Helipad when the latter is built or spawned.
;
; This function is enabled by setting [HouseType] > HeliUnit
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------
@HOOK 0x00459FA4 _BuildingClass__Grand_Opening_HeliUnit_Unhardcode
@HOOK 0x0045A049 _BuildingClass__Grand_Opening_HeliUnit_Unhardcode2

Temp.HeliUnit db 0

_BuildingClass__Grand_Opening_HeliUnit_Unhardcode:
    ;mov  eax,[eax+0x41] ; ActLike
    ;movzx eax,al
    push edi
    push esi
    ;HouseClass.FromIndex(eax,edi)
    mov  edi,eax
    HouseClass.HeliUnit.Get(edi,al)
    movzx eax,al
    mov  esi,eax
    AircraftTypeClass.FromIndex(eax,edi)
    test edi,edi
    jz   .DefaultHeli
    cmp  edi,-1
    je   .DefaultHeli
    AircraftTypeClass.IsFixedWing.Get(edi,al)
    test al,al
    mov  eax,esi
    movzx eax,al
    jz   .Continue
.DefaultHeli:
    mov  al,AircraftType.HELI
.Continue:
    pop  esi
    pop  edi
    mov  byte[Temp.HeliUnit],al
    jmp  0x00459FF6


_BuildingClass__Grand_Opening_HeliUnit_Unhardcode2:
    mov  dl,byte[Temp.HeliUnit]
    movzx edx,dl
    jmp  0x0045A04E