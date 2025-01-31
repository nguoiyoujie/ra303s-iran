;----------------------------------------------------------------
; src/fixes/building_limbo_storage_fix.asm
;
; Certain adjustments are made during Grand_Opening(). This includes Drain and (ore) Capacity. When returning to Limbo, the reverse adjustment is made.
; 
; It is possible that buildings may Limbo before Grand_Opening() is completed. This includes destroying the building during the buildup stage, and the AI deleting buildings in its internal state
; 
; Check Building->HasOpeni instead to revert adjustments only if Grand_Opening() had been rendered for this building.
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

;@SJMP 0x00568F32,0x00568F38 ;override spied check on Silos and Refineries
;@LJMP 0x00568F8B,_test_TechnoClass_Draw_Pip ; Draw house Capacity instead
;_test_TechnoClass_Draw_Pip:
;    mov eax,[eax+HouseClass.Offset.Capacity]
;    jmp 0x00568F90

@HACK 0x0045993E,0x00459944,_BuildingClass__Limbo_CalcFix
    ; positive adjustments were applied during capture or Grand_Opening. But it is possible to Limbo an object before that.
    ; Check Building->HasOpening() instead
    test byte[ecx+0xD7],0x40 ; HasOpened
    jz   0x004599E4 ; not opened, skip
    lea  eax,[ecx+0xCD]  
    jmp  0x00459944
@ENDHACK
