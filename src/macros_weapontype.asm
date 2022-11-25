
; define array location where aircraft type classes are stored
%define Array_WeaponTypeClass              0x00691680
%define Count_WeaponTypeClass              0x00691658

; define warhead type field definitions
%define WeaponTypeClass.Offset.ID                        0x000    ; INT // ID
%define WeaponTypeClass.Offset.IniName                   0x004    ; INT PTR to STRING
%define WeaponTypeClass.Offset.IsTurboBoosted            0x008    ; BOOL // Already supported by game INI
%define WeaponTypeClass.Bit.IsTurboBoosted               1    
%define WeaponTypeClass.Offset.IsSupressed               0x008    ; BOOL // Already supported by game INI
%define WeaponTypeClass.Bit.IsSupressed                  2    
%define WeaponTypeClass.Offset.IsCamera                  0x008    ; BOOL // Already supported by game INI
%define WeaponTypeClass.Bit.IsCamera                     3    
%define WeaponTypeClass.Offset.IsElectric                0x008    ; BOOL // Already supported by game INI
%define WeaponTypeClass.Bit.IsElectric                   4    
; 0x009, 0x00a and 0x00b are empty
%define WeaponTypeClass.Offset.Burst                     0x00c    ; INT (0,1)
%define WeaponTypeClass.Offset.Bullet                    0x010    ; INT PTR
%define WeaponTypeClass.Offset.Damage                    0x014    ; INT
%define WeaponTypeClass.Offset.MaxSpeed                  0x018    ; BYTE
%define WeaponTypeClass.Offset.WarheadPtr                0x019    ; INT PTR
%define WeaponTypeClass.Offset.ROF                       0x01d    ; INT
%define WeaponTypeClass.Offset.Range                     0x021    ; WORD
%define WeaponTypeClass.Offset.Sound                     0x023    ; WORD
%define WeaponTypeClass.Offset.Anim                      0x025    ; BYTE

; INI String controls
str.WeaponTypeClass.IsTurboBoosted            db"TurboBoost",0          ;existing ini
str.WeaponTypeClass.IsElectric                db"Charges",0             ;existing ini
str.WeaponTypeClass.IsCamera                  db"Camera",0              ;existing ini
str.WeaponTypeClass.IsSupressed               db"Supress",0             ;existing ini
str.WeaponTypeClass.Burst                     db"Burst",0               ;existing ini
str.WeaponTypeClass.Bullet                    db"Projectile",0          ;existing ini
str.WeaponTypeClass.Damage                    db"Damage",0              ;existing ini
str.WeaponTypeClass.MaxSpeed                  db"Speed",0               ;existing ini
str.WeaponTypeClass.WarheadPtr                db"Warhead",0             ;existing ini
str.WeaponTypeClass.ROF                       db"ROF",0                 ;existing ini
str.WeaponTypeClass.Range                     db"Range",0               ;existing ini
str.WeaponTypeClass.Sound                     db"Report",0              ;existing ini
str.WeaponTypeClass.Anim                      db"Anim",0                ;existing ini


%define WeaponTypeClass.FromIndex(d_index,reg_output)                        TechnoTypeClass.FromIndex              d_index, Count_WeaponTypeClass, Array_WeaponTypeClass, reg_output
%define WeaponTypeClass.FromID(d_index,reg_output)                           WeaponTypeClass.FromIDInner            d_index, Count_WeaponTypeClass, Array_WeaponTypeClass, reg_output

; WeaponType class is NOT derived from ObjectTypeClass!
; args <pointer to string>,<pointer to type count>,<pointer to type array>,<register to output the result to>
; %2 must not be ESI or EDX
; return <output>: the type class pointer, or 0 / NULL if invalid
%macro WeaponTypeClass.FromIDInner    4
    push esi
    push edi
    push eax
    push edx

    mov  edx, 0
    mov  eax, %1

  %%loop:
    push edx
    TechnoTypeClass.FromIndex  edx, %2, %3, edi
    push eax
	mov  edx, [edi+WeaponTypeClass.Offset.IniName] ; use mov instead of lea because the string stored in WeaponTypeClass is a pointer instead of a buffer
    call _strcmpi
    test eax, eax
    pop  eax
    pop  edx
    jnz  %%next

    mov  %4, edi
    jmp  %%done

  %%next:
    inc  edx
    cmp  edx, [%2] 
    jge  %%done_no_match
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

%define WeaponTypeClass.IsTurboBoosted.Get(ptr_type,reg_output)              ObjectTypeClass.GetBool                ptr_type, WeaponTypeClass.Offset.IsTurboBoosted, WeaponTypeClass.Bit.IsTurboBoosted, reg_output
%define WeaponTypeClass.IsTurboBoosted.Set(ptr_type,value)                   ObjectTypeClass.SetBool                ptr_type, WeaponTypeClass.Offset.IsTurboBoosted, WeaponTypeClass.Bit.IsTurboBoosted, value
%define WeaponTypeClass.IsTurboBoosted.Read(ptr_type,ptr_rules)              WeaponTypeClass.ReadBool               ptr_type, ptr_rules, WeaponTypeClass.Offset.IsTurboBoosted, WeaponTypeClass.Bit.IsTurboBoosted, str.WeaponTypeClass.IsTurboBoosted  

