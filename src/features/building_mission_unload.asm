;----------------------------------------------------------------
; src/features/building_mission_unload.asm
;
; The War Factory plays an animation with a second SHP when this mission is applied to it. Now, athis can be extended to other war factories.
;
; This function is enabled by having more buildings with FactoryType=UnitType, and setting the relevant / WarFactoryOverlayFrames / WarFactoryOverlayRate controls.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------
@HOOK 0x0045DFF3 _BuildingClass_Mission_Unload_WeaponsFactoryOpening
@HOOK 0x0045E0C1 _BuildingClass_Mission_Unload_WeaponsFactory_OpenDoor
@HOOK 0x0045E237 _BuildingClass_Mission_Unload_WeaponsFactory_CloseDoor1
@HOOK 0x0045E25D _BuildingClass_Mission_Unload_WeaponsFactory_CloseDoor2
@HOOK 0x0045E033 _BuildingClass_Mission_Unload_WeaponsFactory_CalculateSouthCell
@HOOK 0x0045E20D _BuildingClass_Mission_Unload_WeaponsFactory_ForceTrack

@HOOK 0x00455412 _BuildingClass_Draw_It_WeaponsFactoryDoor
@HOOK 0x00455442 _BuildingClass_Draw_It_WeaponsFactoryDoorFake
@HOOK 0x00455477 _BuildingClass_Draw_It_WeaponsFactoryDoor2
@HOOK 0x00455491 _BuildingClass_Draw_It_WeaponsFactoryDoor3
@HOOK 0x00458DCD _BuildingClass_ExitObject_Factories
@HOOK 0x00458F42 _BuildingClass_ExitObject_Factories2
@HOOK 0x00459004 _BuildingClass_ExitObject_FactoriesSetFacing



Cache_WarFactory_DoorAnim       dd 0
Cache_WarFactory_DoorFrames     dd 0
Cache_WarFactory_DoorStages     dd 0
Cache_WarFactory_DoorRate     dd 0

; Use movzx to support 255 structure types
;Overrides the structure type check with a FactoryType=xx check
_BuildingClass_Mission_Unload_WeaponsFactoryOpening:
    movzx eax,al
    BuildingTypeClass.FromIndex(eax,eax)
    cmp  byte [eax + BuildingTypeClass.Offset.FactoryType],RTTIType.UnitType 
    jnz  0x0045E2FB 
    push edx
    ;mov  edx,dword [eax + BuildingTypeClass.Offset.WarFactoryOverlayAnim]
    ;mov  dword [Cache_WarFactory_DoorAnim],edx
    mov  edx,dword [eax + BuildingTypeClass.Offset.WarFactoryOverlayFrames]
    cmp  edx,0
    jz   .DefaultFrames
    inc  edx
    mov  dword [Cache_WarFactory_DoorStages],edx
    jmp  .Rate

.DefaultFrames:
    mov  dword [Cache_WarFactory_DoorStages],5

.Rate:
    mov  edx,dword [eax + BuildingTypeClass.Offset.WarFactoryOverlayRate]
    cmp  edx,0
    jz   .DefaultRate
    mov  dword [Cache_WarFactory_DoorRate],edx
    jmp  .Ret

.DefaultRate:
    mov  dword [Cache_WarFactory_DoorRate],8

.Ret:
    pop  edx
    jmp  0x0045DFFF ; is a war factory



_BuildingClass_Mission_Unload_WeaponsFactory_OpenDoor:
    mov  ebx,dword [Cache_WarFactory_DoorStages]
    mov  edx,dword [Cache_WarFactory_DoorRate]
    jmp  0x0045E0CB



_BuildingClass_Mission_Unload_WeaponsFactory_CloseDoor1:
    mov  ebx,dword [Cache_WarFactory_DoorStages]
    mov  edx,dword [Cache_WarFactory_DoorRate]
    jmp  0x0045E241


_BuildingClass_Mission_Unload_WeaponsFactory_CalculateSouthCell:
    call BuildingClass__Exit_Coord
    add  eax,0x01800000 ; +1.5 cell south
    call Coord___Coord_Cell
    ;add  eax,0x80 ; DIR_S
    jmp  0x0045E040


_BuildingClass_Mission_Unload_WeaponsFactory_ForceTrack:
; set track, defaults to 0x42 / DriveClass::OUT_OF_WEAPON_FACTORY
; ebx is the factory building index
    push ebx
    xor  edx,edx
    movzx ebx,bl
    BuildingTypeClass.FromIndex(ebx,ebx)
    BuildingTypeClass.WarFactoryExitTrack.Get(ebx,dl)
    pop  ebx
    cmp  edx,0
    je .Default_OUT_OF_WEAPON_FACTORY
    jmp  0x0045E212 
.Default_OUT_OF_WEAPON_FACTORY:
    mov  edx,0x42
    jmp  0x0045E212


