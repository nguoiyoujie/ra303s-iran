;----------------------------------------------------------------
; inc/types/FlasherClass.inc
;
; Macros to access FlasherClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_FLASHERCLASS
%define TYPES_FLASHERCLASS

; define object type field definitions
; 0x03E
%define FlasherClass.Offset.FlashCount                0x03E    ; 7-bits
%define FlasherClass.Offset.IsBlushing                0x03E    ; bool
%define FlasherClass.Bit.IsBlushing                   8
; 0x03F or 0x042?

; Generally, object instances are not read by INI

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

;%define FlasherClass.RTTI.Get(ptr_type,reg_output)                        GetByte                ptr_type, FlasherClass.Offset.RTTI, reg_output
;%define FlasherClass.RTTI.Set(ptr_type,value)                             SetByte                ptr_type, FlasherClass.Offset.RTTI, value

;%define FlasherClass.Index.Get(ptr_type,reg_output)                       GetInt                 ptr_type, FlasherClass.Offset.Index, reg_output
;%define FlasherClass.Index.Set(ptr_type,value)                            SetInt                 ptr_type, FlasherClass.Offset.Index, value

%endif
