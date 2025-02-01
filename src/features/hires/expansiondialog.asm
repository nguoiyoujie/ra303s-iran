;----------------------------------------------------------------
; src/features/hires/expansiondialog.asm
;
; Apply hi-res features to the Expansion mission selection screens, which is accessible from the main menu
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

; new missions
@HACK 0x004BE7A4,0x004BE7AE,_Expansion_Dialog__Dialog_Adjustment
    mov  edx,0x22
    add  edx,[Hires.DeltaTop]
    mov  eax,0x28
    add  eax,[Hires.DeltaLeft]
    jmp  0x004BE7AE
@ENDHACK


@HACK 0x004BE3DC,0x004BE3EB,_Expansion_Dialog__List_Adjustment
    mov  ecx,0x40
    add  ecx,[Hires.DeltaTop]
    push 0xF7
    mov  ebx,0x4B
    add  ebx,[Hires.DeltaLeft]
    jmp  0x004BE3EB
@ENDHACK


@HACK 0x004BE7BE,0x004BE7C8,_Expansion_Dialog__Counterstrike_Caption_Adjustment
    mov  ebx,0x22
    add  ebx,[Hires.DeltaTop]
    mov  edx,0x28
    add  edx,[Hires.DeltaLeft]
    jmp  0x004BE7C8
@ENDHACK


@HACK 0x004BE7D4,0x004BE7DE,_Expansion_Dialog__Aftermath_Caption_Adjustment
    mov  ebx,0x22
    add  ebx,[Hires.DeltaTop]
    mov  edx,0x28
    add  edx,[Hires.DeltaLeft]
    jmp  0x004BE7DE
@ENDHACK