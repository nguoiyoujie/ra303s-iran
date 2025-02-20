;----------------------------------------------------------------
; src/features/unit_reload.asm
;
; Extends V2 reload logic to all units, by reading AmmoReloadRate=. The value defaults to 0. Values 0 and below indicate no reload.
; Additionally, The amount reloaded per cycle is customizable with AmmoReloadAmount=
;
; This function is applied to normally attacking units and the minelayer
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

cextern Globals___Frame

[section .data] 
Temp.UnitReload           dd    0
Temp.UnitReload.ID   db    0
Temp.UnitReload.Amount    dd    0


@HACK 0x00579FAD,0x00579FB9,_UnitClass__Reload_AI_UseAmmoReloadRate
    ; dl is the unit type id
    mov  byte[Temp.UnitReload.ID],dl
    jmp  0x00579FB9
@ENDHACK


@HACK 0x00579FE7,0x00579FED,_UnitClass__Reload_AI_UseAmmoReloadRate2
    jge  0x0057A0C2
    push edi
    push edx
    mov  dl,byte[Temp.UnitReload.ID]
    movzx edx,dl  
    UnitTypeClass.FromIndex(edx,edi)
    UnitTypeClass.AmmoReloadAmount.Get(edi,edx) 
    mov  dword[Temp.UnitReload.Amount],edx
    cmp  edx,0
    jg   .Continue
    mov  dword[Temp.UnitReload.Amount],1
.Continue:
    UnitTypeClass.AmmoReloadRate.Get(edi,edx) 
    mov  dword[Temp.UnitReload],edx
    cmp  edx,0
    pop  edx
    pop  edi
    jle  0x0057A0C2
    jmp  0x00579FED
@ENDHACK


@HACK 0x0057A05E,0x0057A065,_UnitClass__Reload_AI_UseAmmoReloadAmount
    mov  esi,dword[eax+0xC5]
    add  esi,dword[Temp.UnitReload.Amount]
    jmp  0x0057A065
@ENDHACK


@HACK 0x0057A089,0x0057A095,_UnitClass__Reload_AI_UseAmmoReloadAmount_CheckOverflow
    mov  ebx,dword[eax+0xC5]
    cmp  ebx,dword[edx+0x15E]
    jl   .No_Overflow
.Overflow:
    mov  ebx,dword[edx+0x15E]
    mov  dword[eax+0xC5],ebx
.No_Overflow:
    jmp  0x0057A095
@ENDHACK


@HACK 0x0057A097,0x0057A09C,_UnitClass__Reload_AI_UseAmmoReloadRate3
    mov  edi,dword[Temp.UnitReload]
    imul edi,15 ; ticks in a second
    jmp  0x0057A09C
@ENDHACK


@HACK 0x005807FE,0x00580803,_UnitClass__Fire_At_UpdateReload
    ; al is the unit type id
    push edi
    push edx
    mov  dl,al
    movzx edx,dl  
    UnitTypeClass.FromIndex(edx,edi)
    UnitTypeClass.AmmoReloadRate.Get(edi,edx) 
    mov  dword[Temp.UnitReload],edx
    pop  edx
    pop  edi
    jmp  0x00580803
@ENDHACK


@HACK 0x0058082D,0x00580832,_UnitClass__Fire_At_UpdateReload2
    mov  ebx,dword[Temp.UnitReload]
    imul ebx,15 ; ticks in a second
    jmp  0x00580832
@ENDHACK


@HACK 0x0057DD83,0x0057DD89,_UnitClass__Mission_Unload_Minelayer_Reload
    dec  dword[eax+0xC5]
    push eax
    push ebx
    push edx
    push edi
    mov  edx,dword[eax+0x15C]
    movzx edx,dl
    UnitTypeClass.FromIndex(edx,edi)
    UnitTypeClass.AmmoReloadRate.Get(edi,edx) 
    imul edx,15 ; ticks in a second
    mov  ebx,dword[Globals___Frame]
    ; set Reload timer (current tick, duration)
    mov  dword[eax+0x170],ebx
    mov  dword[eax+0x174],edx
    pop  edi
    pop  edx
    pop  ebx
    pop  eax
    jmp  0x0057DD89
@ENDHACK
