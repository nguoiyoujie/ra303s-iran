;----------------------------------------------------------------
; inc/types/ObjectClass.inc
;
; Macros to access ObjectClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_OBJECTCLASS
%define TYPES_OBJECTCLASS

; define object type field definitions
%define ObjectClass.Offset.IsDown                    0x015    ; bool
%define ObjectClass.Bit.IsDown                       1
%define ObjectClass.Offset.IsToDamage                0x015    ; bool
%define ObjectClass.Bit.IsToDamage                   2
%define ObjectClass.Offset.IsToDisplay               0x015    ; bool
%define ObjectClass.Bit.IsToDisplay                  3
%define ObjectClass.Offset.IsInLimbo                 0x015    ; bool
%define ObjectClass.Bit.IsInLimbo                    4
%define ObjectClass.Offset.IsSelected                0x015    ; bool
%define ObjectClass.Bit.IsSelected                   5
%define ObjectClass.Offset.IsAnimAttached            0x015    ; bool
%define ObjectClass.Bit.IsAnimAttached               6
%define ObjectClass.Offset.IsFalling                 0x015    ; bool
%define ObjectClass.Bit.IsFalling                    7
%define ObjectClass.Offset.Next                      0x019    ; Ptr
%define ObjectClass.Offset.Riser                     0x01D    ; ?
%define ObjectClass.Offset.Trigger                   0x021    ; Ptr
%define ObjectClass.Offset.Strength                  0x025    ; word
; 0x027

; Generally, object instances are not read by INI

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

;%define ObjectClass.RTTI.Get(ptr_type,reg_output)                        GetByte                ptr_type, ObjectClass.Offset.RTTI, reg_output
;%define ObjectClass.RTTI.Set(ptr_type,value)                             SetByte                ptr_type, ObjectClass.Offset.RTTI, value

;%define ObjectClass.Index.Get(ptr_type,reg_output)                       GetInt                 ptr_type, ObjectClass.Offset.Index, reg_output
;%define ObjectClass.Index.Set(ptr_type,value)                            SetInt                 ptr_type, ObjectClass.Offset.Index, value

%define ObjectClass.IsInLimbo.Get(ptr_type,reg_output)                    GetBool                                ptr_type, ObjectClass.Offset.IsInLimbo, ObjectClass.Bit.IsInLimbo, reg_output
%define ObjectClass.IsInLimbo.Set(ptr_type,value)                         SetBool                                ptr_type, ObjectClass.Offset.IsInLimbo, ObjectClass.Bit.IsInLimbo, value


%endif
