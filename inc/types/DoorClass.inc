;----------------------------------------------------------------
; inc/types/DoorClass.inc
;
; Macros to access DoorClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_DOORCLASS
%define TYPES_DOORCLASS

; define object type field definitions
%define DoorClass.Offset.Stage                     0x058    ; Stage,Timer,Rate = StageClass 0x11 bytes
%define DoorClass.Offset.Timer                     0x05C    ; 
%define DoorClass.Offset.Rate                      0x060    ; 
%define DoorClass.Offset.Stages                    0x069    ; byte
%define DoorClass.Offset.State                     0x06A    ; byte
%define DoorClass.Offset.IsToRedraw                0x06B    ; bool
; 0x06F

; Generally, object instances are not read by INI

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

;%define DoorClass.RTTI.Get(ptr_type,reg_output)                        GetByte                ptr_type, DoorClass.Offset.RTTI, reg_output
;%define DoorClass.RTTI.Set(ptr_type,value)                             SetByte                ptr_type, DoorClass.Offset.RTTI, value

;%define DoorClass.Index.Get(ptr_type,reg_output)                       GetInt                 ptr_type, DoorClass.Offset.Index, reg_output
;%define DoorClass.Index.Set(ptr_type,value)                            SetInt                 ptr_type, DoorClass.Offset.Index, value

%endif
