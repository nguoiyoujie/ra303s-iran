;----------------------------------------------------------------
; inc/types/CargoClass.inc
;
; Macros to access CargoClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_CARGOCLASS
%define TYPES_CARGOCLASS

; define object type field definitions
%define CargoClass.Offset.Quantity                 0x053    ; byte
%define CargoClass.Offset.Cargohold                0x054    ; ptr
; 0x058

; Generally, object instances are not read by INI

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

;%define CargoClass.RTTI.Get(ptr_type,reg_output)                        GetByte                ptr_type, CargoClass.Offset.RTTI, reg_output
;%define CargoClass.RTTI.Set(ptr_type,value)                             SetByte                ptr_type, CargoClass.Offset.RTTI, value

;%define CargoClass.Index.Get(ptr_type,reg_output)                       GetInt                 ptr_type, CargoClass.Offset.Index, reg_output
;%define CargoClass.Index.Set(ptr_type,value)                            SetInt                 ptr_type, CargoClass.Offset.Index, value

%endif
