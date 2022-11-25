
; define array location where aircraft type classes are stored
%define Array_WarheadTypeClass             0x00691634
%define Count_WarheadTypeClass             0x0069160C

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
%define WarheadTypeClass.Offset.ExplosionSet              0x00E    ; moved, and use BYTE // was INT, 0x01A // Already supported by game INI
%define WarheadTypeClass.Offset.InfantryDeath             0x00F    ; moved, and use BYTE // was INT, 0x01E // Already supported by game INI

%define WarheadTypeClass.Offset.Modifier                  0x010    ; fixed[5] // fixed is WORD, in units of 1/256
%define WarheadTypeClass.Offset.Modifier0                 0x010    ; WORD
%define WarheadTypeClass.Offset.Modifier1                 0x012    ; WORD
%define WarheadTypeClass.Offset.Modifier2                 0x014    ; WORD
%define WarheadTypeClass.Offset.Modifier3                 0x016    ; WORD
%define WarheadTypeClass.Offset.Modifier4                 0x018    ; WORD
%define WarheadTypeClass.Offset.Modifier5                 0x01A    ; WORD ;added
%define WarheadTypeClass.Offset.Modifier6                 0x01C    ; WORD ;added
%define WarheadTypeClass.Offset.Modifier7                 0x01E    ; WORD ;added
%define WarheadTypeClass.Offset.Modifier8                 0x020    ; WORD ;added
;%define WarheadTypeClass.Offset.Modifier9                 0x022    ; WORD
;%define WarheadTypeClass.Offset.Modifier10                0x024    ; WORD
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


%define WarheadTypeClass.FromIndex(d_index,reg_output)                         TechnoTypeClass.FromIndex              d_index, Count_WarheadTypeClass, Array_WarheadTypeClass, reg_output
%define WarheadTypeClass.FromID(d_index,reg_output)                            TechnoTypeClass.FromID                 d_index, Count_WarheadTypeClass, Array_WarheadTypeClass, reg_output

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
    Get_Bit BYTE [%1+%3], %4
    xor  ecx, ecx
    mov  cl, al
    call_INIClass__Get_Bool %2, edx, %5, ecx
    Set_Bit_Byte [%1+%3], %4, al
%endmacro

%macro WarheadTypeClass.ReadByte    4
    WarheadTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  BYTE cl, [%1+%3]
    call_INIClass__Get_Int %2, edx, %4, ecx
    mov  BYTE [%1+%3], al
%endmacro

; args <Internal ID of type class>
; returns the type class pointer as EAX
%macro Get_WarheadTypeClass    1
    push edx
    mov  edx, [Count_WarheadTypeClass] 
    cmp  %1, edx
    jge  %%invalid_type

    mov  edx, [Array_WarheadTypeClass] 
    shl  %1, 2
    add  edx, %1
    mov  eax, [edx] 
    jmp  %%done

  %%invalid_type:
    mov  eax, 0
  %%done:
    pop  edx
%endmacro
