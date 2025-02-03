;----------------------------------------------------------------
; inc/types/abstracttypeclass.inc
;
; Macros to access AbstractTypeClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_ABSTRACTYPECLASS
%define TYPES_ABSTRACTYPECLASS

; define abstract type field definitions
%define AbstractTypeClass.Offset.RTTI                      0x000    ; byte
%define AbstractTypeClass.Offset.Index                     0x001    ; INT
%define AbstractTypeClass.Offset.ININame                   0x005    ; byte[24]
%define AbstractTypeClass.Offset.StringTableName           0x01D    ; INT
; 0x021

; INI String controls
;str.AbstractTypeClass.RTTI                         db"RTTI",0
;str.AbstractTypeClass.Index                        db"Index",0
;str.AbstractTypeClass.StringTableName              db"DefaultMission",0


;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

%define AbstractTypeClass.RTTI.Get(ptr_type,reg_output)                        GetByte                ptr_type, AbstractTypeClass.Offset.RTTI, reg_output
;%define AbstractTypeClass.RTTI.Set(ptr_type,value)                             SetByte                ptr_type, AbstractTypeClass.Offset.RTTI, value
;%define AbstractTypeClass.RTTI.Read(ptr_type,ptr_rules)                        AbstractTypeClass.ReadByte               ptr_type, ptr_rules, AbstractTypeClass.Offset.RTTI, str.AbstractTypeClass.RTTI  

%define AbstractTypeClass.Index.Get(ptr_type,reg_output)                       GetInt                 ptr_type, AbstractTypeClass.Offset.Index, reg_output
;%define AbstractTypeClass.Index.Set(ptr_type,value)                            SetInt                 ptr_type, AbstractTypeClass.Offset.Index, value
;%define AbstractTypeClass.Index.Read(ptr_type,ptr_rules)                       AbstractTypeClass.ReadInt                ptr_type, ptr_rules, AbstractTypeClass.Offset.Index, str.AbstractTypeClass.Index

%define AbstractTypeClass.StringTableName.Get(ptr_type,reg_output)             GetInt                 ptr_type, AbstractTypeClass.Offset.StringTableName, reg_output
;%define AbstractTypeClass.StringTableName.Set(ptr_type,value)                  SetInt                 ptr_type, AbstractTypeClass.Offset.StringTableName, value
;%define AbstractTypeClass.StringTableName.Read(ptr_type,ptr_rules)             AbstractTypeClass.ReadInt                ptr_type, ptr_rules, AbstractTypeClass.Offset.StringTableName, str.AbstractTypeClass.StringTableName


; args <Pointer to type class>,<register to output the result to>
; return <output>: the pointer to the class ID (e.g. YARD)
%macro AbstractTypeClass.ID    2
    lea  %2,[%1+5]
%endmacro


; args <Numerical index of type class>,<pointer to type count>,<pointer to type array>,<register to output the result to>
; %4 must not be esi
; return <output>: the type class pointer, or 0 / NULL if invalid
%macro AbstractTypeClass.FromIndex 4
    push esi
    push edi
    mov  esi,[%2] 
    mov  edi,%1
    cmp  edi,esi
    jae  %%invalid_type

    mov  esi,[%3] 
    shl  edi,2
    add  esi,edi
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
; %4 must not be esi,edi or edx
; return <output>: the type class pointer, or 0 / NULL if invalid
%macro AbstractTypeClass.FromID 4
    push esi
    push edi
    push eax
    push edx

    xor  edx,edx
  %ifnidni %1,eax
    mov  eax,%1
  %endif

  %%loop:
    AbstractTypeClass.FromIndex  edx,%2,%3,edi
    push eax
    push edx
    push edi
    AbstractTypeClass.ID  edi,edx
    call _strcmpi
    pop  edi
    pop  edx
    test eax,eax
    pop  eax
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


