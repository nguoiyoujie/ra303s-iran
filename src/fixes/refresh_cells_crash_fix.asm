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


@HACK 0x004B062E,0x004B0633,_DisplayClass__Refresh_Cells__ExpandStack
    sub  esp,0x24C ; was 0x4C
    mov  esi,eax
    jmp  0x004B0633
@ENDHACK


@HACK 0x004B0645,0x004B065B,_DisplayClass__Refresh_Cells__Bounds_Check_Fix
    lea  ebx,[ebp-0x258] ; was 0x58
    mov  edx,0x124 ; was 0x24
    call List_Copy
    lea  eax,[esi+0x1C]
    mov  byte[Temp.RefreshCells_Tracker],0x124 ; short tlist[0x100+36]
    lea  ebx,[ebp-0x258] ; was 0x58
    mov  dword[ebp-0x10],eax
    jmp  0x004B065B
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


@HACK 0x004ABF4C,0x004ABF79,_List_Copy__Reimplement
    push ebp
    mov  ebp,esp
    push ecx
    test ebx,ebx
    jz   .Ret
    test eax,eax
    jz   .Ret
.Cycle:
    test edx,edx
    jle  .End
    mov  word cx,[eax]
    mov  word[ebx],cx
    cmp  word cx,0x7FFF
    je   .Ret
    add  ebx,2
    add  eax,2
    dec  edx
    jmp  .Cycle
.End:
    mov  word[ebx],0x7FFF
.Ret:
    lea  esp,[ebp-4]
    pop  ecx
    pop  ebp
    ret
@ENDHACK
