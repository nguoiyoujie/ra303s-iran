;----------------------------------------------------------------
; src/features/hires/loadgamedialog.asm
;
; Apply hi-res features to LoadOptionsClass, which is used when selecting a game to load or delete 
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

; load game dialog
@HACK 0x004FCECF,0x004FCED9,_LoadOptionsClass__Dialog_Adjustment
    mov  ecx,0x46
    add  ecx,[Hires.DeltaLeft]
    mov  esi,0x2C
    add  esi,[Hires.DeltaTop]
    mov  edi,0x140
    add  edi,[Hires.DeltaLeft]; _LoadOptionsClass__Descript_Adjustment_Left
    jmp  0x004FCEDE
@ENDHACK


@HACK 0x004FCEFA,0x004FCF0E,_LoadOptionsClass__List_Adjustment
    mov  ebx,0x66
    add  ebx,[Hires.DeltaLeft]
    mov  ecx,0x5E
    add  ecx,[Hires.DeltaTop]
    mov  eax,0x116 ; _LoadOptionsClass__Descript_Adjustment_Top
    add  eax,[Hires.DeltaTop]
    mov  edi,0x14E ; _LoadOptionsClass__Button_Adjustment_Left_2
    add  edi,[Hires.DeltaLeft]
    jmp  0x004FCF0E
@ENDHACK


@HACK 0x004FCF30,0x004FCF3A,_LoadOptionsClass__Button_Adjustment
    mov  ebx,0xE2
    add  ebx,[Hires.DeltaLeft]
    mov  ecx,0x13C
    add  ecx,[Hires.DeltaTop]
    jmp  0x004FCF3A
@ENDHACK