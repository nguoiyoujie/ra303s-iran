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
%define UnitClass.Offset.Factory                   0x0D1    ; CCPtr
%define UnitClass.Offset.ActLike                   0x0D5    ; HouseType (byte)
%define UnitClass.Offset.IsToRebuild               0x0D6    ; bool
%define UnitClass.Bit.IsToRebuild                  1
%define UnitClass.Offset.IsToRepair                0x0D6    ; bool
%define UnitClass.Bit.IsToRepair                   2
%define UnitClass.Offset.IsAllowedToSell           0x0D6    ; bool
%define UnitClass.Bit.IsAllowedToSell              3
%define UnitClass.Offset.IsReadyToCommence         0x0D6    ; bool
%define UnitClass.Bit.IsReadyToCommence            4
%define UnitClass.Offset.IsRepairing               0x0D6    ; bool
%define UnitClass.Bit.IsRepairing                  5
%define UnitClass.Offset.IsWrenchVisible           0x0D6    ; bool
%define UnitClass.Bit.IsWrenchVisible              6
%define UnitClass.Offset.IsGoingToBlow             0x0D6    ; bool
%define UnitClass.Bit.IsGoingToBlow                7
%define UnitClass.Offset.IsSurvivorless            0x0D6    ; bool
%define UnitClass.Bit.IsSurvivorless               8
%define UnitClass.Offset.IsCharging                0x0D7    ; bool
%define UnitClass.Bit.IsCharging                   1
%define UnitClass.Offset.IsCharged                 0x0D7    ; bool
%define UnitClass.Bit.IsCharged                    2
%define UnitClass.Offset.IsCaptured                0x0D7    ; bool
%define UnitClass.Bit.IsCaptured                   3
%define UnitClass.Offset.IsJamming                 0x0D7    ; bool
%define UnitClass.Bit.IsJamming                    4
%define UnitClass.Offset.IsJammed                  0x0D7    ; bool
%define UnitClass.Bit.IsJammed                     5
%define UnitClass.Offset.HasFired                  0x0D7    ; bool
%define UnitClass.Bit.HasFired                     6
%define UnitClass.Offset.HasOpened                 0x0D7    ; bool
%define UnitClass.Bit.HasOpened                    7
; 0x0D8, 0x0D9 empty
%define UnitClass.Offset.CountDown                 0x0DA    ; CDTimerClass<FrameTimerClass>
%define UnitClass.Offset.BState                    0x0E3    ; BStateType (byte)
%define UnitClass.Offset.QueueBState               0x0E4    ; BStateType (byte)
%define UnitClass.Offset.WhoLastHurtMe             0x0E5    ; HouseType (byte)
%define UnitClass.Offset.WhomToRepay               0x0E6    ; TARGET (dword)
%define UnitClass.Offset.LastStrength              0x0EA    ; int
%define UnitClass.Offset.AnimToTrack               0x0EE    ; TARGET (dword)
%define UnitClass.Offset.PlacementDelay            0x0F2    ; CDTimerClass<FrameTimerClass>
; 0x0FB 

; Generally, object instances are not read by INI

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

%define UnitClass.Class.Get(ptr_type,reg_output)                       GetInt                 ptr_type, UnitClass.Offset.Class, reg_output
%define UnitClass.Class.Set(ptr_type,value)                            SetInt                 ptr_type, UnitClass.Offset.Class, value


%endif