%define WeaponTypeClass.IsSupressed.Get(ptr_type,reg_output)                 ObjectTypeClass.GetBool                ptr_type, WeaponTypeClass.Offset.IsSupressed, WeaponTypeClass.Bit.IsSupressed, reg_output
%define WeaponTypeClass.IsSupressed.Set(ptr_type,value)                      ObjectTypeClass.SetBool                ptr_type, WeaponTypeClass.Offset.IsSupressed, WeaponTypeClass.Bit.IsSupressed, value
%define WeaponTypeClass.IsSupressed.Read(ptr_type,ptr_rules)                 WeaponTypeClass.ReadBool               ptr_type, ptr_rules, WeaponTypeClass.Offset.IsSupressed, WeaponTypeClass.Bit.IsSupressed, str.WeaponTypeClass.IsSupressed

%define WeaponTypeClass.IsCamera.Get(ptr_type,reg_output)                    ObjectTypeClass.GetBool                ptr_type, WeaponTypeClass.Offset.IsCamera, WeaponTypeClass.Bit.IsCamera, reg_output
%define WeaponTypeClass.IsCamera.Set(ptr_type,value)                         ObjectTypeClass.SetBool                ptr_type, WeaponTypeClass.Offset.IsCamera, WeaponTypeClass.Bit.IsCamera, value
%define WeaponTypeClass.IsCamera.Read(ptr_type,ptr_rules)                    WeaponTypeClass.ReadBool               ptr_type, ptr_rules, WeaponTypeClass.Offset.IsCamera, WeaponTypeClass.Bit.IsCamera, str.WeaponTypeClass.IsCamera

%define WeaponTypeClass.IsElectric.Get(ptr_type,reg_output)                  ObjectTypeClass.GetBool                ptr_type, WeaponTypeClass.Offset.IsElectric, WeaponTypeClass.Bit.IsElectric, reg_output
%define WeaponTypeClass.IsElectric.Set(ptr_type,value)                       ObjectTypeClass.SetBool                ptr_type, WeaponTypeClass.Offset.IsElectric, WeaponTypeClass.Bit.IsElectric, value
%define WeaponTypeClass.IsElectric.Read(ptr_type,ptr_rules)                  WeaponTypeClass.ReadBool               ptr_type, ptr_rules, WeaponTypeClass.Offset.IsElectric, WeaponTypeClass.Bit.IsElectric, str.WeaponTypeClass.IsElectric

%define WeaponTypeClass.Burst.Get(ptr_type,reg_output)                       ObjectTypeClass.GetInt                 ptr_type, WeaponTypeClass.Offset.Burst, reg_output
%define WeaponTypeClass.Burst.Set(ptr_type,value)                            ObjectTypeClass.SetInt                 ptr_type, WeaponTypeClass.Offset.Burst, value
%define WeaponTypeClass.Burst.Read(ptr_type,ptr_rules)                       WeaponTypeClass.ReadInt                ptr_type, ptr_rules, WeaponTypeClass.Offset.Burst, str.WeaponTypeClass.Burst

%define WeaponTypeClass.Bullet.Get(ptr_type,reg_output)                      ObjectTypeClass.GetInt                 ptr_type, WeaponTypeClass.Offset.Bullet, reg_output
%define WeaponTypeClass.Bullet.Set(ptr_type,value)                           ObjectTypeClass.SetInt                 ptr_type, WeaponTypeClass.Offset.Bullet, value
%define WeaponTypeClass.Bullet.Read(ptr_type,ptr_rules)                      WeaponTypeClass.ReadInt                ptr_type, ptr_rules, WeaponTypeClass.Offset.Bullet, str.WeaponTypeClass.Bullet

%define WeaponTypeClass.Damage.Get(ptr_type,reg_output)                      ObjectTypeClass.GetInt                 ptr_type, WeaponTypeClass.Offset.Damage, reg_output
%define WeaponTypeClass.Damage.Set(ptr_type,value)                           ObjectTypeClass.SetInt                 ptr_type, WeaponTypeClass.Offset.Damage, value
%define WeaponTypeClass.Damage.Read(ptr_type,ptr_rules)                      WeaponTypeClass.ReadInt                ptr_type, ptr_rules, WeaponTypeClass.Offset.Damage, str.WeaponTypeClass.Damage

