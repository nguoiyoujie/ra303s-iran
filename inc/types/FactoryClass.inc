;----------------------------------------------------------------
; inc/types/factoryclass.inc
;
; Macros to access FactoryClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_FACTORYCLASS
%define TYPES_FACTORYCLASS

cextern FactoryClass.Count
cextern FactoryClass.Array

; define instance field definitions
; FactoryClass is kind of an oddball because it inherits from StageClass, so RTTI is not the first item
%define FactoryClass.Offset.Stage                     0x000    ; int
%define FactoryClass.Offset.Timer                     0x004    ; CDTimerClass<FrameTimerClass> 9 bytes
%define FactoryClass.Offset.Rate                      0x00D    ; int
%define FactoryClass.Offset.RTTI                      0x011    ; byte
%define FactoryClass.Offset.ID                        0x012    ; int
%define FactoryClass.Offset.IsActive                  0x016    ; bool
%define FactoryClass.Bit.IsActive                     1
%define FactoryClass.Offset.IsSuspended               0x016    ; bool
%define FactoryClass.Bit.IsSuspended                  2
%define FactoryClass.Offset.IsDifferent               0x016    ; bool
%define FactoryClass.Bit.IsDifferent                  3
%define FactoryClass.Offset.IsBlocked                 0x016    ; bool
%define FactoryClass.Bit.IsBlocked                    4
%define FactoryClass.Offset.Balance                   0x01A    ; int
%define FactoryClass.Offset.OriginalBalance           0x01E    ; int
%define FactoryClass.Offset.Object                    0x022    ; int
%define FactoryClass.Offset.SpecialItem               0x026    ; int
%define FactoryClass.Offset.House                     0x02A    ; int
; 0x02E

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

%define FactoryClass.FromIndex(d_index,reg_output)                        AbstractClass.FromIndex              d_index, FactoryClass.Count, FactoryClass.Array, reg_output


%endif
