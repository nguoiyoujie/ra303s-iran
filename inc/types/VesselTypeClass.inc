;----------------------------------------------------------------
; inc/types/vesseltypeclass.asm
;
; Macros to access VesselTypeClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_VESSELTYPECLASS
%define TYPES_VESSELTYPECLASS

cextern VesselTypeClass.Count
cextern VesselTypeClass.Array

; define aircraft type field definitions
%define VesselTypeClass.Offset.IsPieceOfEight                0x192    ; BOOL, BIT 1
%define VesselTypeClass.Bit.IsPieceOfEight                   1    
%define VesselTypeClass.Offset.HasSecondTurret               0x192    ; BOOL, BIT 2
%define VesselTypeClass.Bit.HasSecondTurret                  2 
%define VesselTypeClass.Offset.IsOpenTopped                  0x192    ; bool
%define VesselTypeClass.Bit.IsOpenTopped                     3    
%define VesselTypeClass.Offset.ManualAcquire                 0x192    ; bool
%define VesselTypeClass.Bit.ManualAcquire                    4
%define VesselTypeClass.Offset.ToProtectWithSpecials         0x192    ; bool
%define VesselTypeClass.Bit.ToProtectWithSpecials            5
%define VesselTypeClass.Offset.ToTeleportWithSpecials        0x192    ; bool
%define VesselTypeClass.Bit.ToTeleportWithSpecials           6
%define VesselTypeClass.Offset.IsImmuneToTimeWarp            0x192    ; bool
%define VesselTypeClass.Bit.IsImmuneToTimeWarp               7
; 0x193, 0x194 and 0x195 are empty...                   
%define VesselTypeClass.Offset.Type                          0x196    ; byte
%define VesselTypeClass.Offset.TurretOffset                  0x197    ; byte
%define VesselTypeClass.Offset.DefaultMission                0x198    ; byte
%define VesselTypeClass.Offset.Explosion                     0x199    ; byte
%define VesselTypeClass.Offset.MaxSize                       0x19A    ; INT

; Extended space (>= 0x19E)
; Common space for UnitTypeClass and VesselTypeClass (pseudo-DriveClass)
%define VesselTypeClass.Offset.ExtendedPrerequisite          0x19E    ; INTx8
%define VesselTypeClass.Offset.AmmoReloadRate                0x21E    ; INT
%define VesselTypeClass.Offset.AmmoReloadAmount              0x222    ; INT
%define VesselTypeClass.Offset.Response_Select               0x226    ; INT
%define VesselTypeClass.Offset.Response_Select_Data          0x22A    ; word x16
%define VesselTypeClass.Offset.Response_Move                 0x24A    ; INT
%define VesselTypeClass.Offset.Response_Move_Data            0x24E    ; word x16
%define VesselTypeClass.Offset.Response_Attack               0x26E    ; INT
%define VesselTypeClass.Offset.Response_Attack_Data          0x272    ; word x16
%define VesselTypeClass.Offset.Response_Harvest              0x292    ; INT
%define VesselTypeClass.Offset.Response_Harvest_Data         0x296    ; word x16
%define VesselTypeClass.Offset.Response_Enter                0x2B6    ; INT
%define VesselTypeClass.Offset.Response_Enter_Data           0x2BA    ; word x16
%define VesselTypeClass.Offset.Response_Deploy               0x2DA    ; INT
%define VesselTypeClass.Offset.Response_Deploy_Data          0x2DE    ; word x16
;0x2FE
; unique space
%define VesselTypeClass.Offset.TurretName                    0x2FE    ; int ptr to string
%define VesselTypeClass.Offset.TurretShape                   0x302    ; int ptr to SHP file memory
%define VesselTypeClass.Offset.TurretFireOffset              0x306    ; INT
%define VesselTypeClass.Offset.TurretAdjustY                 0x30A    ; INT
%define VesselTypeClass.Offset.CloakSound                    0x30E    ; byte
;0x30F


