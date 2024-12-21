;----------------------------------------------------------------
; src/features/tesla_charging_unhardcode.asm
;
; Allow other Buildings to charge up like a Tesla Coil by supplying with a Primary weapon with Charges=true.
;
; This function is enabled by configuring the relevant building to use a compatible PrimaryWeapon. Remember to set building animations for the Active state.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------
@HOOK 0x0045571B _BuildingClass_ShapeNumber_RemoveTeslaIDCheck
@HOOK 0x00460414 _BuildingClass_AnimationAI_IncludeAllChargingBuildings
@HOOK 0x0045FCC7 _BuildingClass_ChargingAI_Jammed_PreventsCharge
@HOOK 0x0045FCF1 _BuildingClass_ChargingAI_UseActiveAnimCount
@HOOK 0x0045FDA7 _BuildingClass_ChargingAI_UnhardcodeRate
@HOOK 0x0045FDAE _BuildingClass_ChargingAI_UseWeaponChargeVoice

; use PrimaryWeapon -> Charges instead of hardcode Tesla ID check
_BuildingClass_ShapeNumber_RemoveTeslaIDCheck:
    TechnoTypeClass.PrimaryWeapon.Get(eax,eax)
    cmp  eax,0x0
    jz   0x00455749
    test byte [eax + 0x8],0x8 ; Charges
    jz   0x00455749
    jmp  0x00455729

; unsure why shape number for charged state is 3 (and not the start or end of the animation, but let's keep it for now 
_BuildingClass_AnimationAI_IncludeAllChargingBuildings:
    TechnoTypeClass.PrimaryWeapon.Get(eax,eax)
    cmp  eax,0x0
    jz   0x00460433
    test byte [eax + 0x8],0x8 ; Charges
    jnz  0x00460422
    jmp  0x00460433

_BuildingClass_ChargingAI_Jammed_PreventsCharge:
    jz   0x0045FDCA
    test byte [ebx + 0xd7],0x10
    jnz  0x0045FDCA
    jmp  0x0045FCCD

_BuildingClass_ChargingAI_UseActiveAnimCount:
; original check uses (Fetch_Stage() >= 9) to set IsCharged state. This means buildings with Active anim frame count below 9 will not be able to meet this condition
; Link it to Anim_Active_Count instead
; fetch ID (building class ptr + 0xcd)
    xor  edx,edx
    lea  eax,[ebx + 0xcd]
    mov  dl,byte [eax]
    push ecx
    BuildingTypeClass.FromIndex(edx,edx)
    BuildingTypeClass.Anim_Active_Count.Get(edx,ecx)
    lea  edx,[ebx + 0x42]
    mov  eax,dword [edx]
    inc  eax
    cmp  eax,ecx
    pop  ecx
    jmp  0x0045FCF9

_BuildingClass_ChargingAI_UnhardcodeRate:
    push ecx
    push edx
    push eax
    xor  edx,edx
    lea  eax,[ebx + 0xcd]
    mov  dl,byte [eax]
    BuildingTypeClass.FromIndex(edx,edx)
    BuildingTypeClass.Anim_Active_Rate.Get(edx,ecx)
    pop  eax
    pop  edx
    mov  dword [edx + 0xd],ecx
    pop  ecx
    jmp  0x0045FDAE

_BuildingClass_ChargingAI_UseWeaponChargeVoice:
    push ecx
    push edx
    xor  edx,edx
    lea  eax,[ebx + 0xcd]
    mov  dl,byte [eax]
    BuildingTypeClass.FromIndex(edx,edx)
    TechnoTypeClass.PrimaryWeapon.Get(edx,edx)
    xor  eax,eax
    WeaponTypeClass.ChargeSound.Get(edx,ax)
    pop  edx
    pop  ecx
    cmp  ax,0 ; note: This causes GIRLYEAH (0) to be ignored by the code and revert to VOC_TESLA_POWER_UP instead
    jg  0x0045FDB3
    mov  eax,0x45 ;VOC_TESLA_POWER_UP
    jmp  0x0045FDB3


