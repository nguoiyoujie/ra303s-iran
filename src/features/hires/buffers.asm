;----------------------------------------------------------------
; src/features/hires/buffers.asm
;
; Apply hi-res features to update height and width of internal buffers
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

; Buffers
@HACK 0x00552628,0x0055262D,_InitDDraw__Buffer1_Height_Adjustment
    mov  edx,0x190
    add  edx,[Hires.DeltaHeight]
    push edx
    jmp  0x0055262D
@ENDHACK


@HACK 0x00552637,0x0055263C,_InitDDraw__Buffer1_Width_Adjustment
    mov  ecx,0x280
    add  ecx,[Hires.DeltaWidth]
    push ecx
    jmp  0x0055263C
@ENDHACK


@HACK 0x00552645,0x0055264A,_InitDDraw__Buffer2_Height_Adjustment
    mov  edx,0x190
    add  edx,[Hires.DeltaHeight]
    push edx
    jmp  0x0055264A
@ENDHACK


@HACK 0x00552654,0x00552659,_InitDDraw__Buffer2_Width_Adjustment
    mov  ecx,0x280
    add  ecx,[Hires.DeltaWidth]
    push ecx
    jmp  0x00552659
@ENDHACK