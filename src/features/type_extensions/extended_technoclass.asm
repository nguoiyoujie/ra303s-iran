@HOOK 0x00567383 _TechnoClass__Remap_Table_Secondary_Colour_Scheme_For_Units
@HOOK 0x004D6542 _HouseClass__Remap_Table_Use_RemapType_Arg
@HOOK 0x004D6538 _HouseClass__Remap_Table_Use_RemapType_Arg2
@HOOK 0x005671D1 _Patch_Unit_Drawing
@HOOK 0x00568596 _TechnoClass_Risk_UsePoints
@HOOK 0x00567632 _TechnoClass_Value_UsePointsInsteadOfReward
@HOOK 0x0046078A _BuildingClass_Value_UsePointsInsteadOfRiskOrReward

temp.fakes.fakeof db 2,11,27,28,6

_Patch_Unit_Drawing:
    mov  eax,[Globals___PlayerPtr]
    mov  dword ebx,[eax+178Ch]
    sar  ebx,0x18
    jmp  0x005671D6

; offset 0x196 is UnitType of a UnitTypeClass, UnitTypes are 0x1D of offset 0 of TechnoTypeClass,
; buildings are 0x6 of offset 0
_TechnoClass__Remap_Table_Secondary_Colour_Scheme_For_Units:
    push edi
    mov  edi,edx
    sub  edi,0x93 ; TechnoClass pointer

    mov  eax,[Globals___Houses]
    mov  edx,esi
    imul edx,[eax+4]
    mov  eax,[eax+10h]
    add  eax,edx

    push eax

    cmp  byte [eax+0x1802],0xFF
    jz   .Normal_Code
    cmp  byte [edi],0x05 ; Is Building?
    je  .Normal_Code
    cmp  byte [edi],0x1C ; Is Unit?
    jnz  .Draw_Secondary_Color_Scheme
    mov  eax,edi
    call 0x00580854 ; ObjectTypeClass & const UnitClass::Class_Of(void)
    mov  edi,eax
    mov  eax,[edi+0x196]
    cmp  byte al,0x0B ; Is MCV?
    jz   .Normal_Code
    cmp  byte al,0x07 ; Is Ore Truck?
    jz   .Normal_Code

    ; just to be sure
    jmp  .Draw_Secondary_Color_Scheme

.Normal_Code:
    pop  eax
    pop  edi
    mov  dword ebx,[eax+178Ch]
    sar  ebx,0x18
    mov  edx,ecx
    call 0x004D6528 ;  char * const HouseClass::Remap_Table(int,RemapType)const  proc near
    jmp  0x0056739A

.Draw_Secondary_Color_Scheme:
    pop  eax
    pop  edi
    xor  ebx,ebx
    mov  bl,byte [eax+0x1802]
    mov  edx,ecx
    call 0x004D6528 ;  char * const HouseClass::Remap_Table(int,RemapType)const  proc near
    jmp  0x0056739A

_HouseClass__Remap_Table_Use_RemapType_Arg:
    mov  eax,ebx
    jmp  0x004D654B

_HouseClass__Remap_Table_Use_RemapType_Arg2:
    jmp  0x004D6542

; use Points instead of Risk
_TechnoClass_Risk_UsePoints:
    mov  eax,dword [eax + TechnoTypeClass.Offset.Points]
    jmp  0x0056859C

; use Points instead of Reward
_TechnoClass_Value_UsePointsInsteadOfReward:
    mov  eax,dword [eax + TechnoTypeClass.Offset.Points]
    jmp  0x00567638

; use Points instead of Risk/Reward
_BuildingClass_Value_UsePointsInsteadOfRiskOrReward:
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
    mov  eax,dword [eax + TechnoTypeClass.Offset.Points]
    jmp  0x00460885

