@HOOK 0x0045DFF3 _BuildingClass_Mission_Unload_WeaponsFactoryOpening
@HOOK 0x0045E0C1 _BuildingClass_Mission_Unload_WeaponsFactory_OpenDoor
@HOOK 0x0045E237 _BuildingClass_Mission_Unload_WeaponsFactory_CloseDoor1
@HOOK 0x0045E25D _BuildingClass_Mission_Unload_WeaponsFactory_CloseDoor2
@HOOK 0x0045E033 _BuildingClass_Mission_Unload_WeaponsFactory_CalculateSouthCell
;@HOOK 0x0045E20D _BuildingClass_Mission_Unload_WeaponsFactory_ForceTrack

@HOOK 0x00455412 _BuildingClass_Draw_It_WeaponsFactoryDoor
@HOOK 0x00455477 _BuildingClass_Draw_It_WeaponsFactoryDoor2
@HOOK 0x00455491 _BuildingClass_Draw_It_WeaponsFactoryDoor3
@HOOK 0x00458DCD _BuildingClass_ExitObject_Factories
@HOOK 0x00458F42 _BuildingClass_ExitObject_Factories2
;@HOOK 0x00459004 _BuildingClass_ExitObject_Factories3



Cache_WarFactory_DoorAnim       dd 0
Cache_WarFactory_DoorFrames     dd 0
Cache_WarFactory_DoorStages     dd 0
Cache_WarFactory_DoorRate     dd 0


;Overrides the structure type check with a FactoryType=xx check
_BuildingClass_Mission_Unload_WeaponsFactoryOpening:
    movsx eax,al
    BuildingTypeClass.FromIndex(eax,eax)
    cmp  BYTE [eax + BuildingTypeClass.Offset.FactoryType], RTTIType.UnitType 
    jnz  0x0045E2FB 
	push edx
	;mov  edx, DWORD [eax + BuildingTypeClass.Offset.WarFactoryOverlayAnim]
    ;mov  DWORD [Cache_WarFactory_DoorAnim], edx
	mov  edx, DWORD [eax + BuildingTypeClass.Offset.WarFactoryOverlayFrames]
	cmp  edx, 0
	jz   .DefaultFrames
	inc  edx
	mov  DWORD [Cache_WarFactory_DoorStages], edx
    jmp  .Rate

.DefaultFrames:
    mov  DWORD [Cache_WarFactory_DoorStages], 5

.Rate:
	mov  edx, DWORD [eax + BuildingTypeClass.Offset.WarFactoryOverlayRate]
	cmp  edx, 0
	jz   .DefaultRate
    mov  DWORD [Cache_WarFactory_DoorRate], edx
    jmp  .Ret

.DefaultRate:
    mov  DWORD [Cache_WarFactory_DoorRate], 8

.Ret:
	pop  edx
    jmp  0x0045DFFF ; is a war factory



_BuildingClass_Mission_Unload_WeaponsFactory_OpenDoor:
    mov  ebx, DWORD [Cache_WarFactory_DoorStages]
    mov  edx, DWORD [Cache_WarFactory_DoorRate]
	jmp  0x0045E0CB



_BuildingClass_Mission_Unload_WeaponsFactory_CloseDoor1:
    mov  ebx, DWORD [Cache_WarFactory_DoorStages]
    mov  edx, DWORD [Cache_WarFactory_DoorRate]
	jmp  0x0045E241


_BuildingClass_Mission_Unload_WeaponsFactory_CalculateSouthCell:
    call 0x0045EB04 ;BuildingClass::Exit_Coord
    add  eax, 0x01800000 ; +1.5 cell south
    call 0x004AC3C0
    ;add  eax, 0x80 ; DIR_S
    jmp  0x0045E040


_BuildingClass_Mission_Unload_WeaponsFactory_ForceTrack:
    mov  edx, 0x41;test
    jmp  0x0045E212


_BuildingClass_Mission_Unload_WeaponsFactory_CloseDoor2:
    mov  ebx, DWORD [Cache_WarFactory_DoorStages]
    mov  edx, DWORD [Cache_WarFactory_DoorRate]
	jmp  0x0045E267


_BuildingClass_Draw_It_WeaponsFactoryDoor:
    movsx eax,al
    BuildingTypeClass.FromIndex(eax,eax)
    cmp  BYTE [eax + BuildingTypeClass.Offset.FactoryType], RTTIType.UnitType 
    jz   .IsWarFactory ; is a war factory
    jmp  0x0045541A

.IsWarFactory:
	push edx
	mov  edx, DWORD [eax + BuildingTypeClass.Offset.WarFactoryOverlayAnim]
    mov  DWORD [Cache_WarFactory_DoorAnim], edx
	mov  edx, DWORD [eax + BuildingTypeClass.Offset.WarFactoryOverlayFrames]
    mov  DWORD [Cache_WarFactory_DoorFrames], edx
	;mov  edx, DWORD [eax + BuildingTypeClass.Offset.WarFactoryOverlayRate]
    ;mov  DWORD [Cache_WarFactory_DoorRate], edx
	pop  edx
    jmp  0x0045544A


_BuildingClass_Draw_It_WeaponsFactoryDoor2:
    jz   0x0045547C
    cmp  DWORD [Cache_WarFactory_DoorFrames],0
	je   .Default
    add  ebx,DWORD [Cache_WarFactory_DoorFrames]
	jmp  .Ret
	
.Default:
    add  ebx,4

.Ret:
    jmp  0x0045547C


_BuildingClass_Draw_It_WeaponsFactoryDoor3:
    cmp  DWORD [Cache_WarFactory_DoorAnim],0
	je   .Default
    mov  edx ,DWORD [Cache_WarFactory_DoorAnim]
	jmp  .Ret
	
.Default:
    mov  edx ,DWORD [0x00635BA8] ; location for WEAP2 shape object

.Ret:
    jmp  0x00455497


_BuildingClass_ExitObject_Factories:
	cmp  al, 0xC
	jz   0x00458DEC ; is a refinery

    push  eax
    movsx eax,al
    BuildingTypeClass.FromIndex(eax,eax)
    cmp  BYTE [eax + BuildingTypeClass.Offset.FactoryType], RTTIType.InfantryType 
	pop  eax
    jz   0x004590B8 ; is a barracks
	
    push  eax
    movsx eax,al
    BuildingTypeClass.FromIndex(eax,eax)
    cmp  BYTE [eax + BuildingTypeClass.Offset.FactoryType], RTTIType.UnitType 
	pop  eax
    jz   0x00458EC7 ; is a war factory
    jmp  0x004592BC



_BuildingClass_ExitObject_Factories2:
    movsx eax,al
    BuildingTypeClass.FromIndex(eax,eax)
    cmp  BYTE [eax + BuildingTypeClass.Offset.FactoryType], RTTIType.UnitType 
    jnz  0x00458ED8 
    jmp  0x00458F4A ; is a war factory



_BuildingClass_ExitObject_Factories3:
    mov  ebx, 0xA0
    jmp  0x00459009 
