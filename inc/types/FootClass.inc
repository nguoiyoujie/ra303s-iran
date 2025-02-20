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

%define FootClass.Offset.PathAbandon               0x0CF    ; byte

; 0x0D0 empty
%define FootClass.Offset.Speed                     0x0D1    ; int
%define FootClass.Offset.SpeedBias                 0x0D5    ; fixed (word)
%define FootClass.Offset.XFormOffset               0x0D7    ; int
%define FootClass.Offset.YFormOffset               0x0DB    ; int
%define FootClass.Offset.NavCom                    0x0DF    ; TARGET (dword)
%define FootClass.Offset.SuspendedNavCom           0x0E3    ; TARGET (dword)
%define FootClass.Offset.NavQueue                  0x0E7    ; TARGET (dword) * 10, 40 bytes

%define FootClass.Offset.Team                      0x10F    ; CCPtr<TeamClass>
%define FootClass.Offset.Group                     0x113    ; byte
%define FootClass.Offset.Member                    0x114    ; FootClass * (ptr)
%define FootClass.Offset.Path                      0x118    ; FacingType (byte) * 12, 12 bytes
%define FootClass.Offset.PathThreshhold            0x124    ; MoveType (byte)
%define FootClass.Offset.PathDelay                 0x125    ; CDTimerClass<FrameTimerClass>
%define FootClass.Offset.PathTryAgain              0x12E    ; int
%define FootClass.Offset.BaseAttackTimer           0x132    ; CDTimerClass<FrameTimerClass>
%define FootClass.Offset.FormationSpeed            0x13B    ; byte
%define FootClass.Offset.FormationMaxSpeed         0x13C    ; byte
%define FootClass.Offset.HeadToCoord               0x13D    ; COORDINATE (dword)
; 0x141

%endif
