@HOOK 0x004EB040 _InfantryTypeClass__From_Name_Unhardcode_InfantryTypes_Count
@HOOK 0x004F40C7 _Init_Game_Set_InfantryTypes_Heap_Count
@HOOK 0x004EAF16 _InfantryTypeClass__Init_Heap_UnhardCode_UnitTypes
@HOOK 0x004597F2 _BuildingClass__Update_Buildables_UnhardCode_InfantryTypes
@HOOK 0x004EB159 _InfantryTypeClass__One_Time_UnhardCode_InfantryTypes

_InfantryTypeClass__One_Time_UnhardCode_InfantryTypes:
    mov  al,[NewInfantryTypeHeapCount]
    cmp  dl,al
    jl   0x004EB08D
    jmp  0x004EB162

_BuildingClass__Update_Buildables_UnhardCode_InfantryTypes:
    mov  al,[NewInfantryTypeHeapCount]
    cmp  dh,al
    jl   0x0045972F
    jmp  0x004597FB

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
    add  edx,InfantryTypeClass.ORIGINAL_MAX ; InfantryType

    push 0               ; __int32
    push 2               ; char
    push 2               ; char
    push 0x00601A4C        ; offset DoInfoStruct E1DoControls[] ; __int32
    push 1        ; char
    push 0               ; __int32
    push 0               ; __int32
    push 0               ; __int32
    push 0               ; __int32
    push 1        ; __int32
    push 0               ; __int32
    push 10h             ; __int32

    ; apply offset names
    push eax
    cmp  dword [stringtableoffset_newinfantrytypes],-1
    je   .Default_Name
.Offset_Name:
    add  ebx,dword [stringtableoffset_newinfantrytypes]
    jmp  .Continue 
.Default_Name:
    mov  ebx,21 ; Civilian
.Continue:
    pop  eax

    push 35h             ; __int32
    mov  dword [0x006019C4],1
    call InfantryTypeClass__InfantryTypeClass
.Ret:
    retn

_InfantryTypeClass__Init_Heap_UnhardCode_UnitTypes:

Loop_Over_RULES_INI_Section_Entries str_InfantryTypes,Init_InfantryTypeClass

.Ret:
    lea  esp,[ebp-14h]
    pop  edi
    pop  esi
    pop  edx
    jmp  0x004EAF1C


_Init_Game_Set_InfantryTypes_Heap_Count:
    ; update the stringtableoffset,if defined in Rules
    call_INIClass__Get_Int Globals___RuleINI,str_StringTableOffsets,str_Infantry,[stringtableoffset_newinfantrytypes]
    mov  [stringtableoffset_newinfantrytypes],eax

    ; update heap count
    Get_RULES_INI_Section_Entry_Count str_InfantryTypes
    mov  byte [InfantryTypesExtCount],al
    mov  edx,eax
    add  edx,InfantryTypeClass.ORIGINAL_MAX
    mov  byte [NewInfantryTypeHeapCount],dl
    jmp  0x004F40CC


_InfantryTypeClass__From_Name_Unhardcode_InfantryTypes_Count:
    mov  al,[NewInfantryTypeHeapCount]
    cmp  dl,al
    jl   0x004EB04C
    jmp  0x004EB045
