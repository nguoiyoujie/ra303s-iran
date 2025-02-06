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

;cextern Houses.BScan
;cextern Houses.SpecialScan
;cextern Houses.Radar
cextern BuildingClass.Count

; AI will use the same memory as human players, since we maintain one BScan in the future
@SET 0x004D4096,{mov eax,[esi+HouseClass.Offset.BPreGroupScan]} ; 0x13B (HouseClass.Offset.ActiveBScan) // HouseClass::Can_Build
@SJMP 0x004D409C,0x004D40A7 ;_HouseClass__Can_Build ; skip AI using OldBScan
; with the new system, do not combine the STRUCTF_ADVANCED_POWER with STRUCTF_POWER, or STRUCTF_SOVIET_TECH with STRUCTF_ADVANCED_TECH
@SJMP 0x004D40AD,0x004D40CE ;_HouseClass__Can_Build ; skip hardcoded flag combinations

@SET 0x00456A86,{add ebx,HouseClass.Offset.BPreGroupScan} ; 0x137 (HouseClass.Offset.BScan) // BuildingClass::Unlimbo
;@SET 0x00456AE2,{add edx,HouseClass.Offset.BPreGroupScan} ; 0x13B (HouseClass.Offset.ActiveBScan) // BuildingClass::Unlimbo // skipped

@SJMP  0x004DD5BF,0x004DD631 ; 0x004DD5D1 to skip just the ID < 32 check // skip original HouseClass.Offset.BScan
;@LJMP 0x004DD5BF,_HouseClass__Recalc_Attributes_ReplaceTypeWithPrereqType1
;@SET 0x004DD61D,TechnoTypeClass.Offset.PrereqType-3 ; skipped
@SET 0x004DD6A6,{add esi,HouseClass.Offset.BPreGroupScan} ; 0x13B (HouseClass.Offset.ActiveBScan) // HouseClass::Recalc_Attributes // skipped
@SJMP  0x004DD6E8,0x004DD73C
;@LJMP 0x004DD728,_HouseClass__Recalc_Attributes_ReplaceTypeWithPrereqType4 // skipped
;@SET 0x004DD5F9,{add esi,HouseClass.Offset.BPreGroupScan} ; 0x137 (HouseClass.Offset.BScan) // HouseClass::Recalc_Attributes
;@SET 0x004DD708,{lea eax,[ecx+HouseClass.Offset.BPreGroupScan]} ; 0x13F (HouseClass.Offset.OldBScan) // HouseClass::Recalc_Attributes // skipped

@SET 0x004D46DF,{cmp dword[edi+HouseClass.Offset.BPreGroupScan],0} ; 0x13B (HouseClass.Offset.ActiveBScan) // HouseClass::AI (Sell control)
@SET 0x004B4BD9,{cmp dword[edx+HouseClass.Offset.BPreGroupScan],0} ; 0x137 (HouseClass.Offset.BScan) // DisplayClass::Sell_Mode_Control
@SET 0x004B4C81,{cmp dword[edx+HouseClass.Offset.BPreGroupScan],0} ; 0x137 (HouseClass.Offset.BScan) // DisplayClass::Repair_Mode_Control

;@SET 0x004DD0DC,{ret} ; test skip HouseClass__Recalc_Attributes

@HACK 0x00456AC1,0x00456ACA,_BuildingClass__Unlimbo_Skip_ActiveBScan
    lea  eax,[esi+0x93]
    jmp  0x00456B1D
@ENDHACK


@HACK 0x00456AA5,0x00456AAB,_BuildingClass__Unlimbo_ReplaceTypeWithPrereqType1
    mov  ecx,[eax+TechnoTypeClass.Offset.PrereqType-3]
    jmp  0x00456AAB
@ENDHACK


; The type location offset is 0x1A4, but the game code extracts from 0x1A1, then performs a bit shift by 18 places to emulate masking.
; Our new location is TechnoTypeClass.Offset.PrereqType, so we replace 0x1A1 with TechnoTypeClass.Offset.PrereqType-3.
@HACK 0x004DD6CA,0x004DD6D0,_HouseClass__Recalc_Attributes_ReplaceTypeWithPrereqType3
    push esi
    push ecx
    push ebx
    push eax
    mov  ecx,[ecx+BuildingTypeClass.Offset.Type-3]
    shr  ecx,0x18
    ; ecx is now the building type ID
    ; eax+0x93 (TechnoClass->House) contains the id of the house it belongs to
    mov  eax,[eax+0x93]
    push ecx
    HouseClass.FromIndex(eax,ebx)
    push ebx
    lea  ebx,[ebx+HouseClass.Offset.NewBScan]
    ; we want to set Houses.BScan[<houseID> * 256<buildingtypeID>]
    ; SetBit <byte> <Bit>
    ;   <byte> = <houseID> * 32<buildingtypeID> >> 3
    ;   <Bit>  = <buildingtypeID> & 0x7
    mov  esi,ecx
    shr  esi,3
    add  ebx,esi
    and  ecx,7
    mov  al,1
    shl  al,cl
    or   byte[ebx],al
    pop  ebx ; House class
    pop  ecx ; building type ID
    BuildingTypeClass.FromIndex(ecx,eax)
    mov  ecx,eax
    ; Set special types
    BuildingTypeClass.SpecialWeapons.Get(ecx,eax)
    or   dword[ebx+HouseClass.Offset.SpecialScan],eax
    ; Set IsRadar
    BuildingTypeClass.IsRadar.Get(ecx,al)
    test al,al
    jz   .NoRadar
    HouseClass.Radar.Set(ebx,al)  
