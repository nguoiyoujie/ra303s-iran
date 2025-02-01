;----------------------------------------------------------------
; src/features/hires/remotefiledialog.asm
;
; Apply hi-res features to the remote file dialog for file transfer
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------


@HACK 0x005D1801,0x005D1807,_Receive_Remote_File_Caption
    mov  ebx,0x6E
    add  ebx,[Hires.DeltaTop]
    mov  edx,0x50
    add  edx,[Hires.DeltaLeft]
    xor  eax,eax
    jmp  0x005D1807
@ENDHACK


@HACK 0x005D17F3,0x005D17F9,_Receive_Remote_File_Dialog
    mov  edx,0x6E
    add  edx,[Hires.DeltaTop]
    mov  eax,0x78
    add  eax,[Hires.DeltaLeft]
    jmp  0x005D17F9
@ENDHACK


@HACK 0x005D162E,0x0005D1642,_Receive_Remote_File_Text_Button
    mov  ecx,0xFA
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ebx,0x118
    add  ebx,[Hires.DeltaLeft]
    push ebx
    mov  ecx,0x4116
    mov  ebx,0x13
    jmp  0x0005D1642
@ENDHACK


@HACK 0x005D1663,0x005D166B,_Receive_Remote_File_Gauge_Gadget
    lea  eax,[ebp-0x104]
    mov  ecx,0xC0
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0xDC
    add  ebx,[Hires.DeltaLeft]
    jmp  0x005D166B
@ENDHACK


@HACK 0x005D1827,0x005D182D,_Receive_Remote_File_Text_Print
    mov  ecx,0xA0
    add  ecx,[Hires.DeltaTop]
    mov  edx,0x140
    add  edx,[Hires.DeltaLeft]
    jmp  0x005D182D
@ENDHACK


@HACK 0x005D2182,0x005D2188,_Send_Remote_File_Text_Print
    mov  ecx,0xA0
    add  ecx,[Hires.DeltaTop]
    mov  edx,0x140
    add  edx,[Hires.DeltaLeft]
    jmp  0x005D2188
@ENDHACK


@HACK 0x005D1D25,0x005D1D2A,_Send_Remote_File_Text_Gauge_Gadget
    mov  ecx,0xC0
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0xDC
    add  ebx,[Hires.DeltaLeft]
    jmp  0x005D1D2A
@ENDHACK


@HACK 0x005D1CFC,0x005D1D02,_Send_Remote_File_Text_Button
    mov  ecx,0xFA
    add  ecx,[Hires.DeltaTop]
    mov  esi,0x118
    add  esi,[Hires.DeltaLeft]
    jmp  0x005D1D02
@ENDHACK


@HACK 0x005D215C,0x005D2164,_Send_Remote_File_Caption
    mov  ebx,0x6E
    add  ebx,[Hires.DeltaTop]
    mov  edx,0x50
    add  edx,[Hires.DeltaLeft]
    xor  eax,eax
    jmp  0x005D2164
@ENDHACK


@HACK 0x005D214E,0x005D2154,_Send_Remote_File_Dialog
    mov  edx,0x6E
    add  edx,[Hires.DeltaTop]
    mov  eax,0x50
    add  eax,[Hires.DeltaLeft]
    jmp  0x005D2154
@ENDHACK