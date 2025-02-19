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

%endif
