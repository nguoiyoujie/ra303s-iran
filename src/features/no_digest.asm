;----------------------------------------------------------------
; src/features/no_digest.asm
;
; Intercept CCINIClass::Load so that the [Digest] value is never checked
; This is done so maps can be easily created or modified without needing to generate additional checks
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

@HACK 0x00462FF7,0x00462FFC,_CCINIClass__Load__No_Digest
    mov  eax,1
    jmp  0x00462FFC
@ENDHACK