;----------------------------------------------------------------
; src/features/prerequisitesystem/find_building.asm
;
; Reimplements building search and compare functions to account for the new prerequisite system.
; 
; This function is enabled by default and is not controllable.
;----------------------------------------------------------------

cextern Houses.BSignificantScan
cextern Houses.USignificantScan
cextern Houses.ISignificantScan
cextern Houses.VSignificantScan
cextern Houses.ASignificantScan

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
    jmp  0x0056B6B0 ; no buildings, set trigger
@ENDHACK


@HACK 0x0056B64A,_TEventClass__Operator_AllDestroyed_Check
    ; scan each byte of BScan (house-specific) ANDed over Houses.BSignificantScan
    ; this filters out any Insignificant=yes entities
    lea  esi,[eax+HouseClass.Offset.NewActiveBScan]
    lea  ecx,[Houses.BSignificantScan]
    xor  edi,edi ; start with offset 0
.ScanB:
    mov  ebx,[esi] 
    mov  edx,[ecx] 
    and  ebx,edx
    test ebx,ebx
    jnz  0x0056B66A ; there are buildings; skip 
    add  ebx,4
    add  ecx,4  
    inc  edi
    cmp  edi,8
    jl   .ScanB
    ; for units
    lea  esi,[eax+HouseClass.Offset.NewActiveUScan]
    lea  ecx,[Houses.USignificantScan]
    xor  edi,edi ; start with offset 0
.ScanU:
    mov  ebx,[esi] 
    mov  edx,[ecx] 
    and  ebx,edx
    test ebx,ebx
    jnz  0x0056B66A ; there are units; skip 
    add  ebx,4
    add  ecx,4  
    inc  edi
    cmp  edi,8
    jl   .ScanU
    ; for infantry
    lea  esi,[eax+HouseClass.Offset.NewActiveIScan]
    lea  ecx,[Houses.ISignificantScan]
    xor  edi,edi ; start with offset 0
.ScanI:
    mov  ebx,[esi] 
    mov  edx,[ecx] 
    and  ebx,edx
    test ebx,ebx
    jnz  0x0056B66A ; there are infantry; skip 
    add  ebx,4
    add  ecx,4  
    inc  edi
    cmp  edi,8
    jl   .ScanI
    ; for vessels
    lea  esi,[eax+HouseClass.Offset.NewActiveVScan]
    lea  ecx,[Houses.VSignificantScan]
    xor  edi,edi ; start with offset 0
.ScanV:
    mov  ebx,[esi] 
    mov  edx,[ecx] 
    and  ebx,edx
    test ebx,ebx
    jnz  0x0056B66A ; there are vessels; skip 
    add  ebx,4
    add  ecx,4  
    inc  edi
    cmp  edi,8
    jl   .ScanV
    ; no check for aircraft
    jmp  0x0056B6B0 ; nothing, set trigger
@ENDHACK


; Does_Enemy_Building_Exist is not used by the game,but we could use it~
@HACK 0x004D7E30,0x004D7E35,_BuildingClass__Does_Enemy_Building_Exist_UsePrereqType
    movzx edx,dl
    BuildingTypeClass.FromIndex(edx,ecx)
    TechnoTypeClass.PrereqType.Get(ecx,al)
    jmp  0x004D7E35
@ENDHACK
