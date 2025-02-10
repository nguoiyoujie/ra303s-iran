;----------------------------------------------------------------
; src/features/prerequisitedsystem/house_trackers.asm
;
; Internally, the HouseClass shall maintain some trackers for quick comparison with prerequisite tables and other compare functions.
; Originally the following were used:
;    [<HouseClass>] BScan
;    [<HouseClass>] ActiveBScan
;    [<HouseClass>] OldBScan
;    [<HouseClass>] BQuantity
;   
; We now simplify to the following
;    [<HouseClass>] BScan
;    [<HouseClass>] BPreGroupScan
;    [<HouseClass>] NewBQuantity (expanded to support 256 entries)
;    (Global) BSignificantScan (to mask out Insignificant entries)
;    
; 
; This function is enabled by default and is not controllable.
;----------------------------------------------------------------

cextern BuildingClass.Count

; AI will use the same memory as human players, since we maintain one BScan in the future
@SET 0x004D4096,{mov eax,[esi+HouseClass.Offset.BPreGroupScan]} ; 0x13B (HouseClass.Offset.ActiveBScan) // HouseClass::Can_Build
@SJMP 0x004D409C,0x004D40A7 ;_HouseClass__Can_Build ; skip AI using OldBScan
; with the new system, do not combine the STRUCTF_ADVANCED_POWER with STRUCTF_POWER, or STRUCTF_SOVIET_TECH with STRUCTF_ADVANCED_TECH
@SJMP 0x004D40AD,0x004D40CE ;_HouseClass__Can_Build ; skip hardcoded flag combinations

;@SET 0x00456A86,{add ebx,HouseClass.Offset.BPreGroupScan} ; 0x137 (HouseClass.Offset.BScan) // BuildingClass::Unlimbo
;@SET 0x00456AE2,{add edx,HouseClass.Offset.BPreGroupScan} ; 0x13B (HouseClass.Offset.ActiveBScan) // BuildingClass::Unlimbo // skipped

@SET 0x004D46DF,{cmp dword[edi+HouseClass.Offset.BPreGroupScan],0} ; 0x13B (HouseClass.Offset.ActiveBScan) // HouseClass::AI (Sell control)
@SET 0x004B4BD9,{cmp dword[edx+HouseClass.Offset.BPreGroupScan],0} ; 0x137 (HouseClass.Offset.BScan) // DisplayClass::Sell_Mode_Control
@SET 0x004B4C81,{cmp dword[edx+HouseClass.Offset.BPreGroupScan],0} ; 0x137 (HouseClass.Offset.BScan) // DisplayClass::Repair_Mode_Control

@SJMP 0x004FE191,0x004FE196 ; test skip HouseClass__Recalc_Attributes
@CLEAR_INT 0x004DD0DC,0x004DD907 ; clear HouseClass__Recalc_Attributes

