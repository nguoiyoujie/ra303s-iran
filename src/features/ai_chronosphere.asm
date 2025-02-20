;----------------------------------------------------------------
; src/features/ai_chronosphere.asm
;
; AI will use the Chronosphere
;
;----------------------------------------------------------------

cextern Target___As_Target
cextern HouseClass__Place_Special_Blast
cextern Globals___Frame

@HACK 0x004C18FE,0x004C1910,_FootClass__Approach_Target__ChronosphereCheck
    push eax ; Target Cell
    mov  ebx,[esi+0x11]
    call Target___As_Target
    mov  edx,eax
    mov  eax,esi
    push eax ; Techno
    call [ebx+0x1F8] ; Assign_Destination
    pop  esi
    pop  ecx
    ; esi is the techno, ecx is the target cell
    call ChronosphereCheck
    jmp  0x004C1910
@ENDHACK

[section .text]
ChronosphereCheck:
    ; esi=techno, ecx=cell
    AbstractClass.RTTI.Get(esi,bl)
    cmp  bl,RTTIType.Unit
    je   .CheckUnit        
    cmp  bl,RTTIType.Vessel
    je   .CheckVessel
    jmp  .Ret

.CheckUnit:
    UnitClass.Class.Get(esi,ebx)
    UnitTypeClass.FromIndex(ebx,eax)
    test byte[eax+TechnoTypeClass.Offset.ToTeleportWithSpecials],1<<(TechnoTypeClass.Bit.ToTeleportWithSpecials-1)
    jnz  .CheckChronoTank
    jmp  .Ret

.CheckChronoTank:
    cmp  bl,UnitType.CTNK ; hardcoded for the moment
    jne  .HouseCheck
    lea  edx,[esi+0x145] ; MoebiusCountDown
    mov  ebx,[edx+1]
    mov  eax,[edx+5]
    cmp  ebx,-1
    jz   .HouseCheck
    mov  edx,[Globals___Frame]
    sub  edx,ebx
    cmp  edx,eax
    jnc  .Mobius0
    sub  eax,edx
    jmp  .MobiusCheck
.Mobius0:
    xor  eax,eax
.MobiusCheck:
    test eax,eax
    jne  .HouseCheck
    mov  byte al,[esi+TechnoClass.Offset.House]
    movzx eax,al
    HouseClass.FromIndex(eax,edx)
    test byte[edx+HouseClass.Offset.IsHuman],1<<(HouseClass.Bit.IsHuman-1)
    jnz  .Ret
    jmp  .Process

.CheckVessel:
    VesselClass.Class.Get(esi,ebx)
    VesselTypeClass.FromIndex(ebx,eax)
    test byte[eax+TechnoTypeClass.Offset.ToTeleportWithSpecials],1<<(TechnoTypeClass.Bit.ToTeleportWithSpecials-1)
    jnz  .HouseCheck
    jmp  .Ret

.HouseCheck:
    mov  byte al,[esi+TechnoClass.Offset.House]
    movzx eax,al
    HouseClass.FromIndex(eax,edx)
    test byte[edx+HouseClass.Offset.IsHuman],1<<(HouseClass.Bit.IsHuman-1)
    jnz  .Ret
    test dword[edx+HouseClass.Offset.SpecialScan],1<<(SpecialType.CHRONOSPHERE-1)
    jz   .Ret
    mov  byte al,[edx+HouseClass.Offset.SuperWeapon3]
    and  eax,0xA ; IsReady | IsPresent
    cmp  eax,0xA
    jne  .Ret
.Process:
    push edx
    ; Hack the house's UnitToTeleport
    mov  dword ebx,[esi+HouseClass.Offset.ID]
    and  ebx,0xFFFFFF
    mov  byte al,[esi+AbstractClass.Offset.RTTI]
    shl  eax,0x18
    or   eax,ebx
    mov  [edx+HouseClass.Offset.UnitToTeleport],eax
    ; Place_Special_Blast on the target cell
    movzx ebx,cx
    pop  eax
    mov  edx,0xFE ;SpecialChrono2 ;SpecialType.CHRONOSPHERE-1
    call HouseClass__Place_Special_Blast
.Ret:
    ret
