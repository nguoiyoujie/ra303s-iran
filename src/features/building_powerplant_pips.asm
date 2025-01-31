;----------------------------------------------------------------
; src/features/building_powerplant_pips.asm
;
; Originally, only allied or spied Power Plant and Adv. Power Plant would show power pips.
; Now, any building with positive power generation (Power > Drain) will show pips
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------
@LJMP 0x00568A8A,_TechnoClass_Draw_Pips_CheckPower

_TechnoClass_Draw_Pips_CheckPower:
    movzx eax,al
    push edx
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.Power.Get(edi,eax)
    BuildingTypeClass.Drain.Get(edi,edx)
    cmp  eax,edx
    pop  edi
    pop  edx
.PowerPlant:
    jg    0x00568AC5
.NotPowerPlant:
    jmp   0x00568B72
