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

@HOOK 0x00579FAD _UnitClass__Reload_AI_UseAmmoReloadRate
@HOOK 0x00579FE7 _UnitClass__Reload_AI_UseAmmoReloadRate2
@HOOK 0x0057A05E _UnitClass__Reload_AI_UseAmmoReloadAmount
@HOOK 0x0057A089 _UnitClass__Reload_AI_UseAmmoReloadAmount_CheckOverflow
@HOOK 0x0057A097 _UnitClass__Reload_AI_UseAmmoReloadRate3
@HOOK 0x005807FE _UnitClass__Fire_At_UpdateReload
@HOOK 0x0058082D _UnitClass__Fire_At_UpdateReload2
@HOOK 0x0057DD83 _UnitClass__Mission_Unload_Minelayer_Reload



temp_reload      dd    0
temp_reload_id   db    0
temp_reload_amt  dd    0

_UnitClass__Reload_AI_UseAmmoReloadRate:
    ; dl is the unit type id
    mov  byte [temp_reload_id],dl
    jmp  0x00579FB9


_UnitClass__Reload_AI_UseAmmoReloadRate2:
    jge  0x0057A0C2
    push edi
    push edx
    mov  dl,byte [temp_reload_id]
    movzx edx,dl  
    UnitTypeClass.FromIndex(edx,edi)
    UnitTypeClass.AmmoReloadAmount.Get(edi,edx) 
    mov  dword [temp_reload_amt],edx
    cmp  edx,0
    jg   .Continue
    mov  dword [temp_reload_amt],1
.Continue:
    UnitTypeClass.AmmoReloadRate.Get(edi,edx) 
    mov  dword [temp_reload],edx
    cmp  edx,0
    pop  edx
    pop  edi
    jle  0x0057A0C2
    jmp  0x00579FED


_UnitClass__Reload_AI_UseAmmoReloadAmount:
    mov  esi,dword[eax+0xc5]
    add  esi,dword[temp_reload_amt]
    jmp  0x0057A065


_UnitClass__Reload_AI_UseAmmoReloadAmount_CheckOverflow:
    mov  ebx,dword[eax+0xc5]
    cmp  ebx,dword[edx+0x15e]
    jl   .No_Overflow
.Overflow:
    mov  ebx,dword[edx+0x15e]
    mov  dword[eax+0xc5],ebx
.No_Overflow:
    jmp  0x0057A095


_UnitClass__Reload_AI_UseAmmoReloadRate3:
    mov  edi,dword [temp_reload]
    imul edi,15
    jmp  0x0057A09C


_UnitClass__Fire_At_UpdateReload:
    ; al is the unit type id
    push edi
    push edx
    mov  dl,al
    movzx edx,dl  
    UnitTypeClass.FromIndex(edx,edi)
    UnitTypeClass.AmmoReloadRate.Get(edi,edx) 
    mov  dword [temp_reload],edx
    pop  edx
    pop  edi
    jmp  0x00580803


_UnitClass__Fire_At_UpdateReload2:
    mov  ebx,dword [temp_reload]
    imul ebx,15
    jmp  0x00580832


_UnitClass__Mission_Unload_Minelayer_Reload:
    dec  dword[eax + 0xc5]
    ;dec  dword[eax + 0xc5]
    push eax
    push ebx
    push edx
    push edi
    mov  edx,dword[eax + 0x15c]
    movzx edx,dl
    UnitTypeClass.FromIndex(edx,edi)
    UnitTypeClass.AmmoReloadRate.Get(edi,edx) 
    imul edx,15 ; don't forget to convert seconds to ticks
    mov  ebx,dword[0x006680C4]
    ; set Reload timer (current tick, duration)
    mov  dword[eax + 0x170],ebx
    mov  dword[eax + 0x174],edx
    pop  edi
    pop  edx
    pop  ebx
    pop  eax
    jmp  0x0057DD89


