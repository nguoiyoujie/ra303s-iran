;----------------------------------------------------------------
; src/macros/warheadtypeclass.asm
;
; Macros to access WarheadTypeClass offsets
;
;----------------------------------------------------------------

; define warhead type field definitions
%define WarheadTypeClass.Offset.ID                        0x000    ; INT // ID
%define WarheadTypeClass.Offset.IniName                   0x004    ; INT PTR to STRING
%define WarheadTypeClass.Offset.SpreadFactor              0x008    ; INT
%define WarheadTypeClass.Offset.IsWallDestroyer           0x00c    ; BOOL // Already supported by game INI
%define WarheadTypeClass.Bit.IsWallDestroyer              1    
%define WarheadTypeClass.Offset.IsWoodDestroyer           0x00c    ; BOOL // Already supported by game INI
%define WarheadTypeClass.Bit.IsWoodDestroyer              2    
%define WarheadTypeClass.Offset.IsTiberiumDestroyer       0x00c    ; BOOL // Already supported by game INI
%define WarheadTypeClass.Bit.IsTiberiumDestroyer          3    
%define WarheadTypeClass.Offset.IsOrganic                 0x00c    ; BOOL// Already supported by game INI
%define WarheadTypeClass.Bit.IsOrganic                    4    
; 0x00d, 0x00e and 0x00f are empty

;%define WarheadTypeClass.Offset.ExplosionAnim             0x00D    ; new, animation override, byte
%define WarheadTypeClass.Offset.ExplosionSet              0x00E    ; moved, and use byte // was INT, 0x01A // Already supported by game INI
%define WarheadTypeClass.Offset.InfantryDeath             0x00F    ; moved, and use byte // was INT, 0x01E // Already supported by game INI

%define WarheadTypeClass.Offset.Modifier                  0x010    ; fixed[5] // fixed is word, in units of 1/256
%define WarheadTypeClass.Offset.Modifier0                 0x010    ; word
%define WarheadTypeClass.Offset.Modifier1                 0x012    ; word
%define WarheadTypeClass.Offset.Modifier2                 0x014    ; word
%define WarheadTypeClass.Offset.Modifier3                 0x016    ; word
%define WarheadTypeClass.Offset.Modifier4                 0x018    ; word
%define WarheadTypeClass.Offset.Modifier5                 0x01A    ; word ;added
%define WarheadTypeClass.Offset.Modifier6                 0x01C    ; word ;added
%define WarheadTypeClass.Offset.Modifier7                 0x01E    ; word ;added
%define WarheadTypeClass.Offset.Modifier8                 0x020    ; word ;added
;%define WarheadTypeClass.Offset.Modifier9                 0x022    ; word
;%define WarheadTypeClass.Offset.Modifier10                0x024    ; word
; 000 - 021


; INI String controls
str.WarheadTypeClass.SpreadFactor              db"Spread",0                 ;existing ini
str.WarheadTypeClass.IsWallDestroyer           db"Wall",0                   ;existing ini
str.WarheadTypeClass.IsWoodDestroyer           db"Wood",0                   ;existing ini
str.WarheadTypeClass.IsTiberiumDestroyer       db"Ore",0                    ;existing ini
str.WarheadTypeClass.IsOrganic                 db"Organic",0                ;existing ini (not actually read by INI key, but derived from Verses)
str.WarheadTypeClass.Modifier                  db"Verses",0                 ;existing ini
;str.WarheadTypeClass.ExplosionAnim             db"Anim",0                   ;new ini
str.WarheadTypeClass.ExplosionSet              db"Explosion",0              ;existing ini
str.WarheadTypeClass.InfantryDeath             db"InfDeath",0               ;existing ini


%define WarheadTypeClass.FromIndex(d_index,reg_output)                         AbstractTypeClass.FromIndex              d_index, WarheadTypeClass.Count, WarheadTypeClass.Array, reg_output
%define WarheadTypeClass.FromID(d_index,reg_output)                            WarheadTypeClass.FromIDInner           d_index, WarheadTypeClass.Count, WarheadTypeClass.Array, reg_output