;;;;;;;;;;;;;;; BOOL ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<bit of data>,<Pointer to INI keyword string>
; %1-%5 must not be ecx, %1 must not be edx
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, the currently set value in the offset is not changed
%macro AbstractTypeClass.ReadBool 5
    push edx
    AbstractTypeClass.ID %1,edx
    ReadBool %1,%2,%3,%4,edx,%5
    pop  edx
%endmacro

;;;;;;;;;;;;;;; BYTE ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>
; %1-%4 must not be ecx, %1 must not be edx
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, the currently set value in the offset is not changed
%macro AbstractTypeClass.ReadByte    4
    push edx
    AbstractTypeClass.ID %1,edx
    ReadByte %1,%2,%3,edx,%4
    pop  edx
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%5 must not be ecx, %1 must not be edx
; %5 should be a valid function, which takes in the output INI value as eax,and outputs the final value in AL
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro AbstractTypeClass.ReadByteExt    5
    push edx
    AbstractTypeClass.ID %1,edx
    ReadByteExt %1,%2,%3,edx,%4,%5
    pop  edx
%endmacro

;;;;;;;;;;;;;;; WORD / SHORT ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>
; %1-%4 must not be ecx, %1 must not be edx
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, the currently set value in the offset is not changed
%macro AbstractTypeClass.ReadWord    4
    push edx
    AbstractTypeClass.ID %1,edx
    ReadWord %1,%2,%3,edx,%4
    pop  edx
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%5 must not be ecx, %1 must not be edx
; %5 should be a valid function, which takes in the output INI value as eax,and outputs the final value in AX
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro AbstractTypeClass.ReadWordExt    5
    push edx
    AbstractTypeClass.ID %1,edx
    ReadWordExt %1,%2,%3,edx,%4,%5
    pop  edx
%endmacro

;;;;;;;;;;;;;;; DWORD / INT ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>
; %1-%4 must not be ecx, %1 must not be edx
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, the currently set value in the offset is not changed
%macro AbstractTypeClass.ReadInt    4
    push edx
    AbstractTypeClass.ID %1,edx
    ReadInt %1,%2,%3,edx,%4
    pop  edx
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%5 must not be ecx, %1 must not be edx
; %5 should be a valid function, which takes in the output INI value as eax,and outputs the final value in eax
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro AbstractTypeClass.ReadIntExt    5
    push edx
    AbstractTypeClass.ID %1,edx
    ReadIntExt %1,%2,%3,edx,%4,%5
    pop  edx
%endmacro

;;;;;;;;;;;;;;; STRING ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>
; %1-%4 must not be ecx, %1 must not be edx
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, the currently set value in the offset is not changed
; A string buffer of 256 length is supported
%macro AbstractTypeClass.ReadString    4
    push edx
    AbstractTypeClass.ID %1,edx
    ReadString %1,%2,%3,edx,%4
    pop  edx
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%4 must not be ecx, %1 must not be edx
; %5 should be a valid function, which takes in the output INI value as eax,and outputs the final value in AL
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro AbstractTypeClass.ReadStringToByteExt    5
    push edx
    AbstractTypeClass.ID %1,edx
    ReadStringToByteExt %1,%2,%3,edx,%4,%5
    pop  edx
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%4 must not be ecx, %1 must not be edx
; %5 should be a valid function, which takes in the output INI value as eax,and outputs the final value in AX
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro AbstractTypeClass.ReadStringToWordExt    5
    push edx
    AbstractTypeClass.ID %1,edx
    ReadStringToWordExt %1,%2,%3,edx,%4,%5
    pop  edx
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%4 must not be ecx, %1 must not be edx
; %5 should be a valid function, which takes in the output INI value as eax,and outputs the final value in eax
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro AbstractTypeClass.ReadStringExt    5
    push edx
    AbstractTypeClass.ID %1,edx
    ReadStringExt %1,%2,%3,edx,%4,%5
    pop  edx
%endmacro

%endif
