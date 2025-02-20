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
