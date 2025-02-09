;----------------------------------------------------------------
; inc/types/InfantryClass.inc
;
; Macros to access InfantryClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_INFANTRYCLASS
%define TYPES_INFANTRYCLASS

; define object type field definitions
%define InfantryClass.Offset.Class                     0x141    ; CCPtr
%define InfantryClass.Offset.Doing                     0x145    ; DoType (byte)
%define InfantryClass.Offset.Comment                   0x146    ; CCPtr
%define InfantryClass.Offset.IsTechnician              0x14A    ; bool
%define InfantryClass.Bit.IsTechnician                 1
%define InfantryClass.Offset.IsStoked                  0x14A    ; bool
%define InfantryClass.Bit.IsStoked                     2
%define InfantryClass.Offset.IsProne                   0x14A    ; bool
%define InfantryClass.Bit.IsProne                      3
%define InfantryClass.Offset.IsZoneCheat               0x14A    ; bool
%define InfantryClass.Bit.IsZoneCheat                  4
%define InfantryClass.Offset.WasSelected               0x14A    ; bool
%define InfantryClass.Bit.WasSelected                  5
; 0x14B, 0x14C and 0x14D empty
%define InfantryClass.Offset.Fear                      0x14E    ; FearType (byte)
%define InfantryClass.Offset.StopDriverFrame           0x14F    ; long (dword)
%define InfantryClass.Offset.LookCell                  0x153    ; CELL (word)
; 0x154 

; Generally, object instances are not read by INI

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

;%define InfantryClass.RTTI.Get(ptr_type,reg_output)                        GetByte                ptr_type, InfantryClass.Offset.RTTI, reg_output
;%define InfantryClass.RTTI.Set(ptr_type,value)                             SetByte                ptr_type, InfantryClass.Offset.RTTI, value

;%define InfantryClass.Index.Get(ptr_type,reg_output)                       GetInt                 ptr_type, InfantryClass.Offset.Index, reg_output
;%define InfantryClass.Index.Set(ptr_type,value)                            SetInt                 ptr_type, InfantryClass.Offset.Index, value

%define InfantryClass.Class.Get(ptr_type,reg_output)                       GetInt                 ptr_type, InfantryClass.Offset.Class, reg_output
%define InfantryClass.Class.Set(ptr_type,value)                            SetInt                 ptr_type, InfantryClass.Offset.Class, value


%endif
