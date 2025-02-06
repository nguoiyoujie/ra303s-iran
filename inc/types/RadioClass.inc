;----------------------------------------------------------------
; inc/types/RadioClass.inc
;
; Macros to access RadioClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_RADIOCLASS
%define TYPES_RADIOCLASS

; define object type field definitions
%define RadioClass.Offset.Old                       0x037    ; 3 byte
%define RadioClass.Offset.Radio                     0x03A    ; ptr
;%define RadioClass.Offset.Messages                      ; 34 bytes (in static)
; 0x03E

; Generally, object instances are not read by INI

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

;%define RadioClass.RTTI.Get(ptr_type,reg_output)                        GetByte                ptr_type, RadioClass.Offset.RTTI, reg_output
;%define RadioClass.RTTI.Set(ptr_type,value)                             SetByte                ptr_type, RadioClass.Offset.RTTI, value

;%define RadioClass.Index.Get(ptr_type,reg_output)                       GetInt                 ptr_type, RadioClass.Offset.Index, reg_output
;%define RadioClass.Index.Set(ptr_type,value)                            SetInt                 ptr_type, RadioClass.Offset.Index, value

%endif
