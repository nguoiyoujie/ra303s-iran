;----------------------------------------------------------------
; src/features/no_cameo_icons.asm
;
; When the cameo icon (default <TypeName>ICON.SHP) is absent, draw NOICON.SHP on the sidebar instead of leaving it empty and susceptible to redraw tearing
; 
; This function is enabled by having NOICON.SHP stored within a mix file loaded by the game.
;
; No compatibility issues is expected. To not use this logic, simply refrain from including NOICON.SHP.
;----------------------------------------------------------------

@HOOK 0x00403FAE _AircraftTypeClass__One_Time__Load_NoIcon_SHP
@HOOK 0x00453637 _BuildingTypeClass__One_Time__Load_NoIcon_SHP
@HOOK 0x004EB12E _InfantryTypeClass__One_Time__Load_NoIcon_SHP
@HOOK 0x0054DDBD _SideBarClass__One_Time__Load_NoIcon_SHP
@HOOK 0x00578A24 _UnitTypeClass__One_Time__Load_NoIcon_SHP
@HOOK 0x005849EB _VesselTypeClass__One_Time__Load_NoIcon_SHP

str_NoIcon_SHP       db"NOICON.SHP", 0
chk_NoIcon_SHP       db 0
obj_NoIcon_SHP       dd 0


_AircraftTypeClass__One_Time__Load_NoIcon_SHP:
    ; eax is the Shape object loaded from <TypeName>ICON.SHP. It is NUL (0) if the icon does not exist.
    test eax,eax
    jnz  .Retn
    call Load_NoIcon_SHP

.Retn:
    mov  dword [esi+166h],eax
    jmp  0x00403FB4


_BuildingTypeClass__One_Time__Load_NoIcon_SHP:
    test eax,eax
    jnz  .Retn
    call Load_NoIcon_SHP

.Retn:
    mov  dword [esi+166h],eax
    jmp  0x0045363D


_InfantryTypeClass__One_Time__Load_NoIcon_SHP:
    test eax,eax
    jnz  .Retn
    call Load_NoIcon_SHP

.Retn:
    mov  dword [esi+166h],eax
    jmp  0x004EB134
    
    
_SideBarClass__One_Time__Load_NoIcon_SHP:
    test eax,eax
    jnz  .Retn
    call Load_NoIcon_SHP

.Retn:
    mov  dl,byte [ebp-10h]
    mov  ecx,dword [ebp-13h]
    jmp  0x0054DDC3
    
    
_UnitTypeClass__One_Time__Load_NoIcon_SHP:
    test eax,eax
    jnz  .Retn
    call Load_NoIcon_SHP

.Retn:
    mov  dword [esi+166h],eax
    jmp  0x00578A2A
    

_VesselTypeClass__One_Time__Load_NoIcon_SHP:
    test eax,eax
    jnz  .Retn
    call Load_NoIcon_SHP

.Retn:
    mov  dword [esi+166h],eax
    jmp  0x005849F1


Load_NoIcon_SHP:
    mov  al,byte [chk_NoIcon_SHP]
    test al,al
    jnz  .Fetch_Icon
.Load_Icon:
    mov  eax,str_NoIcon_SHP 
    call MFCD__Retrieve
    mov  dword [obj_NoIcon_SHP],eax
    mov  byte [chk_NoIcon_SHP],1
.Fetch_Icon:
    mov  eax,dword [obj_NoIcon_SHP]
.Retn:
    retn