; INI String controls
str.VesselTypeClass.IsPieceOfEight            db"IsPieceOfEight",0              ;internal feature
str.VesselTypeClass.HasSecondTurret           db"HasSecondTurret",0             ;new ini feature
str.VesselTypeClass.IsOpenTopped              db"OpenTopped",0                  ;new ini feature
str.VesselTypeClass.ManualAcquire             db"ManualAcquire",0               ;new ini feature
str.VesselTypeClass.ToProtectWithSpecials     db"ToProtectWithSpecials",0       ;new ini feature
str.VesselTypeClass.ToTeleportWithSpecials    db"ToTeleportWithSpecials",0      ;new ini feature
str.VesselTypeClass.IsImmuneToTimeWarp        db"IsImmuneToTimeWarp",0          ;new ini feature
str.VesselTypeClass.Type                      db"Type",0                        ;internal feature
str.VesselTypeClass.TurretOffset              db"TurretOffset",0                ;unused feature, now new ini feature (measured in pixels)
str.VesselTypeClass.DefaultMission            db"DefaultMission",0              ;unused feature
str.VesselTypeClass.Explosion                 db"Explosion",0                   ;internal feature
str.VesselTypeClass.MaxSize                   db"MaxSize",0                     ;internal feature
str.VesselTypeClass.TurretName                db"TurretName",0                  ;new ini feature
str.VesselTypeClass.TurretFireOffset          db"TurretFireOffset",0            ;new ini feature (measured in leptons)
str.VesselTypeClass.TurretAdjustY             db"TurretAdjustY",0               ;new ini feature (measured in pixels)
str.VesselTypeClass.Response_Select           db"ResponseSelect",0              ;new ini feature
str.VesselTypeClass.Response_Move             db"ResponseMove",0                ;new ini feature
str.VesselTypeClass.Response_Attack           db"ResponseAttack",0              ;new ini feature
str.VesselTypeClass.Response_Harvest          db"ResponseHarvest",0             ;new ini feature
str.VesselTypeClass.Response_Enter            db"ResponseEnter",0               ;new ini feature
str.VesselTypeClass.Response_Deploy           db"ResponseDeploy",0              ;new ini feature
str.VesselTypeClass.AmmoReloadRate            db"AmmoReloadRate",0              ;new ini feature
str.VesselTypeClass.AmmoReloadAmount          db"AmmoReloadAmount",0            ;new ini feature
str.VesselTypeClass.CloakSound                db"CloakSound",0                  ;new ini feature


%define VesselTypeClass.FromIndex(d_index,reg_output)                        AbstractTypeClass.FromIndex              d_index, VesselTypeClass.Count, VesselTypeClass.Array, reg_output
%define VesselTypeClass.FromID(d_index,reg_output)                           AbstractTypeClass.FromID                 d_index, VesselTypeClass.Count, VesselTypeClass.Array, reg_output

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

%define VesselTypeClass.IsPieceOfEight.Get(ptr_type,reg_output)              GetBool                                ptr_type, VesselTypeClass.Offset.IsPieceOfEight, VesselTypeClass.Bit.IsPieceOfEight, reg_output
%define VesselTypeClass.IsPieceOfEight.Set(ptr_type,value)                   SetBool                                ptr_type, VesselTypeClass.Offset.IsPieceOfEight, VesselTypeClass.Bit.IsPieceOfEight, value
%define VesselTypeClass.IsPieceOfEight.Read(ptr_type,ptr_rules)              AbstractTypeClass.ReadBool             ptr_type, ptr_rules, VesselTypeClass.Offset.IsPieceOfEight, VesselTypeClass.Bit.IsPieceOfEight, str.VesselTypeClass.IsPieceOfEight

