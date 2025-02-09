;----------------------------------------------------------------
; inc/types/TechnoClass.inc
;
; Macros to access TechnoClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_TECHNOCLASS
%define TYPES_TECHNOCLASS

; define object type field definitions
%define TechnoClass.Offset.Crew                        0x06F    ; CrewClass (Kill short)
%define TechnoClass.Offset.IsUseless                   0x071    ; bool
%define TechnoClass.Bit.IsUseless                      1
%define TechnoClass.Offset.IsTickedOff                 0x071    ; bool
%define TechnoClass.Bit.IsTickedOff                    2
%define TechnoClass.Offset.IsCloakable                 0x071    ; bool
%define TechnoClass.Bit.IsCloakable                    3
%define TechnoClass.Offset.IsLeader                    0x071    ; bool
%define TechnoClass.Bit.IsLeader                       4
%define TechnoClass.Offset.IsALoaner                   0x071    ; bool
%define TechnoClass.Bit.IsALoaner                      5
%define TechnoClass.Offset.IsLocked                    0x071    ; bool
%define TechnoClass.Bit.IsLocked                       6
%define TechnoClass.Offset.IsInRecoilState             0x071    ; bool
%define TechnoClass.Bit.IsInRecoilState                7
%define TechnoClass.Offset.IsTethered                  0x071    ; bool
%define TechnoClass.Bit.IsTethered                     8
%define TechnoClass.Offset.IsOwnedByPlayer             0x072    ; bool
%define TechnoClass.Bit.IsOwnedByPlayer                1
%define TechnoClass.Offset.IsDiscoveredByPlayer        0x072    ; bool
%define TechnoClass.Bit.IsDiscoveredByPlayer           2
%define TechnoClass.Offset.IsDiscoveredByComputer      0x072    ; bool
%define TechnoClass.Bit.IsDiscoveredByComputer         3
%define TechnoClass.Offset.IsALemon                    0x072    ; bool
%define TechnoClass.Bit.IsALemon                       4
%define TechnoClass.Offset.IsSecondShot                0x072    ; bool
%define TechnoClass.Bit.IsSecondShot                   5
; new bools
%define TechnoClass.Offset.IsInPlay                    0x072    ; bool
%define TechnoClass.Bit.IsInPlay                       6
%define TechnoClass.Offset.IsInTransport               0x072    ; bool
%define TechnoClass.Bit.IsInTransport                  7
; 0x073, 0x074 empty
%define TechnoClass.Offset.ArmorBias                   0x075    ; short (fixed)
%define TechnoClass.Offset.FirepowerBias               0x077    ; short (fixed)
%define TechnoClass.Offset.IdleTimer                   0x079    ; CDTimerClass<FrameTimerClass>, 9 bytes
%define TechnoClass.Offset.IronCurtainCountDown        0x082    ; CDTimerClass<FrameTimerClass>, 9 bytes
%define TechnoClass.Offset.SpiedBy                     0x08B    ; int
%define TechnoClass.Offset.ArchiveTarget               0x08F    ; TARGET (dword)
%define TechnoClass.Offset.House                       0x093    ; CCPtr<HouseClass>
%define TechnoClass.Offset.Cloak                       0x097    ; CloakType (byte)
%define TechnoClass.Offset.CloakingDevice              0x098    ; StageClass, 0x11 bytes
%define TechnoClass.Offset.CloakDelay                  0x0A9    ; CDTimerClass<FrameTimerClass>, 9 bytes
%define TechnoClass.Offset.TarCom                      0x0B2    ; TARGET (dword)
%define TechnoClass.Offset.SuspendedTarCom             0x0B6    ; TARGET (dword)
%define TechnoClass.Offset.PrimaryFacing               0x0BA    ; FacingClass (2 bytes) CurrentFacing / DesiredFacing
%define TechnoClass.Offset.Arm                         0x0BC    ; CDTimerClass<FrameTimerClass>, 9 bytes
%define TechnoClass.Offset.Ammo                        0x0C5    ; int
;%define TechnoClass.Offset.ElectricZapDelay            0x0C9    ; int (Remastered-only)
;%define TechnoClass.Offset.ElectricZapTarget           0x0CD    ;  (dword)
;%define TechnoClass.Offset.ElectricZapWhich            0x0D1    ; int
%define TechnoClass.Offset.PurchasePrice               0x0C9    ; int
;%define TechnoClass.Offset.IsDiscoveredByPlayerMask               0x037    ; bool

; 0x0D9

; Generally, object instances are not read by INI

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

;%define TechnoClass.RTTI.Get(ptr_type,reg_output)                        GetByte                ptr_type, TechnoClass.Offset.RTTI, reg_output
;%define TechnoClass.RTTI.Set(ptr_type,value)                             SetByte                ptr_type, TechnoClass.Offset.RTTI, value

;%define TechnoClass.Index.Get(ptr_type,reg_output)                       GetInt                 ptr_type, TechnoClass.Offset.Index, reg_output
;%define TechnoClass.Index.Set(ptr_type,value)                            SetInt                 ptr_type, TechnoClass.Offset.Index, value

%define TechnoClass.House.Get(ptr_type,reg_output)                       GetInt                                 ptr_type, TechnoClass.Offset.House, reg_output
%define TechnoClass.House.Set(ptr_type,value)                            SetInt                                 ptr_type, TechnoClass.Offset.House, value


%endif
