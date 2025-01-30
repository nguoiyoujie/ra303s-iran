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

; BuildingTypeClass::BuildingTypeClass ; convert sar edx,18 to shr,edx,18
@SET 0x00429D42,{shr edx,0x18} 
@SET 0x00429D4A,{shr edx,0x18}

; BuildingTypeClass::As_Reference ; convert movsx to, movzx
@SET 0x00453A76,{movzx eax,al} 

; TFixedIHeapClass<BuildingTypeClass>::Ptr ; convert sar ecx,18 to shr,ecx,18
@SET 0x00457EB7,{shr ecx,0x18}  
@SET 0x00457ED6,{shr ecx,0x18}  

; BuildingClass::AI ; convert movsx to, movzx
@SET 0x004566C8,{movzx eax,al}  

; BuildingClass::Animation_AI ; convert movsx to, movzx
@SET 0x004603AF,{movzx eax,al} 


@HACK 0x0045359B,0x004535A0,_BuildingTypeClass__Init_Heap_UnhardCode_BuildingTypes
    Loop_Over_RULES_INI_Section_Entries str_BuildingTypes,Init_BuildingTypeClass
    ;mov  edx,[BuildingTypeClass.Count]
    ;dec  edx
    ;mov  [0x005FE83C],edx ; used by deconstructor
    call Init_OverrideExistingBuildingTypes
.Ret:
    lea  esp,[ebp-0x14]
    pop  edi
    pop  esi
    jmp  0x004535A0
@ENDHACK


@HACK 0x00453709,0x0045371A,_BuildingTypeClass__One_Time_UnhardCode_BuildingTypes
    mov  bl,byte[ebp-0x18]
    inc  bl
    mov  byte[ebp-0x18],bl
    mov  al,byte[BuildingTypeClass.Count]
    cmp  bl,al
    jb   0x004535BD
    jmp  0x0045371A
@ENDHACK


@HACK 0x004537C4,0x004537D1,_BuildingTypeClass__From_Name_Unhardcode_BuildingTypes_Count
    mov  dl,byte[ebp-0xC]
    inc  dl
    mov  byte[ebp-0xC],dl
    mov  al,byte[BuildingTypeClass.Count]
    cmp  dl,al
    jb   0x004537D8
    jmp  0x004537D1
@ENDHACK


@HACK 0x004596B3,0x004596C0,_BuildingClass__Update_Buildables_UnhardCode_BuildingTypes
    ;push ebx
    mov  bh,byte[ebp-0x20] ; was bh
    inc  bh
    mov  byte[ebp-0x20],bh
    mov  al,byte[BuildingTypeClass.Count]
    cmp  bh,al
    ;pop  ebx
    jb   0x0045967A
    jmp  0x004596C0
@ENDHACK


@HACK 0x004F40A5,0x004F40AA,_Init_Game_Set_BuildingTypes_Heap_Count
    ; update the stringtableoffset,if defined in Rules
    call_INIClass__Get_Int Globals___RuleINI,str_StringTableOffsets,str_Building,[Rules.StringTableOffsets.BuildingTypes]
    mov  [Rules.StringTableOffsets.BuildingTypes],eax

    ; update heap count
    Get_RULES_INI_Section_Entry_Count str_BuildingTypes
    mov  edx,eax
    add  edx,BuildingTypeClass.ORIGINAL_COUNT
    jmp  0x004F40AA
@ENDHACK


[section .text]
Init_BuildingTypeClass:
    mov  eax,BuildingTypeClass.NEW_SIZE
    call BuildingTypeClass__new
    test eax,eax
    jz   .Ret

    push eax
    mov  eax,edx
    ; edx should have the name of the INI section already
    call _strdup
    mov  ecx,eax

    pop  eax
    mov  edx,ebx
    add  edx,BuildingTypeClass.ORIGINAL_COUNT ; BuildingType

    ; mimic BuildingType ATEK, but using Civilian Building text name
    push 0               ; short const * overlap
    push 0x005FEAF6      ; short const * sizelist
    push 0               ; short const * exitlist
    push BSIZE_22        ; BSizeType size
    push 0               ; DirType sframe
    push 0               ; RTTIType tobuild
    push 1               ; bool is_remappable
    push 0               ; bool is_turret_equipped
    push 0               ; bool is_theater
    push 0               ; bool is_insignificant
    push 1               ; bool is_legal_target
    push 1               ; bool is_selectable
    push 0               ; bool is_stealthy
    push 1               ; bool is_simpledamage
    push 0               ; bool is_wall
    push 0               ; bool is_nominal
    push 1               ; bool is_regulated
    push 0               ; bool is_fake
    push 0               ; int verticaloffset
    push 0               ; int verticaloffset
    push 0               ; int verticaloffset
    push 2               ; RemapType remap
    push 0               ; COORDINATE exitpoint
    push -1             ; FacingType foundation
    ; ecx: char const * ininame
    ; ebx: int name
    ; edx: BuildingType type
    ; eax: BuildingTypeClass object

    ; apply offset names
    push eax
    cmp  dword[Rules.StringTableOffsets.BuildingTypes],-1
    je   .Default_Name
.Offset_Name:
    add  ebx,dword[Rules.StringTableOffsets.BuildingTypes]
    jmp  .Continue 
.Default_Name:
    mov  ebx,305 ; Civilian Building
