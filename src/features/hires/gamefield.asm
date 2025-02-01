;----------------------------------------------------------------
; src/features/hires/gamefield.asm
;
; Apply hi-res features to in-game field, such as cell grid sizes and the in-game text
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------


@HACK 0x0054DB14,0x0054DB19,_Set_Game_Area_Width
    mov ecx,[Hires.WidthTiles]
    jmp  0x0054DB19
@ENDHACK


@HACK 0x0049F600,0x0049F605,_CellClass_Draw_It_Dont_Draw_Past_Map_Border
    push eax
    push edx
    mov  ax,[eax]
    movsx edx,ax
    mov  eax,Globals___Map
    call MapClass__In_Radar
    test eax,eax
    jz   .Out
    pop  edx
    pop  eax
    mov  [ebp-0xC],eax
    mov  edi,edx
    jmp  0x0049F605
.Out:
    pop  edx
    pop  eax
    jmp  0x0049FC47
@ENDHACK


@HACK 0x0053A376,0x0053A37B,_Start_Scenario_Set_Flag_To_Redraw_Screen
    mov  ecx,1
    lea  ebx,[Hires.CellSize]
    mov  edx,1h
    mov  eax,Globals___Map
    call 0x004D2B6C ; HelpClass::Scroll_Map(DirType,int &,int)
    mov  edx,1
    mov  eax,Globals___Map
    call GScreenClass__Flag_To_Redraw
    mov  eax,0x00668188 ; GameOptionsClass Options
    jmp  0x0053A37B
@ENDHACK


; Mission Failed!
@HACK 0x0053B32D,0x0053B33A,_Do_Lose__Text_Adjustment
    mov  ebx,0xB4
    add  ebx,[Hires.DeltaTop]
    push ebx
    push edx
    push 0x10  
    jmp  0x0053B33A
@ENDHACK


; Mission Accomplished!
@HACK 0x0053AD3E,0x0053AD4D,_Do_Win__Text_Adjustment
    mov  edx,0xB4
    add  edx,[Hires.DeltaTop]
    push edx
    push ebx
    mov  ebx,edx
    push 0xF
    xor  edx,edx
    jmp  0x0053AD4D
@ENDHACK


; This Game is a Draw!
@HACK 0x0053B61D,0x0053B62D,_Do_Draw__Text_Adjustment
    mov  ebx,0xB4
    add  ebx,[Hires.DeltaTop]
    push ebx
    push edx
    Extract_Conquer_Eng_String 118
    push eax
    ;push 0x0060707C ; str "The Game is a Draw"
    jmp  0x0053B62D
@ENDHACK