.NoRadar:
    pop  eax
    pop  ebx
    pop  ecx
    pop  esi
    mov  ecx,[ecx+TechnoTypeClass.Offset.PrereqType-3]
    jmp  0x004DD6D0
@ENDHACK


;_HouseClass__Recalc_Attributes_ReplaceTypeWithPrereqType4:
;    push eax
;    push ecx
;    mov  ecx,[ecx+TechnoTypeClass.Offset.PrereqType-3]
;    mov  esi,0x1
;    shr  ecx,0x18
;    shl  esi,cl
;    mov  ecx,esi
;    or   dword[eax],ecx
;    pop  ecx
;    pop  eax
;; Set special types
;    push ebx
;    xor  ebx,ebx
;    lea  eax,[eax-0x13F]
;    mov  bl,byte[eax+1] ; ID
;    xor  eax,eax
;    push ecx
;    BuildingTypeClass.SpecialWeapons.Get(ecx,eax)
;    lea  ecx,[Houses.SpecialScan]
;    lea  ecx,[ecx+ebx*4]
;    or   dword[ecx],eax   
;; Set IsRadar
;    pop  ecx
;    BuildingTypeClass.IsRadar.Get(ecx,al)
;    lea  ecx,[Houses.Radar]
;    lea  ecx,[ecx+ebx]
;    or   byte[ecx],al   
;    pop  ebx
;    jmp  0x004DD73C


;@HACK 0x00456B01,0x00456B07,_BuildingClass__Unlimbo_ReplaceTypeWithPrereqType2 ; skipped
;    ; clashes with DeploysInto logic,as buildings will perform Unlimbo but be deleted thereafter
;    mov  ecx,dword[eax+TechnoTypeClass.Offset.PrereqType-3]
;    jmp  0x00456B07
;@ENDHACK


[section .text]
; reimplementation, basing on Tracking_Add and Tracking_Remove
; ebx is house, al is technotype id, edx is techno (note: not technotype)
House_Recalc_Attributes_Buildings:
    push edx
    push ecx
    push ebx
    push eax
    push esi
    movzx eax,al
    mov  esi,eax
    ;jmp  .ClearAll
    ; test if we need to clear and scan all, or just handle scan only
    BuildingTypeClass.FromIndex(eax,edx)
    BuildingTypeClass.SpecialWeapons.Get(edx,ecx)
    test ecx,ecx
    jnz  .ClearAll
    BuildingTypeClass.IsRadar.Get(edx,cl)
    test cl,cl
    jnz  .ClearAll
    mov  dword edx,[ebx+HouseClass.Offset.NewBQuantity+esi*4] ; if this is a removal, we should clear all anyway since we need to requery multiple types for BPreGroupScan.
    test edx,edx
    jz   .ClearAll
.CheckOne:
    ; Building does not require refreshing of special fields (e.g. Radar). Just update the BScan and BPreGroupScan fields accordingly
    ;mov  dword eax,[ebx+HouseClass.Offset.ID]
    ;lea  ebx,[Houses.BScan]
    ;shl  eax,5
    ;add  ebx,eax
    lea  ebx,[ebx+HouseClass.Offset.NewBScan]
    mov  eax,ecx
    shr  eax,3
    add  ebx,eax
    and  ecx,7
    mov  al,1
    shl  al,cl
    test edx,edx
    jnz  .SetOne
.ClearOne:
    inc  al
    neg  al
    and  byte[ebx],al
    jmp  .Ret
.SetOne:
    or   byte[ebx],al
    jmp  .Ret

.ClearAll:
    ;Reset for recalc
    mov  dword edx,[ebx+HouseClass.Offset.ID]
    xor  ecx,ecx
    ;mov  dword[ebx+HouseClass.Offset.BScan],ecx
    ;mov  dword[ebx+HouseClass.Offset.ActiveBScan],ecx
    ; zero out 32-bit SpecialScan
    HouseClass.SpecialScan.Set(ebx,ecx)
    ; zero out 8-bit Radar
    HouseClass.Radar.Set(ebx,cl)
    ; zero out 256-bit BScan
    push edx
    lea  eax,[ebx+HouseClass.Offset.NewBScan]
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
    mov  dword eax,[ebx+HouseClass.Offset.NewBQuantity+ecx*4]
    test eax,eax
    jz   .Next
    push ebx
    push ecx
    ; ebx = houseclass, ecx = techno index
    mov  dword eax,[ebx+HouseClass.Offset.ID]
    push ebx
    ;lea  ebx,[Houses.BScan]
    ;shl  eax,5
    ;add  ebx,eax
    lea  ebx,[ebx+HouseClass.Offset.NewBScan]
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
    TechnoTypeClass.PrereqType.Get(edx,al)
    mov  cl,al
    mov  eax,1
    shl  eax,cl
    pop  ecx ; building type ID
    pop  ebx ; house
    or   dword [ebx+HouseClass.Offset.BPreGroupScan],eax
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

