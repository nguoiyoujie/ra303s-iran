@HOOK 0x004EB040 _InfantryTypeClass__From_Name_Unhardcode_InfantryTypes_Count
@HOOK 0x004F40C7 _Init_Game_Set_InfantryTypes_Heap_Count
@HOOK 0x004EAF16 _InfantryTypeClass__Init_Heap_UnhardCode_UnitTypes
@HOOK 0x004597F2 _BuildingClass__Update_Buildables_UnhardCode_InfantryTypes
@HOOK 0x004EB159 _InfantryTypeClass__One_Time_UnhardCode_InfantryTypes

;added by lovalmidas
; hook into AI_Infantry() to change how AI weights units in order to make its choices. This is done to support the additional units beyond the original INFANTRY_COUNT
; Note that AI behavior depends on Can_Build() checks and new units will be treated similar to Aftermath units due to being placed after them
;@HOOK 0x004DC516 _HouseClass__AI_Infantry_Expand
;@HOOK 0x004DC62B _HouseClass__AI_Infantry_Expand_Choice
;@HOOK 0x004DC160 _HouseClass__AI_Infantry_Extend_Stackframe
;@HOOK 0x004DC19A _HouseClass__AI_Infantry_Extend_CounterList_1
;@HOOK 0x004DC282 _HouseClass__AI_Infantry_Extend_CounterList_2
;@HOOK 0x004DC363 _HouseClass__AI_Infantry_Extend_CounterList_3
;@HOOK 0x004DC378 _HouseClass__AI_Infantry_Extend_CounterList_4
;@HOOK 0x004DC3A8 _HouseClass__AI_Infantry_Extend_CounterList_5
;@HOOK 0x004DC3D0 _HouseClass__AI_Infantry_Extend_CounterList_6
;@HOOK 0x004DC404 _HouseClass__AI_Infantry_Extend_CounterList_7
;@HOOK 0x004DC47E _HouseClass__AI_Infantry_Extend_CounterList_8
;@HOOK 0x004DC4EE _HouseClass__AI_Infantry_Extend_CounterList_9
;@HOOK 0x004DC4FF _HouseClass__AI_Infantry_Extend_CounterList_10
@HOOK 0x004DC4C0 _HouseClass__AI_Infantry_Extend_Remove_CanBuild_From_TeamTypeCheck
;
;
;@HOOK 0x004DC50A _HouseClass__AI_Infantry_Extend_BestList_1
;@HOOK 0x004DC534 _HouseClass__AI_Infantry_Extend_BestList_2

;@HOOK 0x004DC5B5 _HouseClass__AI_Infantry_Extend_TypeTrackList_1
;@HOOK 0x004DC638 _HouseClass__AI_Infantry_Extend_TypeTrackList_2
;@HOOK 0x004DC643 _HouseClass__AI_Infantry_Extend_TypeTrackList_3
;@HOOK 0x004DC650 _HouseClass__AI_Infantry_Extend_TypeTrackList_4
;@HOOK 0x004DC65A _HouseClass__AI_Infantry_Extend_TypeTrackList_5
;@HOOK 0x004DC66C _HouseClass__AI_Infantry_Extend_TypeTrackList_6
;@HOOK 0x004DC679 _HouseClass__AI_Infantry_Extend_TypeTrackList_7
;@HOOK 0x004DC6B7 _HouseClass__AI_Infantry_Extend_TypeTrackList_8
;@HOOK 0x004DC6E5 _HouseClass__AI_Infantry_Extend_TypeTrackList_9
;@HOOK 0x004DC6F3 _HouseClass__AI_Infantry_Extend_TypeTrackList_10

;@HOOK 0x00400000 _HouseClass__AI_Infantry_Extend_BaseBuildingList_1
;@HOOK 0x00400000 _HouseClass__AI_Infantry_Extend_BaseBuildingList_2
;@HOOK 0x00400000 _HouseClass__AI_Infantry_Extend_BaseBuildingList_3
;@HOOK 0x00400000 _HouseClass__AI_Infantry_Extend_BaseBuildingList_4
;@HOOK 0x00400000 _HouseClass__AI_Infantry_Extend_BaseBuildingList_5

