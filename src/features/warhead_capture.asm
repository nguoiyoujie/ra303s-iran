;----------------------------------------------------------------
; src/features/warhead_capture.asm
;
; Provides a simple emulation of 'mind-control', the act of turning enemy units to your side by means of a weapon/warhead.
; 
; This function is enabled by providing [<Warhead>] IsCapture=yes. When inflicted against an enemy, the unit will be 'captured' by the attacking source.
; Does nothing if there is no attacking source.
;
; No compatibility issues is expected.
;
;----------------------------------------------------------------

cextern Capture.OverrideIsCapturable

@HACK 0x0051E0D9,0x0051E0E3,_ObjectClass__Take_Damage__CaptureCheck
    ; ebx is the warhead
    WarheadTypeClass.FromIndex(ecx,edx)
    test byte[edx+WarheadTypeClass.Offset.IsCapture],1<<(WarheadTypeClass.Bit.IsCapture-1)
    jz   .Ret
    mov  edx,[ebp+0x8] ; source
    test edx,edx
    jz   .Ret ; no source, skip
    mov  byte al,[edx+TechnoClass.Offset.House]
    movzx eax,al
    HouseClass.FromIndex(eax,edx)
    push edi
    mov  edi,[esi+0x11]
    mov  eax,esi
    mov  byte[Capture.OverrideIsCapturable],1
    call dword[edi+0x1D4] ; TechnoClass::Captured
    mov  byte[Capture.OverrideIsCapturable],0
    pop  edi
.Ret:
    cmp  dword[ebp+0xC],0
    jmp  0x0051E0E3
@ENDHACK


@HACK 0x0045AE0E,0x0045AE14,_BuildingClass__Captured__OverrideIsCapturable
    jnz  0x0045AE14
    test byte[Capture.OverrideIsCapturable],1
    jz   0x0045B791
    jmp  0x0045AE14
@ENDHACK
