;----------------------------------------------------------------
; src/features/units_v2rl_dehardcode.asm
;
; Allows a unit to use alternative images when it has less than maximum Ammo. Additionally, multiple set of images can be used, and turrets are supported.
; 
; This function is enabled by the keys:
;   [<UnitType>] > AmmoImageCount=1 or more
;   [<UnitType>] > AmmoTurretCount=1 or more
; 
; No compatibility issues is expected as this was not a configurable parameter.
;
;----------------------------------------------------------------

@HOOK 0x0057C9A1 _UnitClass__ShapeNumber_Offset_V2RL_Body

_UnitClass__ShapeNumber_Offset_V2RL_Body:
; for STNK
    movzx eax,al ; use movzx
    push ebx
    push edx
    push edi
    UnitTypeClass.FromIndex(eax,edi)
    UnitTypeClass.AmmoImageCount.Get(edi,dl)
    cmp  dl,0
    je   .Done
    mov  ebx,[ebx+0xC5] ; Ammo
    sub  dl,bl
    cmp  dl,0
    jle  .Done 
    UnitTypeClass.Anim_HasAPCDoor.Get(edi,bl) 
    cmp  bl,1
    je   .APCDoor
.NoAPCDoor:
    movzx edx,dl
    shl  edx,5 ; multiply by 32
    add  ecx,edx
    jmp  .Done
.APCDoor:
    movzx edx,dl
    mov  ebx,edx
    shl  edx,4 ; (16)
    add  edx,ebx ; (16 + 1)
    shl  ebx,1 ; (2)
    add  edx,ebx ; (16 + 2 + 1)
    shl  edx,1 ; multiply by 38 (16 + 2 + 1) * 2
    add  ecx,edx
.Done:
    pop  edi
    pop  edx    
    pop  ebx    
    jmp  0x0057C9B5

; Turret offset is done in _UnitClass__Draw_It_Offset_Turrets (units_apc_dehardcode.asm)



