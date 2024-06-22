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

;@HOOK 0x0057E23C _UnitClass_Mission_Unload_PassengerUnhardcode
@HOOK 0x0057D3D6 _UnitClass_Mission_Unload_PassengerUnhardcode

;Replaces the Supply Truck check with a Passengers=xx check
;_UnitClass_Mission_Unload_PassengerUnhardcode:
;    push eax
;    movzx eax,al
;    UnitTypeClass.FromIndex(eax,eax)
;    TechnoTypeClass.MaxPassengers.Get(eax,eax)
;    cmp  eax, 0
;    pop  eax
;    jg   0x0057D6E1
;    jmp  0x0057E244

; For Unit IDs >= 0x11
_UnitClass_Mission_Unload_PassengerUnhardcode:
    push eax
    movzx eax,al
    UnitTypeClass.FromIndex(eax,eax)
    TechnoTypeClass.MaxPassengers.Get(eax,eax)
    cmp  eax, 0
    pop  eax
    jg   0x0057D6E1
    cmp  al,0x11
    jc   0x0057E23C
    jbe  0x0057E1BC
    jmp  0x0057D3E4
