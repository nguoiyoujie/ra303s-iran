@HOOK 0x00578974 _UnitTypeClass__From_Name_Unhardcode_UnitTypes_Count
@HOOK 0x004F40FA _Init_Game_Set_UnitTypes_Heap_Count
@HOOK 0x00578950 _UnitTypeClass__Init_Heap_UnhardCode_UnitTypes
@HOOK 0x00459715 _BuildingClass__Update_Buildables_UnhardCode_UnitTypes
@HOOK 0X00578ADB _UnitTypeClass__One_Time_UnhardCode_UnitTypes

;added by lovalmidas
; hook into AI_Unit() to change how AI weights units in order to make its choices. This is done to support the additional units beyond the original UNIT_COUNT
; Note that AI behavior depends on Can_Build() checks and new units will be treated similar to Aftermath units due to being placed after them
@HOOK 0x004DBBC5 _HouseClass__AI_Unit_Expand
@HOOK 0x004DBC89 _HouseClass__AI_Unit_Expand_Choice
@HOOK 0x004DBCAE _HouseClass__AI_Unit_Expand_Choice_2
@HOOK 0x004DB7F4 _HouseClass__AI_Unit_Extend_Stackframe
@HOOK 0x004DB880 _HouseClass__AI_Unit_Extend_CounterList_1
@HOOK 0x004DB969 _HouseClass__AI_Unit_Extend_CounterList_2
@HOOK 0x004DBA40 _HouseClass__AI_Unit_Extend_CounterList_3
@HOOK 0x004DBA6D _HouseClass__AI_Unit_Extend_CounterList_4
@HOOK 0x004DBA95 _HouseClass__AI_Unit_Extend_CounterList_5
@HOOK 0x004DBAC9 _HouseClass__AI_Unit_Extend_CounterList_6
@HOOK 0x004DBB2D _HouseClass__AI_Unit_Extend_CounterList_7
@HOOK 0x004DBB9D _HouseClass__AI_Unit_Extend_CounterList_8
@HOOK 0x004DBBAE _HouseClass__AI_Unit_Extend_CounterList_9
@HOOK 0x004DBBB6 _HouseClass__AI_Unit_Extend_BestList_1
@HOOK 0x004DBBE4 _HouseClass__AI_Unit_Extend_BestList_2
@HOOK 0x004DBB6F _HouseClass__AI_Unit_Extend_Remove_CanBuild_From_TeamTypeCheck
; this section deals with the AI with BaseBuilding, to include the additional units in its random building roster
@HOOK 0x004DBC45 _HouseClass__AI_Unit_Extend_BaseBuildingList_1
@HOOK 0x004DBC58 _HouseClass__AI_Unit_Extend_BaseBuildingList_2
@HOOK 0x004DBC6B _HouseClass__AI_Unit_Extend_BaseBuildingList_3
@HOOK 0x004DBC78 _HouseClass__AI_Unit_Extend_BaseBuildingList_4
@HOOK 0x004DBCDF _HouseClass__AI_Unit_Extend_BaseBuildingList_5
;added by lovalmidas/


str_UnitTypes db"UnitTypes",0
str_NoTurretUnitTypes db"NoTurretUnitTypes",0
TurretUnitTypesCount    dd    0
NoTurretUnitTypesCount    dd    0
NewUnitTypeHeapCount    dd    0
%define        OriginalUnitTypeHeapCount    0x16

; Warning: crude and arbitary extension of stackframe!
_HouseClass__AI_Unit_Extend_Stackframe:
    sub  esp, 0x3e8  ; was e8, add 300h to hold counter[UNIT_COUNT] (0xfffffd04) (100h) and bestlist[UNIT_COUNT] (0xfffffc04) (100h)
    jmp  0x004DB7FA

_HouseClass__AI_Unit_Extend_CounterList_1:
    mov  ebx, 300h ; was e8
    lea  eax, [ebp + 0xfffffc04] ; was 0xffffff04, zero bytes
    jmp  0x004DB88B

_HouseClass__AI_Unit_Extend_CounterList_2:
    mov  dword [ebp + ebx*0x4 + 0xfffffd04],0x1
    jmp  0x004DB974

_HouseClass__AI_Unit_Extend_CounterList_3:
    cmp  esi, dword [ebx + ebp*0x1 + 0xfffffd04]
    jmp  0x004DBA47

_HouseClass__AI_Unit_Extend_CounterList_4:
    mov  dword [ebp + ecx*0x4 + 0xfffffd04],ebx
    jmp  0x004DBA74

_HouseClass__AI_Unit_Extend_CounterList_5:
    cmp  dword [ebp + eax*0x4 + 0xfffffd04],0x0
    jmp  0x004DBA9D

_HouseClass__AI_Unit_Extend_CounterList_6:
    dec  dword [ebp + eax*0x4 + 0xfffffd04]
    jmp  0x004DBAD0