%define WeaponTypeClass.MaxSpeed.Get(ptr_type,reg_output)                    ObjectTypeClass.GetByte                ptr_type, WeaponTypeClass.Offset.MaxSpeed, reg_output
%define WeaponTypeClass.MaxSpeed.Set(ptr_type,value)                         ObjectTypeClass.SetByte                ptr_type, WeaponTypeClass.Offset.MaxSpeed, value
%define WeaponTypeClass.MaxSpeed.Read(ptr_type,ptr_rules)                    WeaponTypeClass.ReadByte               ptr_type, ptr_rules, WeaponTypeClass.Offset.MaxSpeed, str.WeaponTypeClass.MaxSpeed

%define WeaponTypeClass.WarheadPtr.Get(ptr_type,reg_output)                  ObjectTypeClass.GetInt                 ptr_type, WeaponTypeClass.Offset.WarheadPtr, reg_output
%define WeaponTypeClass.WarheadPtr.Set(ptr_type,value)                       ObjectTypeClass.SetInt                 ptr_type, WeaponTypeClass.Offset.WarheadPtr, value
%define WeaponTypeClass.WarheadPtr.Read(ptr_type,ptr_rules)                  WeaponTypeClass.ReadInt                ptr_type, ptr_rules, WeaponTypeClass.Offset.WarheadPtr, str.WeaponTypeClass.WarheadPtr

%define WeaponTypeClass.ROF.Get(ptr_type,reg_output)                         ObjectTypeClass.GetInt                 ptr_type, WeaponTypeClass.Offset.ROF, reg_output
%define WeaponTypeClass.ROF.Set(ptr_type,value)                              ObjectTypeClass.SetInt                 ptr_type, WeaponTypeClass.Offset.ROF, value
%define WeaponTypeClass.ROF.Read(ptr_type,ptr_rules)                         WeaponTypeClass.ReadInt                ptr_type, ptr_rules, WeaponTypeClass.Offset.ROF, str.WeaponTypeClass.ROF

%define WeaponTypeClass.Range.Get(ptr_type,reg_output)                       ObjectTypeClass.GetWord                ptr_type, WeaponTypeClass.Offset.Range, reg_output
%define WeaponTypeClass.Range.Set(ptr_type,value)                            ObjectTypeClass.SetWord                ptr_type, WeaponTypeClass.Offset.Range, value
%define WeaponTypeClass.Range.Read(ptr_type,ptr_rules)                       WeaponTypeClass.ReadWord               ptr_type, ptr_rules, WeaponTypeClass.Offset.Range, str.WeaponTypeClass.Range

%define WeaponTypeClass.Sound.Get(ptr_type,reg_output)                       ObjectTypeClass.GetWord                ptr_type, WeaponTypeClass.Offset.Sound, reg_output
%define WeaponTypeClass.Sound.Set(ptr_type,value)                            ObjectTypeClass.SetWord                ptr_type, WeaponTypeClass.Offset.Sound, value
%define WeaponTypeClass.Sound.Read(ptr_type,ptr_rules)                       WeaponTypeClass.ReadWord               ptr_type, ptr_rules, WeaponTypeClass.Offset.Sound, str.WeaponTypeClass.Sound
  
%define WeaponTypeClass.Anim.Get(ptr_type,reg_output)                        ObjectTypeClass.GetByte                ptr_type, WeaponTypeClass.Offset.Anim, reg_output
%define WeaponTypeClass.Anim.Set(ptr_type,value)                             ObjectTypeClass.SetByte                ptr_type, WeaponTypeClass.Offset.Anim, value
%define WeaponTypeClass.Anim.Read(ptr_type,ptr_rules)                        WeaponTypeClass.ReadByte               ptr_type, ptr_rules, WeaponTypeClass.Offset.Anim, str.WeaponTypeClass.Anim

;  method of getting ID differs from ObjectTypeClass
%macro WeaponTypeClass.ID    2
    mov  %2, [%1+4]  
%endmacro

%macro WeaponTypeClass.ReadBool    5
    WeaponTypeClass.ID %1,edx
    Get_Bit BYTE [%1+%3], %4
    xor  ecx, ecx
    mov  cl, al
    call_INIClass__Get_Bool %2, edx, %5, ecx
    Set_Bit_Byte [%1+%3], %4, al
%endmacro

%macro WeaponTypeClass.ReadByte    4
    WeaponTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  BYTE cl, [%1+%3]
    call_INIClass__Get_Int %2, edx, %4, ecx
    mov  BYTE [%1+%3], al
%endmacro

; args <Internal ID of type class>
; returns the type class pointer as EAX
%macro Get_WeaponTypeClass    1
    push edx
    mov  edx, [Count_WeaponTypeClass] 
    cmp  %1, edx
    jge  %%invalid_type

    mov  edx, [Array_WeaponTypeClass] 
    shl  %1, 2
    add  edx, %1
    mov  eax, [edx] 
    jmp  %%done

  %%invalid_type:
    mov  eax, 0
  %%done:
    pop  edx
%endmacro
