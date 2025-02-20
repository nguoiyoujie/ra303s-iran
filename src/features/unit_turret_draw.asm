;----------------------------------------------------------------
; src/fixes/unit_turret_draw.asm
;
; Unit turrets use new rules definitions. This includes TurretFrameStart and TurretFrameCount
; 
; This function is enabled by including the following key in Rules.ini. 
;   Rules.ini > [<UnitType>] > TurretFrameStart=(integer)
;   Rules.ini > [<UnitType>] > TurretFrameCount=(integer)
;
; No compatibility issues is expected, as this is a new feature.
;----------------------------------------------------------------

@HOOK 0x0057CAF3 _UnitClass_DrawIt_UseDefinedTurretSettings_RotatingTurret1
@HOOK 0x0057CB08 _UnitClass_DrawIt_UseDefinedTurretSettings_RotatingTurret2
@HOOK 0x00578CE1 _UnitTypeClass_Turret_Adjust_UseDefinedTurretSettings

temp.TurretFrameStart                                dw 0 
temp.TurretFrameCount                                dw 0 

_UnitClass_DrawIt_UseDefinedTurretSettings_RotatingTurret1:
    ; eax is the unit id
    push eax
    push ebx
    push ecx
    movzx eax,al
    UnitTypeClass.FromIndex(eax,ebx)
    UnitTypeClass.TurretFrameStart.Get(ebx,cx)
    test cx,cx
    jnz   .UseStart
.DefaultStart:
    mov  cx,32
.UseStart:
    mov  word [temp.TurretFrameStart], cx
    UnitTypeClass.TurretFrameCount.Get(ebx,cx)
    test cx,cx
    jnz   .UseCount
.DefaultCount:
    mov  cx,32
.UseCount:
    mov  word [temp.TurretFrameCount], cx
    pop  ecx
    pop  ebx
    pop  eax
    jmp  0x0057CAFC

_UnitClass_DrawIt_UseDefinedTurretSettings_RotatingTurret2:
    push edx
    push ecx
    mov  eax,[Globals___Frame]
    xor  edx,edx
    mov  cx, word [temp.TurretFrameCount]
    idiv cx
    add  dx, word [temp.TurretFrameStart]
    mov  eax,edx
    pop  ecx
    pop  edx
    jmp  0x0057CB13

_UnitTypeClass_Turret_Adjust_UseDefinedTurretSettings:
    mov  al,byte [eax + 0x196]
    ; eax is the unit id
    push eax
    push edx
    push esi
    push edi
    movzx eax,al
    mov  edi,ebx
    mov  edx,esi
    mov  esi,ecx
    xor  ecx,ecx
    UnitTypeClass.FromIndex(eax,ebx)
    xor  eax,eax
.CheckOffset:
    xor  ecx,ecx
    UnitTypeClass.TurretOffset.Get(ebx,cl)
    test cl,cl
    jz   .CheckX
    test cl,0x80 ; negative number check
    jz   .ForwardOffset
.BackwardOffset:
    add  al,0x80
    neg  cl
.ForwardOffset:
    push ebx
    add  al,byte[edx+0xba]
    movzx ebx,al ; DirType PrimaryFacing
    lea  edx,[esi] ; y
    lea  eax,[edi] ; x
    call 0x004AC870 ; Normal_Move_Point
    pop  ebx
.CheckX:
    xor  eax,eax
    UnitTypeClass.TurretAdjustX.Get(ebx,ecx)
    push ecx ; X
    test ecx,ecx
    jnz  .CheckY
    inc  al
.CheckY:
    UnitTypeClass.TurretAdjustY.Get(ebx,ecx)
    push ecx ; Y
    test ecx,ecx
    jnz  .Apply
.CheckIfZero:
	cmp  al,1
    jne  .Apply
.Default:
    pop  ecx ; y
    pop  ecx ; x
    mov  ebx,edi
    mov  ecx,esi
    pop  edi
    pop  esi
    pop  edx
    pop  eax
	jmp  0x00578CE7
.Apply:
    ; [ebx]=x [ecx]=y
    mov  ebx,edi
    mov  ecx,esi
    pop  edx ; y
    add  dword [ecx], edx
    pop  edx ; x
    add  dword [ebx], edx
    pop  edi
    pop  esi
    pop  edx
    pop  eax
    jmp  0x00578CF1



    