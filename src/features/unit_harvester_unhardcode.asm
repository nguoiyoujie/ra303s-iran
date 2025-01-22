;----------------------------------------------------------------
; src/features/unit_harvester_unhardcode.asm
;
; Customizable harvester function
;
; This function is enabled by setting [UnitType] > IsHarvester=yes
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

@HOOK 0x00454B89 _BuildingClass__Receive_Message_RadioCanLoad_Harvester_Unhardcode
@HOOK 0x00578CB5 _UnitTypeClass__Max_Pips_Harvester_Unhardcode
@HOOK 0x0057B2F6 _UnitClass__Take_Damage_Harvester_Unhardcode
@HOOK 0x0057B3B4 _UnitClass__Take_Damage_Harvester_Unhardcode2
@HOOK 0x0057BFAF _UnitClass__Per_Cell_Process_Harvester_Unhardcode
@HOOK 0x00580136 _UnitClass__PipCount_Harvester_Unhardcode
@HOOK 0x005808A4 _UnitClass__TiberiumLoad_Unhardcode


_BuildingClass__Receive_Message_RadioCanLoad_Harvester_Unhardcode:
    movzx eax,al
    push edi
    UnitTypeClass.FromIndex(eax,edi)
    UnitTypeClass.IsToHarvest.Get(edi,al)
    test al,al
    pop  edi
.Harvester:
    jnz  0x00454B91
.NotAHarvester:
    jmp  0x00454BBC


_UnitTypeClass__Max_Pips_Harvester_Unhardcode:
    movzx edx,dl
    push edx
    push eax
    push edi
    UnitTypeClass.FromIndex(edx,edi)
    UnitTypeClass.IsToHarvest.Get(edi,dl)
    test dl,dl
    pop  edi
    pop  eax
    pop  edx
    jz   .NotAHarvester
.Harvester:
    mov  eax,7 ; 7 pips
    jmp  0x00578CD5
.NotAHarvester:
    jmp  0x00578CBE


_UnitClass__Take_Damage_Harvester_Unhardcode:
    movzx eax,al
    push edi
    UnitTypeClass.FromIndex(eax,edi)
    UnitTypeClass.IsToHarvest.Get(edi,al)
    test al,al
    pop  edi
.Harvester:
    jnz  0x0057B302
.NotAHarvester:
    jmp  0x0057B386


_UnitClass__Take_Damage_Harvester_Unhardcode2:
    movzx eax,al
    push edi
    UnitTypeClass.FromIndex(eax,edi)
    UnitTypeClass.IsToHarvest.Get(edi,al)
    test al,al
    pop  edi
.Harvester:
    jnz  0x0057B3BC
.NotAHarvester:
    jmp  0x0057B3FB


_UnitClass__Per_Cell_Process_Harvester_Unhardcode:
    movzx eax,al
    push edi
    UnitTypeClass.FromIndex(eax,edi)
    UnitTypeClass.IsToHarvest.Get(edi,al)
    test al,al
    pop  edi
.Harvester:
    jnz  0x0057BFBB
.NotAHarvester:
    jmp  0x0057C038


_UnitClass__PipCount_Harvester_Unhardcode:
    movzx eax,al
    push edi
    UnitTypeClass.FromIndex(eax,edi)
    UnitTypeClass.IsToHarvest.Get(edi,al)
    test al,al
    pop  edi
.Harvester:
    jnz  0x0058013E
.NotAHarvester:
    jmp  0x00580165


_UnitClass__TiberiumLoad_Unhardcode:
    movzx edx,dl
    push eax
    push edi
    UnitTypeClass.FromIndex(edx,edi)
    UnitTypeClass.IsToHarvest.Get(edi,dl)
    test dl,dl
    pop  edi
    pop  eax
.Harvester:
    jnz  0x005808AC
.NotAHarvester:
    jmp  0x005808C2

