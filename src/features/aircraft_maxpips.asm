;----------------------------------------------------------------
; src/features/type_extensions/AircraftTypeClass/aircraft_maxpips.asm
;
; Aircraft showed 5 pips for its ammo though less may be used.
; Aircraft now shows up to 5 pips. 
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;
;----------------------------------------------------------------

@HACK 0x00040409D,0x004040A2,_AircraftTypeClass__Max_Pips_Show_Actual_Max_Pips
    TechnoTypeClass.MaxAmmo.Get(eax,edx) 
    mov  eax,5
    cmp  eax,edx
    jg   .Dont_Set_Max_To_Five
    mov  eax,5
.Dont_Set_Max_To_Five:
    jmp  0x004040A2
@ENDHACK
