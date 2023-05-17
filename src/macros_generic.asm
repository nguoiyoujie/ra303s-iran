; generic data read/write functions applicable to all object types. It is the caller's responsibility that inputs are sensible and correspond with correct use data

; args <Pointer to type class>,<register to output the result to>
; return <output>: the pointer to the class ID (e.g. YARD)
%macro ObjectTypeClass.ID    2
    lea  %2, [%1+5]
%endmacro

;;;;;;;;;;;;;;; BOOL ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<offset of data>,<bit of data>,<register to output the result to>
; %1-%3 must not be EAX
; Registers EAX are trashed in the process
; return <output>: 1 if true, 0 otherwise
%macro ObjectTypeClass.GetBool    4
    Get_Bit BYTE [%1+%2], %3
    mov  %4, al
%endmacro

; args <Pointer to type class>,<offset of data>,<bit of data>,<new value>
; Registers EAX are trashed in the process
%macro ObjectTypeClass.SetBool    4
    Set_Bit_Byte [%1+%2], %3, %4
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<bit of data>,<Pointer to INI keyword string>
; %1-%5 must not be EAX, EBX, ECX, or EDX
; Registers EAX, EBX, ECX, EDX are trashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, the currently set value in the offset is not changed
%macro ObjectTypeClass.ReadBool    5
    ObjectTypeClass.ID %1,edx
    Get_Bit BYTE [%1+%3], %4
    xor  ecx, ecx
    mov  cl, al
    call_INIClass__Get_Bool %2, edx, %5, ecx
    Set_Bit_Byte [%1+%3], %4, al
%endmacro

;;;;;;;;;;;;;;; BYTE ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<offset of data>,<register to output the result to>
; %3 should be byte register (e.g. al, ah)
; return <output>: the byte value
%macro ObjectTypeClass.GetByte   3
    mov  BYTE %3, [%1+%2]
%endmacro

; args <Pointer to type class>,<offset of data>,<new value>
; %3 should be byte register (e.g. al, ah)
%macro ObjectTypeClass.SetByte    3
    mov  BYTE [%1+%2], %3
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>
; %1-%4 must not be EAX, EBX, ECX, or EDX
; Registers EAX, EBX, ECX, EDX are trashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, the currently set value in the offset is not changed
%macro ObjectTypeClass.ReadByte    4
    ObjectTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  BYTE cl, [%1+%3]
    call_INIClass__Get_Int %2, edx, %4, ecx
    mov  BYTE [%1+%3], al
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%4 must not be EAX, EBX, ECX, or EDX
; %5 should be a valid function, which takes in the output INI value as EAX, and outputs the final value in AL
; Registers EAX, EBX, ECX, EDX are trashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro ObjectTypeClass.ReadByteExt    5
    ObjectTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  BYTE cl, [%1+%3]
    call_INIClass__Get_Int %2, edx, %4, ecx
    call %5
    mov  BYTE [%1+%3], al
%endmacro

;;;;;;;;;;;;;;; WORD / SHORT ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<offset of data>,<register to output the result to>
; %3 should be word register (e.g. ax, bx)
; return <output>: the word value
%macro ObjectTypeClass.GetWord   3
    mov  WORD %3, [%1+%2]
%endmacro

; args <Pointer to type class>,<offset of data>,<new value>
; %3 should be word register (e.g. ax, bx)
%macro ObjectTypeClass.SetWord    3
    mov  WORD [%1+%2], %3
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>
; %1-%4 must not be EAX, EBX, ECX, or EDX
; Registers EAX, EBX, ECX, EDX are trashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, the currently set value in the offset is not changed
%macro ObjectTypeClass.ReadWord    4
    ObjectTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  WORD cx, [%1+%3]
    call_INIClass__Get_Int %2, edx, %4, ecx
    mov  WORD [%1+%3], ax
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%4 must not be EAX, EBX, ECX, or EDX
; %5 should be a valid function, which takes in the output INI value as EAX, and outputs the final value in AX
; Registers EAX, EBX, ECX, EDX are trashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro ObjectTypeClass.ReadWordExt    5
    ObjectTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  WORD cx, [%1+%3]
    call_INIClass__Get_Int %2, edx, %4, ecx
    call %5
    mov  WORD [%1+%3], ax
%endmacro

;;;;;;;;;;;;;;; DWORD / INT ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<offset of data>,<register to output the result to>
; %3 should be dword register (e.g. eax, ebx)
; return <output>: the int value
%macro ObjectTypeClass.GetInt   3
    mov  DWORD %3, [%1+%2]
%endmacro

