
cextern Audio___Voc_From_Name
cextern str_Comma


; args <register holding possible techno object>
; returns eax=1 if legal, eax=0 otherwise
%macro Techno_Target_Legal_Check 1
    ; edx holds target, which is AABBBBBB, where AA is the RTTI and BBBBBB is the ID
    push edx
  %ifnidni %1,eax
    mov  eax,%1
  %endif
    test eax,eax ; check for TARGET_NONE
    jz   %%done
    ; get the object from target
    xor  edx,edx
    call 0x00555190 ; As_Object()
    test eax,eax ; check if it is object
    je   %%ret1 ; if not an object, it is valid (e.g. template layer)
  %%isTechno:
    ; Check IsActive
    mov  byte dl,[eax+0xD]
    test dl,1 ; bit
    jz   %%ret0
  %%ret1:
    mov  eax,1
    jmp  %%done
  %%ret0:
    xor  eax,eax
  %%done:
    pop  edx
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
    xor  eax,eax
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

