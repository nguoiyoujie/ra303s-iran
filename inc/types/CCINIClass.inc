;----------------------------------------------------------------
; inc/CCINIClass.inc
;
; Common CCINIClass functions and helper macros
;
;----------------------------------------------------------------
cextern CCINIClass__CCINIClass
cextern CCINIClass__Load
cextern CCINIClass__Put_HousesType
cextern CCINIClass__Put_VQType
cextern CCINIClass__Put_ThemeType


; args: <INI Name>, <FileClass>, <INIClass>
%macro call_CCINIClass__Load 3
    mov edx,%1
    mov eax,%2
    call CCFileClass__CCFileClass

    ; check ini exists
    mov eax,%2
    xor edx,edx
    call CCFileClass__Is_Available

    ; initialize iniclass
    mov eax,%3
    call CCINIClass__CCINIClass

    ; load fileclass to iniclass
    mov edx,%2
    mov eax,%3
    call CCINIClass__Load
%endmacro

; use lea [<INIClass>], so we can do stuff like "call_INIClass__Get_Int ebp-4,..."

; args: <INIClass>, <Section>, <Key>, <VQType Value>
%macro call_CCINIClass__Put_HousesType 4
    mov  ebx,%3
    mov  edx,%2
    lea  eax,[%1]
    mov  cl,%4
    call CCINIClass__Put_HousesType
%endmacro


; args: <INIClass>, <Section>, <Key>, <VQType Value>
%macro call_CCINIClass__Put_VQType 4
    mov  ebx,%3
    mov  edx,%2
    lea  eax,[%1]
    mov  cl,%4
    call CCINIClass__Put_VQType
%endmacro


; args: <INIClass>, <Section>, <Key>, <ThemeType Value>
%macro call_CCINIClass__Put_ThemeType 4
    mov  ebx,%3
    mov  edx,%2
    lea  eax,[%1]
    mov  cl,%4
    call CCINIClass__Put_ThemeType
%endmacro
