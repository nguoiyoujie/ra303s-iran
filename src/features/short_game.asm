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


@HACK 0x004D4C79,0x004D4C82,_HouseClass__AI_MPlayerDefeated_Check
    ; scan each byte of BScan (house-specific) ANDed over Houses.BSignificantScan
    ; this filters out any Insignificant=yes entities
    ;lea  esi,[eax+HouseClass.Offset.NewActiveBScan]
    ;lea  ecx,[Houses.BSignificantScan]
    xor  edi,edi ; start with offset 0
.Scan:
    mov  ecx,[eax+HouseClass.Offset.NewActiveBScan+edi*4] 
    mov  edx,[Houses.BSignificantScan+edi*4] 
    and  ecx,edx
    test ecx,ecx
    jnz  0x004D4CB4 ; ret 1; abort check
    inc  edi
    cmp  edi,8
    jl   .Scan
.NoBuildings:
    cmp  byte[Spawn.Settings.ShortGame],1
    jz   .Short_Game    
    jmp  0x004D4C82 ; continue checking other technos
.Short_Game:
    ; TO-DO: Adopt bitfield for DeploysInto to replace hardcoded MCV check
    cmp  dword[eax+0x482],0 ; Does player still have an MCV left?
    jnz  0x004D4CB4
    call 0x004D8814  ; HouseClass::Blowup_All(void)
    mov  eax,[ebp-0x58] ; move HouseClass this pointer into eax again
    call 0x004D8270  ; HouseClass::MPlayer_Defeated(void)
    jmp  0x004D4CB4
@ENDHACK