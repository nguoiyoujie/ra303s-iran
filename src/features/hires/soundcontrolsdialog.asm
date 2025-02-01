;----------------------------------------------------------------
; src/features/hires/soundcontrolsdialog.asm
;
; Apply hi-res features to SoundControlsClass, which is accessible from the paused game options menu
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

; sound controls dialog
@HACK 0x005502A8,0x005502AD,_SoundControlsClass__Dialog_Adjustment_Top
    mov  ecx,0x36
    add  ecx,[Hires.DeltaTop]
    jmp  0x005502AD
@ENDHACK


@HACK 0x00550303,0x00550308,_SoundControlsClass__SongList_Adjustment_Top
    mov  ecx,0xA2
    add  ecx,[Hires.DeltaTop]
    jmp  0x00550308
@ENDHACK


@HACK 0x005502E3,0x005502E8,_SoundControlsClass__SongList_Adjustment_Left
    mov  ebx,0x3E
    add  ebx,[Hires.DeltaLeft]
    jmp  0x005502E8
@ENDHACK


@HACK 0x00550330,0x00550345,_SoundControlsClass__OK_Button_Adjustment
    mov  eax,0x136
    add  eax,[Hires.DeltaTop]
    push eax
    mov  edx,0x1B6
    add  edx,[Hires.DeltaLeft]
    push edx
    lea  eax,[ebp-0x1EC]
    mov  edx,0x261
    jmp  0x00550345
@ENDHACK


@HACK 0x00550355,0x00550364,_SoundControlsClass__Stop_Button_Adjustment
    mov  ecx,0x136
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  eax,0x005F0A52 ; str: "BTN-ST.SHP"
    mov  ecx,0x3E
    add  ecx,[Hires.DeltaLeft]
    jmp  0x00550364
@ENDHACK


@HACK 0x0055037B,0x0055038A,_SoundControlsClass__Play_Button_Adjustment
    mov  ecx,0x136
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  eax,0x005F0A5D ; str: "BTN-PL.SHP"
    mov  ecx,0x62
    add  ecx,[Hires.DeltaLeft]
    jmp  0x0055038A
@ENDHACK


@HACK 0x005503B4,0x005503C6,_SoundControlsClass__Shuffle_Button_Adjustment
    mov  ecx,0x136
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  edi,0x1C
    add  edi,[Hires.DeltaLeft]
    mov  dword[ebp-0x54],esi
    mov  ecx,0xDE
    add  ecx,[Hires.DeltaLeft]
    push ecx
    jmp  0x005503C6
@ENDHACK


@HACK 0x005503E6,0x005503FA,_SoundControlsClass__Repeat_Button_Adjustment
    mov  ecx,0x136
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ebx,0x164
    add  ebx,[Hires.DeltaLeft]
    push ebx
    mov  ecx,0x116
    mov  ebx,0x99
    jmp  0x005503FA
@ENDHACK


@HACK 0x0055040E,0x00550418,_SoundControlsClass__MusicVol_Slider_Adjustment
    mov  ecx,0x6E
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0x142
    add  ebx,[Hires.DeltaLeft]
    jmp  0x00550418
@ENDHACK


@HACK 0x00550431,0x0055043B,_SoundControlsClass__SoundVol_Slider_Adjustment
    mov  ecx,0x86
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0x142
    add  ebx,[Hires.DeltaLeft]
    jmp  0x0055043B
@ENDHACK


@HACK 0x00550459,0x0055045E,_SoundControlsClass__Gadget_Adjustment_Top
    mov  ebx,0x36
    add  ebx,[Hires.DeltaTop]
    jmp  0x0055045E
@ENDHACK