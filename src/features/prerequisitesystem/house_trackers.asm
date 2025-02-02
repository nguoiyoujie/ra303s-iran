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
    mov  esi,[eax+0x93]
    push ecx
    push esi
    ; we want to set Houses.BScan[<houseID> * 256<buildingtypeID>]
    ; SetBit <byte> <Bit>
    ;   <byte> = <houseID> * 32<buildingtypeID> >> 3
    ;   <Bit>  = <buildingtypeID> & 0x7
    lea  ebx,[Houses.BScan]
    shl  esi,5
    add  ebx,esi
    mov  esi,ecx
    shr  esi,3
    add  ebx,esi
    and  ecx,7
    mov  al,1
    shl  al,cl
    or   byte[ebx],al
    pop  ebx ; House ID
    pop  ecx ; building type ID
    BuildingTypeClass.FromIndex(ecx,eax)
    mov  ecx,eax
    ; Set special types
    xor  eax,eax
    push ecx
    BuildingTypeClass.SpecialWeapons.Get(ecx,ax)
    lea  ecx,[Houses.SpecialScan]
    lea  ecx,[ecx+ebx*4]
    or   dword[ecx],eax   
    ; Set IsRadar
    pop  ecx ; building type ID
    BuildingTypeClass.IsRadar.Get(ecx,al)
    lea  ecx,[Houses.Radar]
    lea  ecx,[ecx+ebx]
    or   byte[ecx],al   
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
;    BuildingTypeClass.SpecialWeapons.Get(ecx,ax)
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