_BuildingClass_Mission_Unload_WeaponsFactory_CloseDoor2:
    mov  ebx,dword [Cache_WarFactory_DoorStages]
    mov  edx,dword [Cache_WarFactory_DoorRate]
    jmp  0x0045E267


_BuildingClass_Draw_It_WeaponsFactoryDoor:
    movzx eax,al
    BuildingTypeClass.FromIndex(eax,eax)
    test eax,eax
    jz   0x0045541A
    cmp  byte [eax + BuildingTypeClass.Offset.FactoryType],RTTIType.UnitType 
    jz   .IsWarFactory ; is a war factory
    jmp  0x0045541A

.IsWarFactory:
    push edx
    mov  edx,dword [eax + BuildingTypeClass.Offset.WarFactoryOverlayAnim]
    mov  dword [Cache_WarFactory_DoorAnim],edx
    mov  edx,dword [eax + BuildingTypeClass.Offset.WarFactoryOverlayFrames]
    mov  dword [Cache_WarFactory_DoorFrames],edx
    ;mov  edx,dword [eax + BuildingTypeClass.Offset.WarFactoryOverlayRate]
    ;mov  dword [Cache_WarFactory_DoorRate],edx
    pop  edx
    jmp  0x0045544A

_BuildingClass_Draw_It_WeaponsFactoryDoorFake:
    movzx eax,al
; future code for custom fakes
    ;BuildingTypeClass.FromIndex(eax,eax)
    ;push ebx
    ;xor ebx,ebx
    ;BuildingTypeClass.IsFake.Get(eax,bl)
    ;cmp  bl,0
    ;pop  ebx
    ;je  0x0045549E ; not a fake
; check for Fake War Factory
    cmp  eax,0x20
    jnz  0x0045549E
    jmp  .IsWarFactory

.IsWarFactory:
    push edx
    BuildingTypeClass.FromIndex(eax,eax) ;no need for null check; only one ID (0x20) expected here
    mov  edx,dword [eax + BuildingTypeClass.Offset.WarFactoryOverlayAnim]
    mov  dword [Cache_WarFactory_DoorAnim],edx
    mov  edx,dword [eax + BuildingTypeClass.Offset.WarFactoryOverlayFrames]
    mov  dword [Cache_WarFactory_DoorFrames],edx
    ;mov  edx,dword [eax + BuildingTypeClass.Offset.WarFactoryOverlayRate]
    ;mov  dword [Cache_WarFactory_DoorRate],edx
    pop  edx
    jmp  0x0045544A

_BuildingClass_Draw_It_WeaponsFactoryDoor2:
    jz   0x0045547C
    cmp  dword [Cache_WarFactory_DoorFrames],0
    je   .Default
    add  ebx,dword [Cache_WarFactory_DoorFrames]
    jmp  .Ret

.Default:
    add  ebx,4

.Ret:
    jmp  0x0045547C


_BuildingClass_Draw_It_WeaponsFactoryDoor3:
    cmp  dword [Cache_WarFactory_DoorAnim],-1
    je   .Default
    cmp  dword [Cache_WarFactory_DoorAnim],0
    je   .None
    mov  edx ,dword [Cache_WarFactory_DoorAnim]
    jmp  .Ret

.Default:
    mov  edx ,dword [0x00635BA8] ; location for WEAP2 shape object
.Ret:
    jmp  0x00455497
.None:
    jmp  0x0045549E




_BuildingClass_ExitObject_Factories:
    cmp  al,0xC
    jz   0x00458DEC ; is a refinery

    push  eax
    movzx eax,al
    BuildingTypeClass.FromIndex(eax,eax)
    cmp  byte [eax + BuildingTypeClass.Offset.FactoryType],RTTIType.InfantryType 
    pop  eax
    jz   0x004590B8 ; is a barracks
    
    push  eax
    movzx eax,al
    BuildingTypeClass.FromIndex(eax,eax)
    cmp  byte [eax + BuildingTypeClass.Offset.FactoryType],RTTIType.UnitType 
    pop  eax
    jz   0x00458EC7 ; is a war factory
    jmp  0x004592BC



_BuildingClass_ExitObject_Factories2:
    movzx eax,al
    BuildingTypeClass.FromIndex(eax,eax)
    cmp  byte [eax + BuildingTypeClass.Offset.FactoryType],RTTIType.UnitType 
    jnz  0x00458ED8 
    jmp  0x00458F4A ; is a war factory



_BuildingClass_ExitObject_FactoriesSetFacing:
; set direction,defaults to 0x80 / DIR_S
    push ecx
    push edx
    xor  ebx,ebx
    xor  edx,edx
    lea  ecx,[esi + 0xcd]
    mov  dl,byte [ecx]
    BuildingTypeClass.FromIndex(edx,edx)
    BuildingTypeClass.WarFactoryExitFacing.Get(edx,bl)
    pop  edx
    pop  ecx
    cmp  ebx,0
    je .Default_DIR_S
    jmp  0x00459009 
.Default_DIR_S:
    mov  ebx,0x80
    jmp  0x00459009 
