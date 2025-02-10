;----------------------------------------------------------------
; src/features/house_new_quantity_tracking_offsets.asm
;
; Move object quantity tracking to new offsets to allow for the full use of 256 types per technotype class
; 
; This function is enabled by default and is not controllable.
; A good deal of testing is needed to check for compatibility issues, as many things are tied to the affected values
;----------------------------------------------------------------

cextern UnitTrackerClass__Increment_Unit_Total
cextern UnitTrackerClass__Decrement_Unit_Total

cextern VesselTypeClass.Count

; HouseClass::Get_Quantity
@SET 0x004DDBC2,{mov eax,[eax+edx*4+HouseClass.Offset.NewAQuantity]}
@SET 0x004DDCEE,{mov eax,[eax+edx*4+HouseClass.Offset.NewBQuantity]}

; HouseClass::Find_Building
@SET 0x004D8F4B,{cmp dword[ecx+eax*4+HouseClass.Offset.NewBQuantity],0}

; HouseClass::AI
; this check for force sub surfacing is rather wasteful. Maybe try to use a bitmask? 
@SET 0x004D4AF3,{cmp dword[eax+HouseClass.Offset.NewVQuantity],0} ; SUB
@SET 0x004D4B05,{lea edx,[esi+0x400]}
@SET 0x004D4B0B,{mov edi,[esi+HouseClass.Offset.NewBQuantity]}
@SET 0x004D4B28,{mov ebx,[esi+HouseClass.Offset.NewUQuantity]}
@SET 0x004D4B45,{mov ecx,[esi+HouseClass.Offset.NewIQuantity]}
@SET 0x004D4B62,{mov edi,[esi+HouseClass.Offset.NewAQuantity]}
@SET 0x004D4B82,{add eax,[edx+HouseClass.Offset.NewVQuantity]}
@SET 0x004D4B95,{add eax,[edx+HouseClass.Offset.NewVQuantity]}

@HACK 0x004DCB14,0x004DCC2F,_HouseClass__Tracking_Remove_Reimplementation
    ; eax = HouseClass, edx = TechnoClass
    push ebp
    mov  ebp,esp
    push ebx

    AbstractClass.RTTI.Get(edx,bl)
    cmp  bl,RTTIType.Infantry
    je   .Update.Infantry  
    cmp  bl,RTTIType.Unit
    je   .Update.Unit  
    cmp  bl,RTTIType.Building
    je   .Update.Building  
    cmp  bl,RTTIType.Aircraft
    je   .Update.Aircraft      
    cmp  bl,RTTIType.Vessel
    je   .Update.Vessel
    jmp  .Ret

.Update.Infantry:
    mov  ebx,eax
    InfantryClass.Class.Get(edx,eax)
    dec  dword[ebx+HouseClass.Offset.CurInfantry]
    dec  dword[ebx+eax*4+HouseClass.Offset.NewIQuantity]
    jnz  .Update.Infantry.CheckActive
    call House_Recalc_Attributes_Infantry
.Update.Infantry.CheckActive:
    push eax
    TechnoClass.IsInPlay.Get(edx,ah)
    test ah,ah
    pop  eax
    jz   .Update.Infantry.Done
    TechnoClass.IsInPlay.Set(edx,0)
    dec  dword[ebx+eax*4+HouseClass.Offset.NewActiveIQuantity]
    jnz  .Update.Infantry.Done
    call House_Recalc_Attributes_ActiveInfantry
.Update.Infantry.Done:
    mov  eax,[ebx+HouseClass.Offset.InfantryTotals]
    test eax,eax
    jz   .Ret
    call UnitTrackerClass__Decrement_Unit_Total
    jmp  .Ret

.Update.Unit:
    mov  ebx,eax
    UnitClass.Class.Get(edx,eax)
    dec  dword[ebx+HouseClass.Offset.CurUnits]
    dec  dword[ebx+eax*4+HouseClass.Offset.NewUQuantity]
    jnz  .Update.Unit.CheckActive
    call House_Recalc_Attributes_Unit
.Update.Unit.CheckActive:
    push eax
    TechnoClass.IsInPlay.Get(edx,ah)
    test ah,ah
    pop  eax
    jz   .Update.Unit.Done
    TechnoClass.IsInPlay.Set(edx,0)
    dec  dword[ebx+eax*4+HouseClass.Offset.NewActiveUQuantity]
    jnz  .Update.Unit.Done
    call House_Recalc_Attributes_ActiveUnit
.Update.Unit.Done:
    mov  eax,[ebx+HouseClass.Offset.UnitTotals]
    test eax,eax
    jz   .Ret
    call UnitTrackerClass__Decrement_Unit_Total
    jmp  .Ret

