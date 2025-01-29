;----------------------------------------------------------------
; src/features/building_freeunit.asm
;
; Customizable free unit that spawns with a building type when the latter is built or spawned.
; Used to emulate the Ore Refinery.
;
; If used, the selling price of the building is adjusted by deducting the value of the free unit.
;
; This function is enabled by setting [BuildingType] > FreeUnit
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

@LJMP 0x00453CD3, _BuildingClass__Raw_Cost_FreeUnit_Override
@LJMP 0x00459CD0, _BuildingClass__Grand_Opening_Refinery_Unhardcode_FreeUnit
@LJMP 0x00459DF2, _BuildingClass__Grand_Opening_Refinery_Unhardcode_FreeUnit2
@LJMP 0x00459EFC, _BuildingClass__Grand_Opening_Refinery_Unhardcode_FreeUnit3

[section .data] 
Temp.FreeUnit db 0


[section .text] 
_BuildingClass__Raw_Cost_FreeUnit_Override:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.FreeUnit.Get(edi,al)
    test al,al
    movzx eax,al
    pop  edi
.HasFreeUnit:
    jnz  0x00453CDD
.NotFreeUnit:
    jmp  0x00453CE8


_BuildingClass__Grand_Opening_Refinery_Unhardcode_FreeUnit:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.FreeUnit.Get(edi,al)
    test al,al
    mov  byte[Temp.FreeUnit],al
    pop  edi
.HasFreeUnit:
    jnz  0x00459CDC
.NotFreeUnit:
    jmp  0x00459F34


_BuildingClass__Grand_Opening_Refinery_Unhardcode_FreeUnit2:
    mov  dl,byte[Temp.FreeUnit]
    movzx edx,dl
    jmp  0x00459DF7


_BuildingClass__Grand_Opening_Refinery_Unhardcode_FreeUnit3:
    mov  al,byte[Temp.FreeUnit]
    movzx eax,al
    jmp  0x00459F01

