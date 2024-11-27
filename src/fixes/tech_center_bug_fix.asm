;----------------------------------------------------------------
; src/fixes/tech_center_bug_fix.asm
;
; Fixes tech center confusion, so each house will build their correct tech center
; 
; This function is enabled by including the following key in Rules.ini. 
;   Rules.ini > [General] > TechCenterBugFix=true/false
; or
;   Spawn.ini > [Settings] > TechCenterBugFix=true/false
;
; No compatibility issues is expected.
;----------------------------------------------------------------

@HOOK 0x0054EBAC _SidebarClass__StripClass__Recalc_Can_Build_Check

; Gets a side based on a country type
; arg: <eax: country to get side for>
; returns: eax is 2 if side is Soviet, 0 if Allies
; Note: Turkey is considered Allies
_Side_From_Country:
    cmp  dword eax, HouseType.USSR
    je   .Return_Soviet
    cmp  dword eax, HouseType.Ukraine
    je   .Return_Soviet
    cmp  dword eax, HouseType.BadGuy
    je   .Return_Soviet

.Return_Allies:
    mov  eax, 0
    retn

.Return_Soviet:
    mov  eax, 2
    retn

_SidebarClass__StripClass__Recalc_Can_Build_Check:
    push eax
    call dword [edi+2Ch] ; ObjectTypeClass::Who_Can_Build_Me(int, int, HousesType)

    cmp  byte [TechCenterBugFix], 0
    jz   .Normal_Code

    cmp  dword eax, 0
    je   .Ret_Now

    pop  eax

    mov  edx, eax
    mov  eax, [Globals___PlayerPtr]
    mov  eax, [eax+3Eh]
    sar  eax, 18h
    call _Side_From_Country
    mov  ebx, eax
    mov  eax, [Globals___PlayerPtr]
    call HouseClass__Can_Build

    jmp  0x0054EBB9

.Ret_Now:
    add  esp, 4
    jmp  0x0054EBB9

.Normal_Code:
    add  esp, 4
    test eax, eax
    setnz al
    and  eax, 0FFh
    jmp  0x0054EBB9
