;----------------------------------------------------------------
; src/fixes/ore_truck_ore_patch_minimap_cursor_bug_fix.asm
;
; When selecting a Ore patch in the radar minimap with an Ore Truck selecting the cursor would turn into a "Can't move there" cursor instead of an "Attack" cursor. This fixes it.
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------
@HACK 0x00531207,0x0053120D,_RadarClass__RTacticalClass__Action_Ore_Truck_Ore_Patch_Minimap_Cursor
    mov  ah,[ebp-0x10]
    ; Add check for 'Harvest' ActionType
    cmp  ah,6
    jz   0x00531235
    cmp  ah,5
    jmp  0x00531235
@ENDHACK
