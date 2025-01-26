;----------------------------------------------------------------
; src/features/ai_aircrafts.asm
;
; Extends House AI with the following features
; - Aircraft production obey Can_Build() checks
; - AI will consider training new aircraft beyond the original set
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

; for old AI_Aircraft implementation, in case we need to restore it. 
; this corrects the quantity offsets to use the new HouseClass offsets
%define HouseClass.Offset.NewBQuantity_Helipad 0x1848
%define HouseClass.Offset.NewBQuantity_Airfield 0x1850
%define HouseClass.Offset.NewAQuantity_Mig 0x241C
%define HouseClass.Offset.NewAQuantity_Yak 0x2420
%define HouseClass.Offset.NewAQuantity_Longbow 0x2424
%define HouseClass.Offset.NewAQuantity_Hind 0x2428

@SETD 0x004DC7E3 HouseClass.Offset.NewAQuantity_Longbow ; Longbow
@SETD 0x004DC7E9 HouseClass.Offset.NewAQuantity_Hind ; Hind
@SETD 0x004DC7EF HouseClass.Offset.NewBQuantity_Helipad ; Helipad
@SETD 0x004DC83E HouseClass.Offset.NewAQuantity_Longbow ; Longbow
@SETD 0x004DC844 HouseClass.Offset.NewAQuantity_Hind ; Hind
@SETD 0x004DC84A HouseClass.Offset.NewBQuantity_Helipad ; Helipad
@SETD 0x004DC89E HouseClass.Offset.NewAQuantity_Mig ; Mig
@SETD 0x004DC8A4 HouseClass.Offset.NewAQuantity_Yak ; Yak
@SETD 0x004DC8AA HouseClass.Offset.NewBQuantity_Airfield ; Airfield
@SETD 0x004DC8FE HouseClass.Offset.NewAQuantity_Mig ; Mig
@SETD 0x004DC904 HouseClass.Offset.NewAQuantity_Yak ; Yak
@SETD 0x004DC90A HouseClass.Offset.NewBQuantity_Airfield ; Airfield

@HOOK 0x004DC7AF _HouseClass__AI_Aircraft_Implementation

Temp.AIAircraft.Airfields        dd 0
Temp.AIAircraft.Helipads         dd 0
Temp.AIAircraft.CombatWings      dd 0
Temp.AIAircraft.CombatHelis      dd 0

Temp.AIAircraft.Array            times 256 db 0 ; we will not have more than 256 AircraftTypes
Temp.AIAircraft.Count            db 0

_HouseClass__AI_Aircraft_Implementation:
; first count the buildings and aircrafts
; ECX is HouseClass
    push esi
    push ebx
    push edx
    push eax
    xor  esi,esi ; count Helipad
    xor  ebx,ebx ; count Airfield
    xor  edi,edi
.CountBuildings.Repeat:
    mov  eax,edi
    BuildingTypeClass.FromIndex(eax,edx)
    BuildingTypeClass.IsHelipad.Get(edx,al)
    test al,al
    jz   .CountBuildings.CheckAirfield
    add  esi,dword[ecx+4*edi+HouseClass.Offset.NewBQuantity]
.CountBuildings.CheckAirfield:
    BuildingTypeClass.IsAirfield.Get(edx,al)
    test al,al
    jz   .CountBuildings.Next
    add  ebx,dword[ecx+4*edi+HouseClass.Offset.NewBQuantity]
.CountBuildings.Next:
    inc  edi
    mov  eax,[BuildingTypeClass.Count]
    cmp  edi,eax
    jb   .CountBuildings.Repeat

    mov  dword[Temp.AIAircraft.Airfields],ebx
    mov  dword[Temp.AIAircraft.Helipads],esi
    xor  esi,esi ; count Helis
    xor  ebx,ebx ; count Wings
    xor  edi,edi
