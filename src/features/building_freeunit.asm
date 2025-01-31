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

[section .data] 
Temp.FreeUnit db 0


@HACK 0x00453CD3,0x00453CDD,_BuildingClass__Raw_Cost_FreeUnit_Override
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
@ENDHACK


@HACK 0x00459CD0,0x00459CDC,_BuildingClass__Grand_Opening_Refinery_Unhardcode_FreeUnit
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
@ENDHACK


@HACK 0x00459DF2,0x00459DF7,_BuildingClass__Grand_Opening_Refinery_Unhardcode_FreeUnit2
    mov  dl,byte[Temp.FreeUnit]
    movzx edx,dl
    jmp  0x00459DF7
@ENDHACK


@HACK 0x00459EFC,0x00459F01,_BuildingClass__Grand_Opening_Refinery_Unhardcode_FreeUnit3
    mov  al,byte[Temp.FreeUnit]
    movzx eax,al
    jmp  0x00459F01
@ENDHACK

