;----------------------------------------------------------------
; src/features/bullet_custom_trailanims.asm
;
; Allow customization of animated trails emiting from Animate=yes bullets.
;
; This function is enabled by setting [<BulletType>] TrailAnim=<AnimType>
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

cextern AnimClass.NEW_SIZE
cextern AnimClass__new

@HACK 0x004611C8,0x004611D0,_BulletClass__AI_CustomTrailAnims
    mov  byte cl,[eax+BulletTypeClass.Offset.TrailAnim]
    test cl,cl
    jz   .Original
    cmp  cl,0xFF
    je   .Original
    mov  eax,AnimClass.NEW_SIZE
    call AnimClass__new
    test eax,eax
    jz   0x00461212
    push 1
    movzx edx,cl
    mov  ecx,1
    mov  ebx,[ebp-0x24]
    jmp  0x0046120D
.Original:
    add  eax,0x25
    call _strcmpi
    jmp  0x004611D0
@ENDHACK