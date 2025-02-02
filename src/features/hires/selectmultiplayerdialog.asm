;----------------------------------------------------------------
; src/features/hires/selectmultiplayerdialog.asm
;
; Apply hi-res features to multiplayer selection menu, which is accessible from the main menu
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

cextern str_Internet

; select multiplayer dialog
@HACK 0x0050347C,0x00503486,_Select__MPLayer_Game__Dialog_Adjustment
    mov  ecx,0xA6
    add  ecx,[Hires.DeltaTop]
    mov  esi,0x82
    add  esi,[Hires.DeltaLeft]
    jmp  0x00503486
@ENDHACK


@HACK 0x005034F4,0x005034F9,_Select__MPLayer_Game__ModemSerial_Button_Adjustment_Top
    add  dword[Hires.DeltaTop],0xD0
    push dword[Hires.DeltaTop]
    sub  dword[Hires.DeltaTop],0xD0
    jmp  0x005034F9
@ENDHACK


@HACK 0x00503501,0x00503506,_Select__MPLayer_Game__ModemSerial_Button_Adjustment_Left
    add  dword[Hires.DeltaLeft],0xF0
    push dword[Hires.DeltaLeft]
    sub  dword[Hires.DeltaLeft],0xF0
    jmp  0x00503506
@ENDHACK


@HACK 0x0050351C,0x00503530,_Select__MPLayer_Game__Skirmish_Button_Adjustment
    mov  ecx,0xE6
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ecx,0xF0
    add  ecx,[Hires.DeltaLeft]
    push ecx
    mov  ecx,0x116
    mov  ebx,0x1E2
    jmp  0x00503530
@ENDHACK


@HACK 0x00503549,0x0050355D,_Select__MPLayer_Game__Network_Button_Adjustment
    mov  ecx,0xFC
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ecx,0xF0
    add  ecx,[Hires.DeltaLeft]
    push ecx
    mov  ecx,0x116
    mov  ebx,0xBC
    jmp  0x0050355D
@ENDHACK

   
@HACK 0x00503576,0x0050358A,_Select__MPLayer_Game__Internet_Button_Adjustment
    mov  ecx,0x112
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ecx,0xF0
    add  ecx,[Hires.DeltaLeft]
    push ecx
    mov  ecx,0x116
    mov  ebx,str_Internet
    jmp  0x0050358A
@ENDHACK


@HACK 0x005034C8,0x005034CD,_Select__MPLayer_Game__Cancel_Button_Adjustment_Top
    mov  esi,0x132
    add  esi,[Hires.DeltaTop]
    jmp  0x005034CD
@ENDHACK


@HACK 0x0050349C,0x005034A1,_Select__MPLayer_Game__Cancel_Button_Adjustment_Left
    mov  ebx,0x104
    add  ebx,[Hires.DeltaLeft]
    jmp  0x005034A1
@ENDHACK