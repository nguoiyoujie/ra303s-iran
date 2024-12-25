;----------------------------------------------------------------
; src/features/type_extensions/InfantryTypeClass/infantrytypeclass_read_ini.asm
;
; Implements the reading of new INI settings, or modifications to existing INI reads, if any.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. 
;
;----------------------------------------------------------------

;Read INI settings
@HOOK 0x004EB2D0 _InfantryTypeClass__Read_INI_Extended


;DoInfoStruct (size 0x80)
%define DoControls.DOG                                     0x006019CC ; DOG
%define DoControls.E1                                      0x00601A4C ; E1   
%define DoControls.E2                                      0x00601ACC ; E2   
%define DoControls.E3                                      0x00601B4C ; E3   
%define DoControls.E4                                      0x00601BCC ; E4, also used for SHOK
%define DoControls.E6                                      0x00601C4C ; E6   
%define DoControls.E7                                      0x00601CCC ; E7   
%define DoControls.SPY                                     0x00601D4C ; SPY  
%define DoControls.THF                                     0x00601DCC ; THF  
%define DoControls.MEDI                                    0x00601E4C ; MEDI, also used for MECH
%define DoControls.GNRL                                    0x00601ECC ; GNRL 
%define DoControls.CIV                                     0x00601F4C ; CIV, also used for DELPHI
%define DoControls.EINS                                    0x00601FCC ; EINS, also used for CHAN

list.DoControlsByInfantryType      dd DoControls.E1, \      ; E1       
                                      DoControls.E2, \      ; E2       
                                      DoControls.E3, \      ; E3       
                                      DoControls.E4, \      ; E4       
                                      DoControls.E6, \      ; E6       
                                      DoControls.E7, \      ; E7       
                                      DoControls.SPY, \     ; SPY      
                                      DoControls.THF, \     ; THF      
                                      DoControls.MEDI, \    ; MEDI     
                                      DoControls.GNRL, \    ; GNRL     
                                      DoControls.DOG, \     ; DOG      
                                      DoControls.CIV, \     ; C1       
                                      DoControls.CIV, \     ; C2       
                                      DoControls.CIV, \     ; C3       
                                      DoControls.CIV, \     ; C4       
                                      DoControls.CIV, \     ; C5       
                                      DoControls.CIV, \     ; C6       
                                      DoControls.CIV, \     ; C7       
                                      DoControls.CIV, \     ; C8       
                                      DoControls.CIV, \     ; C9       
                                      DoControls.CIV, \     ; C10      
                                      DoControls.EINS, \    ; EINSTEIN  
                                      DoControls.CIV, \     ; DELPHI    
                                      DoControls.EINS, \    ; CHAN      
                                      DoControls.E4, \      ; SHOK      
                                      DoControls.MEDI, \    ; MECH      

str.CUSTOM                           db"CUSTOM",0

