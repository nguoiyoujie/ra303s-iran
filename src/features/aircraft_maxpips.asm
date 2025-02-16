;----------------------------------------------------------------
; src/features/type_extensions/AircraftTypeClass/aircraft_maxpips.asm
;
; Aircraft showed 5 pips for its ammo though less may be used.
; Aircraft now shows up to 5 pips. Or 15, if the aircraft has Large=yes to provide a larger selection handle. 
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;
;----------------------------------------------------------------

@HACK 0x00040409D,0x004040A2,_AircraftTypeClass__Max_Pips_Show_Actual_Max_Pips
    TechnoTypeClass.MaxAmmo.Get(eax,edx) 
    test byte[eax+AircraftTypeClass.Offset.IsGigundo],1<<(AircraftTypeClass.Bit.IsGigundo-1)
    mov  eax,5
    jz   .Limit5
.LimitLarge:
    mov  eax,15
.Limit5:
    cmp  eax,edx
    jle  .UseLimit
    mov  eax,edx
.UseLimit:
    jmp  0x004040A2
@ENDHACK
