;----------------------------------------------------------------
; src/features/specialweapons/parabomb.asm
;
; Handles the Parabomb special weapon
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

@HACK 0x004D5B6C,0x004D5B73,_HouseClass__Super_Weapon_Handler_Parabomb_Check1
    push ecx
    HouseClass.SpecialScan.Get(esi,ecx)
    test ecx,1<<SpecialType.PARA_BOMB
    pop  ecx   
    jmp  0x004D5B73
@ENDHACK


@HACK 0x004D5BBD,0x004D5BC4,_HouseClass__Super_Weapon_Handler_Parabomb_Check2
    push ecx
    HouseClass.SpecialScan.Get(esi,ecx)
    test ecx,1<<SpecialType.PARA_BOMB
    pop  ecx   
    jmp  0x004D5BC4
@ENDHACK
