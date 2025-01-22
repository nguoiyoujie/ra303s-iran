; If you play as Allies, capture a Soviet Construction yard and build or capture a Helipad and Airfield if do you anything that causes the game to recheck what stuff needs to be removed from the sidebar, the game thinks the Hind and Transport Helicopter aren't buildable and removes it from the sidebar, then re-adds it to the sidebar after the game checks what stuff is buildable again. That's because there's two different checks and the check fails when checking what to remove.

; The Hind and Transport Helicopter require the Helipad and have Soviet as owner, if you have the Construction Yards for both teams you won't be able to build these units after building a Helipad, After getting the Airfield one of the checks thinks you can build Hind and Transport Helicopter and the other thinks you can't. We patch in a special exception for this

; Fix will desync online with 3.03 most likely in the very rare occasion that this situation occurs. That's because Hind and Transport Helicopter will spawn for players with this fix but without those two helicopters won't spawn because both the Helipad and Airfield aren't considered valid factories for those two helicopters in this situation.

;@CLEAR 0x0051EBBD 0x90 0x0051EBC2

; Checks are failing because of building ownership/ActLike checks. Aircrafts can dock in airstrips that cannot build them.
; This change has a side-effect where you no longer lose captured aircraft tech unless all airfields / helipads are destroyed.
@HOOK 0x0051EA31 _ObjectTypeClass__Who_Can_Build_Me_Relax_AircraftType
@HOOK 0x0051EBBA _ObjectTypeClass__Who_Can_Build_Me_Helipad_Unhardcode
@HOOK 0x0051EBF2 _ObjectTypeClass__Who_Can_Build_Me_Airfield_Unhardcode

_ObjectTypeClass__Who_Can_Build_Me_Relax_AircraftType:
    cmp  byte[edi],RTTIType.AircraftType
    je   0x0051EA94 ; skip prereq checks
    mov  edx,dword[edi+0x21]
    mov  eax,edi
    jmp  0x0051EA36


; Avoid NCO bug (allies_NCO_helipad_bug.asm)
_ObjectTypeClass__Who_Can_Build_Me_Helipad_Unhardcode:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsHelipad.Get(edi,al)
    test al,al
    pop  edi
.Helipad:
    jnz  0x0051EBC2
.NotAHelipad:
    jmp  0x0051EBCB


_ObjectTypeClass__Who_Can_Build_Me_Airfield_Unhardcode:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsAirfield.Get(edi,al)
    test al,al
    pop  edi
.Airfield:
    jnz  0x0051EBFE
.NotAnAirfield:
    jmp  0x0051EB02

