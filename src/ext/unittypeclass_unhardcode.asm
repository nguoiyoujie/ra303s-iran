@HOOK 0x00578974 _UnitTypeClass__From_Name_Unhardcode_UnitTypes_Count
@HOOK 0x004F40FA _Init_Game_Set_UnitTypes_Heap_Count
@HOOK 0x00578950 _UnitTypeClass__Init_Heap_UnhardCode_UnitTypes
@HOOK 0x00459715 _BuildingClass__Update_Buildables_UnhardCode_UnitTypes
@HOOK 0X00578ADB _UnitTypeClass__One_Time_UnhardCode_UnitTypes

str_UnitTypes db"UnitTypes",0
UnitTypesExtCount       dd    0
NewUnitTypeHeapCount    dd    0
%define        OriginalUnitTypeHeapCount       0x16

_UnitTypeClass__One_Time_UnhardCode_UnitTypes:
    mov  al, [NewUnitTypeHeapCount]
    cmp  dl, al
    jl   0x005789BF
    jmp  0x00578AE4

_BuildingClass__Update_Buildables_UnhardCode_UnitTypes:
    mov  al, [NewUnitTypeHeapCount]
    cmp  bl, al
    jl   0x004596D4
    jmp  0x0045971A

Init_UnitTypeClass:
    mov  eax, 19Eh
    call 0x0056E290 ; UnitTypeClass::operator new(uint)
    test eax, eax
    jz   .Ret

    push eax
    mov  eax, edx
    ; edx should have the name of the INI section already
    call 0x005C3900 ; strdup()
    mov  ecx, eax

    pop  eax
    mov  edx, ebx
    add  edx, OriginalUnitTypeHeapCount ; UnitType

    push 0Eh
    push 0
    push 20h
    push 0
    push 0
    push 0
    push 1
    push 0
    push 0
    push 0
    push 1 ;is_turret_equipped, was 1
    push 0
    push 0
    push 0
    push 1
    push 0
    push 1
    push 0
    push 030h ;secondaryoffset, was 0C0h
    push 0
    push 030h ;primaryoffset, was 0C0h
    push 30h ;verticaloffset
    add  ebx, dword [stringtableoffset_newunittypes]
    push 1
    mov  DWORD [0x006057E4], 3 ; Turret Dir adjust
    push 2
    call 0x0056E09C    ; UnitTypeClass::UnitTypeClass( lots of args..)
.Ret:
    retn

_UnitTypeClass__Init_Heap_UnhardCode_UnitTypes:

    Loop_Over_RULES_INI_Section_Entries str_UnitTypes, Init_UnitTypeClass

.Ret:
    lea  esp, [ebp-14h]
    pop  edi
    pop  esi
    pop  edx
    jmp  0x00578956


_Init_Game_Set_UnitTypes_Heap_Count:
    call_INIClass__Get_Int 0x00666688, str_stringtableoffsets, str_stringtableoffset_newunittypes, [stringtableoffset_newunittypes]
    mov  [stringtableoffset_newunittypes], eax
    Get_RULES_INI_Section_Entry_Count str_UnitTypes
    mov  BYTE [UnitTypesExtCount], al
    mov  edx, eax
    add  edx, OriginalUnitTypeHeapCount
    mov  BYTE [NewUnitTypeHeapCount], dl
    jmp  0x004F40FF

_UnitTypeClass__From_Name_Unhardcode_UnitTypes_Count:
    mov  BYTE al, [NewUnitTypeHeapCount]
    cmp  dl, al
    jl   0x00578980
    jmp  0x0057899E
