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

    pop  edi
    pop  esi


.Ret:
    lea  esp,[ebp-10h]
    pop  edi
    pop  esi
    pop  ecx
    jmp  0x004EB2D6


_SelectDoControlsFromString:
    ;select InfantryType by performing string compare on eax
    push ebx
    cmp  eax,0
    jle  .Retn ; just return 0
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