%define VesselTypeClass.HasSecondTurret.Get(ptr_type,reg_output)             GetBool                                ptr_type, VesselTypeClass.Offset.HasSecondTurret, VesselTypeClass.Bit.HasSecondTurret, reg_output
%define VesselTypeClass.HasSecondTurret.Set(ptr_type,value)                  SetBool                                ptr_type, VesselTypeClass.Offset.HasSecondTurret, VesselTypeClass.Bit.HasSecondTurret, value
%define VesselTypeClass.HasSecondTurret.Read(ptr_type,ptr_rules)             AbstractTypeClass.ReadBool             ptr_type, ptr_rules, VesselTypeClass.Offset.HasSecondTurret, VesselTypeClass.Bit.HasSecondTurret, str.VesselTypeClass.HasSecondTurret

%define VesselTypeClass.IsOpenTopped.Get(ptr_type,reg_output)                GetBool                                ptr_type, VesselTypeClass.Offset.IsOpenTopped, VesselTypeClass.Bit.IsOpenTopped, reg_output
%define VesselTypeClass.IsOpenTopped.Set(ptr_type,value)                     SetBool                                ptr_type, VesselTypeClass.Offset.IsOpenTopped, VesselTypeClass.Bit.IsOpenTopped, value
%define VesselTypeClass.IsOpenTopped.Read(ptr_type,ptr_rules)                AbstractTypeClass.ReadBool             ptr_type, ptr_rules, VesselTypeClass.Offset.IsOpenTopped, VesselTypeClass.Bit.IsOpenTopped, str.VesselTypeClass.IsOpenTopped

%define VesselTypeClass.ManualAcquire.Get(ptr_type,reg_output)               GetBool                                ptr_type, VesselTypeClass.Offset.ManualAcquire, VesselTypeClass.Bit.ManualAcquire, reg_output
%define VesselTypeClass.ManualAcquire.Set(ptr_type,value)                    SetBool                                ptr_type, VesselTypeClass.Offset.ManualAcquire, VesselTypeClass.Bit.ManualAcquire, value
%define VesselTypeClass.ManualAcquire.Read(ptr_type,ptr_rules)               AbstractTypeClass.ReadBool             ptr_type, ptr_rules, VesselTypeClass.Offset.ManualAcquire, VesselTypeClass.Bit.ManualAcquire, str.VesselTypeClass.ManualAcquire

%define VesselTypeClass.ToProtectWithSpecials.Get(ptr_type,reg_output)       GetBool                                ptr_type, VesselTypeClass.Offset.ToProtectWithSpecials, VesselTypeClass.Bit.ToProtectWithSpecials, reg_output
%define VesselTypeClass.ToProtectWithSpecials.Set(ptr_type,value)            SetBool                                ptr_type, VesselTypeClass.Offset.ToProtectWithSpecials, VesselTypeClass.Bit.ToProtectWithSpecials, value
%define VesselTypeClass.ToProtectWithSpecials.Read(ptr_type,ptr_rules)       AbstractTypeClass.ReadBool             ptr_type, ptr_rules, VesselTypeClass.Offset.ToProtectWithSpecials, VesselTypeClass.Bit.ToProtectWithSpecials, str.VesselTypeClass.ToProtectWithSpecials

%define VesselTypeClass.ToTeleportWithSpecials.Get(ptr_type,reg_output)      GetBool                                ptr_type, VesselTypeClass.Offset.ToTeleportWithSpecials, VesselTypeClass.Bit.ToTeleportWithSpecials, reg_output
%define VesselTypeClass.ToTeleportWithSpecials.Set(ptr_type,value)           SetBool                                ptr_type, VesselTypeClass.Offset.ToTeleportWithSpecials, VesselTypeClass.Bit.ToTeleportWithSpecials, value
%define VesselTypeClass.ToTeleportWithSpecials.Read(ptr_type,ptr_rules)      AbstractTypeClass.ReadBool             ptr_type, ptr_rules, VesselTypeClass.Offset.ToTeleportWithSpecials, VesselTypeClass.Bit.ToTeleportWithSpecials, str.VesselTypeClass.ToTeleportWithSpecials