; ecx is the techno
; IsInPlay = IsLocked &&  (!IsInLimbo | IsInTransport) && (!Owner->IsHuman | IsDiscoveredByPlayer)
%macro Techno_CheckInPlay 0
    push eax
    push ebx
    push edx
  %%CheckLocked:
    TechnoClass.IsLocked.Get(ecx,bh)
    test bh,bh
    jz   %%CompareInPlay
  %%CheckLimboAndTransport:
    ObjectClass.IsInLimbo.Get(ecx,dl)
    test dl,dl
    jz   %%CheckHouseAndDiscovery
    TechnoClass.IsInTransport.Get(ecx,dh)
    and  bh,dh
    jz   %%CompareInPlay
  %%CheckHouseAndDiscovery:
    TechnoClass.IsDiscoveredByPlayer.Get(ecx,dl)
    test dl,dl
    jnz  %%CompareInPlay
    TechnoClass.House.Get(ecx,edx)
    mov  eax,edx
    HouseClass.FromIndex(eax,edx)
    HouseClass.IsHuman.Get(edx,bl)
    dec  bl
    and  bh,bl
  %%CompareInPlay:
    TechnoClass.IsInPlay.Get(ecx,al)
    cmp  bh,al
    je   %%Ret
  %%Update:
    TechnoClass.IsInPlay.Set(ecx,bh)
    AbstractClass.RTTI.Get(ecx,al)
    mov  ah,bh
    cmp  al,RTTIType.Infantry
    je   %%Update.Infantry  
    cmp  al,RTTIType.Unit
    je   %%Update.Unit  
    cmp  al,RTTIType.Building
    je   %%Update.Building  
    cmp  al,RTTIType.Aircraft
    je   %%Update.Aircraft      
    cmp  al,RTTIType.Vessel
    je   %%Update.Vessel
    jmp  %%Ret

  %%Update.Infantry:
    TechnoClass.House.Get(ecx,edx)
    HouseClass.FromIndex(edx,ebx)
    InfantryClass.Class.Get(ecx,edx)
    test ah,ah
    jz   %%Update.Infantry.Dec
  %%Update.Infantry.Inc:
    inc  dword[ebx+edx*4+HouseClass.Offset.NewActiveIQuantity]
    cmp  dword[ebx+edx*4+HouseClass.Offset.NewActiveIQuantity],1
    jne  %%Ret
    jmp  %%Update.Infantry.Call
  %%Update.Infantry.Dec:
    dec  dword[ebx+edx*4+HouseClass.Offset.NewActiveIQuantity]
    jnz  %%Ret
  %%Update.Infantry.Call:
    mov  eax,edx
    mov  edx,ecx
    call House_Recalc_Attributes_ActiveInfantry
    jmp  %%Ret

  %%Update.Unit:
    TechnoClass.House.Get(ecx,edx)
    HouseClass.FromIndex(edx,ebx)
    UnitClass.Class.Get(ecx,edx)
    test ah,ah
    jz   %%Update.Unit.Dec
  %%Update.Unit.Inc:
    inc  dword[ebx+edx*4+HouseClass.Offset.NewActiveUQuantity]
    cmp  dword[ebx+edx*4+HouseClass.Offset.NewActiveUQuantity],1
    jne  %%Ret
    jmp  %%Update.Unit.Call
  %%Update.Unit.Dec:
    dec  dword[ebx+edx*4+HouseClass.Offset.NewActiveUQuantity]
    jnz  %%Ret
  %%Update.Unit.Call:
    mov  eax,edx
    mov  edx,ecx
    call House_Recalc_Attributes_ActiveUnit
    jmp  %%Ret

  %%Update.Building:
    TechnoClass.House.Get(ecx,edx)
    HouseClass.FromIndex(edx,ebx)
    BuildingClass.Class.Get(ecx,edx)
    test ah,ah
    jz   %%Update.Building.Dec
  %%Update.Building.Inc:
    inc  dword[ebx+edx*4+HouseClass.Offset.NewActiveBQuantity]
    cmp  dword[ebx+edx*4+HouseClass.Offset.NewActiveBQuantity],1
    jne  %%Ret
    jmp  %%Update.Building.Call
  %%Update.Building.Dec:
    dec  dword[ebx+edx*4+HouseClass.Offset.NewActiveBQuantity]
    jnz  %%Ret
  %%Update.Building.Call:
    mov  eax,edx
    mov  edx,ecx
    call House_Recalc_Attributes_ActiveBuilding
    jmp  %%Ret

  %%Update.Aircraft:
    TechnoClass.House.Get(ecx,edx)
    HouseClass.FromIndex(edx,ebx)
    AircraftClass.Class.Get(ecx,edx)
    test ah,ah
    jz   %%Update.Aircraft.Dec
  %%Update.Aircraft.Inc:
    inc  dword[ebx+edx*4+HouseClass.Offset.NewActiveAQuantity]
    cmp  dword[ebx+edx*4+HouseClass.Offset.NewActiveAQuantity],1
    jne  %%Ret
    jmp  %%Update.Aircraft.Call
  %%Update.Aircraft.Dec:
    dec  dword[ebx+edx*4+HouseClass.Offset.NewActiveAQuantity]
    jnz  %%Ret
  %%Update.Aircraft.Call:
    mov  eax,edx
    mov  edx,ecx
    call House_Recalc_Attributes_ActiveAircraft
    jmp  %%Ret

  %%Update.Vessel:
    TechnoClass.House.Get(ecx,edx)
    HouseClass.FromIndex(edx,ebx)
    VesselClass.Class.Get(ecx,edx)
    test ah,ah
    jz   %%Update.Vessel.Dec
  %%Update.Vessel.Inc:
    inc  dword[ebx+edx*4+HouseClass.Offset.NewActiveVQuantity]
    cmp  dword[ebx+edx*4+HouseClass.Offset.NewActiveVQuantity],1
    jne  %%Ret
    jmp  %%Update.Vessel.Call
  %%Update.Vessel.Dec:
    dec  dword[ebx+edx*4+HouseClass.Offset.NewActiveVQuantity]
    jnz  %%Ret
  %%Update.Vessel.Call:
    mov  eax,edx
    mov  edx,ecx
    call House_Recalc_Attributes_ActiveVessel
    jmp  %%Ret

  %%Ret:
    pop  edx
    pop  ebx
    pop  eax
