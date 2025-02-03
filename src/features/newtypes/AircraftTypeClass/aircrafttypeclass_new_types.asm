;----------------------------------------------------------------
; src/features/type_extensions/AircraftTypeClass/aircrafttypeclass_new_types.asm
;
; Continuation of Iran's work in enabling the game to use new AircraftTypeClass.
; 
; This function is enabled by including the section [AircraftTypes] in Rules.ini. This section includes an indexed array of names of aircrafts to load.
;   [AircraftTypes]
;   0=ORCA
; 
; No compatibility issues is expected as the original game lack the ability to add new types.
;
;----------------------------------------------------------------

cextern AircraftTypeClass__AircraftTypeClass
cextern AircraftTypeClass__new
cextern Globals___RuleINI

cextern str_StringTableOffsets
cextern str_Aircraft
cextern str_AircraftTypes

cextern AircraftTypeClass.ORIGINAL_COUNT
cextern AircraftTypeClass.NEW_SIZE
cextern Rules.StringTableOffsets.AircraftTypes


@HACK 0x00403EE3,0x00403EE9,_AircraftTypeClass__Init_Heap_Unhardcode_AircraftTypes
    Loop_Over_RULES_INI_Section_Entries str_AircraftTypes,Init_AircraftTypeClass
    ;mov  edx,[AircraftTypeClass.Count]
    ;dec  edx
    ;mov  [0x005FDF74],edx ; used by deconstructor
.Ret:
    lea  esp,[ebp-0x14]
    pop  edi
    pop  esi
    pop  edx
    jmp  0x00403EE9
@ENDHACK


@HACK 0x00403F08,0x00403F0D,_AircraftTypeClass__From_Name_Unhardcode_AircraftTypes
    mov  byte al,[AircraftTypeClass.Count]
    cmp  dl,al
    jl   0x00403F14
    jmp  0x00403F0D
@ENDHACK


@HACK 0x00403FF3,0x00403FFC,_AircraftTypeClass__One_Time_Unhardcode_AircraftTypes
    mov  al,[AircraftTypeClass.Count]
    cmp  dl,al
    jl   0x00403F55
    jmp  0x00403FFC
@ENDHACK

    
@HACK 0x00459850,0x00459855,_BuildingClass__Update_Buildables_Unhardcode_AircraftTypes
    mov  al,[AircraftTypeClass.Count]
    cmp  ah,al
    jl   0x0045980F
    jmp  0x00459855
@ENDHACK


@HACK 0x004F40B6,0x004F40BB,_Init_Game_Set_AircraftTypes_Heap_Count
    ; update the stringtableoffset,if defined in Rules
    call_INIClass__Get_Int Globals___RuleINI,str_StringTableOffsets,str_Aircraft,[Rules.StringTableOffsets.AircraftTypes]
    mov  [Rules.StringTableOffsets.AircraftTypes],eax

    ; update heap count
    Get_RULES_INI_Section_Entry_Count str_AircraftTypes
    mov  edx,eax
    add  edx,AircraftTypeClass.ORIGINAL_COUNT
    jmp  0x004F40BB
@ENDHACK


[section .text]
Init_AircraftTypeClass:
    mov  eax,0x19D
    call AircraftTypeClass__new
    test eax,eax
    jz   .Ret

    push eax
    mov  eax,edx
    ; edx should have the name of the INI section already
    call _strdup
    mov  ecx,eax

    pop  eax
    mov  edx,ebx
    add  edx,AircraftTypeClass.ORIGINAL_COUNT

    ; mimic AircraftType HELI, but using Civilian text name
    push MissionType.MISSION_HUNT ; MissionType order MISSION_HUNT
    push 0x20             ; bool rotation
    push -1             ; int landingspeed
    push BuildingType.HPAD ; StructType building
    push 0               ; bool is_immune
    push 0               ; bool is_insignificant
    push 1               ; bool is_legal_target
    push 1               ; bool is_selectable
    push 1               ; bool is_stealthy
    push 0               ; bool is_landable
    push 0               ; bool is_rotorcustom
    push 1               ; bool is_rotorequipped
    push 0               ; bool is_fixedwing
    push 0               ; int primarylateral
    push 0x40             ; int primaryoffset
    push 0               ; int verticaloffset
    ; ecx: char const * ininame
    ; ebx: int name
    ; edx: AircraftType type
    ; eax: AircraftTypeClass object

    ; apply offset names
    push eax
    cmp  dword[Rules.StringTableOffsets.AircraftTypes],-1
    je   .Default_Name
.Offset_Name:
    add  ebx,dword[Rules.StringTableOffsets.AircraftTypes]
    jmp  .Continue 
.Default_Name:
    mov  ebx,21 ; Civilian
.Continue:
    pop  eax
    call AircraftTypeClass__AircraftTypeClass 
.Ret:
    retn

