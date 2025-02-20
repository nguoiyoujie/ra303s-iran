;----------------------------------------------------------------
; inc/types/AircraftClass.inc
;
; Macros to access AircraftClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_AIRCRAFTCLASS
%define TYPES_AIRCRAFTCLASS

; define object type field definitions
%define AircraftClass.Offset.Class                     0x146    ; CCPtr
%define AircraftClass.Offset.SecondaryFacing           0x14A    ; FacingClass (2 bytes) CurrentFacing / DesiredFacing
%define AircraftClass.Offset.Passenger                 0x14C    ; bool
%define AircraftClass.Bit.Passenger                    1
%define AircraftClass.Offset.IsLanding                 0x14C    ; bool (to confirm)
%define AircraftClass.Bit.IsLanding                    2
%define AircraftClass.Offset.IsTakingOff               0x14C    ; bool
%define AircraftClass.Bit.IsTakingOff                  3
%define AircraftClass.Offset.IsHoming                  0x14C    ; bool
%define AircraftClass.Bit.IsHoming                     4
%define AircraftClass.Offset.IsHovering                0x14C    ; bool
%define AircraftClass.Bit.IsHovering                   5
; 0x14D, 0x14E, 0x14F empty
%define AircraftClass.Offset.Jitter                    0x150    ; byte
%define AircraftClass.Offset.SightTimer                0x151    ; CDTimerClass<FrameTimerClass>; 9 bytes
%define AircraftClass.Offset.AttacksRemaining          0x15A    ; byte
; 0x15F

; Generally, object instances are not read by INI

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

%define AircraftClass.Class.Get(ptr_type,reg_output)                       GetInt                 ptr_type, AircraftClass.Offset.Class, reg_output
%define AircraftClass.Class.Set(ptr_type,value)                            SetInt                 ptr_type, AircraftClass.Offset.Class, value


%endif