%endmacro


; arg <HouseClass.Offset.NewXQuantity> <HouseClass.Offset.NewXScan>
; ebx is house, al is technotype id, edx is techno (note: not technotype)
%macro House_Recalc_Attributes_X 2
    push edx
    push ecx
    push ebx
    push eax
    push esi
    movzx eax,al
    mov  esi,eax
    mov  dword edx,[ebx+%1+esi*4]
  %%CheckOne:
    mov  ecx,esi
    lea  ebx,[ebx+%2]
    mov  eax,ecx
    shr  eax,3
    add  ebx,eax
    and  ecx,7
    mov  al,1
    shl  al,cl
    test edx,edx
    jnz  %%SetOne
  %%ClearOne:
    inc  al
    neg  al
    and  byte[ebx],al
    jmp  %%Ret
  %%SetOne:
    or   byte[ebx],al
  %%Ret:
    pop  esi
    pop  eax
    pop  ebx
    pop  ecx
    pop  edx
    ret
%endmacro


@HACK 0x00456A62,0x00456A69,_BuildingClass__Unlimbo_Set_NewActiveBScan
    ;HouseClass.FromIndex([eax],ebx)
    ; esi is the buildingclass
    ;BuildingClass.Class.Get(esi,edx)
    ;BuildingTypeClass.FromIndex(edx,ecx)
    ;TechnoTypeClass.PrereqType.Get(ecx,al)
    ;mov  cl,al
    ;mov  eax,1
    ;shl  eax,cl
    ;or   dword[ebx+HouseClass.Offset.BPreGroupScan],eax
    lea  eax,[esi+0x93]
    jmp  0x00456B1D
@ENDHACK


;@HACK 0x00456AC1,0x00456ACA,_BuildingClass__Unlimbo_Skip_ActiveBScan
;    lea  eax,[esi+0x93]
;    jmp  0x00456B1D
;@ENDHACK


;@HACK 0x00456AA5,0x00456AAB,_BuildingClass__Unlimbo_ReplaceTypeWithPrereqType1
;    mov  ecx,[eax+TechnoTypeClass.Offset.PrereqType-3]
;    jmp  0x00456AAB
;@ENDHACK


;@HACK 0x00456B01,0x00456B07,_BuildingClass__Unlimbo_ReplaceTypeWithPrereqType2 ; skipped
;    ; clashes with DeploysInto logic,as buildings will perform Unlimbo but be deleted thereafter
;    mov  ecx,dword[eax+TechnoTypeClass.Offset.PrereqType-3]
;    jmp  0x00456B07
;@ENDHACK


; Update IsInPlay
@HACK 0x005643D0,0x005643D5,_TechnoClass__AI_Update_PlayState
    sub  esp,0x10
    mov  ecx,eax
    Techno_CheckInPlay
    jmp  0x005643D5
@ENDHACK


