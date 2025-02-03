;----------------------------------------------------------------
; inc/ini.inc
;
; Common functions for reading rules entries
;
;----------------------------------------------------------------

%ifndef INC_INI
%define INC_INI

cextern Globals___RuleINI

cextern INI_Loop_Entry_Buffer
cextern INI_Read_String_Buffer
cextern INI_Read_Value_Buffer

; args <RULES.INI Section Name to get entry count for>
%macro Get_RULES_INI_Section_Entry_Count 1
    push edx
  %ifnidni %1,edx
    mov  edx,%1
  %endif
    mov  eax,Globals___RuleINI
    call INIClass__Entry_Count
    pop  edx
%endmacro


; args <RULES.INI Section Name to loop entries over>, <function to call (with entry name in edx)>
%macro Loop_Over_RULES_INI_Section_Entries 2
    push edx
    push eax
  %ifnidni %1,edx
    mov  edx,%1
  %endif
  %ifnidni %2,eax
    mov  eax,%2
  %endif
    call Loop_Over_RULES_INI_Section_Entries_
    pop  eax
    pop  edx
%endmacro


; Note: Don't bother optimizing as these functions are only called during load, not gameplay
;;;;;;;;;;;;;;; BOOL ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<bit of data>,<Pointer to INI section string>,<Pointer to INI keyword string>
; %1-%6 must not be ecx
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, the currently set value in the offset is not changed
%macro ReadBool 6
    push eax
    push edx
    push ecx
    push ebx
    GetBit [%1+%3],%4
    xor  ecx,ecx
    mov  cl,al
    call_INIClass__Get_Bool %2,%5,%6,ecx ; trashes eax-edx, outputs al
    SetBit [%1+%3],%4,al
    pop  ebx
    pop  ecx
    pop  edx
    pop  eax
%endmacro

;;;;;;;;;;;;;;; BYTE ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI section string>,<Pointer to INI keyword string>
; %1-%5 must not be ecx
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, the currently set value in the offset is not changed
%macro ReadByte 5
    push eax
    push edx
    push ecx
    push ebx
    xor  ecx,ecx
    mov  byte cl,[%1+%3]
    call_INIClass__Get_Int %2,%4,%5,ecx ; trashes eax-edx, outputs al
    mov  byte[%1+%3],al
    pop  ebx
    pop  ecx
    pop  edx
    pop  eax
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI section string>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%6 must not be ecx
; %6 should be a valid function, which takes in the output INI value as `eax`,and outputs the final value in `al`
; Reads the value from the INI rules, passes it into a function, and updates the corresponding offset with the result. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro ReadByteExt 6
    push eax
    push edx
    push ecx
    push ebx
    xor  ecx,ecx
    mov  byte cl,[%1+%3]
    call_INIClass__Get_Int %2,%4,%5,ecx ; trashes eax-edx, outputs eax
    call %5 ; input eax, output al
    mov  byte[%1+%3],al
    pop  ebx
    pop  ecx
    pop  edx
    pop  eax
%endmacro

;;;;;;;;;;;;;;; WORD / SHORT ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI section string>,<Pointer to INI keyword string>
; %1-%5 must not be ecx
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, the currently set value in the offset is not changed
%macro ReadWord 5
    push eax
    push edx
    push ecx
    push ebx
    xor  ecx,ecx
    mov  word cx,[%1+%3]
    call_INIClass__Get_Int %2,%4,%5,ecx ; trashes eax-edx, outputs ax
    mov  word[%1+%3],ax
    pop  ebx
    pop  ecx
    pop  edx
    pop  eax
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI section string>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%6 must not be ecx
; %6 should be a valid function, which takes in the output INI value as `eax`,and outputs the final value in `ax`
; Reads the value from the INI rules, passes it into a function, and updates the corresponding offset with the result. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro ReadWordExt 6
    push eax
    push edx
    push ecx
    push ebx
    xor  ecx,ecx
    mov  word cx,[%1+%3]
    call_INIClass__Get_Int %2,%4,%5,ecx ; trashes eax-edx, outputs eax
    call %6 ; input eax, output ax
    mov  word[%1+%3],ax
    pop  ebx
    pop  ecx
    pop  edx
    pop  eax
%endmacro

;;;;;;;;;;;;;;; DWORD / INT ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI section string>,<Pointer to INI keyword string>
; %1-%5 must not be ecx
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, the currently set value in the offset is not changed
%macro ReadInt 5
    push eax
    push edx
    push ecx
    push ebx
    xor  ecx,ecx
    mov  dword ecx,[%1+%3]
    call_INIClass__Get_Int %2,%4,%5,ecx ; trashes eax-edx, outputs eax
    mov  dword[%1+%3],eax
    pop  ebx
    pop  ecx
    pop  edx
    pop  eax
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI section string>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%6 must not be ecx
; %6 should be a valid function, which takes in the output INI value as `eax`,and outputs the final value in `eax`
; Reads the value from the INI rules, passes it into a function, and updates the corresponding offset with the result. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro ReadIntExt 6
    push eax
    push edx
    push ecx
    push ebx
    xor  ecx,ecx
    mov  dword ecx,[%1+%3]
    call_INIClass__Get_Int %2,%4,%5,ecx ; trashes eax-edx, outputs eax
    call %6 ; input eax, output eax
    mov  dword[%1+%3],eax
    pop  ebx
    pop  ecx
    pop  edx
    pop  eax
