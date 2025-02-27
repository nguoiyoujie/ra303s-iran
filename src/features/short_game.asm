;----------------------------------------------------------------
; src/features/short_game.asm
;
; Adds support for short games, where a house is defeated when he no longer has a building or MCV
; 
; This function is enabled by including the following key(s): 
;   Rules.ini > [General] > ShortGame=true/false
;   Spawn.ini > [Settings] > ShortGame=true/false
;
; No compatibility issues is expected.
;
;----------------------------------------------------------------

cextern Spawn.Settings.ShortGame

cextern Houses.BSignificantScan
cextern Houses.USignificantScan
cextern Houses.ISignificantScan
cextern Houses.VSignificantScan


@HACK 0x004D4C79,0x004D4C82,_HouseClass__AI_MPlayerDefeated_Check
    ; scan each byte of BScan (house-specific) ANDed over Houses.BSignificantScan
    ; this filters out any Insignificant=yes entities
    xor  edi,edi ; start with offset 0
.ScanB:
    mov  ecx,[eax+HouseClass.Offset.NewActiveBScan+edi*4] 
    mov  edx,[Houses.BSignificantScan+edi*4] 
    and  ecx,edx
    test ecx,ecx
    jnz  0x004D4CB4 ; ret 1; abort check
    inc  edi
    cmp  edi,8
    jl   .ScanB
.NoBuildings:
    cmp  byte[Spawn.Settings.ShortGame],1
    jz   .Short_Game    
    ; for units
    xor  edi,edi ; start with offset 0
    jmp  .ScanU ; continue checking other technos
.Short_Game:
    ; TO-DO: Adopt bitfield for DeploysInto to replace hardcoded MCV check
    xor  edi,edi
.Repeat:
    UnitTypeClass.FromIndex(edi,ecx)
    test byte[ecx+ObjectTypeClass.Offset.IsInsignificant],1<<(ObjectTypeClass.Bit.IsInsignificant+1)
    jnz  .Next
    cmp  byte[ecx+UnitTypeClass.Offset.DeploysInto],0
    jne  0x004D4CB4 ; skip
.Next:
    inc  edi
    cmp  edi,[UnitTypeClass.Count]
    jl   .Repeat
.BlowUp:
    call 0x004D8814  ; HouseClass::Blowup_All(void)
    mov  eax,[ebp-0x58] ; move HouseClass this pointer into eax again
    call 0x004D8270  ; HouseClass::MPlayer_Defeated(void)
    jmp  0x004D4CB4

.ScanU:
    mov  ecx,[eax+HouseClass.Offset.NewActiveUScan+edi*4] 
    mov  edx,[Houses.USignificantScan+edi*4] 
    and  ecx,edx
    test ecx,ecx
    jnz  0x004D4CB4 ; ret 1; abort check
    inc  edi
    cmp  edi,8
    jl   .ScanU
    xor  edi,edi
.ScanI:
    mov  ecx,[eax+HouseClass.Offset.NewActiveIScan+edi*4] 
    mov  edx,[Houses.ISignificantScan+edi*4] 
    and  ecx,edx
    test ecx,ecx
    jnz  0x004D4CB4 ; ret 1; abort check
    inc  edi
    cmp  edi,8
    jl   .ScanI
    xor  edi,edi
.ScanV:
    mov  ecx,[eax+HouseClass.Offset.NewActiveVScan+edi*4] 
    mov  edx,[Houses.VSignificantScan+edi*4] 
    and  ecx,edx
    test ecx,ecx
    jnz  0x004D4CB4 ; ret 1; abort check
    inc  edi
    cmp  edi,8
    jl   .ScanV
    ; no check for aircraft
    jmp  .BlowUp
@ENDHACK