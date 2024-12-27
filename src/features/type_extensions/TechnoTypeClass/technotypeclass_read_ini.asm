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
@JMP 0x00569B6A 0x00569B72 ;_TechnoTypeClass__SkipReading_Prerequisite
@HOOK 0x00569E1F _TechnoTypeClass__Read_INI_Extended

@CLEAR 0x00569B6F 0x90 0x00569B72
@CLEAR 0x00569B7B 0x90 0x00569B81 ; bug-fix: remove actual writing of value into prerequisite

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
    cmp  eax,0
    je  .Retn ; just return 0
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
    
    cmp  eax,0
    je  .Retn ; just return 0
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
    cmp  eax,0
    je  .Retn ; just return 0
    cmp  eax,0
    je  .DefaultNull ; just return 0
    mov  ebx,eax

.Check.NONE:
    mov  edx,str.PrereqType.NONE
    call _strcmpi
    test eax,eax
    jnz  .Check.CONYARD
    mov  al,PrereqType.NONE
    jmp  .Retn

.Check.CONYARD:
    mov  edx,str.PrereqType.CONYARD
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.POWER
    mov  al,PrereqType.CONYARD
    jmp  .Retn

.Check.POWER:
    mov  edx,str.PrereqType.POWER
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.ADV.POWER
    mov  al,PrereqType.POWER
    jmp  .Retn

.Check.ADV.POWER:
    mov  edx,str.PrereqType.ADV.POWER
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.REFINERY
    mov  al,PrereqType.ADV.POWER
    jmp  .Retn

.Check.REFINERY:
    mov  edx,str.PrereqType.REFINERY
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.ORESILO
    mov  al,PrereqType.REFINERY
    jmp  .Retn

.Check.ORESILO:
    mov  edx,str.PrereqType.ORESILO
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.BARRACKS
    mov  al,PrereqType.ORESILO
    jmp  .Retn

.Check.BARRACKS:
    mov  edx,str.PrereqType.BARRACKS
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.WARFACTORY
    mov  al,PrereqType.BARRACKS
    jmp  .Retn

.Check.WARFACTORY:
    mov  edx,str.PrereqType.WARFACTORY
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.RADAR
    mov  al,PrereqType.WARFACTORY
    jmp  .Retn

.Check.RADAR:
    mov  edx,str.PrereqType.RADAR
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.REPAIR
    mov  al,PrereqType.RADAR
    jmp  .Retn

.Check.REPAIR:
    mov  edx,str.PrereqType.REPAIR
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.DEFENSE
    mov  al,PrereqType.REPAIR
    jmp  .Retn

.Check.DEFENSE:
    mov  edx,str.PrereqType.DEFENSE
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.ADV.DEFENSE
    mov  al,PrereqType.DEFENSE
    jmp  .Retn

.Check.ADV.DEFENSE:
    mov  edx,str.PrereqType.ADV.DEFENSE
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.AA.DEFENSE
    mov  al,PrereqType.ADV.DEFENSE
    jmp  .Retn

.Check.AA.DEFENSE:
    mov  edx,str.PrereqType.AA.DEFENSE
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.TECH
    mov  al,PrereqType.AA.DEFENSE
    jmp  .Retn

.Check.TECH:
    mov  edx,str.PrereqType.TECH
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.AIRSTRIP
    mov  al,PrereqType.TECH
    jmp  .Retn

.Check.AIRSTRIP:
    mov  edx,str.PrereqType.AIRSTRIP
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.HELIPAD
    mov  al,PrereqType.AIRSTRIP
    jmp  .Retn

.Check.HELIPAD:
    mov  edx,str.PrereqType.HELIPAD
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.SHIPYARD
    mov  al,PrereqType.HELIPAD
    jmp  .Retn

.Check.SHIPYARD:
    mov  edx,str.PrereqType.SHIPYARD
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.LAB
    mov  al,PrereqType.SHIPYARD
    jmp  .Retn

.Check.LAB:
    mov  edx,str.PrereqType.LAB
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.ADV.LAB
    mov  al,PrereqType.LAB
    jmp  .Retn

.Check.ADV.LAB:
    mov  edx,str.PrereqType.ADV.LAB
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.ADV.WEAPON1
    mov  al,PrereqType.ADV.LAB
    jmp  .Retn

.Check.ADV.WEAPON1:
    mov  edx,str.PrereqType.ADV.WEAPON1
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.ADV.WEAPON2
    mov  al,PrereqType.ADV.WEAPON1
    jmp  .Retn

.Check.ADV.WEAPON2:
    mov  edx,str.PrereqType.ADV.WEAPON2
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.FAKES
    mov  al,PrereqType.ADV.WEAPON2
    jmp  .Retn

.Check.FAKES:
    mov  edx,str.PrereqType.FAKES
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.USER.22
    mov  al,PrereqType.FAKES
    jmp  .Retn

.Check.USER.22:
    mov  edx,str.PrereqType.USER.22
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.USER.23
    mov  al,PrereqType.USER.22
    jmp  .Retn

.Check.USER.23:
    mov  edx,str.PrereqType.USER.23
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.USER.24
    mov  al,PrereqType.USER.23
    jmp  .Retn

.Check.USER.24:
    mov  edx,str.PrereqType.USER.24
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.USER.25
    mov  al,PrereqType.USER.24
    jmp  .Retn

.Check.USER.25:
    mov  edx,str.PrereqType.USER.25
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.USER.26
    mov  al,PrereqType.USER.25
    jmp  .Retn

.Check.USER.26:
    mov  edx,str.PrereqType.USER.26
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.USER.27
    mov  al,PrereqType.USER.26
    jmp  .Retn

.Check.USER.27:
    mov  edx,str.PrereqType.USER.27
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.USER.28
    mov  al,PrereqType.USER.27
    jmp  .Retn

.Check.USER.28:
    mov  edx,str.PrereqType.USER.28
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.USER.29
    mov  al,PrereqType.USER.28
    jmp  .Retn

.Check.USER.29:
    mov  edx,str.PrereqType.USER.29
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.MISC
    mov  al,PrereqType.USER.29
    jmp  .Retn

.Check.MISC:
    mov  edx,str.PrereqType.MISC
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.CIVBUILDING
    mov  al,PrereqType.MISC
    jmp  .Retn

.Check.CIVBUILDING:
    mov  edx,str.PrereqType.CIVBUILDING
    mov  eax,ebx
    call _strcmpi
    jnz  .DefaultNull
    mov  al,PrereqType.CIVBUILDING
    jmp  .Retn

;.CheckBuilding:
;    call 0x004537B4 ; BuildingTypeClass::From_Name, eax is already the string
;    cmp  al,0xff ; STRUCT_NONE
;    jz   .DefaultNull

.DefaultNull:
    xor  eax,eax  ; PrereqType.NONE

.Retn:
    pop ebx
    pop edx
    retn

