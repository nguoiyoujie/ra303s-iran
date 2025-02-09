;----------------------------------------------------------------
; inc/types/FlyClass.inc
;
; Macros to access FlyClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_FLYCLASS
%define TYPES_FLYCLASS

; TO-DO: confirm the offsets

; define object type field definitions
%define FlyClass.Offset.SpeedAccum                0x0B1    ; byte
%define FlyClass.Offset.SpeedAdd                  0x0B2    ; byte
; 0x0B3

; Generally, object instances are not read by INI

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

;%define FlyClass.RTTI.Get(ptr_type,reg_output)                        GetByte                ptr_type, FlyClass.Offset.RTTI, reg_output
;%define FlyClass.RTTI.Set(ptr_type,value)                             SetByte                ptr_type, FlyClass.Offset.RTTI, value

;%define FlyClass.Index.Get(ptr_type,reg_output)                       GetInt                 ptr_type, FlyClass.Offset.Index, reg_output
;%define FlyClass.Index.Set(ptr_type,value)                            SetInt                 ptr_type, FlyClass.Offset.Index, value

%endif
