
@SJMP 0x004D6538,0x004D6542 ; _HouseClass__Remap_Table_Use_RemapType_Arg2
; use Points instead of Risk
@SET 0x00568596,{mov dword eax,[eax+TechnoTypeClass.Offset.Points]} ; _TechnoClass_Risk_UsePoints
; use Points instead of Reward
@SET 0x00567632,{mov dword eax,[eax+TechnoTypeClass.Offset.Points]} ; _TechnoClass_Value_UsePointsInsteadOfReward

[section .rdata] 
temp.fakes.fakeof db 2,11,27,28,6


[section .text] 
@HACK 0x005671D1,0x005671D6,_Patch_Unit_Drawing
    mov  eax,[Globals___PlayerPtr]
    xor  ebx,ebx
    mov  bl,byte[eax+HouseClass.Offset.RemapColor]
    sar  ebx,0x18
    jmp  0x005671D6
@ENDHACK


; offset 0x196 is UnitType of a UnitTypeClass, UnitTypes are 0x1D of offset 0 of TechnoTypeClass,
; buildings are 0x6 of offset 0
@HACK 0x00567383,0x00567393,_TechnoClass__Remap_Table_Secondary_Colour_Scheme_For_Units
    push edi
    mov  edi,edx
    sub  edi,0x93 ; TechnoClass pointer

    mov  eax,[Globals___Houses]
    mov  edx,esi
    imul edx,[eax+4]
    mov  eax,[eax+0x10]
    add  eax,edx

    push eax

    cmp  byte[eax+HouseClass.Offset.SecondaryColorScheme],0xFF
    jz   .Normal_Code
    cmp  byte[edi],0x5 ; Is Building?
    je   .Normal_Code
    cmp  byte[edi],0x1C ; Is Unit?
    jnz  .Draw_Secondary_Color_Scheme
    mov  eax,edi
    call 0x00580854 ; ObjectTypeClass & const UnitClass::Class_Of(void)
    mov  edi,eax
    mov  eax,[edi+0x196]
    push eax
    movzx eax,al
    push edi
    UnitTypeClass.FromIndex(eax,edi)
    UnitTypeClass.UsePrimaryColor.Get(edi,al)
    test al,al
    pop  edi
    pop  eax
.UsePrimaryColor:
    jnz  .Normal_Code
.UseSecondaryColor:
    jmp  .Draw_Secondary_Color_Scheme

.Normal_Code:
    pop  eax
    pop  edi
    xor  ebx,ebx
    mov  bl,byte[eax+HouseClass.Offset.RemapColor]
    mov  edx,ecx
    call 0x004D6528 ;  char * const HouseClass::Remap_Table(int,RemapType)const  proc near
    jmp  0x0056739A

.Draw_Secondary_Color_Scheme:
    pop  eax
    pop  edi
    xor  ebx,ebx
    mov  bl,byte[eax+HouseClass.Offset.SecondaryColorScheme]
    mov  edx,ecx
    call 0x004D6528 ;  char * const HouseClass::Remap_Table(int,RemapType)const  proc near
    jmp  0x0056739A
@ENDHACK


@HACK 0x004D6542,0x004D654B,_HouseClass__Remap_Table_Use_RemapType_Arg
    mov  eax,ebx
    jmp  0x004D654B
@ENDHACK


; use Points instead of Risk/Reward
@HACK 0x0046078A,0x00460790,_BuildingClass_Value_UsePointsInsteadOfRiskOrReward
; Fake structures are from 0x20 to 0x24
    cmp  dl,0x20
    jl   0x00460880
    cmp  dl,0x24
    jg   0x00460880
; Fake structure code
    sub  dl,0x20
	xor  eax,eax
	mov  al,dl
	add  eax,temp.fakes.fakeof
	mov  eax,[eax]
    call 0x00453A6C
    mov  eax,dword[eax+TechnoTypeClass.Offset.Points]
    jmp  0x00460885
@ENDHACK
