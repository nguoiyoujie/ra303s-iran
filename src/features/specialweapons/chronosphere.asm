;----------------------------------------------------------------
; src/features/specialweapons/chronosphere.asm
;
; Handles the Chronosphere special weapon
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

@HACK 0x004D5418,0x004D541F,_HouseClass__Super_Weapon_Handler_Chronosphere_Check1
    push ecx
    push ebx
    xor  ebx,ebx
    mov  bl,byte[esi+1] ; ID
    lea  ecx,[Houses.SpecialScan]
    lea  ecx,[ecx+ebx*4]
    test dword[ecx],0x8   ; CHRONOSPHERE 1 << 3
    pop  ebx   
    pop  ecx   
    jmp  0x004D541F
@ENDHACK


@HACK 0x004D54DE,0x004D54E5,_HouseClass__Super_Weapon_Handler_Chronosphere_Check2
    push ecx
    push ebx
    xor  ebx,ebx
    mov  bl,byte[esi+1] ; ID
    lea  ecx,[Houses.SpecialScan]
    lea  ecx,[ecx+ebx*4]
    test dword[ecx],0x8   ; CHRONOSPHERE 1 << 3
    pop  ebx   
    pop  ecx   
    jmp  0x004D54E5
@ENDHACK


;-------------------------------------------------
; Chrono Targeting
;-------------------------------------------------
; Moving SPC_CHRONO2 from 8 to a custom ID (0xFE)
@HACK 0x004D68DC,0x004D68E5,_HouseClass__Place_Special_Blast_SwitchRoute
    cmp  dx,SpecialChrono2
    jz   0x004D71F0 ; SPC_CHRONO2
    cmp  dx,0x8
    ja   0x004D7668 ; end of handling
    jmp  0x004D68E5 ; specials 0-6
@ENDHACK


@HACK 0x004D71B4,0x004D71BB,_HouseClass__Place_Special_Blast_Redefine_Chrono2
    mov  byte[Globals___Map_IsTargettingMode],SpecialChrono2
    jmp  0x004D71BB
@ENDHACK


@HACK 0x004D5460,0x004D5479,_HouseClass__Super_Weapon_Handler_Chronosphere_Check_new_Chrono2
    mov  ah,byte[Globals___Map_IsTargettingMode]
    cmp  ah,0x2
    jz   0x004D54C4
    cmp  ah,SpecialChrono2
    jz   0x004D5479
    jmp  0x004D54CB
@ENDHACK


@HACK 0x004B343F,0x004B344C,_DisplayClass__TacticalClass__Action_Chrono_Target_Icon_new_Chrono2
    cmp  byte[Globals___Map_IsTargettingMode],SpecialChrono2
    jz   0x004B344C
    jg   0x004B34BD
    mov  byte[ebp-0x10],0x11 ; ACTION_PARA_INFANTRY (to replace later)
    jmp  0x004B34BD
@ENDHACK


@HACK 0x0057E1C5,0x0057E1CC,_UnitClass__Mission_Unload__Chrono_Tank_new_Chrono2
    mov  byte[Globals___Map_IsTargettingMode],SpecialChrono2
    jmp  0x0057E1CC
@ENDHACK


@HACK 0x0057F708,0x0057F711,_UnitClass__What_Action__Chrono_Tank_new_Chrono2
    cmp  byte[Globals___Map_IsTargettingMode],SpecialChrono2
    jnz  0x0057F718
    jmp  0x0057F711
@ENDHACK


@HACK 0x00566898,0x005668A5,_TechnoClass__Record_The_Kill__Chrono_Tank_new_Chrono2
    cmp  byte[Globals___Map_IsTargettingMode],SpecialChrono2
    jnz  0x005668F8
    jmp  0x005668A5
@ENDHACK


@HACK 0x005666AE,0x005666B7,_TechnoClass__Take_Damage__Chrono_Tank_new_Chrono2
    cmp  byte[Globals___Map_IsTargettingMode],SpecialChrono2
    jnz  0x00566711
    jmp  0x005666B7
@ENDHACK
