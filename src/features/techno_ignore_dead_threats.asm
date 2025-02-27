;----------------------------------------------------------------
; src/features/techno_ignore_dead_threats.asm
;
; Technos are not allowed to assign dead technos as targets, but dead targets are still counted during target scan.
; This led to stalls, especially with AI or AI-assisted commands (Area Guard)
; 
; This function is enabled by default and is not configurable.
; No compatibility issues is expected.
;
;----------------------------------------------------------------

@HACK 0x00563572,0x00563577,_TechnoClass__Evaluate_Cell_IgnoreDeadTechnos
    cmp  word[ebx+ObjectClass.Offset.Strength],0
    je   0x00563579
    jmp  0x0056357B
@ENDHACK


; Evaluate_Object hack performed in techno_static_disguise.asm
