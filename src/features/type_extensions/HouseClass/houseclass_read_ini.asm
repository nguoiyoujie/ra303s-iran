;----------------------------------------------------------------
; src/features/type_extensions/HouseClass/houseclass_read_ini.asm
;
; Implements the reading of new INI settings, or modifications to existing INI reads, if any.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. 
;
;----------------------------------------------------------------

@HOOK 0x004DDD31 _HouseClass__Read_INI
@HOOK 0x004DDE56 _HouseClass__Read_INI_Optional_House_Neutral_Ally
@HOOK 0x004DDE80 _HouseClass__Read_INI_Optional_House_Neutral_Ally_Patch_Out_Double
@HOOK 0x00540F20 _ScoreClass__Presentation_Proper_Country_Check

    
_HouseClass__Read_INI:
    call 0x004D33E4 ; HouseClass::HouseClass(HousesType)
    mov  [ebp-0x24],eax

    push edx
    push esi
    push edi
    ; HouseClass does not have an INI name. Instead of fetching from HouseTypeClass, grab the existing one in the function
    mov  esi,eax ; HouseClass_This
    mov  edx,edi ; section
    mov  edi,[ebp-0x20] ; INI

    HouseClass.RemapColor.Read1(esi,edi,edx,_GetHouseTypeIDFromIntOrString)
    HouseClass.RemapColor.Read2(esi,edi,edx,_GetHouseTypeIDFromIntOrString)
    HouseClass.ActLike.Read(esi,edi,edx,_GetHouseTypeIDFromIntOrString)
    HouseClass.InstantCapture.Read(esi,edi,edx)
    HouseClass.NoBuildingCrew.Read(esi,edi,edx)
    HouseClass.AllyTheNeutralHouse.Read(esi,edi,edx)
    ;HouseClass.SecondaryColorScheme.Set(esi,0xFF) ; reset color scheme, this completely nullifies reads from earlier INIs (e.g. rules.ini before map.ini...)
    HouseClass.SecondaryColorScheme.Read(esi,edi,edx,_GetHouseTypeIDFromIntOrString)
    HouseClass.HeliUnit.Read(esi,edi,edx,_GetAircraftTypeIDFromString)
    HouseClass.MCVUnit.Read(esi,edi,edx,_GetUnitTypeIDFromString)

    pop  edi
    pop  esi
    pop  edx
    jmp  0x004DDD39


_HouseClass__Read_INI_Optional_House_Neutral_Ally:
    mov  edx,0Ah
    mov  eax,esi
    test byte[esi+HouseClass.Offset.AllyTheNeutralHouse],1 ; offset 1
    jz   .Ret
    call HouseClass__Make_Ally
.Ret:
    jmp  0x004DDE62


_HouseClass__Read_INI_Optional_House_Neutral_Ally_Patch_Out_Double:
    cmp  edx,0x0A ; Neutral house
    jz   .Ret
    call HouseClass__Make_Ally
.Ret:
    jmp  0x004DDE85


_ScoreClass__Presentation_Proper_Country_Check:
    mov  byte dl,[eax+0x41]
    mov  edi,eax
    jmp  0x00540F25
