; generic data read/write functions applicable to all object types. It is the caller's responsibility that inputs are sensible and correspond with correct use data

; args <Pointer to type class>,<register to output the result to>
; return <output>: the pointer to the class ID (e.g. YARD)
%macro ObjectTypeClass.ID    2
    lea  %2, [%1+5]
%endmacro

;;;;;;;;;;;;;;; BOOL ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<offset of data>,<bit of data>,<register to output the result to>
; %1-%3 must not be eax
; Register eax istrashed in the process
; return <output>: 1 if true, 0 otherwise
%macro ObjectTypeClass.GetBool    4
    Get_Bit byte [%1+%2], %3
    mov  %4, al
%endmacro

; args <Pointer to type class>,<offset of data>,<bit of data>,<new value>
; Register eax istrashed in the process
%macro ObjectTypeClass.SetBool    4
    Set_Bit_Byte [%1+%2], %3, %4
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<bit of data>,<Pointer to INI keyword string>
; %1-%5 must not be eax
; Register eax istrashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, the currently set value in the offset is not changed
%macro ObjectTypeClass.ReadBool    5
    push edx
    push ecx
    ObjectTypeClass.ID %1,edx
    Get_Bit byte [%1+%3], %4
    xor  ecx, ecx
    mov  cl, al
    call_INIClass__Get_Bool %2, edx, %5, ecx
    Set_Bit_Byte [%1+%3], %4, al
    pop  ecx
    pop  edx
%endmacro

;;;;;;;;;;;;;;; byte ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<offset of data>,<register to output the result to>
; %3 should be byte register (e.g. al, ah)
; return <output>: the byte value
%macro ObjectTypeClass.GetByte   3
    mov  byte %3, [%1+%2]
%endmacro

; args <Pointer to type class>,<offset of data>,<new value>
; %3 should be byte register (e.g. al, ah)
%macro ObjectTypeClass.SetByte    3
    mov  byte [%1+%2], %3
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>
; %1-%4 must not be eax
; Register eax istrashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, the currently set value in the offset is not changed
%macro ObjectTypeClass.ReadByte    4
    push edx
    push ecx
    ObjectTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  byte cl, [%1+%3]
    call_INIClass__Get_Int %2, edx, %4, ecx
    mov  byte [%1+%3], al
    pop  ecx
    pop  edx
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%4 must not be eax
; %5 should be a valid function, which takes in the output INI value as eax, and outputs the final value in AL
; Register eax istrashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro ObjectTypeClass.ReadByteExt    5
    push edx
    push ecx
    ObjectTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  byte cl, [%1+%3]
    call_INIClass__Get_Int %2, edx, %4, ecx
    call %5
    mov  byte [%1+%3], al
    pop  ecx
    pop  edx
%endmacro

;;;;;;;;;;;;;;; word / SHORT ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<offset of data>,<register to output the result to>
; %3 should be word register (e.g. ax, bx)
; return <output>: the word value
%macro ObjectTypeClass.GetWord   3
    mov  word %3, [%1+%2]
%endmacro

; args <Pointer to type class>,<offset of data>,<new value>
; %3 should be word register (e.g. ax, bx)
%macro ObjectTypeClass.SetWord    3
    mov  word [%1+%2], %3
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>
; %1-%4 must not be eax
; Register eax istrashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, the currently set value in the offset is not changed
%macro ObjectTypeClass.ReadWord    4
    push edx
    push ecx
    ObjectTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  word cx, [%1+%3]
    call_INIClass__Get_Int %2, edx, %4, ecx
    mov  word [%1+%3], ax
    pop  ecx
    pop  edx
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%4 must not be eax
; %5 should be a valid function, which takes in the output INI value as eax, and outputs the final value in AX
; Register eax istrashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro ObjectTypeClass.ReadWordExt    5
    push edx
    push ecx
    ObjectTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  word cx, [%1+%3]
    call_INIClass__Get_Int %2, edx, %4, ecx
    call %5
    mov  word [%1+%3], ax
    pop  ecx
    pop  edx
%endmacro

;;;;;;;;;;;;;;; dword / INT ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<offset of data>,<register to output the result to>
; %3 should be dword register (e.g. eax, ebx)
; return <output>: the int value
%macro ObjectTypeClass.GetInt   3
    mov  dword %3, [%1+%2]
%endmacro

; args <Pointer to type class>,<offset of data>,<new value>
; %3 should be dword register (e.g. eax, ebx)
%macro ObjectTypeClass.SetInt    3
    mov  dword [%1+%2], %3
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>
; %1-%4 must not be eax
; Register eax istrashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, the currently set value in the offset is not changed
%macro ObjectTypeClass.ReadInt    4
    push edx
    push ecx
    ObjectTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  ecx, dword [%1+%3]
    call_INIClass__Get_Int %2, edx, %4, ecx
    mov  dword [%1+%3], eax
    pop  ecx
    pop  edx
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%4 must not be eax
; %5 should be a valid function, which takes in the output INI value as eax, and outputs the final value in eax
; Register eax istrashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro ObjectTypeClass.ReadIntExt    5
    push edx
    push ecx
    ObjectTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  ecx, dword [%1+%3]
    call_INIClass__Get_Int %2, edx, %4, ecx
    call %5
    mov  dword [%1+%3], eax
    pop  ecx
    pop  edx
