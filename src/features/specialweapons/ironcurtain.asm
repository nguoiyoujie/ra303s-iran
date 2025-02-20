;----------------------------------------------------------------
; src/features/specialweapons/ironcurtain.asm
;
; Handles the Iron Curtain special weapon
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

@HACK 0x004D5584,0x004D558B,_HouseClass__Super_Weapon_Handler_IronCurtain_Check1
    test dword[esi+HouseClass.Offset.SpecialScan],1<<(SpecialType.IRON_CURTAIN-1)
    jmp  0x004D558B
@ENDHACK


@HACK 0x004D55EE,0x004D560F,_HouseClass__Super_Weapon_Handler_IronCurtain_Check2
    ; Also remove the USSR / Ukraine check
    test dword[esi+HouseClass.Offset.SpecialScan],1<<(SpecialType.IRON_CURTAIN-1)
    jmp  0x004D560F ; use 0x004D55F5 if we want to restore check for USSR / Ukraine
@ENDHACK
