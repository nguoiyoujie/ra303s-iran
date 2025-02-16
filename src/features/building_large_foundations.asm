;----------------------------------------------------------------
; src/features/building_large_foundations.asm
;
; WW's coding limited occupy and overlap cells to 32 each. Sync them to our larger size of 640 each. 
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

cextern List_Copy 

[section .data] 
Temp.OccupyOverlapArray times 0x281 dw 0
Temp.DisplayArray times 0x281 dw 0

; MapClass__Place_Down , add 0x500
@HACK 0x004FE91E,0x004FE924,MapClass__Place_Down_ExpandStack
    sub esp,0x548
    mov [ebp-0x14],eax
    jmp 0x004FE924
@ENDHACK

@HACK 0x004FE963,0x004FE979,MapClass__Place_Down_ExtendCopyListArray1
    lea  ebx,[ebp-0x554]
    mov  edx,0x2A0
    mov  edi,[ebp-0x14]
    call List_Copy
    add  edi,0x1C
    lea  ebx,[ebp-0x554]
    jmp  0x004FE979
@ENDHACK

@HACK 0x004FE9CE,0x004FE9E4,MapClass__Place_Down_ExtendCopyListArray2
    lea  ebx,[ebp-0x554]
    mov  edx,0x2A0
    mov  edi,[ebp-0x14]
    call List_Copy
    add  edi,0x1C
    lea  ebx,[ebp-0x554]
    jmp  0x004FE9E4
@ENDHACK

; MapClass__Pick_Up , add 0x500
@HACK 0x004FEA2E,0x004FEA34,MapClass__Pick_Up_ExpandStack
    sub esp,0x548
    mov [ebp-0x14],eax
    jmp 0x004FEA34
@ENDHACK

@HACK 0x004FEA73,0x004FEA89,MapClass__Pick_Up_ExtendCopyListArray1
    lea  ebx,[ebp-0x554]
    mov  edx,0x2A0
    mov  edi,[ebp-0x14]
    call List_Copy
    add  edi,0x1C
    lea  ebx,[ebp-0x554]
    jmp  0x004FEA89
@ENDHACK

@HACK 0x004FEADE,0x004FEAF4,MapClass__Pick_Up_ExtendCopyListArray2
    lea  ebx,[ebp-0x554]
    mov  edx,0x2A0
    mov  edi,[ebp-0x14]
    call List_Copy
    add  edi,0x1C
    lea  ebx,[ebp-0x554]
    jmp  0x004FEAF4
@ENDHACK

; BuildingTypeClass__Occupy_List
@SET 0x00453AC7,{mov ebx,Temp.OccupyOverlapArray} 
@SET 0x00453B16,{mov eax,Temp.OccupyOverlapArray} 

; DisplayClass__Set_Cursor_Shape
@SET 0x004AF74A,{mov ecx,0x281 * 2}
@SET 0x004AF74F,{mov edi,Temp.DisplayArray} 

; MapClass__Overlap_Down , add 0x500
@HACK 0x004FEB3E,0x004FEB43,MapClass__Overlap_Down_ExpandStack
    sub esp,0x544
    mov edi,eax
    jmp 0x004FEB43
@ENDHACK

@HACK 0x004FEB82,0x004FEB95,MapClass__Overlap_Down_ExtendCopyListArray
    lea  ebx,[ebp-0x550]
    mov  edx,0x2A0
    add  edi,0x1C
    call List_Copy
    lea  ebx,[ebp-0x550]
    jmp  0x004FEB95
@ENDHACK

; MapClass__Overlap_Up , add 0x500
@HACK 0x004FEBDE,0x004FEBE3,MapClass__Overlap_Up_ExpandStack
    sub esp,0x544
    mov edi,eax
    jmp 0x004FEBE3
@ENDHACK

@HACK 0x004FEC22,0x004FEC35,MapClass__Overlap_Up_ExtendCopyListArray
    lea  ebx,[ebp-0x550]
    mov  edx,0x2A0
    add  edi,0x1C
    call List_Copy
    lea  ebx,[ebp-0x550]
    jmp  0x004FEC35
@ENDHACK

