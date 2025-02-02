
cextern Audio___Voc_From_Name

cextern str_Comma


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

