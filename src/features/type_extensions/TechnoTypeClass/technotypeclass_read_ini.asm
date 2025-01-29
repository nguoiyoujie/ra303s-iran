;----------------------------------------------------------------
; src/features/type_extensions/TechnoTypeClass/technotypeclass_read_ini.asm
;
; Implements the reading of new INI settings, or modifications to existing INI reads, if any.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. 
;
;----------------------------------------------------------------

; Expose other technotype fields that already exist
;Read INI settings
@SJMP 0x00569B6A, 0x00569B72 ;_TechnoTypeClass__SkipReading_Prerequisite
@LJMP 0x00569E1F, _TechnoTypeClass__Read_INI_Extended

@CLEAR 0x00569B6F, 0x90, 0x00569B72
@CLEAR 0x00569B7B, 0x90, 0x00569B81 ; bug-fix: remove actual writing of value into prerequisite

;_TechnoTypeClass__SkipReading_Prerequisite:
;    jmp  0x00569B72


_TechnoTypeClass__Read_INI_Extended:
;========= start loading from INI ==============
    push esi
    push edi
    ;mov edi,Globals___RuleINI
    mov  edi,[ebp-18h]

    ; Clear the fields of Risk and Reward, as they are replaced with other functions
    push eax
    xor  eax,eax
    TechnoTypeClass.DeathWeapon.Set(esi,eax)
    pop eax

    ;ObjectTypeClass
    ObjectTypeClass.IsSelectable.Read(esi,edi)
    ObjectTypeClass.IsInsignificant.Read(esi,edi)

    ;TechnoTypeClass.IsScanner.Read(esi,edi) ;already existing
    TechnoTypeClass.IsNominal.Read(esi,edi)
    TechnoTypeClass.IsTheater.Read(esi,edi)
    TechnoTypeClass.HasTurret.Read(esi,edi)
    TechnoTypeClass.Facings.Read(esi,edi)
    TechnoTypeClass.VerticalOffset.Read(esi,edi)
    TechnoTypeClass.PrimaryOffset.Read(esi,edi)
    TechnoTypeClass.PrimaryLateral.Read(esi,edi)
    TechnoTypeClass.SecondaryOffset.Read(esi,edi)
    TechnoTypeClass.SecondaryLateral.Read(esi,edi)
; somehow setting primary and secondary weapons remove Aftermath weapons.
    TechnoTypeClass.PrimaryWeapon.Read(esi,edi,_GetWeaponTypeFromString)
    TechnoTypeClass.SecondaryWeapon.Read(esi,edi,_GetWeaponTypeFromString)
    TechnoTypeClass.DeathWeapon.Read(esi,edi,_GetWeaponTypeFromString)
    TechnoTypeClass.PrereqType.Read(esi,edi,_SelectPrereqTypeFromString)
    TechnoTypeClass.Prerequisite.Read(esi,edi,_GetPrerequisiteFromString)

    pop  edi
    pop  esi
 
.Ret:
    mov  eax,1 ;return 1
    lea  esp,[ebp-10h]
    pop  edi
    pop  esi
    pop  ecx
    jmp  0x00569E2A


_GetWeaponTypeFromString:
    ;select WeaponType by performing string compare on eax
    push ebx
    cmp  eax,0
    jle  .Retn ; just return 0
    WeaponTypeClass.FromID(eax,ebx)
    mov  eax,ebx
.Retn:
    pop ebx
    retn

    
_GetPrerequisiteFromString:
    push edi
    push edx
    push ecx
    push ebx
    xor  edi,edi
    test eax,eax
    jz  .Retn ; just return 0
    mov  ebx,eax
.Read_Next:
   ; the string is a comma-delimited set
    mov  edx,str_Comma
    mov  eax,ebx
    push eax
    call _stristr
    test eax,eax
    je  .Read_Last    
    mov  byte [eax],0
    lea  eax,[eax + 1]
    mov  ebx,eax
    pop  eax
    call _SelectPrereqTypeFromString
    test eax,eax
    je   .Read_Next
    mov  cl,al
     xor  eax,eax
    mov  eax,1   
    shl  eax,cl
    or   edi,eax
    jmp  .Read_Next
.Read_Last:
    pop  eax
    call _SelectPrereqTypeFromString
    test eax,eax
    je   .Retn
    mov  cl,al
     xor  eax,eax
    mov  eax,1   
    shl  eax,cl
    or   edi,eax  
.Retn:
    mov eax,edi
    pop ebx
    pop ecx
    pop edx
    pop edi
    retn
    

_GetPrerequisiteExtendedFromString:
    push edi
    push edx
    push ecx
    push ebx
    xor  edi,edi
    TechnoTypeClass.ExtPrerequisiteOffset.Get(esi,di)
    cmp  di,0
    je  .Retn ; just return 0
; clear 32-bit field
    lea  ecx,[esi + edi]
    mov  edx,8
.RepeatZero:
    mov  dword [ecx],0
    dec  edx
    add  ecx,4
    cmp  edx,0
    jg   .RepeatZero
    test eax,eax
    jz  .Retn ; just return 0
    mov  ebx,eax

.Read_Next:
   ; the string is a comma-delimited set
    mov  edx,str_Comma
    mov  eax,ebx
    push eax
    call _stristr
    test eax,eax
    je  .Read_Last    
    mov  byte [eax],0
    lea  eax,[eax + 1]
    mov  ebx,eax
    pop  eax
    call 0x004537B4 ; BuildingTypeClass::From_Name, eax is already the string
    cmp  al,0xff ; STRUCT_NONE
    jz   .Read_Next
    ; al is any value from 00 to FE
    ; di is the byte offset of the 32-byte ExtPrerequisiteOffset space
    ; esi is the pointer to the type
    lea  edx,[esi + edi]
    xor  ecx,ecx
    mov  cl,al
    shr  cl,3
    add  edx,ecx
    mov  cl,al
    and  cl,7
    mov  al,1
    shl  al,cl
    or   byte [edx],al
    jmp  .Read_Next

.Read_Last:
    pop  eax
    call 0x004537B4 ; BuildingTypeClass::From_Name, eax is already the string
    cmp  al,0xff ; STRUCT_NONE
    jz   .Retn
    ; al is any value from 00 to FE
    ; di is the byte offset of the 32-byte ExtPrerequisiteOffset space
    ; esi is the pointer to the type
    lea  edx,[esi + edi]
    xor  ecx,ecx
    mov  cl,al
    shr  cl,3
    add  edx,ecx
    mov  cl,al
    and  cl,7
    mov  al,1
    shl  al,cl
    or   byte [edx],al
    
.Retn:
    ;mov eax,edi
    pop ebx
    pop ecx
    pop edx
    pop edi
    TechnoTypeClass.Prerequisite.Get(esi,eax)
    retn


_SelectPrereqTypeFromString:
    ;select PrereqType by performing string compare on eax
    push edx
    push ebx ; hold eax value for multiple checks
    push edi
    test eax,eax
    jz  .Retn ; just return 0
    mov  ebx,eax
    xor  edi,edi
.Repeat:
    mov  edx,[strlist.PrereqTypes+edi*4]
    test edx,edx
    jz   .DefaultNull
    call _strcmpi
    test eax,eax
    jz   .Apply
    inc  edi
    mov  eax,ebx
    jmp  .Repeat
.Apply:
    mov  eax,edi
    jmp  .Retn
.DefaultNull:
    xor  eax,eax  ; PrereqType.NONE
.Retn:
    pop edi
    pop ebx
    pop edx
    retn

