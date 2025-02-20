;----------------------------------------------------------------
; inc/types/VesselClass.inc
;
; Macros to access VesselClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_VESSELCLASS
%define TYPES_VESSELCLASS

; define object type field definitions
%define VesselClass.Offset.Class                     0x15C    ; CCPtr
%define VesselClass.Offset.Factory                   0x0D1    ; CCPtr
%define VesselClass.Offset.ActLike                   0x0D5    ; HouseType (byte)
%define VesselClass.Offset.IsToRebuild               0x0D6    ; bool
%define VesselClass.Bit.IsToRebuild                  1
%define VesselClass.Offset.IsToRepair                0x0D6    ; bool
%define VesselClass.Bit.IsToRepair                   2
%define VesselClass.Offset.IsAllowedToSell           0x0D6    ; bool
%define VesselClass.Bit.IsAllowedToSell              3
%define VesselClass.Offset.IsReadyToCommence         0x0D6    ; bool
%define VesselClass.Bit.IsReadyToCommence            4
%define VesselClass.Offset.IsRepairing               0x0D6    ; bool
%define VesselClass.Bit.IsRepairing                  5
%define VesselClass.Offset.IsWrenchVisible           0x0D6    ; bool
%define VesselClass.Bit.IsWrenchVisible              6
%define VesselClass.Offset.IsGoingToBlow             0x0D6    ; bool
%define VesselClass.Bit.IsGoingToBlow                7
%define VesselClass.Offset.IsSurvivorless            0x0D6    ; bool
%define VesselClass.Bit.IsSurvivorless               8
%define VesselClass.Offset.IsCharging                0x0D7    ; bool
%define VesselClass.Bit.IsCharging                   1
%define VesselClass.Offset.IsCharged                 0x0D7    ; bool
%define VesselClass.Bit.IsCharged                    2
%define VesselClass.Offset.IsCaptured                0x0D7    ; bool
%define VesselClass.Bit.IsCaptured                   3
%define VesselClass.Offset.IsJamming                 0x0D7    ; bool
%define VesselClass.Bit.IsJamming                    4
%define VesselClass.Offset.IsJammed                  0x0D7    ; bool
%define VesselClass.Bit.IsJammed                     5
%define VesselClass.Offset.HasFired                  0x0D7    ; bool
%define VesselClass.Bit.HasFired                     6
%define VesselClass.Offset.HasOpened                 0x0D7    ; bool
%define VesselClass.Bit.HasOpened                    7
; 0x0D8, 0x0D9 empty
%define VesselClass.Offset.CountDown                 0x0DA    ; CDTimerClass<FrameTimerClass>
%define VesselClass.Offset.BState                    0x0E3    ; BStateType (byte)
%define VesselClass.Offset.QueueBState               0x0E4    ; BStateType (byte)
%define VesselClass.Offset.WhoLastHurtMe             0x0E5    ; HouseType (byte)
%define VesselClass.Offset.WhomToRepay               0x0E6    ; TARGET (dword)
%define VesselClass.Offset.LastStrength              0x0EA    ; int
%define VesselClass.Offset.AnimToTrack               0x0EE    ; TARGET (dword)
%define VesselClass.Offset.PlacementDelay            0x0F2    ; CDTimerClass<FrameTimerClass>
; 0x0FB 

; Generally, object instances are not read by INI

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

%define VesselClass.Class.Get(ptr_type,reg_output)                       GetInt                 ptr_type, VesselClass.Offset.Class, reg_output
%define VesselClass.Class.Set(ptr_type,value)                            SetInt                 ptr_type, VesselClass.Offset.Class, value


%endif
