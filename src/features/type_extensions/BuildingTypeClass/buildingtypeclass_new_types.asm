;----------------------------------------------------------------
; src/features/type_extensions/BuildingTypeClass/buildingtypeclass_new_types.asm
;
; Continuation of Iran's work in enabling the game to use new BuildingTypeClass.
; 
; This function is enabled by including the section [BuildingTypes] in Rules.ini. This section includes an indexed array of names of buildings to load.
;   [BuildingTypes]
;   0=OBEL
; 
; No compatibility issues is expected as the original game lack the ability to add new types.
;
;----------------------------------------------------------------

@HOOK 0x004537C4 _BuildingTypeClass__From_Name_Unhardcode_BuildingTypes_Count
@HOOK 0x0045359B _BuildingTypeClass__Init_Heap_UnhardCode_BuildingTypes
@HOOK 0x00453709 _BuildingTypeClass__One_Time_UnhardCode_BuildingTypes
@HOOK 0x004596B3 _BuildingClass__Update_Buildables_UnhardCode_BuildingTypes
@HOOK 0x004F40A5 _Init_Game_Set_BuildingTypes_Heap_Count

; BuildingTypeClass::BuildingTypeClass
; convert sar edx,18 to shr edx,18
@CLEAR 0x00429D43 0xEA 0x00429D44
@CLEAR 0x00429D4B 0xEA 0x00429D4C

; BuildingTypeClass::As_Reference
; convert movsx to movzx
@CLEAR 0x00453A77 0xB6 0x00453A78

; TFixedIHeapClass<BuildingTypeClass>::Ptr
; convert sar ecx,18 to shr ecx,18
@CLEAR 0x00457EB8 0xE9 0x00457EB9
@CLEAR 0x00457ED7 0xE9 0x00457ED8

; BuildingClass::AI
; convert movsx to movzx
@CLEAR 0x004566C9 0xB6 0x004566CA

; BuildingClass::Animation_AI
; convert movsx to movzx
@CLEAR 0x004603B0 0xB6 0x004603B1

_BuildingTypeClass__Init_Heap_UnhardCode_BuildingTypes:

    Loop_Over_RULES_INI_Section_Entries str_BuildingTypes,Init_BuildingTypeClass
    call Init_OverrideExistingBuildingTypes

.Ret:
    lea  esp,[ebp-14h]
    pop  edi
    pop  esi
    pop  edx
    jmp  0x004535A1


Init_BuildingTypeClass:
    mov  eax,BuildingTypeClass.NEW_SIZE
    call BuildingTypeClass__new
    test eax,eax
    jz   .Ret

    push eax
    mov  eax,edx
    ; edx should have the name of the INI section already
    call __strdup
    mov  ecx,eax

    pop  eax
    mov  edx,ebx
    add  edx,BuildingTypeClass.ORIGINAL_MAX ; BuildingType

    push 0
    push 0x005FEAF6 ; offset short const List22[]
    push 0
    push BSIZE_22 ;2x2 building size
    push 0
    push 0
    push 1
    push 0
    push 0
    push 0
    push 1
    push 1
    push 0
    push 1
    push 0
    push 0
    push 1
    push 0
    push 0
    push 0
    push 0
    push 2
    push 0

    ; apply offset names
    push eax
    cmp  dword [stringtableoffset_newbuildingtypes],-1
    je   .Default_Name
.Offset_Name:
    add  ebx,dword [stringtableoffset_newbuildingtypes]
    jmp  .Continue 
.Default_Name:
    mov  ebx,305 ; Civilian Building
.Continue:
    pop  eax

    mov  dword [0x005FE83C],6
    push 0FFFFFFFFh
    call BuildingTypeClass__BuildingTypeClass
.Ret:
    retn


