;----------------------------------------------------------------
; src/features/specialweapons/parabomb.asm
;
; Handles the Parabomb special weapon
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

@HACK 0x004D5B6C,0x004D5B73,_HouseClass__Super_Weapon_Handler_Parabomb_Check1
    test dword[esi+HouseClass.Offset.SpecialScan],1<<(SpecialType.PARA_BOMB-1)
    jmp  0x004D5B73
@ENDHACK


@HACK 0x004D5BBD,0x004D5BC4,_HouseClass__Super_Weapon_Handler_Parabomb_Check2
    test dword[esi+HouseClass.Offset.SpecialScan],1<<(SpecialType.PARA_BOMB-1)
    jmp  0x004D5BC4
@ENDHACK
