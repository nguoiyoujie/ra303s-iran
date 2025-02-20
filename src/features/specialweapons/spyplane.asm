;----------------------------------------------------------------
; src/features/specialweapons/spyplane.asm
;
; Handles the Spy Plane special weapon
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

@HACK 0x004D59C4,0x004D59CB,_HouseClass__Super_Weapon_Handler_SpyPlane_Check1
    test dword[esi+HouseClass.Offset.SpecialScan],1<<(SpecialType.SPY_MISSION-1)
    jmp  0x004D59CB
@ENDHACK


@HACK 0x004D5A3D,0x004D5A44,_HouseClass__Super_Weapon_Handler_SpyPlane_Check2
    test dword[esi+HouseClass.Offset.SpecialScan],1<<(SpecialType.SPY_MISSION-1)
    jmp  0x004D5A44
@ENDHACK
