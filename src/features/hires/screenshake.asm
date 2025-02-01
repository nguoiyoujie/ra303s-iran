;----------------------------------------------------------------
; src/features/hires/screenshake.asm
;
; Apply hi-res features to the screen shake
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

; screen shake
@HACK 0x004AB8A3,0x004AB8A8,_Shake_The_Screen__Adjustment1
    mov  ecx,0x280
    add  ecx,[Hires.DeltaWidth]
    jmp  0x004AB8A8
@ENDHACK


@HACK 0x004AB8C8,0x004AB8CD,_Shake_The_Screen__Adjustment2
    mov  eax,0x280
    add  eax,[Hires.DeltaWidth]
    push eax
    jmp  0x004AB8CD
@ENDHACK


@HACK 0x004ABBFA,0x004ABBFF,_Shake_The_Screen__Adjustment3
    mov  eax,0x280
    add  eax,[Hires.DeltaWidth]
    jmp  0x004ABBFF
@ENDHACK


@HACK 0x004ABC1C,0x004ABC21,_Shake_The_Screen__Adjustment4
    mov  ecx,0x280
    add  ecx,[Hires.DeltaWidth]
    push ecx
    jmp  0x004ABC21
@ENDHACK


@HACK 0x004ABBDF,0x004ABBE4,_Shake_The_Screen_Height2
    mov  eax,[Globals___ScreenHeight]
    sub  eax,2
    jmp  0x004ABBE4
@ENDHACK


@HACK 0x004AB8A8,0x004AB8AD,_Shake_The_Screen_Height1
    mov  eax,[Globals___ScreenHeight]
    sub  eax,2
    jmp  0x004AB8AD
@ENDHACK

