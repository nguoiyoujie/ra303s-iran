@LJMP 0x0053755D,_RulesClass__Objects_Epilogue
@LJMP 0x00453703,_BuildingTypeClass__One_Time_Civilian_Buildings_Fix
@LJMP 0x00453689,_BuildingTypeClass__One_Time_Missile_Silo_Buildup_Fix
;@LJMP 0x004EB12E,_InfantryTypeClass__One_Time_Invisible_Icon_Fix ; already overriden by no_cameo_icons
@LJMP 0x004EB0D7,_InfantryTypeClass__One_Time_Invisible_Infantry_Fix

%define UnitTypeClass__One_Time    0x005789AC

; for some reason the game can't find the graphics third time loading them..
; work around this by not updating graphics if they cant be found

_InfantryTypeClass__One_Time_Invisible_Infantry_Fix:
    cmp  dword eax,0
    jz   .Dont_Use_No_Infantry_Graphics

    mov  [esi+0x12C],eax

.Dont_Use_No_Infantry_Graphics:
    jmp  0x004EB0DD

_InfantryTypeClass__One_Time_Invisible_Icon_Fix:
    cmp  dword eax,0
    jz   .Dont_Use_Icon_Graphics
    mov  [esi+0x166],eax

.Dont_Use_Icon_Graphics:
    jmp  0x004EB134

_BuildingTypeClass__One_Time_Missile_Silo_Buildup_Fix:
    cmp  dword eax,0
    je   .Dont_use_Buildup_Graphics

    mov  [esi+0x203],eax

.Dont_use_Buildup_Graphics:
    jmp  0x0045368F

_BuildingTypeClass__One_Time_Civilian_Buildings_Fix:
    cmp  dword eax,0
    jz   .Dont_Use_No_Graphics

    mov  [esi+0x12C],eax

.Dont_Use_No_Graphics:
    jmp  0x00453709

_RulesClass__Objects_Epilogue:

    call UnitTypeClass__One_Time
    call 0x004535A8 ; builing

;    xor        edx,edx
;    mov        al,1
;    call    0x004538F4 ; building theater
;    call    0x0041C5E4 ; anim

    call 0x00584968    ; vessel
    call 0x004EB078  ; Infantry
    call 0x00403F40 ; aircraft
    pop  edi
    pop  esi
    pop  ecx
    pop  ebx
    pop  ebp
    jmp  0x00537562