_InfantryTypeClass__Read_INI_Extended:                    
    push esi                                              
    push edi
    mov esi,edi
    mov edi,[esp+0xC] ;RulesINI

	TechnoTypeClass.ExtPrerequisiteOffset.Set(esi,InfantryTypeClass.Offset.ExtendedPrerequisite)
	TechnoTypeClass.Prerequisite.Read(esi,edi,_GetPrerequisiteExtendedFromString)

    InfantryTypeClass.IsFemale.Read(esi,edi)
    InfantryTypeClass.IsCrawling.Read(esi,edi)
    InfantryTypeClass.IsCivilian.Read(esi,edi)
    InfantryTypeClass.Pip.Read(esi,edi)
    InfantryTypeClass.FireFrame.Read(esi,edi)
    InfantryTypeClass.ProneFireFrame.Read(esi,edi)
    InfantryTypeClass.DoControls.Read(esi,edi,_SelectDoControlsFromString)
    InfantryTypeClass.DoControls_Ready_Start.Read(esi,edi)
    InfantryTypeClass.DoControls_Ready_Count.Read(esi,edi)
    InfantryTypeClass.DoControls_Ready_Jump.Read(esi,edi)
    InfantryTypeClass.DoControls_Guard_Start.Read(esi,edi)
    InfantryTypeClass.DoControls_Guard_Count.Read(esi,edi)
    InfantryTypeClass.DoControls_Guard_Jump.Read(esi,edi)
    InfantryTypeClass.DoControls_Prone_Start.Read(esi,edi)
    InfantryTypeClass.DoControls_Prone_Count.Read(esi,edi)
    InfantryTypeClass.DoControls_Prone_Jump.Read(esi,edi)
    InfantryTypeClass.DoControls_Walk_Start.Read(esi,edi)
    InfantryTypeClass.DoControls_Walk_Count.Read(esi,edi)
    InfantryTypeClass.DoControls_Walk_Jump.Read(esi,edi)
    InfantryTypeClass.DoControls_Fire_Start.Read(esi,edi)
    InfantryTypeClass.DoControls_Fire_Count.Read(esi,edi)
    InfantryTypeClass.DoControls_Fire_Jump.Read(esi,edi)
    InfantryTypeClass.DoControls_LieDown_Start.Read(esi,edi)
    InfantryTypeClass.DoControls_LieDown_Count.Read(esi,edi)
    InfantryTypeClass.DoControls_LieDown_Jump.Read(esi,edi)
    InfantryTypeClass.DoControls_Crawl_Start.Read(esi,edi)
    InfantryTypeClass.DoControls_Crawl_Count.Read(esi,edi)
    InfantryTypeClass.DoControls_Crawl_Jump.Read(esi,edi)
    InfantryTypeClass.DoControls_GetUp_Start.Read(esi,edi)
    InfantryTypeClass.DoControls_GetUp_Count.Read(esi,edi)
    InfantryTypeClass.DoControls_GetUp_Jump.Read(esi,edi)
    InfantryTypeClass.DoControls_FireProne_Start.Read(esi,edi)
    InfantryTypeClass.DoControls_FireProne_Count.Read(esi,edi)
    InfantryTypeClass.DoControls_FireProne_Jump.Read(esi,edi)
    InfantryTypeClass.DoControls_Idle1_Start.Read(esi,edi)
    InfantryTypeClass.DoControls_Idle1_Count.Read(esi,edi)
    InfantryTypeClass.DoControls_Idle1_Jump.Read(esi,edi)
    InfantryTypeClass.DoControls_Idle2_Start.Read(esi,edi)
    InfantryTypeClass.DoControls_Idle2_Count.Read(esi,edi)
    InfantryTypeClass.DoControls_Idle2_Jump.Read(esi,edi)
    InfantryTypeClass.DoControls_Death1_Start.Read(esi,edi)
    InfantryTypeClass.DoControls_Death1_Count.Read(esi,edi)
    InfantryTypeClass.DoControls_Death1_Jump.Read(esi,edi)
    InfantryTypeClass.DoControls_Death2_Start.Read(esi,edi)
    InfantryTypeClass.DoControls_Death2_Count.Read(esi,edi)
    InfantryTypeClass.DoControls_Death2_Jump.Read(esi,edi)
    InfantryTypeClass.DoControls_Death2b_Start.Read(esi,edi)
    InfantryTypeClass.DoControls_Death2b_Count.Read(esi,edi)
    InfantryTypeClass.DoControls_Death2b_Jump.Read(esi,edi)
    InfantryTypeClass.DoControls_Death3_Start.Read(esi,edi)
    InfantryTypeClass.DoControls_Death3_Count.Read(esi,edi)
    InfantryTypeClass.DoControls_Death3_Jump.Read(esi,edi)
    InfantryTypeClass.DoControls_Death4_Start.Read(esi,edi)
    InfantryTypeClass.DoControls_Death4_Count.Read(esi,edi)
    InfantryTypeClass.DoControls_Death4_Jump.Read(esi,edi)
    InfantryTypeClass.DoControls_Gesture1_Start.Read(esi,edi)
    InfantryTypeClass.DoControls_Gesture1_Count.Read(esi,edi)
    InfantryTypeClass.DoControls_Gesture1_Jump.Read(esi,edi)
    InfantryTypeClass.DoControls_Salute1_Start.Read(esi,edi)
    InfantryTypeClass.DoControls_Salute1_Count.Read(esi,edi)
    InfantryTypeClass.DoControls_Salute1_Jump.Read(esi,edi)
    InfantryTypeClass.DoControls_Gesture2_Start.Read(esi,edi)
    InfantryTypeClass.DoControls_Gesture2_Count.Read(esi,edi)
    InfantryTypeClass.DoControls_Gesture2_Jump.Read(esi,edi)
    InfantryTypeClass.DoControls_Salute2_Start.Read(esi,edi)
    InfantryTypeClass.DoControls_Salute2_Count.Read(esi,edi)
    InfantryTypeClass.DoControls_Salute2_Jump.Read(esi,edi)
    InfantryTypeClass.DoControls_DogMaul_Start.Read(esi,edi)
    InfantryTypeClass.DoControls_DogMaul_Count.Read(esi,edi)
    InfantryTypeClass.DoControls_DogMaul_Jump.Read(esi,edi)
    InfantryTypeClass.Response_Select.Read(esi,edi,_GetInfantryResponseSelectFromString)
    InfantryTypeClass.Response_Move.Read(esi,edi,_GetInfantryResponseMoveFromString)
    InfantryTypeClass.Response_Attack.Read(esi,edi,_GetInfantryResponseAttackFromString)
    InfantryTypeClass.Response_Invade.Read(esi,edi,_GetInfantryResponseInvadeFromString)
    InfantryTypeClass.DeathReport1.Read(esi,edi,_GetDeathReport1FromString)
    InfantryTypeClass.DeathReport2.Read(esi,edi,_GetDeathReport2FromString)
    InfantryTypeClass.DeathReport3.Read(esi,edi,_GetDeathReport3FromString)
    InfantryTypeClass.DeathReport4.Read(esi,edi,_GetDeathReport4FromString)
    InfantryTypeClass.DeathReport5.Read(esi,edi,_GetDeathReport5FromString)
    InfantryTypeClass.DeathReport.Read(esi,edi,_GetDeathReportFromString)

    pop  edi
    pop  esi


