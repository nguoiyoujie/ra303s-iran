;----------------------------------------------------------------
; src/features/building_kennel_unhardcode.asm
;
; Customizable kennel function
;
; This function is enabled by setting [BuildingType] > IsKennel=yes
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

@HACK 0x0045A507,0x0045A513,_BuildingClass__What_Action_Kennel_Unhardcode
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsKennel.Get(edi,al)
    test al,al
    pop  edi
.Kennel:
    jnz  0x0045A513
.NotAKennel:
    jmp  0x0045A585
@ENDHACK


@HACK 0x0045A574,0x0045A57C,_BuildingClass__What_Action_Kennel_Unhardcode2
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsKennel.Get(edi,al)
    test al,al
    pop  edi
.Kennel:
    jnz  0x0045A57C
.NotAKennel:
    jmp  0x0045A519
@ENDHACK


@HACK 0x0045A61D,0x0045A629,_BuildingClass__What_Action_Kennel_Unhardcode3
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsKennel.Get(edi,al)
    test al,al
    pop  edi
.Kennel:
    jnz  0x0045A58B
.NotAKennel:
    jmp  0x0045A629
@ENDHACK