.Continue:
    pop  eax
    call BuildingTypeClass__BuildingTypeClass
.Ret:
    retn


Init_OverrideExistingBuildingTypes:
    ; explicit set default PrereqType values for compatibility

    BuildingTypeClass.FromIndex(BuildingType.ATEK,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.TECH)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.TECH)

    BuildingTypeClass.FromIndex(BuildingType.IRON,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.ADV.WEAPON1)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.TECH)

    BuildingTypeClass.FromIndex(BuildingType.WEAP,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.WARFACTORY)
    BuildingTypeClass.WarFactoryOverlayAnim.Set(edi,-1)
    BuildingTypeClass.WarFactoryOverlayFrames.Set(edi,4)
    BuildingTypeClass.WarFactoryOverlayRate.Set(edi,8)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.WARFACTORY)

    BuildingTypeClass.FromIndex(BuildingType.PDOX,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.ADV.WEAPON1)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.TECH)

    BuildingTypeClass.FromIndex(BuildingType.PBOX,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.DEFENSE)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.DEFENSE)

    BuildingTypeClass.FromIndex(BuildingType.HBOX,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.DEFENSE)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.DEFENSE)

    BuildingTypeClass.FromIndex(BuildingType.DOME,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.RADAR)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.TECH)

    BuildingTypeClass.FromIndex(BuildingType.GAP,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.NONE)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.TECH)

    BuildingTypeClass.FromIndex(BuildingType.GUN,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.DEFENSE)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.DEFENSE)

    BuildingTypeClass.FromIndex(BuildingType.AGUN,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.AA.DEFENSE)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.AA.DEFENSE)

    BuildingTypeClass.FromIndex(BuildingType.FTUR,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.DEFENSE)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.DEFENSE)

    BuildingTypeClass.FromIndex(BuildingType.FACT,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.CONYARD)
    BuildingTypeClass.UndeploysInto.Set(edi,UnitType.MCV)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.NONE)

    BuildingTypeClass.FromIndex(BuildingType.PROC,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.REFINERY)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.REFINERY)
    BuildingTypeClass.IsRefinery.Set(edi,1)
    BuildingTypeClass.FreeUnit.Set(edi,UnitType.HARV)

    BuildingTypeClass.FromIndex(BuildingType.SILO,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.ORESILO)
    BuildingTypeClass.AIBuildLimit.Set(edi,4)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.GENERIC)
    BuildingTypeClass.IsSilo.Set(edi,1)

    BuildingTypeClass.FromIndex(BuildingType.HPAD,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.HELIPAD)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.HELIPAD)
    BuildingTypeClass.IsHelipad.Set(edi,1)

    BuildingTypeClass.FromIndex(BuildingType.SAM,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.AA.DEFENSE)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.AA.DEFENSE)

    BuildingTypeClass.FromIndex(BuildingType.AFLD,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.AIRSTRIP)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.AIRSTRIP)
    BuildingTypeClass.IsAirfield.Set(edi,1)

    BuildingTypeClass.FromIndex(BuildingType.POWR,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.POWER)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.POWER)

    BuildingTypeClass.FromIndex(BuildingType.APWR,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.POWER)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.POWER)

    BuildingTypeClass.FromIndex(BuildingType.STEK,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.TECH)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.TECH)

    BuildingTypeClass.FromIndex(BuildingType.HOSP,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.NONE)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.NONE)

    BuildingTypeClass.FromIndex(BuildingType.BARR,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.BARRACKS)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.BARRACKS)

    BuildingTypeClass.FromIndex(BuildingType.TENT,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.BARRACKS)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.BARRACKS)

    BuildingTypeClass.FromIndex(BuildingType.KENN,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.NONE)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.TECH)
    BuildingTypeClass.IsKennel.Set(edi,1)

    BuildingTypeClass.FromIndex(BuildingType.FIX,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.REPAIR)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.TECH)
    BuildingTypeClass.IsRepairPad.Set(edi,1)

    BuildingTypeClass.FromIndex(BuildingType.BIO,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.NONE)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.NONE)

    BuildingTypeClass.FromIndex(BuildingType.MISS,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.NONE)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.NONE)

    BuildingTypeClass.FromIndex(BuildingType.SYRD,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.SHIPYARD)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.NONE)

    BuildingTypeClass.FromIndex(BuildingType.SPEN,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.SHIPYARD)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.NONE)

    BuildingTypeClass.FromIndex(BuildingType.MSLO,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.ADV.WEAPON2)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.TECH)

    BuildingTypeClass.FromIndex(BuildingType.FCOM,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.NONE)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.NONE)

    BuildingTypeClass.FromIndex(BuildingType.TSLA,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.ADV.DEFENSE)
    BuildingTypeClass.AIBuildType.Set(edi,AIBuildType.ADV.DEFENSE)

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

    BuildingTypeClass.FromIndex(BuildingType.BARL,edi)
    BuildingTypeClass.SpreadExplosionDamage.Set(edi,200)
    BuildingTypeClass.SpreadExplosionWarhead.Set(edi,3) ;WARHEAD_FIRE

    BuildingTypeClass.FromIndex(BuildingType.BRL3,edi)
    BuildingTypeClass.SpreadExplosionDamage.Set(edi,200)
    BuildingTypeClass.SpreadExplosionWarhead.Set(edi,3) ;WARHEAD_FIRE

    retn