%endmacro

;;;;;;;;;;;;;;; STRING ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI section string>,<Pointer to INI keyword string>
; %1-%5 must not be ecx
; Reads the value from the INI rules, and updates the corresponding offset. If the INI key is not defined, the currently set value in the offset is not changed
%macro ReadString 5
    push eax
    push edx
    push ecx
    push ebx
    xor  ecx,ecx
    mov  dword ecx,[%1+%3]
    call_INIClass__Get_String %2,%4,%5,ecx,INI_Read_String_Buffer,INI_STRING_BUFFER_LENGTH
    lea  eax,[%1+%3]
    mov  dword[eax],INI_Read_String_Buffer
    pop  ebx
    pop  ecx
    pop  edx
    pop  eax
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI section string>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%6 must not be ecx
; %6 should be a valid function, which takes in the output INI value as `eax`,and outputs the final value in `al`
; Reads the value from the INI rules, passes it into a function, and updates the corresponding offset with the result. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro ReadStringToByteExt 6
    push eax
    push edx
    push ecx
    push ebx
    xor  ecx,ecx
    mov  byte cl,[%1+%3]
    mov  byte[INI_Read_Value_Buffer],cl
    xor  ecx,ecx
    call_INIClass__Get_String %2,%4,%5,ecx,INI_Read_String_Buffer,INI_STRING_BUFFER_LENGTH
    mov  byte al,[INI_Read_String_Buffer] ;check if the first byte is NULL / 0
    test al,al
    jz   %%null_string
  %%valid_string:
    mov  eax,INI_Read_String_Buffer
    call %6
    mov  byte[%1+%3],al
    jmp  %%done
  %%null_string:
  %%done:
    mov  dword[INI_Read_Value_Buffer],0
    pop  ebx
    pop  ecx
    pop  edx
    pop  eax
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI section string>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%6 must not be ecx
; %6 should be a valid function, which takes in the output INI value as `eax`,and outputs the final value in `ax`
; Reads the value from the INI rules, passes it into a function, and updates the corresponding offset with the result. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro ReadStringToWordExt 6
    push eax
    push edx
    push ecx
    push ebx
    xor  ecx,ecx
    mov  word cx,[%1+%3]
    mov  word[INI_Read_Value_Buffer],cx
    xor  ecx,ecx
    call_INIClass__Get_String %2,%4,%5,ecx,INI_Read_String_Buffer,INI_STRING_BUFFER_LENGTH
    mov  byte al,[INI_Read_String_Buffer] ;check if the first byte is NULL / 0
    test al,al
    jz   %%null_string
  %%valid_string:
    mov  eax,INI_Read_String_Buffer
    call %6
    mov  word[%1+%3],ax
    jmp  %%done
  %%null_string:
  %%done:
    mov  dword[INI_Read_Value_Buffer],0
    pop  ebx
    pop  ecx
    pop  edx
    pop  eax
%endmacro

; args <Pointer to type class>,<Pointer to rules class>,<offset of data>,<Pointer to INI section string>,<Pointer to INI keyword string>,<Function to process INI value into final output>
; %1-%6 must not be ecx
; %6 should be a valid function, which takes in the output INI value as `eax`,and outputs the final value in `eax`
; Reads the value from the INI rules, passes it into a function, and updates the corresponding offset with the result. If the INI key is not defined, it is up to the function to handle the pre-existing value in the offset
%macro ReadStringExt 6
    push eax
    push edx
    push ecx
    push ebx
    xor  ecx,ecx
    mov  dword ecx,[%1+%3]
    mov  dword[INI_Read_Value_Buffer],ecx
    xor  ecx,ecx
    call_INIClass__Get_String %2,%4,%5,ecx,INI_Read_String_Buffer,INI_STRING_BUFFER_LENGTH
    mov  byte al,[INI_Read_String_Buffer] ;check if the first byte is NULL / 0
    test al,al
    jz   %%null_string
  %%valid_string:
    mov  eax,INI_Read_String_Buffer
    call %6
    mov  dword[%1+%3],eax
    jmp  %%done
  %%null_string:
  %%done:
    mov  dword[INI_Read_Value_Buffer],0
    pop  ebx
    pop  ecx
    pop  edx
    pop  eax
%endmacro




[section .text] 
Loop_Over_RULES_INI_Section_Entries_:
    Save_Registers
    ; ==== loop setup
    push edx    ; section name
    push eax    ; function to call
    Get_RULES_INI_Section_Entry_Count edx
    mov  esi,eax ; loop max
    xor  edi,edi ; Loop variable
    ; ==== start looping
.Loop:
    cmp  edi,esi
    jge  .Out
    mov  ebx,edi
    mov  edx,[esp+4] ; Section name
    mov  eax,Globals___RuleINI
    call INIClass__Get_Entry
    mov  edx,[esp+4] ; Section name
    call_INIClass__Get_String Globals___RuleINI,edx ,eax,0xFF,INI_Loop_Entry_Buffer,256
    ; call function pointer with the value of the entry
    mov  edx,INI_Loop_Entry_Buffer
    mov  ebx,edi
    mov  eax,esp ; function pointer
    call [eax]
    inc  edi
    jmp  .Loop
.Out:
    pop  eax
    pop  edx
    Restore_Registers
    retn

%endif