
;Read INI settings
@HOOK 0x004C7445 _TFixedIHeapClass__fn_init_InfantryTypes_Heap
@HOOK 0x004C935A _TFixedIHeapClass__InfantryTypeClass__Constructor_New_Size
@HOOK 0x004D0D53 _TFixedIHeapClass__InfantryTypeClass__Save_New_Size
@HOOK 0x004D0E36 _TFixedIHeapClass__InfantryTypeClass__Load_New_Size
@HOOK 0x004D0E51 _TFixedIHeapClass__InfantryTypeClass__Load_Clear_Memory
@HOOK 0x004EB2D0 _InfantryTypeClass__Read_INI_Extended


_TFixedIHeapClass__InfantryTypeClass__Load_Clear_Memory:
    Clear_Extended_Class_Memory_For_Old_Saves ecx,InfantryTypeClass.NEW_SIZE,InfantryTypeClass.ORIGINAL_SIZE
.Ret:
    lea  edx,[ebp-0x14]
    mov  eax,ecx
    jmp  0x004D0E56

_TFixedIHeapClass__fn_init_InfantryTypes_Heap:
    mov  edx,InfantryTypeClass.NEW_SIZE
    jmp  0x004C744A

_TFixedIHeapClass__InfantryTypeClass__Load_New_Size:
    mov  ebx,InfantryTypeClass.NEW_SIZE
    jmp  0x004D0E3B

_TFixedIHeapClass__InfantryTypeClass__Save_New_Size:
    mov  ebx,InfantryTypeClass.NEW_SIZE
    jmp  0x004D0D58

_TFixedIHeapClass__InfantryTypeClass__Constructor_New_Size:
    mov  edx,InfantryTypeClass.NEW_SIZE
    jmp  0x004C935F


_InfantryTypeClass__Read_INI_Extended:
    push esi
    push edi
    mov esi,edi
    mov edi,[esp+0xC] ;RulesINI

	TechnoTypeClass.ExtPrerequisiteOffset.Set(esi,InfantryTypeClass.Offset.ExtendedPrerequisite)
	TechnoTypeClass.Prerequisite.Read(esi,edi,_GetPrerequisiteExtendedFromString)

    InfantryTypeClass.IsFemale.Read(esi,edi)
    InfantryTypeClass.IsCrawling.Read(esi,edi)
    InfantryTypeClass.IsCivilian.Read(esi,edi)
    InfantryTypeClass.Pip.Read(esi,edi)
    InfantryTypeClass.FireFrame.Read(esi,edi)
    InfantryTypeClass.ProneFireFrame.Read(esi,edi)

    pop  edi
    pop  esi


.Ret:
    lea  esp,[ebp-10h]
    pop  edi
    pop  esi
    pop  ecx
    jmp  0x004EB2D6