str_InfantryTypes db"InfantryTypes",0
InfantryTypesExtCount    dd    0
NewInfantryTypeHeapCount    dd    0
%define        OriginalInfantryTypeHeapCount    0x1A

; Warning: crude and arbitary extension of stackframe!
_HouseClass__AI_Infantry_Extend_Stackframe:
    sub  esp, 0x42c  ; was 12c, add 300h to hold counter[count] (0xfffffc44) (100h) and typetrack[count] (0xffffff44) (100h)
    jmp  0x004DC166

_HouseClass__AI_Infantry_Expand:
    cmp  al, [NewInfantryTypeHeapCount] ; was INFANTRY_COUNT (0x1A)
    jl   0x004DC462
    jmp  0x004DC51E

_HouseClass__AI_Infantry_Expand_Choice:
    cmp  al, [NewInfantryTypeHeapCount] ; was INFANTRY_COUNT (0x1A)
    jge  0x004DC713
    jmp  0x004DC574


_HouseClass__AI_Infantry_Extend_CounterList_1:
    mov  ebx, 300h ; was 68
    lea  eax, [ebp + 0xfffffc44] ; was 0xffffff44, zero bytes
    jmp  0x004DC1A0

_HouseClass__AI_Infantry_Extend_CounterList_2:
    lea  ebx,[ebp + ebx*4 + 0xfffffc44] ; was 0xffffff44, zero bytes
    jmp  0x004DC289

_HouseClass__AI_Infantry_Extend_CounterList_3:
    mov  esi, dword [ebp + edx + 0xfffffc44]
    jmp  0x004DC36A

_HouseClass__AI_Infantry_Extend_CounterList_4:
    mov  dword [ebp + edx + 0xfffffc44], esi
    jmp  0x004DC386

_HouseClass__AI_Infantry_Extend_CounterList_5:
    mov  dword [ebp + ebx*4 + 0xfffffc44],edx
    jmp  0x004DC3AF

_HouseClass__AI_Infantry_Extend_CounterList_6:
    cmp  dword [ebp + eax*4 + 0xfffffc44],0
    jmp  0x004DC3D8

_HouseClass__AI_Infantry_Extend_CounterList_7:
    dec  dword [ebp + eax*4 + 0xfffffc44]
    jmp  0x004DC40B

_HouseClass__AI_Infantry_Extend_CounterList_8:
    cmp  dword [ebp + eax*4 + 0xfffffc44],0
    jmp  0x004DC486

_HouseClass__AI_Infantry_Extend_CounterList_9:
    cmp  esi, dword [ebp + eax*4 + 0xfffffc44]
    jmp  0x004DC4F5

_HouseClass__AI_Infantry_Extend_CounterList_10:
    mov  esi, dword [ebp + eax*4 + 0xfffffc44]
    jmp  0x004DC506

_HouseClass__AI_Infantry_Extend_Remove_CanBuild_From_TeamTypeCheck:
    jmp  0x004DC4C4

_HouseClass__AI_Infantry_Extend_BestList_1:
    mov  byte [ebp + ecx + 0xfffffd44], al ; was 0xffffffab, zero bytes
    jmp  0x004DC50E

_HouseClass__AI_Infantry_Extend_BestList_2:
    mov  al, byte [ebp + eax + 0xfffffd45]
    jmp  0x004DC538


