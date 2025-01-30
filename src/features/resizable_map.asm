;----------------------------------------------------------------
; src/features/resizeable_map.asm
;
; There are special handling on objects that spawn from outside the map.
; Buildings and smudges, in particular, are not expected to move into the map, 
; so the game conserved memory by preventing their creation off-map.
; 
; For resizable maps to work, buildings and smudges are allowed to be created outside the map.
; 
; This function is enabled by default and is not controllable.
; 
; Compatibility Warning: Note that this is a shift in behavior that can break maps that had mistakenly placed 
; buildings outside the map.
;
;----------------------------------------------------------------

; allow building placement outside of play area, only during scenario setup
@LJMP 0x0045BA09, _BuildingClass_Can_Enter_Cell_OK_if_ScenarioInit

; allow smudges to be marked outside of the play area
@LJMP 0x0054FDBC, _SmudgeClass_Replace_In_Radar_Check

_BuildingClass_Can_Enter_Cell_OK_if_ScenarioInit:
    cmp  dword[Globals___ScenarioInit],0
    jg   0x0045B9F2 ; MOVE_OK
    jmp  0x0045BA12

_SmudgeClass_Replace_In_Radar_Check:
    ; Instead of using Map::In_Radar, check the cell against the map cell limit (16384)
    cmp  edx,0x4000
	jge  0x0054FF31
    jmp  0x0054FDC9