.Update.Building:
    mov  ebx,eax
    BuildingClass.Class.Get(edx,eax)
    dec  dword[ebx+HouseClass.Offset.CurBuildings]
    dec  dword[ebx+eax*4+HouseClass.Offset.NewBQuantity]
    jnz  .Update.Building.CheckActive
    call House_Recalc_Attributes_Building
.Update.Building.CheckActive:
    push eax
    TechnoClass.IsInPlay.Get(edx,ah)
    test ah,ah
    pop  eax
    jz   .Update.Building.Done
    TechnoClass.IsInPlay.Set(edx,0)
    dec  dword[ebx+eax*4+HouseClass.Offset.NewActiveBQuantity]
    jnz  .Update.Building.Done
    call House_Recalc_Attributes_ActiveBuilding
.Update.Building.Done:
    mov  eax,[ebx+HouseClass.Offset.BuildingTotals]
    test eax,eax
    jz   .Ret
    call UnitTrackerClass__Decrement_Unit_Total
    jmp  .Ret

.Update.Aircraft:
    mov  ebx,eax
    AircraftClass.Class.Get(edx,eax)
    dec  dword[ebx+HouseClass.Offset.CurAircraft]
    dec  dword[ebx+eax*4+HouseClass.Offset.NewAQuantity]
    jnz  .Update.Aircraft.CheckActive
    call House_Recalc_Attributes_Aircraft
.Update.Aircraft.CheckActive:
    push eax
    TechnoClass.IsInPlay.Get(edx,ah)
    test ah,ah
    pop  eax
    jz   .Update.Aircraft.Done
    TechnoClass.IsInPlay.Set(edx,0)
    dec  dword[ebx+eax*4+HouseClass.Offset.NewActiveAQuantity]
    jnz  .Update.Aircraft.Done
    call House_Recalc_Attributes_ActiveAircraft
.Update.Aircraft.Done:
    mov  eax,[ebx+HouseClass.Offset.AircraftTotals]
    test eax,eax
    jz   .Ret
    call UnitTrackerClass__Decrement_Unit_Total
    jmp  .Ret

.Update.Vessel:
    mov  ebx,eax
    VesselClass.Class.Get(edx,eax)
    dec  dword[ebx+HouseClass.Offset.CurVessels]
    dec  dword[ebx+eax*4+HouseClass.Offset.NewVQuantity]
    jnz  .Update.Vessel.CheckActive
    call House_Recalc_Attributes_Vessel
.Update.Vessel.CheckActive:
    push eax
    TechnoClass.IsInPlay.Get(edx,ah)
    test ah,ah
    pop  eax
    jz   .Update.Vessel.Done
    TechnoClass.IsInPlay.Set(edx,0)
    dec  dword[ebx+eax*4+HouseClass.Offset.NewActiveVQuantity]
    jnz  .Update.Vessel.Done
    call House_Recalc_Attributes_ActiveVessel
.Update.Vessel.Done:
    mov  eax,[ebx+HouseClass.Offset.VesselTotals]
    test eax,eax
    jz   .Ret
    call UnitTrackerClass__Decrement_Unit_Total
    jmp  .Ret

.Ret:
    lea  esp,[ebp-0x4]
    pop  ebx
    pop  ebp
    ret
@ENDHACK


@HACK 0x004DCC30,0x004DCEB3,_HouseClass__Tracking_Add_Reimplementation
    ; eax = HouseClass, edx = TechnoClass
    ; Note to self: Do not update ActiveXQuantity and Active Attributes here!
    ; This is because code may call from areas where the House owner of the techno has not been updated yet
    ; E.g. TechnoClass::Capture()
    ; Use TechnoClass__AI to update active
    push ebp
    mov  ebp,esp
    push ebx

    AbstractClass.RTTI.Get(edx,bl)
    cmp  bl,RTTIType.Infantry
    je   .Update.Infantry  
    cmp  bl,RTTIType.Unit
    je   .Update.Unit  
    cmp  bl,RTTIType.Building
    je   .Update.Building  
    cmp  bl,RTTIType.Aircraft
    je   .Update.Aircraft      
    cmp  bl,RTTIType.Vessel
    je   .Update.Vessel
    jmp  .Ret

.Update.Infantry:
    mov  ebx,eax
    InfantryClass.Class.Get(edx,eax)
    inc  dword[ebx+HouseClass.Offset.CurInfantry]
    inc  dword[ebx+eax*4+HouseClass.Offset.NewIQuantity]
    cmp  dword[ebx+eax*4+HouseClass.Offset.NewIQuantity],1
    call House_Recalc_Attributes_Infantry
    mov  eax,[ebx+HouseClass.Offset.InfantryTotals]
    test eax,eax
    jz   .Ret
    call UnitTrackerClass__Increment_Unit_Total
    jmp  .Ret

