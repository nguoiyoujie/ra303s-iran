;----------------------------------------------------------------
; src/fixes/refresh_cells_crash_fix.asm
;
; Fixes crash within DisplayClass::Refresh_Cells in case more than 36 cells are to be refreshed. The Remastered already contains this fix.
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

[section .data] 
Temp.RefreshCells_Tracker db 0


@HACK 0x004B0655,0x004B065B,_DisplayClass__Refresh_Cells__Bounds_Check_Fix
    mov   byte[Temp.RefreshCells_Tracker],0x24 ; short tlist[36]
    lea   ebx,[ebp-0x58]  
    mov   dword[ebp-0x10],eax
    jmp   0x004B065B
@ENDHACK


@HACK 0x004B065B,0x004B0663,_DisplayClass__Refresh_Cells__Bounds_Check_Fix_2
    push  eax
    mov   al,byte[Temp.RefreshCells_Tracker]
    test  al,al
    dec   al
    mov   byte[Temp.RefreshCells_Tracker],al
    pop   eax
    jz    0x004B03AA
    movzx eax,word[ebx]  
    cmp   eax,0x7FFF
    jmp   0x004B0663
@ENDHACK

