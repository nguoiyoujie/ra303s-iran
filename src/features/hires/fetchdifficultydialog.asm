;----------------------------------------------------------------
; src/features/hires/fetchdifficultydialog.asm
;
; Apply hi-res features to the difficulty selection dialog, which is accessible after selecting a mission to play
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

; select difficulty dialog
@HACK 0x005517CA,0x005517DE,_Fetch_Difficulty__OK_Button_Adjustment
    mov  ecx,0xF4
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ecx,0x116
    mov  ebx,0x1D6
    add  ebx,[Hires.DeltaLeft]
    push ebx
    mov  ebx,0x17
    jmp  0x005517DE
@ENDHACK


@HACK 0x00551889,0x00551893,_Fetch_Difficulty__Dialog_Adjustment
    mov  edx,0x78
    add  edx,[Hires.DeltaTop]
    mov  eax,0x46
    add  eax,[Hires.DeltaLeft]
    jmp  0x00551893
@ENDHACK


@HACK 0x005517EF,0x005517F9,_Fetch_Difficulty__Slider_Adjustment
    mov  ecx,0xDE
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0x6E
    add  ebx,[Hires.DeltaLeft]
    jmp  0x005517F9
@ENDHACK