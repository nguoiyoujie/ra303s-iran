;----------------------------------------------------------------
; src/features/type_extensions/AircraftTypeClass/aircraft_isfixedwing.asm
;
; Dehardcodes certain YAK/MIG checks to check for IsFixedWing=yes instead. This includes assignments of aircraft to Airfields.
; 
; This function is enabled by default and is not configurable.
; No compatibility issues is expected as this is intended to allow new units to achieve the same behaviors for YAK/MIG. 
;
;----------------------------------------------------------------

; Note: IsFixedWing=yes is not fully functional, as there are several locations to decouple YAK/MIG checks and replace with IsFixedWing=yes
; // HouseClass::Is_No_YakMig
; // HouseClass::Is_Hack_Prevented
; // Reinf::_Need_To_Take
@HOOK 0x004DE09E _HouseClass_Is_No_YakMig_UseFixedWing
@HOOK 0x004DE103 _HouseClass_Is_No_YakMig_UseFixedWing2
@HOOK 0x004DE13C _HouseClass_Is_No_YakMig_CountAirfield
@HOOK 0x004DE15C _HouseClass_Is_Hack_Prevented_UseFixedWing

_HouseClass_Is_No_YakMig_UseFixedWing:
    push edi
    push eax
    xor  edi,edi ;begin from ID 0
    xor  edx,edx 
	xor  ecx,ecx
.Repeat:
    mov  eax,edi
    AircraftTypeClass.FromIndex(eax,edx)
    AircraftTypeClass.IsFixedWing.Get(edx,al) ; check if aircraft is fixed wing
    test al,al
    jz   .Next
    ObjectTypeClass.IsSelectable.Get(edx,al) ; exclude unselectable aircrafts such as the spy plane and badger bomber,as those do not return to the airfield
    test al,al
    jz   .Next
.Found:
    pop  eax ; HouseClass
    push eax
    add  ecx,dword[eax+edi*4+HouseClass.Offset.NewAQuantity] ;[edx]
.Next:
    inc  edi
    mov  eax,[AircraftTypeClass.Count]
    cmp  edi,eax
    jb   .Repeat
.Done:
    pop  eax
    pop  edi
    jmp  0x004DE0AC


_HouseClass_Is_No_YakMig_UseFixedWing2:
    movzx eax,al
    push edi
    AircraftTypeClass.FromIndex(eax,edi)
    AircraftTypeClass.IsFixedWing.Get(edi,al)
    test al,al
    pop  edi
.FixedWing:
    jnz  0x004DE13B
.NotFixedWing:
    jmp  0x004DE13C


_HouseClass_Is_No_YakMig_CountAirfield:
; edx is not used. ebx is HouseClass
    push edi
    push esi
    push eax
    xor  edi,edi
    xor  esi,esi
.Repeat:
    mov  eax,edi
    BuildingTypeClass.FromIndex(eax,edx)
    BuildingTypeClass.IsAirfield.Get(edx,al)
    test al,al
    jz   .Next
    add  esi,dword[ebx+4*edi+HouseClass.Offset.NewBQuantity]
.Next:
    inc  edi
    mov  eax,[BuildingTypeClass.Count]
    cmp  edi,eax
    jb   .Repeat
.Done:
    cmp  ecx,esi
    pop  eax
    pop  esi
    pop  edi
    jmp  0x004DE142


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