; WarheadType class is NOT derived from ObjectTypeClass!
; args <pointer to string>,<pointer to type count>,<pointer to type array>,<register to output the result to>
; %2 must not be esi or edx
; return <output>: the type class pointer, or 0 / NULL if invalid
%macro WarheadTypeClass.FromIDInner    4
    push esi
    push edi
    push eax
    push edx

    xor  edx,edx
    mov  eax,%1

  %%loop:
    push edx
    AbstractTypeClass.FromIndex  edx,%2,%3,edi
    push eax
	mov  edx,[edi+WarheadTypeClass.Offset.IniName] ; use mov instead of lea because the string stored in WarheadTypeClass is a pointer instead of a buffer
    call _strcmpi
    test eax,eax
    pop  eax
    pop  edx
    jnz  %%next

    mov  %4,edi
    jmp  %%done

  %%next:
    inc  edx
    cmp  edx,[%2] 
    jae  %%done_no_match
    jmp  %%loop

  %%done_no_match:
    mov  %4, 0

  %%done:
    pop  edx
    pop  eax
    pop  edi
    pop  esi
%endmacro

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

%define WarheadTypeClass.IsWallDestroyer.Get(ptr_type,reg_output)             ObjectTypeClass.GetBool                ptr_type, WarheadTypeClass.Offset.IsWallDestroyer, WarheadTypeClass.Bit.IsWallDestroyer, reg_output
%define WarheadTypeClass.IsWallDestroyer.Set(ptr_type,value)                  ObjectTypeClass.SetBool                ptr_type, WarheadTypeClass.Offset.IsWallDestroyer, WarheadTypeClass.Bit.IsWallDestroyer, value
%define WarheadTypeClass.IsWallDestroyer.Read(ptr_type,ptr_rules)             WarheadTypeClass.ReadBool              ptr_type, ptr_rules, WarheadTypeClass.Offset.IsWallDestroyer, WarheadTypeClass.Bit.IsWallDestroyer, str.WarheadTypeClass.IsWallDestroyer  

%define WarheadTypeClass.IsWoodDestroyer.Get(ptr_type,reg_output)             ObjectTypeClass.GetBool                ptr_type, WarheadTypeClass.Offset.IsWoodDestroyer, WarheadTypeClass.Bit.IsWoodDestroyer, reg_output
%define WarheadTypeClass.IsWoodDestroyer.Set(ptr_type,value)                  ObjectTypeClass.SetBool                ptr_type, WarheadTypeClass.Offset.IsWoodDestroyer, WarheadTypeClass.Bit.IsWoodDestroyer, value
%define WarheadTypeClass.IsWoodDestroyer.Read(ptr_type,ptr_rules)             WarheadTypeClass.ReadBool              ptr_type, ptr_rules, WarheadTypeClass.Offset.IsWoodDestroyer, WarheadTypeClass.Bit.IsWoodDestroyer, str.WarheadTypeClass.IsWoodDestroyer

%define WarheadTypeClass.IsTiberiumDestroyer.Get(ptr_type,reg_output)         ObjectTypeClass.GetBool                ptr_type, WarheadTypeClass.Offset.IsTiberiumDestroyer, WarheadTypeClass.Bit.IsTiberiumDestroyer, reg_output
%define WarheadTypeClass.IsTiberiumDestroyer.Set(ptr_type,value)              ObjectTypeClass.SetBool                ptr_type, WarheadTypeClass.Offset.IsTiberiumDestroyer, WarheadTypeClass.Bit.IsTiberiumDestroyer, value
%define WarheadTypeClass.IsTiberiumDestroyer.Read(ptr_type,ptr_rules)         WarheadTypeClass.ReadBool              ptr_type, ptr_rules, WarheadTypeClass.Offset.IsTiberiumDestroyer, WarheadTypeClass.Bit.IsTiberiumDestroyer, str.WarheadTypeClass.IsTiberiumDestroyer

%define WarheadTypeClass.IsOrganic.Get(ptr_type,reg_output)                   ObjectTypeClass.GetBool                ptr_type, WarheadTypeClass.Offset.IsOrganic, WarheadTypeClass.Bit.IsOrganic, reg_output
%define WarheadTypeClass.IsOrganic.Set(ptr_type,value)                        ObjectTypeClass.SetBool                ptr_type, WarheadTypeClass.Offset.IsOrganic, WarheadTypeClass.Bit.IsOrganic, value
%define WarheadTypeClass.IsOrganic.Read(ptr_type,ptr_rules)                   WarheadTypeClass.ReadBool              ptr_type, ptr_rules, WarheadTypeClass.Offset.IsOrganic, WarheadTypeClass.Bit.IsOrganic, str.WarheadTypeClass.IsOrganic