;005626a1 ;TechnoClass__Unlimbo(




[section .text]
; reimplementation, basing on Tracking_Add and Tracking_Remove
; ebx is house, al is technotype id, edx is techno (note: not technotype)
House_Recalc_Attributes_Aircraft:
    House_Recalc_Attributes_X HouseClass.Offset.NewAQuantity,HouseClass.Offset.NewAScan


House_Recalc_Attributes_ActiveAircraft:
    House_Recalc_Attributes_X HouseClass.Offset.NewActiveAQuantity,HouseClass.Offset.NewActiveAScan


House_Recalc_Attributes_Building:
    House_Recalc_Attributes_X HouseClass.Offset.NewBQuantity,HouseClass.Offset.NewBScan


House_Recalc_Attributes_Infantry:
    House_Recalc_Attributes_X HouseClass.Offset.NewIQuantity,HouseClass.Offset.NewIScan


House_Recalc_Attributes_ActiveInfantry:
    House_Recalc_Attributes_X HouseClass.Offset.NewActiveIQuantity,HouseClass.Offset.NewActiveIScan


House_Recalc_Attributes_Unit:
    House_Recalc_Attributes_X HouseClass.Offset.NewUQuantity,HouseClass.Offset.NewUScan


House_Recalc_Attributes_ActiveUnit:
    House_Recalc_Attributes_X HouseClass.Offset.NewActiveUQuantity,HouseClass.Offset.NewActiveUScan


House_Recalc_Attributes_Vessel:
    House_Recalc_Attributes_X HouseClass.Offset.NewVQuantity,HouseClass.Offset.NewVScan


House_Recalc_Attributes_ActiveVessel:
    House_Recalc_Attributes_X HouseClass.Offset.NewActiveVQuantity,HouseClass.Offset.NewActiveVScan


; reimplementation, basing on TechnoType__AI()
; ebx is house, al is technotype id, edx is techno (note: not technotype)
House_Recalc_Attributes_ActiveBuilding:
    push edx
    push ecx
    push ebx
    push eax
    push esi
    movzx eax,al
    mov  esi,eax

    ; if the building is removed, we should clear all and rescan everything, since we will need to requery multiple types for BPreGroupScan. 
    BuildingTypeClass.FromIndex(eax,edx)
    cmp  dword[ebx+HouseClass.Offset.NewActiveBQuantity+esi*4],0
    je   .ClearAll
.SetOne:
    ; All special fields can be ORed.
    ; BPreGroupScan
    TechnoTypeClass.PrereqType.Get(edx,cl)
    mov  eax,1
    shl  eax,cl
    or   dword[ebx+HouseClass.Offset.BPreGroupScan],eax
    ; SpecialScan
    BuildingTypeClass.SpecialWeapons.Get(edx,eax)
    or   dword[ebx+HouseClass.Offset.SpecialScan],eax
    ; IsRadar
    BuildingTypeClass.IsRadar.Get(edx,al)
    test al,al
    jz   .SetOne.NoRadar
    HouseClass.Radar.Set(ebx,al) 
.SetOne.NoRadar:
    ; ActiveBScan
    mov  ecx,esi
    lea  ebx,[ebx+HouseClass.Offset.NewActiveBScan]
    mov  eax,ecx
    shr  eax,3
    add  ebx,eax
    and  ecx,7
    mov  al,1
    shl  al,cl
    or   byte[ebx],al
    jmp  .Ret

.ClearAll:
    ;Reset for recalc
    mov  dword edx,[ebx+HouseClass.Offset.ID]
    xor  ecx,ecx
    HouseClass.BPreGroupScan.Set(ebx,ecx)
    HouseClass.SpecialScan.Set(ebx,ecx)
    HouseClass.Radar.Set(ebx,cl)
    push edx
    lea  eax,[ebx+HouseClass.Offset.NewActiveBScan]
    mov  edx,8
.RepeatZero:
    mov  dword[eax],ecx
    dec  edx
    add  eax,4
    cmp  edx,0
    jg   .RepeatZero
    pop  edx
    ; ebx = houseclass, edx = house id, ecx = 0

.Repeat:
    mov  dword eax,[ebx+HouseClass.Offset.NewActiveBQuantity+ecx*4]
    test eax,eax
    jz   .Next
    push ebx
    push ecx
    ; ebx = houseclass, ecx = techno index
    mov  dword eax,[ebx+HouseClass.Offset.ID]
    push ebx
    lea  ebx,[ebx+HouseClass.Offset.NewActiveBScan]
    mov  eax,ecx
    shr  eax,3
    add  ebx,eax
    and  ecx,7
    mov  al,1
    shl  al,cl
    or   byte[ebx],al
    pop  ebx ; House ID
    pop  ecx ; building type ID
    push ecx
    BuildingTypeClass.FromIndex(ecx,edx)
    ; Set special types
    BuildingTypeClass.SpecialWeapons.Get(edx,eax)
    or   dword[ebx+HouseClass.Offset.SpecialScan],eax
    ; Set IsRadar
    BuildingTypeClass.IsRadar.Get(edx,al)
    test al,al
    jz   .NoRadar
    HouseClass.Radar.Set(ebx,al)  
.NoRadar:
    ; Set Prereq group
    TechnoTypeClass.PrereqType.Get(edx,cl)
    mov  eax,1
    shl  eax,cl
    pop  ecx ; building type ID
    pop  ebx ; house
    or   dword[ebx+HouseClass.Offset.BPreGroupScan],eax
.Next:
    inc  cl
    cmp  cl,[BuildingTypeClass.Count]
    jb   .Repeat
.Ret:
    pop  esi
    pop  eax
    pop  ebx
    pop  ecx
    pop  edx
    ret


