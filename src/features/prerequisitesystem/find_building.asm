;----------------------------------------------------------------
; src/features/prerequisitesystem/find_building.asm
;
; Reimplements building search and compare functions to account for the new prerequisite system.
; 
; This function is enabled by default and is not controllable.
;----------------------------------------------------------------

cextern Houses.BSignificantScan

@HACK 0x0056B4E7,0x0056B4F9,_TEventClass__Operator_BuildingExists_Check
    ; don't use old ActiveBScan anymore, since that is used by the new prerequisite system
    ; eax is houseclass, ecx right shifted 18-bits is structtype id
    lea  eax,[eax+HouseClass.Offset.NewActiveBScan]
    shr  ecx,0x18
    mov  edx,ecx 
    shr  edx,3
    mov  eax,dword[eax+edx]
    and  ecx,0x7
    mov  edx,1
    shl  edx,cl
    and  eax,edx ; bit match
    test eax,eax
    jmp  0x0056B4F9
@ENDHACK


@HACK 0x0056B615,0x0056B622,_TEventClass__Operator_BuildingsDestroyed_Check
    ; scan each byte of BScan (house-specific) ANDed over Houses.BSignificantScan
    ; this filters out any Insignificant=yes entities
    lea  esi,[eax+HouseClass.Offset.NewActiveBScan]
    lea  ecx,[Houses.BSignificantScan]
    xor  edi,edi ; start with offset 0
.Scan:
    mov  eax,[esi] 
    mov  edx,[ecx] 
    and  eax,edx
    test eax,eax
    jnz  0x0056B622 ; there are buildings; skip 
    add  eax,4
    add  ecx,4  
    inc  edi
    cmp  edi,8
    jl   .Scan
    jmp  0x0056B6B0 ; no buildings,set trigger
@ENDHACK


;@HACK 0x0056B64A,_TEventClass__Operator_AllDestroyed_Check
;    ; scan each byte of BScan (house-specific) ANDed over Houses.BSignificantScan
;    ; this filters out any Insignificant=yes entities
;    lea  esi,[eax+HouseClass.Offset.NewActiveBScan]
;    lea  ecx,[Houses.BSignificantScan]
;    xor  edi,edi ; start with offset 0
;.Scan:
;    mov  eax,[esi] 
;    mov  edx,[ecx] 
;    and  eax,edx
;    test eax,eax
;    ;jnz  0x0056B6B0 ; ret 1
;    add  eax,4
;    add  ecx,4  
;    inc  edi
;    cmp  edi,8
;    jl   .Scan
;    ;jmp  0x0056B622 ; ret 0
;; TO-DO: implement similar checks to IScan,UScan,VScan (AScan is not included in checks)
;@ENDHACK


; Does_Enemy_Building_Exist is not used by the game,but we could use it~
@HACK 0x004D7E30,0x004D7E35,_BuildingClass__Does_Enemy_Building_Exist_UsePrereqType
    movzx edx,dl
    BuildingTypeClass.FromIndex(edx,ecx)
    TechnoTypeClass.PrereqType.Get(ecx,al)
    jmp  0x004D7E35
@ENDHACK