;%define WarheadTypeClass.ExplosionAnim.Get(ptr_type,reg_output)               ObjectTypeClass.GetByte                ptr_type, WarheadTypeClass.Offset.ExplosionAnim, reg_output
;%define WarheadTypeClass.ExplosionAnim.Set(ptr_type,value)                    ObjectTypeClass.SetByte                ptr_type, WarheadTypeClass.Offset.ExplosionAnim, value
;%define WarheadTypeClass.ExplosionAnim.Read(ptr_type,ptr_rules,function)       WarheadTypeClass.ReadStringToByteExt   ptr_type, ptr_rules, WarheadTypeClass.Offset.ExplosionAnim, str.WarheadTypeClass.ExplosionAnim, function

%define WarheadTypeClass.ExplosionSet.Get(ptr_type,reg_output)                ObjectTypeClass.GetByte                ptr_type, WarheadTypeClass.Offset.ExplosionSet, reg_output
%define WarheadTypeClass.ExplosionSet.Set(ptr_type,value)                     ObjectTypeClass.SetByte                ptr_type, WarheadTypeClass.Offset.ExplosionSet, value
%define WarheadTypeClass.ExplosionSet.Read(ptr_type,ptr_rules)                WarheadTypeClass.ReadByte              ptr_type, ptr_rules, WarheadTypeClass.Offset.ExplosionSet, str.WarheadTypeClass.ExplosionSet

%define WarheadTypeClass.InfantryDeath.Get(ptr_type,reg_output)               ObjectTypeClass.GetByte                ptr_type, WarheadTypeClass.Offset.InfantryDeath, reg_output
%define WarheadTypeClass.InfantryDeath.Set(ptr_type,value)                    ObjectTypeClass.SetByte                ptr_type, WarheadTypeClass.Offset.InfantryDeath, value
%define WarheadTypeClass.InfantryDeath.Read(ptr_type,ptr_rules)               WarheadTypeClass.ReadByte              ptr_type, ptr_rules, WarheadTypeClass.Offset.InfantryDeath, str.WarheadTypeClass.InfantryDeath

;  method of getting ID differs from ObjectTypeClass
%macro WarheadTypeClass.ID    2
    mov  %2, [%1+4]  
%endmacro

%macro WarheadTypeClass.ReadBool    5
    WarheadTypeClass.ID %1,edx
    Get_Bit byte[%1+%3],%4
    xor  ecx,ecx
    mov  cl,al
    call_INIClass__Get_Bool %2,edx,%5,ecx
    Set_Bit_Byte[%1+%3],%4,al
%endmacro

%macro WarheadTypeClass.ReadByte    4
    WarheadTypeClass.ID %1,edx
    xor  ecx,ecx
    mov  byte cl,[%1+%3]
    call_INIClass__Get_Int %2,edx,%4,ecx
    mov  byte[%1+%3],al
%endmacro

; args <Internal ID of type class>
; returns the type class pointer as eax
%macro Get_WarheadTypeClass    1
    push edx
    mov  edx,[WarheadTypeClass.Count] 
    cmp  %1,edx
    jge  %%invalid_type

    mov  edx,[WarheadTypeClass.Array] 
    shl  %1, 2
    add  edx,%1
    mov  eax,[edx] 
    jmp  %%done

  %%invalid_type:
    xor  eax,eax
  %%done:
    pop  edx
%endmacro


_GetWarheadTypeIDFromString:
    ;select WarheadType by performing string compare on eax
    push ebx
    cmp  eax,0
    jle  .Retn ; just return 0
    WarheadTypeClass.FromID(eax,ebx)
    ;in case the ID was invalid...
    test ebx,ebx
    jz   .Retn ; just return 0
    mov  ebx,dword[ebx]; index
    mov  eax,ebx
.Retn:
    pop ebx
    retn
  