.Update.Unit:
    mov  ebx,eax
    UnitClass.Class.Get(edx,eax)
    inc  dword[ebx+HouseClass.Offset.CurUnits]
    inc  dword[ebx+eax*4+HouseClass.Offset.NewUQuantity]
    cmp  dword[ebx+eax*4+HouseClass.Offset.NewUQuantity],1
    call House_Recalc_Attributes_Unit
    mov  eax,[ebx+HouseClass.Offset.UnitTotals]
    test eax,eax
    jz   .Ret
    call UnitTrackerClass__Increment_Unit_Total
    jmp  .Ret

.Update.Building:
    mov  ebx,eax
    BuildingClass.Class.Get(edx,eax)
    inc  dword[ebx+HouseClass.Offset.CurBuildings]
    inc  dword[ebx+eax*4+HouseClass.Offset.NewBQuantity]
    cmp  dword[ebx+eax*4+HouseClass.Offset.NewBQuantity],1
    call House_Recalc_Attributes_Building
    mov  eax,[ebx+HouseClass.Offset.BuildingTotals]
    test eax,eax
    jz   .Ret
    call UnitTrackerClass__Increment_Unit_Total
    jmp  .Ret

.Update.Aircraft:
    mov  ebx,eax
    AircraftClass.Class.Get(edx,eax)
    inc  dword[ebx+HouseClass.Offset.CurAircraft]
    inc  dword[ebx+eax*4+HouseClass.Offset.NewAQuantity]
    cmp  dword[ebx+eax*4+HouseClass.Offset.NewAQuantity],1
    call House_Recalc_Attributes_Aircraft
    mov  eax,[ebx+HouseClass.Offset.AircraftTotals]
    test eax,eax
    jz   .Ret
    call UnitTrackerClass__Increment_Unit_Total
    jmp  .Ret

.Update.Vessel:
    mov  ebx,eax
    VesselClass.Class.Get(edx,eax)
    inc  dword[ebx+HouseClass.Offset.CurVessels]
    inc  dword[ebx+eax*4+HouseClass.Offset.NewVQuantity]
    cmp  dword[ebx+eax*4+HouseClass.Offset.NewVQuantity],1
    call House_Recalc_Attributes_Vessel
    mov  eax,[ebx+HouseClass.Offset.VesselTotals]
    test eax,eax
    jz   .Ret
    call UnitTrackerClass__Increment_Unit_Total
    jmp  .Ret

.Ret:
    lea  esp,[ebp-0x4]
    pop  ebx
    pop  ebp
    ret
@ENDHACK


@HACK 0x004D4B22,0x004D4B28,_HouseClass__AI_Sub_Check_Replace_UQuantity
    mov  esi,dword[ebp-0x58]
    lea  edx,[esi+0x400]
    jmp  0x004D4B28
@ENDHACK


@HACK 0x004D4B3F,0x004D4B45,_HouseClass__AI_Sub_Check_Replace_IQuantity
    mov  esi,dword[ebp-0x58]
    lea  edx,[esi+0x400]
    jmp  0x004D4B45
@ENDHACK


@HACK 0x004D4B5C,0x004D4B62,_HouseClass__AI_Sub_Check_Replace_AQuantity
    mov  esi,dword[ebp-0x58]
    lea  edx,[esi+0x400]
    jmp  0x004D4B62
@ENDHACK


@HACK 0x004D4B89,0x004D4B8F,_HouseClass__AI_Sub_Check_Replace_VCount
    add  edx,4
    cmp  esi,[VesselTypeClass.Count]
    jmp  0x004D4B8F
@ENDHACK


;Temp
; CellClass::GoodieCheck
;@SET 0x004A077E,{mov ebx,[ecx+ebx*4+HouseClass.Offset.NewUQuantity]}
@HACK 0x004A08AA,0x004A08AF,_CellClass__GoodieCheck_Replace_Quantity
    ; edx is houseclass
    lea  eax,[edx+HouseClass.Offset.NewUQuantity]
    lea  ecx,[eax+0x400*4] ; NewUQuantity, NewIQuantity, NewAQuantity, NewVQuantity
    xor  ebx,ebx
.Repeat:
    add  ebx,dword[eax]
.Next:
    add  eax,4
    cmp  eax,ecx
    jl   .Repeat  
    add  dword[ebp-192],ebx
.CountBuildings:
    lea  eax,[edx+HouseClass.Offset.NewBQuantity]
    lea  ecx,[eax+0x400] ; NewBQuantity
    xor  ebx,ebx
.CountBuildings_Repeat:
    add  ebx,dword[eax]
.CountBuildings_Next:
    add  eax,4
    cmp  eax,ecx
    jl   .Repeat
    shr  ebx,1 ; divide building score by 2
    add  dword[ebp-192],ebx
.Done:
    jmp  0x004A085D
@ENDHACK


