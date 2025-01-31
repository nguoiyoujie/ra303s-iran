;----------------------------------------------------------------
; src/features/houses_mcvunit.asm
;
; Customizable MCV unit for skirmish and multiplayer
;
; This function is enabled by setting [HouseType] > MCVUnit
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------
@HACK 0x0053E6FF,0x0053E704,_Create_Units__MCV_Unit_Unhardcode
    mov  byte dl,[esi+HouseClass.Offset.ActLike]
    movzx edx,dl
    push edi
    HouseTypeClass.FromIndex(edx,edi)
    HouseTypeClass.MCVUnit.Get(edi,dl)
    movzx edx,dl
    UnitTypeClass.FromIndex(edx,edi)
    test edi,edi
    jz   .DefaultMCV
    cmp  edi,-1
    jne  .Continue
.DefaultMCV:
    mov  edx,UnitType.MCV
.Continue:
    pop  edi
    jmp  0x0053E704
@ENDHACK
