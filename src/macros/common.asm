
extern Audio___Voc_From_Name

[section .data] 
Loop_Entry_Buffer: TIMES 256 DB 0


[section .text] 
%macro Save_Registers 0
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi
%endmacro

%macro Restore_Registers 0
    pop  edi
    pop  esi
    pop  edx
    pop  ecx
    pop  ebx
    pop  eax
%endmacro

%macro Extract_Conquer_Eng_String 1
    mov  edx,%1
    mov  eax,[0x0066991C] ; ds:char *SystemStrings
    call 0x005C5070  ; Extract_String(void *,int)
%endmacro

; args <RULES.INI Section Name to get entry count for>
%macro    Get_RULES_INI_Section_Entry_Count 1
    push edx
    mov  edx,%1
    mov  eax,Globals___RuleINI
    call INIClass__Entry_Count
    pop  edx
%endmacro


Loop_Over_RULES_INI_Section_Entries_:
    Save_Registers
;    ==== loop setup
    push edx        ; section name
    push eax    ; function to call
    Get_RULES_INI_Section_Entry_Count edx
    mov  esi,eax ; loop max
    mov  edi,0 ; Loop variable
;    ==== start looping
.Loop:
    cmp  edi,esi
    jge  .Out

    mov  ebx,edi
    mov  edx,[esp+4] ; Section name
    mov  eax,Globals___RuleINI
    call INIClass__Get_Entry

    mov  edx,[esp+4] ; Section name
    call_INIClass__Get_String Globals___RuleINI,edx ,eax,0xFF, Loop_Entry_Buffer, 256

    ; call function pointer with the value of the entry
    mov  edx,Loop_Entry_Buffer
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

; args <RULES.INI Section Name to loop entries over>, <function to call (with entry name in edx)
%macro    Loop_Over_RULES_INI_Section_Entries 2
    push edx
    push eax
    mov  edx,%1
    mov  eax,%2
    call Loop_Over_RULES_INI_Section_Entries_
    pop  eax
    pop  edx
%endmacro

; args <What to turn bit on, <what bit to turn on>
%macro Turn_On_Bit    2
    mov  al,   1
    shl  al,byte %2-1
    or   byte %1,al
%endmacro Set_Bit 3

; args <What to check bit on>, <what bit to check>
%macro Get_Bit 2
    mov  al,1
    shl  al,byte %2-1
    test byte %1,al
    setnz al
%endmacro

;number &= ~(1 << x);
; args <What to clear bit on>, <what bit to clear>
%macro Clear_Bit 2
    mov  al,1
    shl  al,byte %2-1
    add  al,1
    neg  al
    and  byte %1,al
%endmacro

; args <What to clear bit on>, <what bit>, <turn on or off>, <identifier for branch>
%macro Set_Bit_Byte    3
    mov  al,%3
    cmp  al,0
    jz   %%turn_off

    Turn_On_Bit    %1,%2
    jmp  %%done

  %%turn_off:
    Clear_Bit %1,%2

  %%done:
%endmacro



; args <Internal ID of type class>
; returns the type class pointer as eax
%macro Get_BulletTypeClass    1
    push edx
    mov  edx,[BulletTypeClass.Count] 
    cmp  %1,edx
    jge  %%invalid_type

    mov  edx,[BulletTypeClass.Array] 
    shl  %1, 2
    add  edx,%1
    mov  eax,[edx] 
    jmp  %%done

  %%invalid_type:
    mov  eax,0
  %%done:
    pop  edx
%endmacro


; %1 = address to store data
; %2 = max entries
; return: eax = number of entries loaded
%macro GetVocArrayFromString 2
    push edi
    push edx
    push ecx
    push ebx
    xor  edi,edi
    test eax,eax
    jz   %%Retn ; just return 0
    mov  ebx,eax

  %%Read_Next:
   ; the string is a comma-delimited set
    mov  edx,str_Comma
    mov  eax,ebx
    push eax
    call _stristr
    test eax,eax
    je   %%Read_Last    
    mov  byte[eax],0
    lea  eax,[eax+1]
    mov  ebx,eax
    pop  eax
    call Audio___Voc_From_Name
    cmp  ax,-1
    je   %%Read_Next
    mov  word[%1+edi*2],ax
    inc  edi
    cmp  edi,%2 ; stop on max entry
    jge  %%Retn
    jmp  %%Read_Next
  %%Read_Last:
    pop  eax
    call Audio___Voc_From_Name
    cmp  ax,-1
    je   %%Retn
    mov  word[%1+edi*2],ax
    inc  edi
  %%Retn:
    mov eax,edi
    pop ebx
    pop ecx
    pop edx
    pop edi
%endmacro

