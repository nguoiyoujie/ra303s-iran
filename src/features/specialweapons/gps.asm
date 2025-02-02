;----------------------------------------------------------------
; src/features/specialweapons/gps.asm
;
; Handles the GPS special weapon
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------


@HACK 0x004D5193,0x004D519A,_HouseClass__Super_Weapon_Handler_GPS_Check1
    push ecx
    push ebx
    xor  ebx,ebx
    mov  bl,byte[esi+1] ; ID
    lea  ecx,[Houses.SpecialScan]
    lea  ecx,[ecx+ebx*4]
    test dword[ecx],0x100   ; GPS 1 << 8
    pop  ebx   
    pop  ecx   
    jmp  0x004D519A
@ENDHACK


@HACK 0x004D51C9,0x004D51D0,_HouseClass__Super_Weapon_Handler_GPS_Check2
    push ecx
    push ebx
    xor  ebx,ebx
    mov  bl,byte[esi+1] ; ID
    lea  ecx,[Houses.SpecialScan]
    lea  ecx,[ecx+ebx*4]
    test dword[ecx],0x100   ; GPS 1 << 8
    pop  ebx   
    pop  ecx   
    jmp  0x004D51D0
@ENDHACK


@HACK 0x004D52E3,0x004D52EA,_HouseClass__Super_Weapon_Handler_GPS_Check3
    push ecx
    push ebx
    xor  ebx,ebx
    mov  bl,byte[esi+1] ; ID
    lea  ecx,[Houses.SpecialScan]
    lea  ecx,[ecx+ebx*4]
    test dword[ecx],0x100   ; GPS 1 << 8
    pop  ebx   
    pop  ecx   
    jmp  0x004D52EA
@ENDHACK


@HACK 0x004D52A4,0x004D52AB,_HouseClass__Super_Weapon_Handler_GPS_LaunchCheck1
    movzx eax,al
    ; eax is the id
    push ebx
    push ecx
    BuildingTypeClass.FromIndex(eax,ebx)
    BuildingTypeClass.SpecialWeapons.Get(ebx,cx)
    test cx,0x100; SpecialType.GPS (8)
    pop  ecx
    pop  ebx
    jz   0x004D525E
    jmp  0x004D52AB
@ENDHACK


@HACK 0x004D5371,0x004D5378,_HouseClass__Super_Weapon_Handler_GPS_LaunchCheck2
    movzx eax,al
    ; eax is the id
    push ebx
    push ecx
    BuildingTypeClass.FromIndex(eax,ebx)
    BuildingTypeClass.SpecialWeapons.Get(ebx,cx)
    test cx,0x100; SpecialType.GPS (8)
    pop  ecx
    pop  ebx
    jz   0x004D5327
    jmp  0x004D5378
@ENDHACK


@HACK 0x0045D73A,0x0045D74A,_BuildingClass_Mission_Missile_SpecialWeapon_GPSCheck
    movzx eax,al
    ; eax is the id
    push ebx
    push ecx
    BuildingTypeClass.FromIndex(eax,ebx)
    BuildingTypeClass.SpecialWeapons.Get(ebx,cx)
    test cx,0x100; SpecialType.GPS (8)
    pop  ecx
    pop  ebx
    jnz  0x0045D8A6
    jmp  0x0045D8BA
@ENDHACK