_HouseClass__AI_Unit_Extend_CounterList_7:
    cmp  dword [ebp + eax*0x4 + 0xfffffd04],0x0
    jmp  0x004DBB35

_HouseClass__AI_Unit_Extend_CounterList_8:
    cmp  esi, dword [ebp + eax*0x4 + 0xfffffd04]
    jmp  0x004DBBA4

_HouseClass__AI_Unit_Extend_CounterList_9:
    cmp  esi, dword [ebp + eax*0x4 + 0xfffffd04]
    jmp  0x004DBBB5

_HouseClass__AI_Unit_Extend_BestList_1:
    mov  al, byte [ebp + -0x18]
    mov  byte [ecx + ebp*0x1 + 0xfffffc03],al  ; was -0x4d
    jmp  0x004DBBBD

_HouseClass__AI_Unit_Extend_BestList_2:
    mov  al, byte [eax + ebp*0x1 + 0xfffffc04] ; was -0x4c
    mov  byte [edx + 0x536],al
    jmp  0x004DBBEE

_HouseClass__AI_Unit_Extend_Remove_CanBuild_From_TeamTypeCheck:
    jmp  0x004DBB73



_HouseClass__AI_Unit_Extend_BaseBuildingList_1:
    ; manipulating local memory locations
    mov  dword [ebp + eax*0x4 + 0xfffffd04],0x14 ; was 0xffffff5c, counter's offset is 0xffffff04
    jmp  0x004DBC50

_HouseClass__AI_Unit_Extend_BaseBuildingList_2:
    mov  dword [ebp + eax*0x4 + 0xfffffd04],0x1
    jmp  0x004DBC63

_HouseClass__AI_Unit_Extend_BaseBuildingList_3:
    mov  dword [ebp + eax*0x4 + 0xfffffd04],edi
    jmp  0x004DBC72

_HouseClass__AI_Unit_Extend_BaseBuildingList_4:
    mov  ecx, dword [ebp + eax*0x4 + 0xfffffd04]
    jmp  0x004DBC7F

_HouseClass__AI_Unit_Extend_BaseBuildingList_5:
    mov  esi, dword [edx + ebp*0x1 + 0xfffffd04]
    jmp  0x004DBCE6

_HouseClass__AI_Unit_Expand:
    cmp  bl, [NewUnitTypeHeapCount] ; was UNIT_COUNT (0x16)
    jl   0x004DBB27
    jmp  0x004DBBCE

_HouseClass__AI_Unit_Expand_Choice:
    cmp  al, [NewUnitTypeHeapCount] ; was UNIT_COUNT (0x16)
    jl   0x004DBC05
    jmp  0x004DBC91

_HouseClass__AI_Unit_Expand_Choice_2:
    cmp  dh, [NewUnitTypeHeapCount] ; was UNIT_COUNT (0x16)
    jl   0x004DBCD6
    jmp  0x004DBCB3


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
    add  ebx, 600 ; refer to new REDALERT.mix/local.mix/Conquer.eng
    push 1
    mov  DWORD [0x006057E4], 3 ; Turret Dir adjust
    push 2
    call 0x0056E09C    ; UnitTypeClass::UnitTypeClass( lots of args..)
.Ret:
    retn

Init_NoTurretUnitTypeClass:
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
    mov  edx, [TurretUnitTypesCount]
    add  edx, ebx
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
    push 0 ;is_turret_equipped, was 1
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
    add  ebx, 600 ; refer to new REDALERT.mix/local.mix/Conquer.eng
    add  ebx, [TurretUnitTypesCount]
    push 1
    mov  DWORD [0x006057E4], 3 ; Turret Dir adjust
    push 2
    call 0x0056E09C    ; UnitTypeClass::UnitTypeClass( lots of args..)
.Ret:
    retn

_UnitTypeClass__Init_Heap_UnhardCode_UnitTypes:

    Loop_Over_RULES_INI_Section_Entries str_UnitTypes, Init_UnitTypeClass
    Loop_Over_RULES_INI_Section_Entries str_NoTurretUnitTypes, Init_NoTurretUnitTypeClass

.Ret:
    lea  esp, [ebp-14h]
    pop  edi
    pop  esi
    pop  edx
    jmp  0x00578956


_Init_Game_Set_UnitTypes_Heap_Count:
    Get_RULES_INI_Section_Entry_Count str_UnitTypes
    mov  BYTE [TurretUnitTypesCount], al
    mov  edx, eax
    Get_RULES_INI_Section_Entry_Count str_NoTurretUnitTypes
    mov  BYTE [NoTurretUnitTypesCount], al
    add  edx, eax
    add  edx, OriginalUnitTypeHeapCount
    mov  BYTE [NewUnitTypeHeapCount], dl
    jmp  0x004F40FF

_UnitTypeClass__From_Name_Unhardcode_UnitTypes_Count:
    mov  al, [NewUnitTypeHeapCount]
    cmp  dl, al
    jl   0x00578980
    jmp  0x0057899E
