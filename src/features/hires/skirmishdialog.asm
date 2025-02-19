;----------------------------------------------------------------
; src/features/hires/skirmishdialog.asm
;
; Apply hi-res features to skirmish dialog, which is accessible from the multiplayer selection menu
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

; skirmish dialog
@HACK 0x005128D4,0x005128E0,_hires_SkirmishMenu
    mov  ecx,[Hires.DeltaLeft]
    mov  dword[ebp-0x1D4],ecx
    mov  ecx,[Hires.DeltaTop]
    mov  dword[ebp-0x1D0],ecx
    xor  ecx,ecx
    jmp  0x005128E0
@ENDHACK


@HACK 0x00512901,0x0051290B,_Com_Scenario_Dialog__Dialog_Adjustment1
    mov  edi,0x5A
    add  edi,[Hires.DeltaLeft]
    mov  eax,0x1D
    add  eax,[Hires.DeltaTop]
    jmp  0x0051290B
@ENDHACK


@HACK 0x00512939,0x00512948,_Com_Scenario_Dialog__Dialog_Adjustment2
    mov  edi,0x104
    add  edi,[Hires.DeltaLeft]
    mov  esi,0x12
    mov  eax,0x1A4
    add  eax,[Hires.DeltaLeft]
    jmp  0x00512948
@ENDHACK


@HACK 0x0051296A,0x0051296F,_Com_Scenario_Dialog__Dialog_Adjustment3
    mov  edi,0x1E
    add  edi,[Hires.DeltaLeft]
    jmp  0x0051296F
@ENDHACK


@HACK 0x00512A21,0x00512A27,_Com_Scenario_Dialog__List_Adjustment ; not for hires, but to make space for more color choices
    sub  edx,0x50 ; move left 80 pixels
    mov  [ebp-0x17C],edx
    jmp  0x00512A27
@ENDHACK
