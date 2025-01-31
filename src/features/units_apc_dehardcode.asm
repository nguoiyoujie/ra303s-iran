;----------------------------------------------------------------
; src/features/units_apc_dehardcode.asm
;
; Allows a unit to use the APC door opening / closing sequences
; 
; This function is enabled by the keys:
;   [<UnitType>] > HasAPCDoor=yes
; 
; No compatibility issues is expected as this was not a configurable parameter.
;
;----------------------------------------------------------------

@HACK 0x0057A7A3,0x0057A7D7,_UnitClass__Receive_Message_Door_Open_And_Close
    push eax
    push ebx
    push edx
    push edi
    UnitTypeClass.FromIndex(eax,edi)
    UnitTypeClass.Anim_HasAPCDoor.Get(edi,dl) 
    cmp  dl,1
    pop  edi
    pop  edx
    pop  ebx
    pop  eax
    je   0x0057A7D7 ; enter
    jmp  0x0057A81A ; bail
@ENDHACK


@HACK 0x0057A863,0x0057A897,_UnitClass__Receive_Message_PromptPassenger
    push eax
    push ebx
    push edx
    push edi
    UnitTypeClass.FromIndex(eax,edi)
    UnitTypeClass.Anim_HasAPCDoor.Get(edi,dl) 
    cmp  dl,1
    pop  edi
    pop  edx
    pop  ebx
    pop  eax
    je   0x0057A897 ; enter
    jmp  0x0057A8B1 ; bail
@ENDHACK


; Overlap with _UnitClass_Mission_Unload_PassengerUnhardcode
;@HACK 0x0057D3C2,_UnitClass__Mission_Unload_CheckAPCDoor ; Overlap with _UnitClass_Mission_Unload_PassengerUnhardcode
;    mov  al,byte[eax+0x196]
;    push eax
;    push ebx
;    push edx
;    push edi
;    movzx eax,al
;    UnitTypeClass.FromIndex(eax,edi)
;    UnitTypeClass.Anim_HasAPCDoor.Get(edi,dl) 
;    cmp  dl,1
;    pop  edi
;    pop  edx
;    pop  ebx
;    pop  eax
;    je   0x0057D96C ; enter
;    jmp  0x0057D3C8 ; bail
;@ENDHACK


@HACK 0x0057CC5F,0x0057CC6B,_UnitClass__Draw_It_Offset_Turrets
    ; for STNK
    movzx eax,al ; use movzx
    push edx
    push edi
    UnitTypeClass.FromIndex(eax,edi)
    UnitTypeClass.Anim_HasAPCDoor.Get(edi,dl) 
    cmp  dl,1
    jne  .NoAPCDoor
    add  dword[ebp-0x14],6
    UnitTypeClass.AmmoImageCount.Get(edi,dl)
    cmp  dl,0
    je   .CheckTurretCount
    push ebx
    movzx edx,dl
    mov  ebx,edx
    shl  edx,4 ; (16)
    add  edx,ebx ; (161)
    shl  ebx,1 ; (2)
    add  edx,ebx ; (1621)
    shl  edx,1 ; multiply by 38 (1621) * 2
    pop  ebx
    add  dword[ebp-0x14],edx
.NoAPCDoor:
    UnitTypeClass.AmmoImageCount.Get(edi,dl)
    cmp  dl,0
    je   .CheckTurretCount
    movzx edx,dl
    shl  edx,5 ; multiply by 32
    add  dword[ebp-0x14],edx
.CheckTurretCount:
    UnitTypeClass.AmmoTurretCount.Get(edi,dl)
    cmp  dl,0
    je   .Done
    mov  ebx,[esi+0xC5] ; Ammo ; esi is unit class
    sub  dl,bl
    cmp  dl,0
    jle  .Done 
    movzx edx,dl
    shl  edx,5 ; multiply by 32
    add  dword[ebp-0x14],edx
.Done:
    pop  edi
    pop  edx    
    jmp  0x0057CC6B
@ENDHACK
