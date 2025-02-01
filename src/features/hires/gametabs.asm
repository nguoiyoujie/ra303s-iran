;----------------------------------------------------------------
; src/features/hires/gametabs.asm
;
; Apply hi-res features to TabClass, which is presented at the top row of the game screen during a game
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

; Top bar Tabs
@HACK 0x00553757,0x0055375C,_TabClass__Draw_Credits_Tab_Credits_Width_Adjustment
    mov  ebx,0x1E0
    add  ebx,[Hires.DeltaWidth]
    jmp  0x0055375C
@ENDHACK


@HACK 0x00553839,0x0055383E,_TabClass__Draw_Credits_Tab_Timer_Width_Adjustment
    mov  ebx,0x140
    add  ebx,[Hires.DeltaWidth]
    jmp  0x0055383E
@ENDHACK


@HACK 0x004ACEC5,0x004ACECA,_CreditClass__Graphic_Logic_Caption_Width_Adjustment1
    add  dword[Hires.DeltaWidth],0x190
    push dword[Hires.DeltaWidth]
    sub  dword[Hires.DeltaWidth],0x190
    jmp  0x004ACECA
@ENDHACK


@HACK 0x004ACEE4,0x004ACEE9,_CreditClass__Graphic_Logic_Caption_Width_Adjustment2
    add  dword[Hires.DeltaWidth],0x190
    push dword[Hires.DeltaWidth]
    sub  dword[Hires.DeltaWidth],0x190
    jmp  0x004ACEE9
@ENDHACK