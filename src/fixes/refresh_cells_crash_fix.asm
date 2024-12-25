;----------------------------------------------------------------
; src/fixes/refresh_cells_crash_fix.asm
;
; Fixes crash within DisplayClass::Refresh_Cells in case more than 36 cells are to be refreshed. The Remastered already contains this fix.
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------
@HOOK 0x004B0655 _DisplayClass__Refresh_Cells__Bounds_Check_Fix
@HOOK 0x004B065B _DisplayClass__Refresh_Cells__Bounds_Check_Fix_2
@CLEAR 0x004B065A 0x90 0x004B065B

RefreshCells_Tracker db 0

_DisplayClass__Refresh_Cells__Bounds_Check_Fix:
    mov   byte [RefreshCells_Tracker],24h ; short tlist[36]
    lea   ebx,[ebp-58h]  
    mov   dword [ebp-10h],eax
    jmp   0x004B065B

_DisplayClass__Refresh_Cells__Bounds_Check_Fix_2:
    push  eax
    mov   al,byte [RefreshCells_Tracker]
    test  al,al
    dec   al
    mov   byte [RefreshCells_Tracker],al
    pop   eax
    jz    0x004B03AA

    movzx eax,word[ebx]  
    cmp   eax,7FFFh
    jmp   0x004B0663
