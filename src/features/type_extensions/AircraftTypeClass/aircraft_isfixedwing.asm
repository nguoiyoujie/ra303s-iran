;----------------------------------------------------------------
; src/features/type_extensions/AircraftTypeClass/aircraft_isfixedwing.asm
;
; Dehardcodes certain YAK/MIG checks to check for IsFixedWing=yes instead. This includes assignments of aircraft to Airfields.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected as this is intended to allow new units to achieve the same behaviors for YAK/MIG. 
;
;----------------------------------------------------------------

; Note: IsFixedWing=yes is not fully functional, as there are several locations to decouple YAK/MIG checks and replace with IsFixedWing=yes
; // HouseClass::Is_No_YakMig
; // HouseClass::Is_Hack_Prevented
; // Reinf::_Need_To_Take
@HOOK 0x004DE09E _HouseClass_Is_No_YakMig_UseFixedWing
@HOOK 0x004DE15C _HouseClass_Is_Hack_Prevented_UseFixedWing

AircraftFixedWingSelectableCount                    dd    0

_HouseClass_Is_No_YakMig_UseFixedWing:
    xor  edi,edi ;begin from ID 0
    xor  ebx,ebx 
	xor  ecx,ecx
    mov  dword [AircraftFixedWingSelectableCount],0 ;initial count 0

.Check:
    cmp  edi,[AircraftTypeClass.Count]
    jge  .Done
.Loop:
    push eax
    push edi
    AircraftTypeClass.FromIndex(edi,ebx)
    AircraftTypeClass.IsFixedWing.Get(ebx,cl) ; check if aircraft is fixed wing
    pop  edi
    pop  eax
    test cl,cl
    jz   .NoAddCount
    push eax
    ObjectTypeClass.IsSelectable.Get(ebx,cl) ; exclude unselectable aircrafts such as the spy plane and badger bomber,as those do not return to the airfield
    pop  eax
    test cl,cl
    jz   .NoAddCount
.AddCount:
    ; AQuantity[<aircraftTypeID>] = eax + 0x4ee + 4 * <aircraftTypeID>
    mov  edx,edi
    shl  edx,2
    add  edx,0x4ee
    add  edx,eax
    mov  ebx,dword [AircraftFixedWingSelectableCount]
    add  ebx,dword [edx]
    mov  dword [AircraftFixedWingSelectableCount],ebx
.NoAddCount:
    inc  edi
	jmp  .Check
.Done:
    mov  ecx,dword [AircraftFixedWingSelectableCount]
    mov  ebx,eax
    jmp  0x004DE0AC


_HouseClass_Is_Hack_Prevented_UseFixedWing:
    push eax
    push ecx
    push edx
    push esi
    push ebx
    AircraftTypeClass.FromIndex(ebx,ecx)
	pop  ebx
    AircraftTypeClass.IsFixedWing.Get(ecx,dl) ; check if aircraft is fixed wing
    test dl,dl
    jz   .NoHack
    ObjectTypeClass.IsSelectable.Get(ecx,dl) ; exclude unselectable aircrafts such as the spy plane and badger bomber,as those do not return to the airfield
    test dl,dl
    jnz  .ApplyHack
.NoHack:
    pop  esi
    pop  edx
    pop  ecx
    pop  eax
    jmp  0x004DE16F
.ApplyHack:
    pop  esi
    pop  edx
    pop  ecx
    pop  eax
    call HouseClass__Is_No_YakMig
    jmp  0x004DE16B