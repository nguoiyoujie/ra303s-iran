
;----------------------------------------------------------------
; src/features/vessel_turret_draw.asm
;
; Revises turret draw logic.
; 
; This function is enabled by default and is not controllable.
; Check that the original three turreted vessels are drawn correctly
; No compatibility issues is expected as this was not an adjustable parameter
; 
; 
;----------------------------------------------------------------

[section .data] 
Temp.VesselTypeObject      dd    0


[section .text] 
@HACK 0x0058A1E4,0x0058A207,_VesselClass__Draw_It_Check_Second_Turret
    ; dx is the vessel type id
    push edi
    push eax
    push ebx
    push edx
    and  edx,0xFF
    VesselTypeClass.FromIndex(edx,edi)
    pop  edx
    mov  dword[Temp.VesselTypeObject],edi
    xor  ecx,ecx
    VesselTypeClass.TurretShape.Get(edi,ecx)
    test ecx,ecx
    jz   .NoTurret
    VesselTypeClass.HasSecondTurret.Get(edi,bl) ; modifies eax
    test bl,bl
    pop  ebx
    pop  eax
    pop  edi
    ; ecx is the shape
    jz  .SingleTurret
.DoubleTurret:
    mov  dl,byte[ebx]
    xor  ebx,ebx
    jmp  0x0058A207
.NoTurret:
    pop  ebx
    pop  eax
    pop  edi
    jmp  0x0058A302
.SingleTurret:
    mov  dl,byte[ebx]
    xor  ebx,ebx
    jmp  0x0058A368
@ENDHACK


@HACK 0x00584A78,0x00584AE2,_VesselClass__Turret_Adjust_Apply_TurretOffset
    push edi
    mov edi,dword[Temp.VesselTypeObject]
    xor ecx,ecx
    VesselTypeClass.TurretOffset.Get(edi,cl)
    ;mov  cl,<offset>
    mov  al,dh
    xor  ebx,ebx
    test cl,0x80 ; negative number check
    jz   .ForwardOffset
.BackwardOffset:
    add  al,0x80
    neg  cl
.ForwardOffset:
    lea  edx,[ebp-0xC] 
    mov  bl,al
    lea  eax,[ebp-0x10]
    call 0x004AC870 ; Normal_Move_Point
    mov  eax,dword[ebp-0x12]
    sar  eax,0x10
    mov  dword[esi],eax
    mov  eax,dword[ebp-0xE]
    sar  eax,0x10
    VesselTypeClass.TurretAdjustY.Get(edi,ecx)
    add  eax,ecx
    pop  edi
    jmp  0x00584B0B
@ENDHACK


@HACK 0x0058B5FC,0x0058B648,_VesselClass__Fire_Data_Apply_Offsets
    ; ebx is the ID
    push edi
    push eax
    VesselTypeClass.FromIndex(ebx,edi)
    ; check IsSecondShot
    mov  al,byte[ecx+0x72]
    mov  dl,byte[ecx+0xBA] ; PrimaryFacing
    test al,0x10 ; IsSecondShot
    jz   .FirstShot
    VesselTypeClass.HasSecondTurret.Get(edi,bl) ; modifies eax
    test bl,bl
    jz   .FirstShot
.SecondShot:
    add  dl,0x80
.FirstShot:
    pop  eax
    and  edx,0xFF
    VesselTypeClass.TurretFireOffset.Get(edi,ebx)
    call 0x004AC798 ; Coord_Move
    TechnoTypeClass.VerticalOffset.Get(edi,ebx)
    xor  edx,edx ; DIR_N
    call 0x004AC798 ; Coord_Move
    TechnoTypeClass.PrimaryOffset.Get(edi,ebx)
    pop  edi
    mov  edx,dword[ecx+0x11]
    mov  esi,eax
    mov  eax,ecx
    call dword[edx+0x164]
    xor  edx,edx
    jmp  0x0058B648
@ENDHACK