%define VesselTypeClass.IsImmuneToTimeWarp.Get(ptr_type,reg_output)          GetBool                                ptr_type, VesselTypeClass.Offset.IsImmuneToTimeWarp, VesselTypeClass.Bit.IsImmuneToTimeWarp, reg_output
%define VesselTypeClass.IsImmuneToTimeWarp.Set(ptr_type,value)               SetBool                                ptr_type, VesselTypeClass.Offset.IsImmuneToTimeWarp, VesselTypeClass.Bit.IsImmuneToTimeWarp, value
%define VesselTypeClass.IsImmuneToTimeWarp.Read(ptr_type,ptr_rules)          AbstractTypeClass.ReadBool             ptr_type, ptr_rules, VesselTypeClass.Offset.IsImmuneToTimeWarp, VesselTypeClass.Bit.IsImmuneToTimeWarp, str.VesselTypeClass.IsImmuneToTimeWarp

%define VesselTypeClass.Type.Get(ptr_type,reg_output)                        GetInt                                 ptr_type, VesselTypeClass.Offset.Type, reg_output
%define VesselTypeClass.Type.Set(ptr_type,value)                             SetInt                                 ptr_type, VesselTypeClass.Offset.Type, value
%define VesselTypeClass.Type.Read(ptr_type,ptr_rules)                        AbstractTypeClass.ReadInt              ptr_type, ptr_rules, VesselTypeClass.Offset.Type, str.VesselTypeClass.Type

%define VesselTypeClass.TurretOffset.Get(ptr_type,reg_output)                GetByte                                ptr_type, VesselTypeClass.Offset.TurretOffset, reg_output
%define VesselTypeClass.TurretOffset.Set(ptr_type,value)                     SetByte                                ptr_type, VesselTypeClass.Offset.TurretOffset, value
%define VesselTypeClass.TurretOffset.Read(ptr_type,ptr_rules)                AbstractTypeClass.ReadByte             ptr_type, ptr_rules, VesselTypeClass.Offset.TurretOffset, str.VesselTypeClass.TurretOffset  

%define VesselTypeClass.TurretFireOffset.Get(ptr_type,reg_output)            GetInt                                 ptr_type, VesselTypeClass.Offset.TurretFireOffset, reg_output
%define VesselTypeClass.TurretFireOffset.Set(ptr_type,value)                 SetInt                                 ptr_type, VesselTypeClass.Offset.TurretFireOffset, value
%define VesselTypeClass.TurretFireOffset.Read(ptr_type,ptr_rules)            AbstractTypeClass.ReadInt              ptr_type, ptr_rules, VesselTypeClass.Offset.TurretFireOffset, str.VesselTypeClass.TurretFireOffset  

%define VesselTypeClass.DefaultMission.Get(ptr_type,reg_output)              GetByte                                ptr_type, VesselTypeClass.Offset.DefaultMission, reg_output
%define VesselTypeClass.DefaultMission.Set(ptr_type,value)                   SetByte                                ptr_type, VesselTypeClass.Offset.DefaultMission, value
%define VesselTypeClass.DefaultMission.Read(ptr_type,ptr_rules)              AbstractTypeClass.ReadByte             ptr_type, ptr_rules, VesselTypeClass.Offset.DefaultMission, str.VesselTypeClass.DefaultMission  

%define VesselTypeClass.Explosion.Get(ptr_type,reg_output)                   GetByte                                ptr_type, VesselTypeClass.Offset.Explosion, reg_output
%define VesselTypeClass.Explosion.Set(ptr_type,value)                        SetByte                                ptr_type, VesselTypeClass.Offset.Explosion, value
%define VesselTypeClass.Explosion.Read(ptr_type,ptr_rules)                   AbstractTypeClass.ReadByte             ptr_type, ptr_rules, VesselTypeClass.Offset.Explosion, str.VesselTypeClass.Explosion  

