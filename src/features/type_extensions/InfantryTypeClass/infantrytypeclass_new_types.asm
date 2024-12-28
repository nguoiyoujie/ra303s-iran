;----------------------------------------------------------------
; src/features/type_extensions/InfantryTypeClass/infantrytypeclass_new_types.asm
;
; Continuation of Iran's work in enabling the game to use new InfantryTypeClass.
; 
; This function is enabled by including the section [InfantryTypes] in Rules.ini. This section includes an indexed array of names of infantry to load.
;   [InfantryTypes]
;   0=E5
; 
; No compatibility issues is expected as the original game lack the ability to add new types.
;
;----------------------------------------------------------------

@HOOK 0x004597F2 _BuildingClass__Update_Buildables_UnhardCode_InfantryTypes
@HOOK 0x004EAF16 _InfantryTypeClass__Init_Heap_UnhardCode_UnitTypes
@HOOK 0x004EB040 _InfantryTypeClass__From_Name_Unhardcode_InfantryTypes_Count
@HOOK 0x004EB159 _InfantryTypeClass__One_Time_UnhardCode_InfantryTypes
@HOOK 0x004F40C7 _Init_Game_Set_InfantryTypes_Heap_Count


_BuildingClass__Update_Buildables_UnhardCode_InfantryTypes:
    mov  al,[InfantryTypeClass.Count]
    cmp  dh,al
    jl   0x0045972F
    jmp  0x004597FB


_InfantryTypeClass__Init_Heap_UnhardCode_UnitTypes:
    Loop_Over_RULES_INI_Section_Entries str_InfantryTypes,Init_InfantryTypeClass
    ;mov  edx,[InfantryTypeClass.Count]
    ;dec  edx
    ;mov  [0x006019C4],edx ; used by deconstructor
.Ret:
    lea  esp,[ebp-14h]
    pop  edi
    pop  esi
    pop  edx
    jmp  0x004EAF1C


Init_InfantryTypeClass:
    mov  eax,InfantryTypeClass.NEW_SIZE
    call InfantryTypeClass__new
    test eax,eax
    jz   .Ret

    push eax
    mov  eax,edx
    ; edx should have the name of the INI section already
    call __strdup
    mov  ecx,eax

    pop  eax
    mov  edx,ebx
    add  edx,InfantryTypeClass.ORIGINAL_COUNT ; InfantryType

    ; mimic InfantryType E1, but using Civilian text name
    push 0               ; unsigned char const * override_remap
    push 2               ; int pronelaunch
    push 2               ; int firelaunch
    push 0x00601A4C      ; DoInfoStruct const * control
    push 1               ; PipEnum pip
    push 0               ; bool is_theater
    push 0               ; bool is_nominal
    push 0               ; bool is_remap_override
    push 0               ; bool is_civilian
    push 1               ; bool is_crawling
    push 0               ; bool is_female
    push 10h             ; int primaryoffset
    push 35h             ; int verticaloffset
    ; ecx: char const * ininame
    ; ebx: int name
    ; edx: InfantryType type
    ; eax: InfantryTypeClass object

    ; apply offset names
    push eax
    cmp  dword [Rules.StringTableOffsets.InfantryTypes],-1
    je   .Default_Name
.Offset_Name:
    add  ebx,dword [Rules.StringTableOffsets.InfantryTypes]
    jmp  .Continue 
.Default_Name:
    mov  ebx,21 ; Civilian
.Continue:
    pop  eax
    call InfantryTypeClass__InfantryTypeClass
.Ret:
    retn


_InfantryTypeClass__From_Name_Unhardcode_InfantryTypes_Count:
    mov  al,[InfantryTypeClass.Count]
    cmp  dl,al
    jl   0x004EB04C
    jmp  0x004EB045


_InfantryTypeClass__One_Time_UnhardCode_InfantryTypes:
    mov  al,[InfantryTypeClass.Count]
    cmp  dl,al
    jl   0x004EB08D
    jmp  0x004EB162


_Init_Game_Set_InfantryTypes_Heap_Count:
    ; update the stringtableoffset,if defined in Rules
    call_INIClass__Get_Int Globals___RuleINI,str_StringTableOffsets,str_Infantry,[Rules.StringTableOffsets.InfantryTypes]
    mov  [Rules.StringTableOffsets.InfantryTypes],eax

    ; update heap count
    Get_RULES_INI_Section_Entry_Count str_InfantryTypes
    mov  edx,eax
    add  edx,InfantryTypeClass.ORIGINAL_COUNT
    jmp  0x004F40CC

