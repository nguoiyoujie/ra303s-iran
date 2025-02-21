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
cextern Modify_Damage

@HACK 0x0051E103,0x0051E10D,_ObjectClass__Take_Damage__CaptureCheck
    ; edx is the warhead
    push edx
    call Modify_Damage
    pop  edx
    ; eax is the damage amount
    mov  [edi],eax
    cmp  eax,0
    jle  .Ret ; do nothing if the damage doesn't do anything
    mov  byte[esi+TechnoClass.Offset.StaticDisguiseShimmer],0
    call CaptureCheck
    cmp  dword[edi],0
    jle  .Ret ; do nothing more if already captured
    call IronCurtainCheck
.Ret:
    mov  edx,[ebp+0x8]
    jmp  0x0051E10D
@ENDHACK


@HACK 0x0045AE0E,0x0045AE14,_BuildingClass__Captured__OverrideIsCapturable
    jnz  0x0045AE14
    test byte[Capture.OverrideIsCapturable],1
    jz   0x0045B791
    jmp  0x0045AE14
@ENDHACK


[section .text]
CaptureCheck:
    ; edx=warhead, esi=techno, ebp+0x8=source
    WarheadTypeClass.FromIndex(edx,ebx)
    test byte[ebx+WarheadTypeClass.Offset.IsCapture],1<<(WarheadTypeClass.Bit.IsCapture-1)
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
    ; if it is a capture, deal no damage    
    mov  dword[edi],0
    ; wipe the target's memory: NavCom and TarCom
    test al,al
    jz   .Ret
    mov  dword[esi+TechnoClass.Offset.TarCom],-1
    mov  dword[esi+FootClass.Offset.NavCom],-1
.Ret:
    ret

