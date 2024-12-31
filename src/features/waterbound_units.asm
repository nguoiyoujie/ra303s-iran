;----------------------------------------------------------------
; src/features/waterbound_units.asm
;
; Allows the use of water-bound units. This just sets the unit to SPEED_FLOAT, like ships, determines its movement zone, and suppresses code that sinks the unit when it moves to a water tile.
; True amphibious units are not supported... yet.
; 
; This function is enabled by the keys:
;   [<UnitType>] > Waterbound=yes
; 
; No compatibility issues is expected as this was not a configurable parameter.
;
;----------------------------------------------------------------

@HOOK 0x0057C568 _UnitClass__Per_Cell_Process_Dont_Sink_Waterbound_Units

_UnitClass__Per_Cell_Process_Dont_Sink_Waterbound_Units:
    test byte[ebx+0xcd],0x80  
    jnz  0x0057C5EF
    push eax
    push ebx
    push edx
    push edi
    mov  edx,dword[ebx+0x15c]
    movzx edx,dl
    UnitTypeClass.FromIndex(edx,edi)
    TechnoTypeClass.Speed.Get(edi,dl) 
    cmp  dl,4
    pop  edi
    pop  edx
    pop  ebx
    pop  eax
    jz   0x0057C5EF
    jmp  0x0057C575
