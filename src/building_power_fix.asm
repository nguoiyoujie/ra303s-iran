; Buildings that originally consume power have drain set, but when these buildings are updated with new INI values with positive power values, the drain are not reset, so they continue to drain power
; This fix clears the drain if power is positive

@HOOK 0x00453FDC _BuildingTypeClass_Read_Ini_ResetDrain

_BuildingTypeClass_Read_Ini_ResetDrain:
    jge  .PositivePower
    mov  dword [esi + 0x1aa],0
    neg  eax
    mov  dword [esi + 0x1ae],eax
    jmp  0x00453FF6
.PositivePower:
    mov  dword [esi + 0x1ae],0
    jmp  0x00453FF6
