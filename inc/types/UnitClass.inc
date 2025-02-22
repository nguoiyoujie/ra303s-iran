;----------------------------------------------------------------
; inc/types/UnitClass.inc
;
; Macros to access UnitClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_UNITCLASS
%define TYPES_UNITCLASS

; define object type field definitions
%define UnitClass.Offset.Class                     0x15C    ; CCPtr

; 0x???

; Generally, object instances are not read by INI

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

%define UnitClass.Class.Get(ptr_type,reg_output)                       GetInt                 ptr_type, UnitClass.Offset.Class, reg_output
%define UnitClass.Class.Set(ptr_type,value)                            SetInt                 ptr_type, UnitClass.Offset.Class, value


%endif