%endmacro

;;;;;;;;;;;;;;; STRING ;;;;;;;;;;;;;;;
;; For Get and Set, use GetInt and SetInt as they work for string addresses (dword) as well
%define ObjectTypeClass.StringBuffer.Length      1024
ObjectTypeClass.StringBuffer                     times ObjectTypeClass.StringBuffer.Length db 0
ObjectTypeClass.ValueBuffer                      dd 0

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>
; %1-%4 must not be eax
; Register eax istrashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, the currently set value in the offset is not changed
; A string buffer of 256 length is supported
%macro ObjectTypeClass.ReadString    4
    push edx
    push ecx
    ObjectTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  ecx, dword [%1+%3]
    call_INIClass__Get_String %2, edx, %4, ecx, ObjectTypeClass.StringBuffer, ObjectTypeClass.StringBuffer.Length
    mov  dword [%1+%3], ObjectTypeClass.StringBuffer
    pop  ecx
    pop  edx
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%4 must not be eax
; %5 should be a valid function, which takes in the output INI value as eax, and outputs the final value in AL
; Register eax istrashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro ObjectTypeClass.ReadStringToByteExt    5
    push edx
    push ecx
    ObjectTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  byte cl, [%1+%3]
    mov  byte [ObjectTypeClass.ValueBuffer], cl
    xor  ecx, ecx
    call_INIClass__Get_String %2, edx, %4, ecx, ObjectTypeClass.StringBuffer, ObjectTypeClass.StringBuffer.Length
    mov  byte al, [ObjectTypeClass.StringBuffer] ;just check if the first byte is NULL / 0
    test al, al
    jz   %%null_string
  %%valid_string:
    mov  eax, ObjectTypeClass.StringBuffer
    call %5
    mov  byte [%1+%3], al
    jmp  %%done
  %%null_string:
    ;mov  byte al, [ObjectTypeClass.ValueBuffer]
    ;mov  byte [%1+%3], al
  %%done:
    mov  dword [ObjectTypeClass.ValueBuffer], 0
    pop  ecx
    pop  edx
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%4 must not be eax, ebx, ecx, or edx
; %5 should be a valid function, which takes in the output INI value as eax, and outputs the final value in AX
; Register eax istrashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro ObjectTypeClass.ReadStringToWordExt    5
    push edx
    push ecx
    ObjectTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  ecx, [%1+%3]
    mov  word [ObjectTypeClass.ValueBuffer], cx
    xor  ecx, ecx
    call_INIClass__Get_String %2, edx, %4, ecx, ObjectTypeClass.StringBuffer, ObjectTypeClass.StringBuffer.Length
    mov  byte al, [ObjectTypeClass.StringBuffer] ;just check if the first byte is NULL / 0
    test al, al
    jz   %%null_string
  %%valid_string:
    mov  eax, ObjectTypeClass.StringBuffer
    call %5
    mov  word [%1+%3], ax
    jmp  %%done
  %%null_string:
    ;mov  word ax, [ObjectTypeClass.ValueBuffer]
    ;mov  word [%1+%3], ax
  %%done:
    mov  dword [ObjectTypeClass.ValueBuffer], 0
    pop  ecx
    pop  edx
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%4 must not be eax
; %5 should be a valid function, which takes in the output INI value as eax, and outputs the final value in eax
; Register eax istrashed in the process
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro ObjectTypeClass.ReadStringExt    5
    push edx
    push ecx
    ObjectTypeClass.ID %1,edx
    xor  ecx, ecx
    mov  dword ecx, [%1+%3]
    mov  dword [ObjectTypeClass.ValueBuffer], ecx
    xor  ecx, ecx
    call_INIClass__Get_String %2, edx, %4, ecx, ObjectTypeClass.StringBuffer, ObjectTypeClass.StringBuffer.Length
    mov  byte al, [ObjectTypeClass.StringBuffer] ;just check if the first byte is NULL / 0
    test al, al
    jz   %%null_string
  %%valid_string:
    mov  eax, ObjectTypeClass.StringBuffer
    call %5
    mov  dword [%1+%3], eax
    jmp  %%done
  %%null_string:
    ;mov  dword eax, [ObjectTypeClass.ValueBuffer]
    ;mov  dword [%1+%3], eax
  %%done:
    mov  dword [ObjectTypeClass.ValueBuffer], 0
    pop  ecx
    pop  edx
%endmacro