%define VesselTypeClass.MaxSize.Get(ptr_type,reg_output)                     GetInt                                 ptr_type, VesselTypeClass.Offset.MaxSize, reg_output
%define VesselTypeClass.MaxSize.Set(ptr_type,value)                          SetInt                                 ptr_type, VesselTypeClass.Offset.MaxSize, value
%define VesselTypeClass.MaxSize.Read(ptr_type,ptr_rules)                     AbstractTypeClass.ReadInt              ptr_type, ptr_rules, VesselTypeClass.Offset.MaxSize, str.VesselTypeClass.MaxSize

%define VesselTypeClass.TurretName.Get(ptr_type,reg_output)                  GetInt                                 ptr_type, VesselTypeClass.Offset.TurretName, reg_output
%define VesselTypeClass.TurretName.Set(ptr_type,value)                       SetInt                                 ptr_type, VesselTypeClass.Offset.TurretName, value
%define VesselTypeClass.TurretName.Read(ptr_type,ptr_rules,function)         AbstractTypeClass.ReadStringExt        ptr_type, ptr_rules, VesselTypeClass.Offset.TurretName, str.VesselTypeClass.TurretName, function

%define VesselTypeClass.TurretShape.Get(ptr_type,reg_output)                 GetInt                                 ptr_type, VesselTypeClass.Offset.TurretShape, reg_output
%define VesselTypeClass.TurretShape.Set(ptr_type,value)                      SetInt                                 ptr_type, VesselTypeClass.Offset.TurretShape, value

%define VesselTypeClass.TurretAdjustY.Get(ptr_type,reg_output)               GetInt                                 ptr_type, VesselTypeClass.Offset.TurretAdjustY, reg_output
%define VesselTypeClass.TurretAdjustY.Set(ptr_type,value)                    SetInt                                 ptr_type, VesselTypeClass.Offset.TurretAdjustY, value
%define VesselTypeClass.TurretAdjustY.Read(ptr_type,ptr_rules)               AbstractTypeClass.ReadInt              ptr_type, ptr_rules, VesselTypeClass.Offset.TurretAdjustY, str.VesselTypeClass.TurretAdjustY

%define VesselTypeClass.AmmoReloadRate.Get(ptr_type,reg_output)              GetInt                                 ptr_type, VesselTypeClass.Offset.AmmoReloadRate, reg_output
%define VesselTypeClass.AmmoReloadRate.Set(ptr_type,value)                   SetInt                                 ptr_type, VesselTypeClass.Offset.AmmoReloadRate, value
%define VesselTypeClass.AmmoReloadRate.Read(ptr_type,ptr_rules)              AbstractTypeClass.ReadInt              ptr_type, ptr_rules, VesselTypeClass.Offset.AmmoReloadRate, str.VesselTypeClass.AmmoReloadRate

%define VesselTypeClass.AmmoReloadAmount.Get(ptr_type,reg_output)            GetInt                                 ptr_type, VesselTypeClass.Offset.AmmoReloadAmount, reg_output
%define VesselTypeClass.AmmoReloadAmount.Set(ptr_type,value)                 SetInt                                 ptr_type, VesselTypeClass.Offset.AmmoReloadAmount, value
%define VesselTypeClass.AmmoReloadAmount.Read(ptr_type,ptr_rules)            AbstractTypeClass.ReadInt              ptr_type, ptr_rules, VesselTypeClass.Offset.AmmoReloadAmount, str.VesselTypeClass.AmmoReloadAmount

%define VesselTypeClass.Response_Select.Get(ptr_type,reg_output)             GetInt                                 ptr_type, VesselTypeClass.Offset.Response_Select, reg_output
%define VesselTypeClass.Response_Select_Data.Get(ptr_type,reg_output)        GetWord                                ptr_type, VesselTypeClass.Offset.Response_Select_Data, reg_output
%define VesselTypeClass.Response_Select.Read(ptr_type,ptr_rules,function)    AbstractTypeClass.ReadStringExt        ptr_type, ptr_rules, VesselTypeClass.Offset.Response_Select, str.VesselTypeClass.Response_Select, function

