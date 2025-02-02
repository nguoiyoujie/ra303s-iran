;----------------------------------------------------------------
; src/features/specialweapons/spyplane.asm
;
; Handles the Spy Plane special weapon
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

@HACK 0x004D59C4,0x004D59CB,_HouseClass__Super_Weapon_Handler_SpyPlane_Check1
    push ecx
    push ebx
    xor  ebx,ebx
    mov  bl,byte[esi+1] ; ID
    lea  ecx,[Houses.SpecialScan]
    lea  ecx,[ecx+ebx*4]
    test dword[ecx],0x40   ; SPY_MISSION 1 << 6
    pop  ebx   
    pop  ecx   
    jmp  0x004D59CB
@ENDHACK


@HACK 0x004D5A3D,0x004D5A44,_HouseClass__Super_Weapon_Handler_SpyPlane_Check2
    push ecx
    push ebx
    xor  ebx,ebx
    mov  bl,byte[esi+1] ; ID
    lea  ecx,[Houses.SpecialScan]
    lea  ecx,[ecx+ebx*4]
    test dword[ecx],0x40   ; SPY_MISSION 1 << 6
    pop  ebx   
    pop  ecx   
    jmp  0x004D5A44
@ENDHACK
