;----------------------------------------------------------------
; src/features/specialweapons/paradrop.asm
;
; Handles the Paradrop special weapon
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

@HACK 0x004D5AAA,0x004D5AB1,_HouseClass__Super_Weapon_Handler_Paradrop_Check1
    push ecx
    HouseClass.SpecialScan.Get(esi,ecx)
    test ecx,1<<SpecialType.PARA_INFANTRY
    pop  ecx   
    jmp  0x004D5AB1
@ENDHACK


@HACK 0x004D5AFF,0x004D5B06,_HouseClass__Super_Weapon_Handler_Paradrop_Check2
    push ecx
    HouseClass.SpecialScan.Get(esi,ecx)
    test ecx,1<<SpecialType.PARA_INFANTRY
    pop  ecx   
    jmp  0x004D5B06
@ENDHACK

