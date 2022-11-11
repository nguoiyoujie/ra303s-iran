; When a unit moves to remove shroud, the game filters out the inner range (sight - 2) to reduce the number of cells to process.
; This assumes that the cells are already revealed.
; With gap generators and shroud regrowth, this is often not the case
; Therefore, we abandon the filter. Since the sight range is limited to ~10, the performance cost is peanuts compared to the rest of the code.

@HOOK 0x004FE495 _MapClass_Sight_From_NoIncremental

_MapClass_Sight_From_NoIncremental:
    jmp  0x004FE4B5