.Ret:
    lea  esp,[ebp-10h]
    pop  edi
    pop  esi
    pop  ecx
    jmp  0x004EB2D6


_SelectDoControlsFromString:
    push ebx
    cmp  eax,0
    jle  .Retn ; just return 0

.CheckCustom:
    mov  edx,str.CUSTOM
    mov  ebx,eax
    call _strcmpi
    test eax,eax
    jnz  .CheckInfantry
    lea  eax,[esi+InfantryTypeClass.Offset.DoControls_Ready_Start]
    jmp  .Retn

.CheckInfantry:
    ;select InfantryType by performing string compare on eax
    mov  eax,ebx
    InfantryTypeClass.FromID(eax,ebx)
    mov  ebx,dword [ebx+1]; index

    ;then select DoInfoControls based on InfantryType ID
    cmp  ebx,InfantryType.MECH
    jg   .DefaultE1
    cmp  ebx,0
    jl   .DefaultE1

    lea  ebx,[list.DoControlsByInfantryType+ebx*4]
    mov  eax,[ebx]
    jmp  .Retn

.DefaultE1:
    ; default to E1
    mov  eax,DoControls.E1

.Retn:
    pop  ebx
    retn


_GetInfantryResponseSelectFromString:
    GetVocArrayFromString esi+InfantryTypeClass.Offset.Response_Select_Data,16
    retn

_GetInfantryResponseMoveFromString:
    GetVocArrayFromString esi+InfantryTypeClass.Offset.Response_Move_Data,16
    retn

_GetInfantryResponseAttackFromString:
    GetVocArrayFromString esi+InfantryTypeClass.Offset.Response_Attack_Data,16
    retn

_GetInfantryResponseInvadeFromString:
    GetVocArrayFromString esi+InfantryTypeClass.Offset.Response_Invade_Data,16
    retn

_GetDeathReport1FromString:
    GetVocArrayFromString esi+InfantryTypeClass.Offset.DeathReport1_Data,16
    retn

_GetDeathReport2FromString:
    GetVocArrayFromString esi+InfantryTypeClass.Offset.DeathReport2_Data,16
    retn

_GetDeathReport3FromString:
    GetVocArrayFromString esi+InfantryTypeClass.Offset.DeathReport3_Data,16
    retn

_GetDeathReport4FromString:
    GetVocArrayFromString esi+InfantryTypeClass.Offset.DeathReport4_Data,16
    retn

_GetDeathReport5FromString:
    GetVocArrayFromString esi+InfantryTypeClass.Offset.DeathReport5_Data,16
    retn

_GetDeathReportFromString:
    GetVocArrayFromString esi+InfantryTypeClass.Offset.DeathReport_Data,16
    retn

