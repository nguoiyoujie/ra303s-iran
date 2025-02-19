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

%endif
