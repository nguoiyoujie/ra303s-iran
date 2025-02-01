;----------------------------------------------------------------
; src/features/hires/surrenderdialog.asm
;
; Apply hi-res features to resign dialog, which is accessible during a multiplayer game
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

; surrender dialog
@HACK 0x00503F04,0x00503F11,_Surrender_Dialog__Dialog_Adjustment
    mov  eax,0x50
    add  eax,[Hires.DeltaLeft]
    mov  dword[ebp-0x20],edx
    mov  edx,0x89
    add  edx,[Hires.DeltaTop]
    jmp  0x00503F11
@ENDHACK


@HACK 0x00503E3B,0x00503E4F,_Surrender_Dialog__OK_Button_Adjustment
    mov  ecx,0xE1
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ebx,0xDC
    add  ebx,[Hires.DeltaLeft]
    push ebx
    mov  ecx,0x116
    mov  ebx,0x17
    jmp  0x00503E4F
@ENDHACK


@HACK 0x00503E65,0x00503E79,_Surrender_Dialog__Cancel_Button_Adjustment
    mov  ecx,0xE1
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ebx,0x14A
    add  ebx,[Hires.DeltaLeft]
    push ebx
    mov  ecx,0x116
    mov  ebx,0x13
    jmp  0x00503E79
@ENDHACK


@HACK 0x00503F39,0x00503F43,_Surrender_Dialog__Caption_Adjustment
    mov  ebx,0xB1
    add  ebx,[Hires.DeltaTop]
    push ebx
    mov  ebx,0x140
    add  ebx,[Hires.DeltaLeft]
    push ebx
    jmp  0x00503F43
@ENDHACK