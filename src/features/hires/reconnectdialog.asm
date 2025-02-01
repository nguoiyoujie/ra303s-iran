;----------------------------------------------------------------
; src/features/hires/reconnectdialog.asm
;
; Apply hi-res features to the dialog message box when attempting to reconnect to a server
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------


@HACK 0x0050E7F1,0x0050E7F9,_hires_Reconnect_Dialog_Fill_Rect
    mov  edx,[ebp-0x30]
    add  edx,[Hires.DeltaTop]
    push edx
    mov  ebx,[ebp-0x28]
    add  ebx,[Hires.DeltaLeft]
    push ebx
    jmp  0x0050E7F9
@ENDHACK


@HACK 0x0050E7E9,0x0050E7F1,_hires_Reconnect_Dialog_Fill_Rect2
    mov  ecx,[ebp-0x24]  ; Top
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  eax,[ebp-0x34]  ; Left
    add  eax,[Hires.DeltaLeft]
    push eax
    jmp  0x0050E7F1
@ENDHACK


@HACK 0x0050E4FD,0x0050E508,_hires_Reconnect_Dialog_Dialog_Box
    mov  edx,[0x006851A0] ; top
    add  edx,[Hires.DeltaTop]
    mov  eax,[0x0068519C] ; left
    add  eax,[Hires.DeltaLeft]
    jmp  0x0050E508
@ENDHACK


@HACK 0x0050E5D2,0x0050E5D8,_hires_Reconnect_Dialog_Text_Print1
    add  eax,[Hires.DeltaTop]
    push eax
    mov  eax,0x140
    add  eax,[Hires.DeltaLeft]
    push eax
    jmp  0x0050E5D8
@ENDHACK


@HACK 0x0050E554,0x0050E55A,_hires_Reconnect_Dialog_Text_Print2
    add  eax,[Hires.DeltaTop]
    push eax
    mov  eax,0x140
    add  eax,[Hires.DeltaLeft]
    push eax
    jmp  0x0050E55A
@ENDHACK


@HACK 0x0050E526,0x0050E52C,_hires_Reconnect_Dialog_Text_Print3
    add  eax,[Hires.DeltaTop]
    push eax
    mov  eax,0x140
    add  eax,[Hires.DeltaLeft]
    push eax
    jmp  0x0050E52C
@ENDHACK


@HACK 0x0050E5A0,0x0050E5A6,_hires_Reconnect_Dialog_Text_Print4
    add  eax,[Hires.DeltaTop]
    push eax
    mov  eax,0x140
    add  eax,[Hires.DeltaLeft]
    push eax
    jmp  0x0050E5A6
@ENDHACK


@HACK 0x0050E845,0x0050E84B,_hires_Reconnect_Dialog_Text_Print5
    add  eax,[Hires.DeltaTop]
    push eax
    mov  eax,0x140
    add  eax,[Hires.DeltaLeft]
    push eax
    jmp  0x0050E84B
@ENDHACK