%define VesselTypeClass.Response_Move.Get(ptr_type,reg_output)               GetInt                                 ptr_type, VesselTypeClass.Offset.Response_Move, reg_output
%define VesselTypeClass.Response_Move_Data.Get(ptr_type,reg_output)          GetWord                                ptr_type, VesselTypeClass.Offset.Response_Move_Data, reg_output
%define VesselTypeClass.Response_Move.Read(ptr_type,ptr_rules,function)      AbstractTypeClass.ReadStringExt        ptr_type, ptr_rules, VesselTypeClass.Offset.Response_Move, str.VesselTypeClass.Response_Move, function

%define VesselTypeClass.Response_Attack.Get(ptr_type,reg_output)             GetInt                                 ptr_type, VesselTypeClass.Offset.Response_Attack, reg_output
%define VesselTypeClass.Response_Attack_Data.Get(ptr_type,reg_output)        GetWord                                ptr_type, VesselTypeClass.Offset.Response_Attack_Data, reg_output
%define VesselTypeClass.Response_Attack.Read(ptr_type,ptr_rules,function)    AbstractTypeClass.ReadStringExt        ptr_type, ptr_rules, VesselTypeClass.Offset.Response_Attack, str.VesselTypeClass.Response_Attack, function

%define VesselTypeClass.Response_Harvest.Get(ptr_type,reg_output)            GetInt                                 ptr_type, VesselTypeClass.Offset.Response_Harvest, reg_output
%define VesselTypeClass.Response_Harvest_Data.Get(ptr_type,reg_output)       GetWord                                ptr_type, VesselTypeClass.Offset.Response_Harvest_Data, reg_output
%define VesselTypeClass.Response_Harvest.Read(ptr_type,ptr_rules,function)   AbstractTypeClass.ReadStringExt        ptr_type, ptr_rules, VesselTypeClass.Offset.Response_Harvest, str.VesselTypeClass.Response_Harvest, function

%define VesselTypeClass.Response_Enter.Get(ptr_type,reg_output)              GetInt                                 ptr_type, VesselTypeClass.Offset.Response_Enter, reg_output
%define VesselTypeClass.Response_Enter_Data.Get(ptr_type,reg_output)         GetWord                                ptr_type, VesselTypeClass.Offset.Response_Enter_Data, reg_output
%define VesselTypeClass.Response_Enter.Read(ptr_type,ptr_rules,function)     AbstractTypeClass.ReadStringExt        ptr_type, ptr_rules, VesselTypeClass.Offset.Response_Enter, str.VesselTypeClass.Response_Enter, function

%define VesselTypeClass.Response_Deploy.Get(ptr_type,reg_output)             GetInt                                 ptr_type, VesselTypeClass.Offset.Response_Deploy, reg_output
%define VesselTypeClass.Response_Deploy_Data.Get(ptr_type,reg_output)        GetWord                                ptr_type, VesselTypeClass.Offset.Response_Deploy_Data, reg_output
%define VesselTypeClass.Response_Deploy.Read(ptr_type,ptr_rules,function)    AbstractTypeClass.ReadStringExt        ptr_type, ptr_rules, VesselTypeClass.Offset.Response_Deploy, str.VesselTypeClass.Response_Deploy, function

%define VesselTypeClass.CloakSound.Get(ptr_type,reg_output)                  GetByte                                ptr_type, VesselTypeClass.Offset.CloakSound, reg_output
%define VesselTypeClass.CloakSound.Set(ptr_type,value)                       SetByte                                ptr_type, VesselTypeClass.Offset.CloakSound, value
%define VesselTypeClass.CloakSound.Read(ptr_type,ptr_rules,function)         AbstractTypeClass.ReadStringToByteExt  ptr_type, ptr_rules, VesselTypeClass.Offset.CloakSound, str.VesselTypeClass.CloakSound, function

%endif
