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

%endif
