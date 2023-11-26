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

@HOOK 0x00403EE3 _AircraftTypeClass__Init_Heap_Unhardcode_AircraftTypes
@HOOK 0x00403F08 _AircraftTypeClass__From_Name_Unhardcode_AircraftTypes
@HOOK 0x00403FF3 _AircraftTypeClass__One_Time_Unhardcode_AircraftTypes
@HOOK 0x00459850 _BuildingClass__Update_Buildables_Unhardcode_AircraftTypes
@HOOK 0x004F40B6 _Init_Game_Set_AircraftTypes_Heap_Count


_AircraftTypeClass__Init_Heap_Unhardcode_AircraftTypes:

    Loop_Over_RULES_INI_Section_Entries str_AircraftTypes,Init_AircraftTypeClass

.Ret:
    lea  esp,[ebp-14h]
    pop  edi
    pop  esi
    pop  edx
    jmp  0x00403EE9


Init_AircraftTypeClass:
    mov  eax,19Dh
    call AircraftTypeClass__new
    test eax,eax
    jz   .Ret

    push eax
    mov  eax,edx
    ; edx should have the name of the INI section already
    call __strdup
    mov  ecx,eax

    pop  eax
    mov  edx,ebx
    add  edx,AircraftTypeClass.ORIGINAL_MAX

    push 0Eh
    push 20h
    push 0FFh
    push 0Eh
    push 0
    push 0
    push 1
    push 1
    push 1
    push 0
    push 0
    push 1
    push 0
    push 0
    push 40h
    push 0

    ; apply offset names
    push eax
    cmp  dword [stringtableoffset_newaircrafttypes],-1
    je   .Default_Name
.Offset_Name:
    add  ebx,dword [stringtableoffset_newaircrafttypes]
    jmp  .Continue 
.Default_Name:
    mov  ebx,21 ; Civilian
.Continue:
    pop  eax

    mov  dword [0x005FDF74],5
    call AircraftTypeClass__AircraftTypeClass 

.Ret:
    retn


_AircraftTypeClass__From_Name_Unhardcode_AircraftTypes:
    mov  byte al,[NewAircraftTypeHeapCount]
    cmp  dl,al
    jl   0x00403F14
    jmp  0x00403F0D


_AircraftTypeClass__One_Time_Unhardcode_AircraftTypes:
    mov  al,[NewAircraftTypeHeapCount]
    cmp  dl,al
    jl   0x00403F55
    jmp  0x00403FFC

    
_BuildingClass__Update_Buildables_Unhardcode_AircraftTypes:
    mov  al,[NewAircraftTypeHeapCount]
    cmp  ah,al
    jl   0x0045980F
    jmp  0x00459855


_Init_Game_Set_AircraftTypes_Heap_Count:
    ; update the stringtableoffset,if defined in Rules
    call_INIClass__Get_Int Globals___RuleINI,str_StringTableOffsets,str_Aircraft,[stringtableoffset_newaircrafttypes]
    mov  [stringtableoffset_newaircrafttypes],eax

    ; update heap count
    Get_RULES_INI_Section_Entry_Count str_AircraftTypes
    mov  byte [AircraftTypesTypesExtCount],al
    mov  edx,eax
    add  edx,AircraftTypeClass.ORIGINAL_MAX
    mov  byte [NewAircraftTypeHeapCount],dl
    jmp  0x004F40BB
