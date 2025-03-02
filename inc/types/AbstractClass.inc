;----------------------------------------------------------------
; inc/types/abstractclass.inc
;
; Macros to access AbstractClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_ABSTRACTCLASS
%define TYPES_ABSTRACTCLASS

; define abstract type field definitions
%define AbstractClass.Offset.RTTI                      0x000    ; byte
%define AbstractClass.Offset.Index                     0x001    ; INT
%define AbstractClass.Offset.Coord                     0x005    ; INT
%define AbstractClass.Offset.Height                    0x009    ; INT
%define AbstractClass.Offset.IsActive                  0x00D    ; bool
%define AbstractClass.Bit.IsActive                     1        
; 0x011

; Generally, object instances are not read by INI

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

%define AbstractClass.RTTI.Get(ptr_type,reg_output)                        GetByte                ptr_type, AbstractClass.Offset.RTTI, reg_output
%define AbstractClass.Index.Get(ptr_type,reg_output)                       GetInt                 ptr_type, AbstractClass.Offset.Index, reg_output

%endif

; args <Numerical index of type class>,<pointer to type count>,<pointer to type array>,<register to output the result to>
; %4 must not be esi
; return <output>: the type class pointer, or 0 / NULL if invalid
%macro AbstractClass.FromIndex 4
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
    mov  %4,[esi] 
    jmp  %%done

  %%invalid_type:
    pop  edi
    mov  %4, 0
  %%done:
    pop  esi
%endmacro