;_HouseClass__AI_Infantry_Extend_TypeTrackList_1:
;    mov  dword [ebp + ecx + 0xfffffc44],eax ; was 0xfffffec1, zero bytes
;    jmp  0x004DC5BC
;
;_HouseClass__AI_Infantry_Extend_TypeTrackList_2:
;    mov  dword [ebp + ecx + 0xfffffc44],0x3
;    jmp  0x004DC643
;
;_HouseClass__AI_Infantry_Extend_TypeTrackList_3:
;    cmp  dword [ebp + ecx + 0xfffffc44],0x0
;    jmp  0x004DC64B
;
;_HouseClass__AI_Infantry_Extend_TypeTrackList_4:
;    mov  dword [ebp + ecx + 0xfffffc43],al
;    jmp  0x004DC657
;
;_HouseClass__AI_Infantry_Extend_TypeTrackList_5:
;    mov  dword eax,[ebp + ecx + 0xfffffc44]
;    jmp  0x004DC661
;
;_HouseClass__AI_Infantry_Extend_TypeTrackList_6:
;    mov  dword [ebp + ecx + 0xfffffc44],0x5
;    jmp  0x004DC677
;
;_HouseClass__AI_Infantry_Extend_TypeTrackList_7:
;    mov  dword [ebp + ecx + 0xfffffc44],0x2
;    jmp  0x004DC684
;
;_HouseClass__AI_Infantry_Extend_TypeTrackList_8:
;    mov  dword [ebp + ecx + 0xfffffc44],edx
;    jmp  0x004DC6BE
;
;_HouseClass__AI_Infantry_Extend_TypeTrackList_9:
;    mov  dword [ebp + ecx + 0xfffffc44],edx
;    jmp  0x004DC6EC
;
;_HouseClass__AI_Infantry_Extend_TypeTrackList_10:
;    mov  dword [ebp + ecx + 0xfffffc44],edx
;    jmp  0x004DC6FA



_InfantryTypeClass__One_Time_UnhardCode_InfantryTypes:
    mov  al, [NewInfantryTypeHeapCount]
    cmp  dl, al
    jl   0x004EB08D
    jmp  0x004EB162

_BuildingClass__Update_Buildables_UnhardCode_InfantryTypes:
    mov  al, [NewInfantryTypeHeapCount]
    cmp  dh, al
    jl   0x0045972F
    jmp  0x004597FB

Init_InfantryTypeClass:
    mov  eax, 1A2h
    call 0x004DF728 ; InfantryTypeClass::operator new(uint)
    test eax, eax
    jz   .Ret

    push eax
    mov  eax, edx
    ; edx should have the name of the INI section already
    call 0x005C3900 ; strdup()
    mov  ecx, eax

    pop  eax
    mov  edx, ebx
    add  edx, OriginalInfantryTypeHeapCount ; InfantryType

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
    add  ebx, 640 ; refer to new REDALERT.mix/local.mix/Conquer.eng
    push 35h             ; __int32
    mov  DWORD [0x006019C4], 1
    call 0x004DF5E0 ; InfantryTypeClass::InfantryTypeClass(InfantryType,int,char *,int,int,int,int,int,int,int,int,PipEnum,DoInfoStruct *,int,int,char *)
.Ret:
    retn

_InfantryTypeClass__Init_Heap_UnhardCode_UnitTypes:

Loop_Over_RULES_INI_Section_Entries str_InfantryTypes, Init_InfantryTypeClass

.Ret:
    lea  esp, [ebp-14h]
    pop  edi
    pop  esi
    pop  edx
    jmp  0x004EAF1C


_Init_Game_Set_InfantryTypes_Heap_Count:
    Get_RULES_INI_Section_Entry_Count str_InfantryTypes
    mov  BYTE [InfantryTypesExtCount], al
    mov  edx, eax
    add  edx, OriginalInfantryTypeHeapCount
    mov  BYTE [NewInfantryTypeHeapCount], dl
    jmp  0x004F40CC


_InfantryTypeClass__From_Name_Unhardcode_InfantryTypes_Count:
    mov  al, [NewInfantryTypeHeapCount]
    cmp  dl, al
    jl   0x004EB04C
    jmp  0x004EB045