; args <Pointer to type class>,<offset of data>,<new value>
; %3 should be dword register (e.g. eax, ebx)
%macro ObjectTypeClass.SetInt    3
    mov  DWORD [%1+%2], %3
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>
; %1-%4 must not be EAX, EBX, ECX, or EDX
; Registers EAX, EBX, ECX, EDX are trashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, the currently set value in the offset is not changed
%macro ObjectTypeClass.ReadInt    4
    ObjectTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  ecx, DWORD [%1+%3]
    call_INIClass__Get_Int %2, edx, %4, ecx
    mov  DWORD [%1+%3], eax
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%4 must not be EAX, EBX, ECX, or EDX
; %5 should be a valid function, which takes in the output INI value as EAX, and outputs the final value in EAX
; Registers EAX, EBX, ECX, EDX are trashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro ObjectTypeClass.ReadIntExt    5
    ObjectTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  ecx, DWORD [%1+%3]
    call_INIClass__Get_Int %2, edx, %4, ecx
    call %5
    mov  DWORD [%1+%3], eax
%endmacro

;;;;;;;;;;;;;;; STRING ;;;;;;;;;;;;;;;
;; For Get and Set, use GetInt and SetInt as they work for string addresses (dword) as well
ObjectTypeClass.StringBuffer: TIMES 256 DB 0
ObjectTypeClass.ValueBuffer:  TIMES 4 DB 0

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>
; %1-%4 must not be EAX, EBX, ECX, or EDX
; Registers EAX, EBX, ECX, EDX are trashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, the currently set value in the offset is not changed
; A string buffer of 256 length is supported
%macro ObjectTypeClass.ReadString    4
    ObjectTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  ecx, DWORD [%1+%3]
    call_INIClass__Get_String %2, edx, %4, ecx, ObjectTypeClass.StringBuffer, 256
    mov  DWORD [%1+%3], ObjectTypeClass.StringBuffer
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%4 must not be EAX, EBX, ECX, or EDX
; %5 should be a valid function, which takes in the output INI value as EAX, and outputs the final value in AL
; Registers EAX, EBX, ECX, EDX are trashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro ObjectTypeClass.ReadStringToByteExt    5
    ObjectTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  BYTE cl, [%1+%3]
    mov  BYTE [ObjectTypeClass.ValueBuffer], cl
    xor  ecx, ecx
    call_INIClass__Get_String %2, edx, %4, ecx, ObjectTypeClass.StringBuffer, 256
    mov  BYTE al, [ObjectTypeClass.StringBuffer] ;just check if the first byte is NULL / 0
    test al, al
    jz   %%null_string
  %%valid_string:
    mov  eax, ObjectTypeClass.StringBuffer
    call %5
    mov  BYTE [%1+%3], al
    jmp  %%done
  %%null_string:
    ;mov  BYTE al, [ObjectTypeClass.ValueBuffer]
    ;mov  BYTE [%1+%3], al
  %%done:
    mov  DWORD [ObjectTypeClass.ValueBuffer], 0
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%4 must not be EAX, EBX, ECX, or EDX
; %5 should be a valid function, which takes in the output INI value as EAX, and outputs the final value in AX
; Registers EAX, EBX, ECX, EDX are trashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro ObjectTypeClass.ReadStringToWordExt    5
    ObjectTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  ecx, [%1+%3]
    mov  WORD [ObjectTypeClass.ValueBuffer], cx
    xor  ecx, ecx
    call_INIClass__Get_String %2, edx, %4, ecx, ObjectTypeClass.StringBuffer, 256
    mov  BYTE al, [ObjectTypeClass.StringBuffer] ;just check if the first byte is NULL / 0
    test al, al
    jz   %%null_string
  %%valid_string:
    mov  eax, ObjectTypeClass.StringBuffer
    call %5
    mov  WORD [%1+%3], ax
    jmp  %%done
  %%null_string:
    ;mov  WORD ax, [ObjectTypeClass.ValueBuffer]
    ;mov  WORD [%1+%3], ax
  %%done:
    mov  DWORD [ObjectTypeClass.ValueBuffer], 0
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%4 must not be EAX, EBX, ECX, or EDX
; %5 should be a valid function, which takes in the output INI value as EAX, and outputs the final value in EAX
; Registers EAX, EBX, ECX, EDX are trashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro ObjectTypeClass.ReadStringExt    5
    ObjectTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  DWORD ecx, [%1+%3]
    mov  DWORD [ObjectTypeClass.ValueBuffer], ecx
    xor  ecx, ecx
    call_INIClass__Get_String %2, edx, %4, ecx, ObjectTypeClass.StringBuffer, 256
    mov  BYTE al, [ObjectTypeClass.StringBuffer] ;just check if the first byte is NULL / 0
    test al, al
    jz   %%null_string
  %%valid_string:
    mov  eax, ObjectTypeClass.StringBuffer
    call %5
    mov  DWORD [%1+%3], eax
    jmp  %%done
  %%null_string:
    ;mov  DWORD eax, [ObjectTypeClass.ValueBuffer]
    ;mov  DWORD [%1+%3], eax
  %%done:
    mov  DWORD [ObjectTypeClass.ValueBuffer], 0
%endmacro
