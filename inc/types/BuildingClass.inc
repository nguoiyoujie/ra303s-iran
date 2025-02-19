;----------------------------------------------------------------
; inc/types/BuildingClass.inc
;
; Macros to access BuildingClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_BUILDINGCLASS
%define TYPES_BUILDINGCLASS

; define object type field definitions
%define BuildingClass.Offset.Class                     0x0CD    ; CCPtr
%define BuildingClass.Offset.Factory                   0x0D1    ; CCPtr
%define BuildingClass.Offset.ActLike                   0x0D5    ; HouseType (byte)
%define BuildingClass.Offset.IsToRebuild               0x0D6    ; bool
%define BuildingClass.Bit.IsToRebuild                  1
%define BuildingClass.Offset.IsToRepair                0x0D6    ; bool
%define BuildingClass.Bit.IsToRepair                   2
%define BuildingClass.Offset.IsAllowedToSell           0x0D6    ; bool
%define BuildingClass.Bit.IsAllowedToSell              3
%define BuildingClass.Offset.IsReadyToCommence         0x0D6    ; bool
%define BuildingClass.Bit.IsReadyToCommence            4
%define BuildingClass.Offset.IsRepairing               0x0D6    ; bool
%define BuildingClass.Bit.IsRepairing                  5
%define BuildingClass.Offset.IsWrenchVisible           0x0D6    ; bool
%define BuildingClass.Bit.IsWrenchVisible              6
%define BuildingClass.Offset.IsGoingToBlow             0x0D6    ; bool
%define BuildingClass.Bit.IsGoingToBlow                7
%define BuildingClass.Offset.IsSurvivorless            0x0D6    ; bool
%define BuildingClass.Bit.IsSurvivorless               8
%define BuildingClass.Offset.IsCharging                0x0D7    ; bool
%define BuildingClass.Bit.IsCharging                   1
%define BuildingClass.Offset.IsCharged                 0x0D7    ; bool
%define BuildingClass.Bit.IsCharged                    2
%define BuildingClass.Offset.IsCaptured                0x0D7    ; bool
%define BuildingClass.Bit.IsCaptured                   3
%define BuildingClass.Offset.IsJamming                 0x0D7    ; bool
%define BuildingClass.Bit.IsJamming                    4
%define BuildingClass.Offset.IsJammed                  0x0D7    ; bool
%define BuildingClass.Bit.IsJammed                     5
%define BuildingClass.Offset.HasFired                  0x0D7    ; bool
%define BuildingClass.Bit.HasFired                     6
%define BuildingClass.Offset.HasOpened                 0x0D7    ; bool
%define BuildingClass.Bit.HasOpened                    7
; 0x0D8, 0x0D9 empty
%define BuildingClass.Offset.CountDown                 0x0DA    ; CDTimerClass<FrameTimerClass>
%define BuildingClass.Offset.BState                    0x0E3    ; BStateType (byte)
%define BuildingClass.Offset.QueueBState               0x0E4    ; BStateType (byte)
%define BuildingClass.Offset.WhoLastHurtMe             0x0E5    ; HouseType (byte)
%define BuildingClass.Offset.WhomToRepay               0x0E6    ; TARGET (dword)
%define BuildingClass.Offset.LastStrength              0x0EA    ; int
%define BuildingClass.Offset.AnimToTrack               0x0EE    ; TARGET (dword)
%define BuildingClass.Offset.PlacementDelay            0x0F2    ; CDTimerClass<FrameTimerClass>
; 0x0FB 

; Generally, object instances are not read by INI

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;
%define BuildingClass.Class.Get(ptr_type,reg_output)                       GetInt                 ptr_type, BuildingClass.Offset.Class, reg_output
%define BuildingClass.Class.Set(ptr_type,value)                            SetInt                 ptr_type, BuildingClass.Offset.Class, value


%endif
