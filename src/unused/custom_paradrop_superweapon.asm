; Test code

;@LJMP 0x004D6D3B, _Paradrop_Superweapon_Custom

_Paradrop_Superweapon_Custom:

    ; Amount to paradrop
    mov  byte[eax+0xA9],30

    mov  esi,eax

    ; Paradrop Demo Trucks
    mov  eax,0x14
    call UnitTypeClass__As_Reference

    ; Paradrop Cruisers
;    mov        eax,2
;    call    VesselTypeClass__As_Reference

    ; Paradrop dogs
;    mov        eax,10
;    call    InfantryTypeClass__As_Reference

    ; Paradrop HELI
;    mov        eax,5
;    call    AircraftTypeClass__As_Reference

    mov  dword[esi+0xAD],eax
    mov  eax,esi
    call Reinf___Do_Reinforcements
    jmp  0x004D6D40
