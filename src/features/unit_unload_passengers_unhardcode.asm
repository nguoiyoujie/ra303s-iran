;----------------------------------------------------------------
; src/features/unit_unload_passengers_unhardcode.asm
;
; Before, only certain units, such as the APC, Phase Tank or Supply Truck has in-built logic got unloading Passengers. Other units do not do anything, even if the deploy cursor is shown
; Now, any unit with Passengers set to 1 or above may unload like the Supply Truck. APC and Phase Tank retain their special behavior.
; 
; This function is enabled by default. The new unit need only redefine Passengers=
;
; No compatibility issues is expected.
;
;----------------------------------------------------------------

;Replaces the Supply Truck check with a Passengers=xx check
;@HACK 0x0057E23C,_UnitClass_Mission_Unload_PassengerUnhardcode
;    push eax
;    movzx eax,al
;    UnitTypeClass.FromIndex(eax,eax)
;    TechnoTypeClass.MaxPassengers.Get(eax,eax)
;    cmp  eax,0
;    pop  eax
;    jg   0x0057D6E1
;    jmp  0x0057E244
;@ENDHACK


; For Unit IDs >= 0x11
@HACK 0x0057D3C2,0x0057D3F9,_UnitClass_Mission_Unload_PassengerUnhardcode
    mov  al,byte[eax+0x196]
    movzx eax,al
    push eax
    push edx
    UnitTypeClass.FromIndex(eax,edx)
    TechnoTypeClass.MaxPassengers.Get(edx,eax)
    cmp  eax,0
    jg   .Passengers
    UnitTypeClass.IsToHarvest.Get(edx,al)
    test al,al
    jnz  .Harvester
    UnitTypeClass.DeploysInto.Get(edx,al)
    cmp  al,0
    jg   .Deployer
    pop  edx
    pop  eax
    cmp  al,UnitType.MNLY
    jz   0x0057DE04
    cmp  al,UnitType.QTNK
    jz   0x0057DE1B
    cmp  al,UnitType.CTNK
    jz   0x0057E1BC
    jmp  0x0057E262
.Passengers:
    UnitTypeClass.Anim_HasAPCDoor.Get(edx,al)
    test al,al
    jnz  .APC
.Truck:
    pop  edx
    pop  eax
    jmp  0x0057D6E1
.APC:
    pop  edx
    pop  eax
    jmp  0x0057D96C
.Deployer:
    pop  edx
    pop  eax
    jmp  0x0057DA83
.Harvester:
    pop  edx
    pop  eax
    jmp  0x0057D3F9
@ENDHACK
