; used to allow building placement outside of play area
@HOOK 0x0045BA09 _BuildingClass_Can_Enter_Cell_OK_if_ScenarioInit

; used to allow smudges to be marked outside of the play area
@HOOK 0x0054FDBC _SmudgeClass_Replace_In_Radar_Check

_BuildingClass_Can_Enter_Cell_OK_if_ScenarioInit:
    cmp  dword [0x00669914],0  ; ScenarioInit
    jg   0x0045B9F2 ; MOVE_OK
    jmp  0x0045BA12

_SmudgeClass_Replace_In_Radar_Check:
    ; Instead of using Map::In_Radar, check the cell against the map cell limit (16384)
    cmp  edx, 0x4000
	jge  0x0054FF31
    jmp  0x0054FDC9

