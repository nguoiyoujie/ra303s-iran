;----------------------------------------------------------------
; inc/common.inc
;
; Common functions and helper macros
;
;----------------------------------------------------------------

%ifndef INC_COMMON
%define INC_COMMON

cextern Extract_String

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


; args <the string ID>
; returns the string on EAX
%macro Extract_Conquer_Eng_String 1
  %ifnidni %1,edx
    mov  edx,%1
  %endif
    mov  eax,[0x0066991C] ; ds:char *SystemStrings
    call Extract_String
%endmacro


;;;;;;;;;;;;;;; BIT methods ;;;;;;;;;;;;;;;

; args <What to turn bit on, <what bit to turn on>
%macro SetBit 2
    mov  al,1
    shl  al,byte %2-1
    or   byte %1,al
%endmacro Set_Bit 3


; args <What to check bit on>, <what bit to check>
%macro GetBit 2
    mov  al,1
    shl  al,byte %2-1
    test byte %1,al
    setnz al
%endmacro


;number &= ~(1 << x);
; args <What to clear bit on>, <what bit to clear>
%macro ClearBit 2
    mov  al,1
    shl  al,byte %2-1
    add  al,1
    neg  al
    and  byte %1,al
%endmacro


; args <What to clear bit on>, <what bit>, <turn on or off>, <identifier for branch>
%macro SetBit 3
  %ifnidni %3,al
    mov  al,%3
  %endif
    cmp  al,0
    jz   %%turn_off
    SetBit    %1,%2
    jmp  %%done
  %%turn_off:
    ClearBit %1,%2
  %%done:
%endmacro

;;;;;;;;;;;;;;; BOOL methods ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<offset of data>,<bit of data>,<register to output the result to>
; %1-%3 must not be eax
; Register eax istrashed in the process
; return <output>: 1 if true, 0 otherwise
%macro GetBool 4
    GetBit byte[%1+%2],%3
    mov  %4,al
%endmacro

; args <Pointer to type class>,<offset of data>,<bit of data>,<new value>
%macro SetBool 4
    SetBit[%1+%2],%3,%4
%endmacro

;;;;;;;;;;;;;;; BYTE methods ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<offset of data>,<register to output the result to>
; %3 should be byte register (e.g. al,ah)
; return <output>: the byte value
%macro GetByte 3
    mov  byte %3,[%1+%2]
%endmacro

; args <Pointer to type class>,<offset of data>,<new value>
; %3 should be byte register (e.g. al,ah)
%macro SetByte 3
    mov  byte[%1+%2],%3
%endmacro

;;;;;;;;;;;;;;; WORD / SHORT methods ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<offset of data>,<register to output the result to>
; %3 should be word register (e.g. ax,bx)
; return <output>: the word value
%macro GetWord 3
    mov  word %3,[%1+%2]
%endmacro

; args <Pointer to type class>,<offset of data>,<new value>
; %3 should be word register (e.g. ax,bx)
%macro SetWord 3
    mov  word[%1+%2],%3
%endmacro

;;;;;;;;;;;;;;; DWORD / INT / PTR methods ;;;;;;;;;;;;;;;

; args <Pointer to type class>,<offset of data>,<register to output the result to>
; %3 should be dword register (e.g. eax,ebx)
; return <output>: the int value
%macro GetInt 3
    mov  dword %3,[%1+%2]
%endmacro

; args <Pointer to type class>,<offset of data>,<new value>
; %3 should be dword register (e.g. eax,ebx)
%macro SetInt 3
    mov  dword[%1+%2],%3
%endmacro

%endif
