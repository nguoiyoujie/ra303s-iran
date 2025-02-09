;----------------------------------------------------------------
; inc/types/FootClass.inc
;
; Macros to access FootClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_FOOTCLASS
%define TYPES_FOOTCLASS

; TO-DO: confirm the offsets

; define object type field definitions
%define FootClass.Offset.IsScanLimited             0x0CD    ; bool
%define FootClass.Bit.IsScanLimited                1
%define FootClass.Offset.IsInitiated               0x0CD    ; bool
%define FootClass.Bit.IsInitiated                  2
%define FootClass.Offset.IsNewNavCom               0x0CD    ; bool
%define FootClass.Bit.IsNewNavCom                  3
%define FootClass.Offset.IsPlanningToLook          0x0CD    ; bool
%define FootClass.Bit.IsPlanningToLook             4
%define FootClass.Offset.IsDeploying               0x0CD    ; bool
%define FootClass.Bit.IsDeploying                  5
%define FootClass.Offset.IsFiring                  0x0CD    ; bool
%define FootClass.Bit.IsFiring                     6
%define FootClass.Offset.IsRotating                0x0CD    ; bool
%define FootClass.Bit.IsRotating                   7
%define FootClass.Offset.IsDriving                 0x0CD    ; bool
%define FootClass.Bit.IsDriving                    8
%define FootClass.Offset.IsUnloading               0x0CE    ; bool
%define FootClass.Bit.IsUnloading                  1
%define FootClass.Offset.IsFormationMove           0x0CE    ; bool
%define FootClass.Bit.IsFormationMove              2
%define FootClass.Offset.IsNavQueueLoop            0x0CE    ; bool
%define FootClass.Bit.IsNavQueueLoop               3
%define FootClass.Offset.IsScattering              0x0CE    ; bool
%define FootClass.Bit.IsScattering                 4
%define FootClass.Offset.IsMovingOntoBridge        0x0CE    ; bool
%define FootClass.Bit.IsMovingOntoBridge           5

; 0x0CF, 0x0D0 empty
%define FootClass.Offset.Speed                     0x0D1    ; int
%define FootClass.Offset.SpeedBias                 0x0D5    ; fixed (word)
%define FootClass.Offset.XFormOffset               0x0D7    ; int
%define FootClass.Offset.YFormOffset               0x0DB    ; int
%define FootClass.Offset.NavCom                    0x0DF    ; TARGET (dword)
%define FootClass.Offset.SuspendedNavCom           0x0E3    ; TARGET (dword)
%define FootClass.Offset.NavQueue                  0x0E7    ; TARGET (dword) * 10, 40 bytes

%define FootClass.Offset.Team                      0x07F    ; CCPtr<TeamClass>
%define FootClass.Offset.Group                     0x083    ; byte
%define FootClass.Offset.Member                    0x084    ; FootClass * (ptr)
%define FootClass.Offset.Path                      0x088    ; FacingType (byte) * 12, 12 bytes
%define FootClass.Offset.PathThreshhold            0x094    ; MoveType (byte)
%define FootClass.Offset.PathDelay                 0x095    ; CDTimerClass<FrameTimerClass>
%define FootClass.Offset.PathTryAgain              0x09E    ; int
%define FootClass.Offset.BaseAttackTimer           0x0A2    ; CDTimerClass<FrameTimerClass>
%define FootClass.Offset.FormationSpeed            0x0AB    ; byte
%define FootClass.Offset.FormationMaxSpeed         0x0AC    ; byte
%define FootClass.Offset.HeadToCoord               0x0AD    ; COORDINATE (dword)
; 0x0B1

; Generally, object instances are not read by INI

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

;%define FootClass.RTTI.Get(ptr_type,reg_output)                        GetByte                ptr_type, FootClass.Offset.RTTI, reg_output
;%define FootClass.RTTI.Set(ptr_type,value)                             SetByte                ptr_type, FootClass.Offset.RTTI, value

;%define FootClass.Index.Get(ptr_type,reg_output)                       GetInt                 ptr_type, FootClass.Offset.Index, reg_output
;%define FootClass.Index.Set(ptr_type,value)                            SetInt                 ptr_type, FootClass.Offset.Index, value

%endif
