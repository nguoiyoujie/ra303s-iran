;----------------------------------------------------------------
; src/fixes/building_power_clear_drain.asm
;
; Buildings that originally consume power have drain set, but when these buildings are updated with new INI values with positive power values, the drain are not reset, so they continue to drain power
; This fix resolves the bug by clearing the drain if power is positive
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

@LJMP 0x00453FDC, _BuildingTypeClass_Read_Ini_ResetDrain

_BuildingTypeClass_Read_Ini_ResetDrain:
    jge  .PositivePower
    BuildingTypeClass.Power.Set(esi,0)
    neg  eax
    BuildingTypeClass.Drain.Set(esi,eax)
    jmp  0x00453FF6
.PositivePower:
    BuildingTypeClass.Drain.Set(esi,0)
    jmp  0x00453FF6