.CountAircraft.Repeat:
    mov  eax,edi
    AircraftTypeClass.FromIndex(eax,edx)
    ; let AI ignore every non-combat craft
    TechnoTypeClass.PrimaryWeapon.Get(edx,eax) ; eax is now the weapon ptr
	test eax,eax
    jz   .CountAircraft.Next
    ObjectTypeClass.IsSelectable.Get(edx,al)
    test al,al
    jz   .CountAircraft.Next
    AircraftTypeClass.IsFixedWing.Get(edx,al)
    test al,al
    jnz  .CountAircraft.FixedWing
    add  esi,dword[ecx+4*edi+HouseClass.Offset.NewAQuantity]
    jmp   .CountAircraft.Next
.CountAircraft.FixedWing:
    add  ebx,dword[ecx+4*edi+HouseClass.Offset.NewAQuantity]
.CountAircraft.Next:
    inc  edi
    mov  eax,[AircraftTypeClass.Count]
    cmp  edi,eax
    jb   .CountAircraft.Repeat

    mov  dword[Temp.AIAircraft.CombatWings],ebx
    mov  dword[Temp.AIAircraft.CombatHelis],esi
    pop  eax
    pop  edx
    pop  ebx
    pop  esi

    ; Compare CombatHelis to Helipads
.CheckHelis:
    mov  eax,dword[Temp.AIAircraft.CombatHelis]
    cmp  eax,dword[Temp.AIAircraft.Helipads]
    jge  .CheckWings
.BuildHeli:
    xor  eax,eax
    call GetRandomAircraft
    test al,al
    jz   .Done
    call ChooseOneToBuild
    jmp  .Done
    ; Compare CombatWings to Airfields
.CheckWings:
    mov  eax,dword[Temp.AIAircraft.CombatWings]
    cmp  eax,dword[Temp.AIAircraft.Airfields]
    jge  .Done
.BuildWing:
    mov  eax,1
    call GetRandomAircraft
    test al,al
    jz   .Done
    call ChooseOneToBuild
.Done:
    jmp  0x004DC92F



GetRandomAircraft:
    ; eax: 1=Wing, 0=Heli
    ; ecx: House class
    ; cycle through all buildings
    ; result is stored as eax: Count and edx: array
    push edi
    push esi
    xor  edi,edi
    mov  byte[Temp.AIAircraft.Count],0
    mov  ebx,eax
.Repeat:
    mov  eax,edi
    AircraftTypeClass.FromIndex(eax,edx)
    ; let AI ignore every non-combat craft
    TechnoTypeClass.PrimaryWeapon.Get(edx,eax) ; eax is now the weapon ptr
	test eax,eax
    jz   .Next
    ObjectTypeClass.IsSelectable.Get(edx,al)
    test al,al
    jz   .Next
    AircraftTypeClass.IsFixedWing.Get(edx,al)
    cmp  al,bl
    jne  .Next
    push ebx
    push ecx
    push eax
    mov  bl,byte[ecx+HouseClass.Offset.ActLike]
    movzx ebx,bl
    mov  eax,ecx
    call HouseClass__Can_Build
    pop  edx
    pop  ecx
    pop  ebx
    test eax,eax
    jz   .Next
.AddAircraft:
    mov  dl,byte[Temp.AIAircraft.Count]
    movzx edx,dl
    lea  eax,[Temp.AIAircraft.Array+edx]
    inc  dl
    mov  byte[Temp.AIAircraft.Count],dl
    mov  edx,edi
    mov  byte[eax],dl
.Next:
    inc  edi
    mov  eax,[AircraftTypeClass.Count]
    cmp  edi,eax
    jb   .Repeat
.Done:
    xor  eax,eax
    mov  al,byte[Temp.AIAircraft.Count]
    lea  edx,[Temp.AIAircraft.Array]
    pop  esi
    pop  edi
    retn


ChooseOneToBuild:
    ; al: Count
    ; edx: Array of AircraftTypes
    ; don't disturb ecx (House class)
    push esi
    test al,al ; don't bother if count is 0
    jz   .Done
    ; pick the AircraftType first before allocation
    mov  esi,edx
    mov  bl,al ; al is at least 1
    dec  bl
    movzx ebx,bl
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  al,byte[esi+eax]
    mov  byte[ecx+HouseClass.Offset.BuildAircraft],al
.Done:
    pop  esi
    retn
