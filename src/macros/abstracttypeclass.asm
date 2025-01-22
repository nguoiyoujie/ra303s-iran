;----------------------------------------------------------------
; src/macros/abstracttypeclass.asm
;
; Macros to access AbstractTypeClass offsets
;
;----------------------------------------------------------------

; define abstract type field definitions
%define AbstractTypeClass.Offset.RTTI                      0x000    ; byte
%define AbstractTypeClass.Offset.Index                     0x001    ; INT
%define AbstractTypeClass.Offset.ININame                   0x002    ; byte[24]
%define AbstractTypeClass.Offset.StringTableName           0x01D    ; INT
; 0x021

; INI String controls
str.AbstractTypeClass.RTTI                      db"RTTI",0                ;internal feature
str.AbstractTypeClass.Index                     db"Index",0               ;internal feature
str.AbstractTypeClass.StringTableName           db"DefaultMission",0      ;internal feature


;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

%define AbstractTypeClass.RTTI.Get(ptr_type,reg_output)                        ObjectTypeClass.GetByte                ptr_type, AbstractTypeClass.Offset.RTTI, reg_output
;%define AbstractTypeClass.RTTI.Set(ptr_type,value)                             ObjectTypeClass.SetByte                ptr_type, AbstractTypeClass.Offset.RTTI, value
;%define AbstractTypeClass.RTTI.Read(ptr_type,ptr_rules)                        ObjectTypeClass.ReadByte               ptr_type, ptr_rules, AbstractTypeClass.Offset.RTTI, str.AbstractTypeClass.RTTI  

%define AbstractTypeClass.Index.Get(ptr_type,reg_output)                       ObjectTypeClass.GetInt                 ptr_type, AbstractTypeClass.Offset.Index, reg_output
;%define AbstractTypeClass.Index.Set(ptr_type,value)                            ObjectTypeClass.SetInt                 ptr_type, AbstractTypeClass.Offset.Index, value
;%define AbstractTypeClass.Index.Read(ptr_type,ptr_rules)                       ObjectTypeClass.ReadInt                ptr_type, ptr_rules, AbstractTypeClass.Offset.Index, str.AbstractTypeClass.Index

%define AbstractTypeClass.StringTableName.Get(ptr_type,reg_output)             ObjectTypeClass.GetInt                 ptr_type, AbstractTypeClass.Offset.StringTableName, reg_output
;%define AbstractTypeClass.StringTableName.Set(ptr_type,value)                  ObjectTypeClass.SetInt                 ptr_type, AbstractTypeClass.Offset.StringTableName, value
;%define AbstractTypeClass.StringTableName.Read(ptr_type,ptr_rules)             ObjectTypeClass.ReadInt                ptr_type, ptr_rules, AbstractTypeClass.Offset.StringTableName, str.AbstractTypeClass.StringTableName


; args <Numerical index of type class>,<pointer to type count>,<pointer to type array>,<register to output the result to>
; %4 must not be esi
; return <output>: the type class pointer, or 0 / NULL if invalid
%macro AbstractTypeClass.FromIndex    4
    push esi
    push edi
    mov  esi, [%2] 
    mov  edi, %1
    cmp  edi, esi
    jae  %%invalid_type

    mov  esi, [%3] 
    shl  edi, 2
    add  esi, edi
    pop  edi
    mov  %4, [esi] 
    jmp  %%done

  %%invalid_type:
    pop  edi
    mov  %4, 0
  %%done:
    pop  esi
%endmacro

; args <pointer to string>,<pointer to type count>,<pointer to type array>,<register to output the result to>
; %4 must not be esi, edi or edx
; return <output>: the type class pointer, or 0 / NULL if invalid
%macro AbstractTypeClass.FromID    4
    push esi
    push edi
    push eax
    push edx

    mov  edx, 0
    mov  eax, %1

  %%loop:
    AbstractTypeClass.FromIndex  edx,%2,%3,edi
    push eax
    push edx
    push edi
    ObjectTypeClass.ID  edi,edx
    call _strcmpi
    pop  edi
    pop  edx
    test eax, eax
    pop  eax
    jnz  %%next

    mov  %4, edi
    jmp  %%done

  %%next:
    inc  edx
    cmp  edx, [%2] 
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