Init_OverrideExistingBuildingTypes:
    ; explicit set default PrereqType values for compatibility

    BuildingTypeClass.FromIndex(BuildingType.ATEK,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.TECH)

    BuildingTypeClass.FromIndex(BuildingType.IRON,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.ADV.WEAPON1)

    BuildingTypeClass.FromIndex(BuildingType.WEAP,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.WARFACTORY)
    BuildingTypeClass.WarFactoryOverlayAnim.Set(edi,-1)
    BuildingTypeClass.WarFactoryOverlayFrames.Set(edi,4)
    BuildingTypeClass.WarFactoryOverlayRate.Set(edi,8)

    BuildingTypeClass.FromIndex(BuildingType.PDOX,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.ADV.WEAPON1)

    BuildingTypeClass.FromIndex(BuildingType.PBOX,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.DEFENSE)

    BuildingTypeClass.FromIndex(BuildingType.HBOX,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.DEFENSE)

    BuildingTypeClass.FromIndex(BuildingType.DOME,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.RADAR)

    BuildingTypeClass.FromIndex(BuildingType.GAP,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.NONE)

    BuildingTypeClass.FromIndex(BuildingType.GUN,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.DEFENSE)

    BuildingTypeClass.FromIndex(BuildingType.AGUN,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.AA.DEFENSE)

    BuildingTypeClass.FromIndex(BuildingType.FTUR,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.DEFENSE)

    BuildingTypeClass.FromIndex(BuildingType.FACT,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.CONYARD)
    BuildingTypeClass.UndeploysInto.Set(edi,UnitType.MCV)

    BuildingTypeClass.FromIndex(BuildingType.PROC,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.REFINERY)

    BuildingTypeClass.FromIndex(BuildingType.SILO,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.ORESILO)

    BuildingTypeClass.FromIndex(BuildingType.HPAD,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.HELIPAD)

    BuildingTypeClass.FromIndex(BuildingType.SAM,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.AA.DEFENSE)

    BuildingTypeClass.FromIndex(BuildingType.AFLD,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.AIRSTRIP)

    BuildingTypeClass.FromIndex(BuildingType.POWR,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.POWER)

    BuildingTypeClass.FromIndex(BuildingType.APWR,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.POWER)

    BuildingTypeClass.FromIndex(BuildingType.STEK,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.TECH)

    BuildingTypeClass.FromIndex(BuildingType.HOSP,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.NONE)

    BuildingTypeClass.FromIndex(BuildingType.BARR,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.BARRACKS)

    BuildingTypeClass.FromIndex(BuildingType.TENT,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.BARRACKS)

    BuildingTypeClass.FromIndex(BuildingType.KENN,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.BARRACKS)

    BuildingTypeClass.FromIndex(BuildingType.FIX,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.REPAIR)

    BuildingTypeClass.FromIndex(BuildingType.BIO,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.NONE)

    BuildingTypeClass.FromIndex(BuildingType.MISS,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.NONE)

    BuildingTypeClass.FromIndex(BuildingType.SYRD,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.SHIPYARD)

    BuildingTypeClass.FromIndex(BuildingType.SPEN,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.SHIPYARD)

    BuildingTypeClass.FromIndex(BuildingType.MSLO,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.ADV.WEAPON2)

    BuildingTypeClass.FromIndex(BuildingType.FCOM,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.NONE)

    BuildingTypeClass.FromIndex(BuildingType.TSLA,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.ADV.DEFENSE)

    BuildingTypeClass.FromIndex(BuildingType.WEAF,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.FAKES)
    BuildingTypeClass.WarFactoryOverlayAnim.Set(edi,-1)
    BuildingTypeClass.WarFactoryOverlayFrames.Set(edi,4)
    BuildingTypeClass.WarFactoryOverlayRate.Set(edi,8)
	
    BuildingTypeClass.FromIndex(BuildingType.FACF,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.FAKES)

    BuildingTypeClass.FromIndex(BuildingType.SYRF,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.FAKES)

    BuildingTypeClass.FromIndex(BuildingType.SPEF,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.FAKES)

    BuildingTypeClass.FromIndex(BuildingType.DOMF,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.FAKES)

    retn


_BuildingTypeClass__From_Name_Unhardcode_BuildingTypes_Count:
    mov  dl,byte [ebp-0xc]
    inc  dl
    mov  byte [ebp-0xc],dl
    mov  al,byte [NewBuildingTypeHeapCount]
    cmp  dl,al
    jb   0x004537D8
    jmp  0x004537D1


_BuildingTypeClass__One_Time_UnhardCode_BuildingTypes:
    mov  bl,byte [ebp-0x18]
    inc  bl
    mov  byte [ebp-0x18],bl
    mov  al,byte [NewBuildingTypeHeapCount]
    cmp  bl,al
    jb   0x004535BD
    jmp  0x0045371A


_BuildingClass__Update_Buildables_UnhardCode_BuildingTypes:
    ;push ebx
    mov  bh,byte [ebp-0x20] ; was bh
    inc  bh
    mov  byte [ebp-0x20],bh
    mov  al,byte [NewBuildingTypeHeapCount]
    cmp  bh,al
    ;pop  ebx
    jb   0x0045967A
    jmp  0x004596C0


_Init_Game_Set_BuildingTypes_Heap_Count:
    ; update the stringtableoffset,if defined in Rules
    call_INIClass__Get_Int Globals___RuleINI,str_StringTableOffsets,str_Building,[stringtableoffset_newbuildingtypes]
    mov  [stringtableoffset_newbuildingtypes],eax

    ; update heap count
    Get_RULES_INI_Section_Entry_Count str_BuildingTypes
    mov  [BuildingTypesExtCount],eax
    mov  edx,eax
    add  edx,BuildingTypeClass.ORIGINAL_MAX
    mov  [NewBuildingTypeHeapCount],edx
    jmp  0x004F40AA
