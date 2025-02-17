;----------------------------------------------------------------
; src/features/warhead_anim.asm
;
; Allows configuration of warhead explosion animations.
; 
; This function is enabled by providing [<Warhead>] ExplosionAnim=. This overrides the explosion used by Explosion=
; Does nothing if there is no attacking source.
;
; No compatibility issues is expected.
;
;----------------------------------------------------------------

@HACK 0x004A37BC,0x004A37C9,_Combat_Anim_ExplosionSetCheck
    mov  edx,eax
    mov  byte al,[edx+WarheadTypeClass.Offset.ExplosionAnim]
    test al,al
    jnz  0x004A37AB
    cmp  al,0xFF
    je   0x004A37AB
    mov  byte al,[edx+WarheadTypeClass.Offset.ExplosionSet] ;  use new offset
    movzx eax,al
    dec  eax
    cmp  eax,0x5
    ja   0x004A35EE
    jmp  0x004A37C9
@ENDHACK
