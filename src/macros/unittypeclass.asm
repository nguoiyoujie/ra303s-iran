;----------------------------------------------------------------
; src/macros/unittypeclass.asm
;
; Macros to access UnitTypeClass offsets
;
;----------------------------------------------------------------


; define building type field definitions
%define UnitTypeClass.Offset.IsCrateGoodie                 0x192    ; BOOL
%define UnitTypeClass.Bit.IsCrateGoodie                    1    
%define UnitTypeClass.Offset.Crusher                       0x192    ; BOOL
%define UnitTypeClass.Bit.Crusher                          2    
%define UnitTypeClass.Offset.IsToHarvest                   0x192    ; BOOL
%define UnitTypeClass.Bit.IsToHarvest                      3    
%define UnitTypeClass.Offset.IsRotatingTurret              0x192    ; BOOL
%define UnitTypeClass.Bit.IsRotatingTurret                 4    
%define UnitTypeClass.Offset.IsFireAnim                    0x192    ; BOOL
%define UnitTypeClass.Bit.IsFireAnim                       5    
%define UnitTypeClass.Offset.IsLockTurret                  0x192    ; BOOL
%define UnitTypeClass.Bit.IsLockTurret                     6    
%define UnitTypeClass.Offset.IsGigundo                     0x192    ; BOOL
%define UnitTypeClass.Bit.IsGigundo                        7    
%define UnitTypeClass.Offset.IsAnimating                   0x192    ; BOOL
%define UnitTypeClass.Bit.IsAnimating                      8    
%define UnitTypeClass.Offset.IsJammer                      0x193    ; BOOL
%define UnitTypeClass.Bit.IsJammer                         1    
%define UnitTypeClass.Offset.IsGapper                      0x193    ; BOOL
%define UnitTypeClass.Bit.IsGapper                         2    
%define UnitTypeClass.Offset.IsNoFireWhileMoving           0x193    ; BOOL // Already supported by game INI
%define UnitTypeClass.Bit.IsNoFireWhileMoving              3    
%define UnitTypeClass.Offset.IsNoSmoke                     0x193    ; BOOL
%define UnitTypeClass.Bit.IsNoSmoke                        4    
;%define UnitTypeClass.Offset.IsAmmoLauncher                0x193    ; BOOL
;%define UnitTypeClass.Bit.IsAmmoLauncher                   5    
; 0x194 and 0x195 are empty...  
%define UnitTypeClass.Offset.Type                          0x196    ; byte
%define UnitTypeClass.Offset.TurretOffset                  0x197    ; byte
%define UnitTypeClass.Offset.DefaultMission                0x198    ; byte
%define UnitTypeClass.Offset.Explosion                     0x199    ; byte
%define UnitTypeClass.Offset.MaxSize                       0x19A    ; INT

; Extended space (>= 0x19E)
%define UnitTypeClass.Offset.ExtendedPrerequisite          0x19E    ; INTx8
%define UnitTypeClass.Offset.TurretAdjustX                 0x21E    ; INT
%define UnitTypeClass.Offset.TurretAdjustY                 0x222    ; INT
%define UnitTypeClass.Offset.TurretFrameStart              0x226    ; word
%define UnitTypeClass.Offset.TurretFrameCount              0x228    ; word
%define UnitTypeClass.Offset.DeploysInto                   0x22A    ; byte
%define UnitTypeClass.Offset.AmmoReloadRate                      0x22B    ; INT
%define UnitTypeClass.Offset.AmmoReloadAmount                    0x22F    ; INT

; INI String controls
str.UnitTypeClass.IsCrateGoodie                 db"IsCrateGoodie",0               ;new ini feature
str.UnitTypeClass.Crusher                       db"Crusher",0                     ;new ini feature
str.UnitTypeClass.IsToHarvest                   db"IsHarvester",0                 ;new ini feature
str.UnitTypeClass.IsRotatingTurret              db"HasRotatingTurret",0           ;new ini feature
str.UnitTypeClass.IsFireAnim                    db"IsFireAnim",0                  ;new ini feature (C&C dinos)
str.UnitTypeClass.IsLockTurret                  db"IsLockTurret",0                ;new ini feature
str.UnitTypeClass.IsGigundo                     db"Large",0                       ;new ini feature
str.UnitTypeClass.IsAnimating                   db"IsAnimating",0                 ;new ini feature (C&C viceroid)
str.UnitTypeClass.IsJammer                      db"IsJammer",0                    ;new ini feature
str.UnitTypeClass.IsGapper                      db"IsGapGenerator",0              ;new ini feature
str.UnitTypeClass.IsNoFireWhileMoving           db"IsNoFireWhileMoving",0         ;new ini feature
str.UnitTypeClass.IsNoSmoke                     db"IsNoSmoke",0                   ;new ini feature
str.UnitTypeClass.Type                          db"Type",0                        ;internal feature
str.UnitTypeClass.TurretOffset                  db"TurretOffset",0                ;internal feature
str.UnitTypeClass.DefaultMission                db"DefaultMission",0              ;internal feature
str.UnitTypeClass.Explosion                     db"ExplosionAnim",0               ;internal feature
str.UnitTypeClass.MaxSize                       db"MaxSize",0                     ;internal feature
str.UnitTypeClass.TurretAdjustX                 db"TurretAdjustX",0               ;new ini feature
str.UnitTypeClass.TurretAdjustY                 db"TurretAdjustY",0               ;new ini feature
str.UnitTypeClass.TurretFrameStart              db"TurretFrameStart",0            ;new ini feature
str.UnitTypeClass.TurretFrameCount              db"TurretFrameCount",0            ;new ini feature
str.UnitTypeClass.DeploysInto                   db"DeploysInto",0                 ;new ini feature
str.UnitTypeClass.AmmoReloadRate                db"AmmoReloadRate",0              ;new ini feature
str.UnitTypeClass.AmmoReloadAmount              db"AmmoReloadAmount",0            ;new ini feature


%define UnitTypeClass.FromIndex(d_index,reg_output)                        TechnoTypeClass.FromIndex              d_index, UnitTypeClass.Count, UnitTypeClass.Array, reg_output
%define UnitTypeClass.FromID(d_index,reg_output)                           TechnoTypeClass.FromID                 d_index, UnitTypeClass.Count, UnitTypeClass.Array, reg_output

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

%define UnitTypeClass.IsCrateGoodie.Get(ptr_type,reg_output)               ObjectTypeClass.GetBool                ptr_type, UnitTypeClass.Offset.IsCrateGoodie, UnitTypeClass.Bit.IsCrateGoodie, reg_output
%define UnitTypeClass.IsCrateGoodie.Set(ptr_type,value)                    ObjectTypeClass.SetBool                ptr_type, UnitTypeClass.Offset.IsCrateGoodie, UnitTypeClass.Bit.IsCrateGoodie, value
%define UnitTypeClass.IsCrateGoodie.Read(ptr_type,ptr_rules)               ObjectTypeClass.ReadBool               ptr_type, ptr_rules, UnitTypeClass.Offset.IsCrateGoodie, UnitTypeClass.Bit.IsCrateGoodie, str.UnitTypeClass.IsCrateGoodie

%define UnitTypeClass.Crusher.Get(ptr_type,reg_output)                     ObjectTypeClass.GetBool                ptr_type, UnitTypeClass.Offset.Crusher, UnitTypeClass.Bit.Crusher, reg_output
%define UnitTypeClass.Crusher.Set(ptr_type,value)                          ObjectTypeClass.SetBool                ptr_type, UnitTypeClass.Offset.Crusher, UnitTypeClass.Bit.Crusher, value
%define UnitTypeClass.Crusher.Read(ptr_type,ptr_rules)                     ObjectTypeClass.ReadBool               ptr_type, ptr_rules, UnitTypeClass.Offset.Crusher, UnitTypeClass.Bit.Crusher, str.UnitTypeClass.Crusher

%define UnitTypeClass.IsToHarvest.Get(ptr_type,reg_output)                 ObjectTypeClass.GetBool                ptr_type, UnitTypeClass.Offset.IsToHarvest, UnitTypeClass.Bit.IsToHarvest, reg_output
%define UnitTypeClass.IsToHarvest.Set(ptr_type,value)                      ObjectTypeClass.SetBool                ptr_type, UnitTypeClass.Offset.IsToHarvest, UnitTypeClass.Bit.IsToHarvest, value
%define UnitTypeClass.IsToHarvest.Read(ptr_type,ptr_rules)                 ObjectTypeClass.ReadBool               ptr_type, ptr_rules, UnitTypeClass.Offset.IsToHarvest, UnitTypeClass.Bit.IsToHarvest, str.UnitTypeClass.IsToHarvest

%define UnitTypeClass.IsRotatingTurret.Get(ptr_type,reg_output)            ObjectTypeClass.GetBool                ptr_type, UnitTypeClass.Offset.IsRotatingTurret, UnitTypeClass.Bit.IsRotatingTurret, reg_output
%define UnitTypeClass.IsRotatingTurret.Set(ptr_type,value)                 ObjectTypeClass.SetBool                ptr_type, UnitTypeClass.Offset.IsRotatingTurret, UnitTypeClass.Bit.IsRotatingTurret, value
%define UnitTypeClass.IsRotatingTurret.Read(ptr_type,ptr_rules)            ObjectTypeClass.ReadBool               ptr_type, ptr_rules, UnitTypeClass.Offset.IsRotatingTurret, UnitTypeClass.Bit.IsRotatingTurret, str.UnitTypeClass.IsRotatingTurret

%define UnitTypeClass.IsFireAnim.Get(ptr_type,reg_output)                  ObjectTypeClass.GetBool                ptr_type, UnitTypeClass.Offset.IsFireAnim, UnitTypeClass.Bit.IsFireAnim, reg_output
%define UnitTypeClass.IsFireAnim.Set(ptr_type,value)                       ObjectTypeClass.SetBool                ptr_type, UnitTypeClass.Offset.IsFireAnim, UnitTypeClass.Bit.IsFireAnim, value
%define UnitTypeClass.IsFireAnim.Read(ptr_type,ptr_rules)                  ObjectTypeClass.ReadBool               ptr_type, ptr_rules, UnitTypeClass.Offset.IsFireAnim, UnitTypeClass.Bit.IsFireAnim, str.UnitTypeClass.IsFireAnim

%define UnitTypeClass.IsLockTurret.Get(ptr_type,reg_output)                ObjectTypeClass.GetBool                ptr_type, UnitTypeClass.Offset.IsLockTurret, UnitTypeClass.Bit.IsLockTurret, reg_output
%define UnitTypeClass.IsLockTurret.Set(ptr_type,value)                     ObjectTypeClass.SetBool                ptr_type, UnitTypeClass.Offset.IsLockTurret, UnitTypeClass.Bit.IsLockTurret, value
%define UnitTypeClass.IsLockTurret.Read(ptr_type,ptr_rules)                ObjectTypeClass.ReadBool               ptr_type, ptr_rules, UnitTypeClass.Offset.IsLockTurret, UnitTypeClass.Bit.IsLockTurret, str.UnitTypeClass.IsLockTurret

%define UnitTypeClass.IsGigundo.Get(ptr_type,reg_output)                   ObjectTypeClass.GetBool                ptr_type, UnitTypeClass.Offset.IsGigundo, UnitTypeClass.Bit.IsGigundo, reg_output
%define UnitTypeClass.IsGigundo.Set(ptr_type,value)                        ObjectTypeClass.SetBool                ptr_type, UnitTypeClass.Offset.IsGigundo, UnitTypeClass.Bit.IsGigundo, value
%define UnitTypeClass.IsGigundo.Read(ptr_type,ptr_rules)                   ObjectTypeClass.ReadBool               ptr_type, ptr_rules, UnitTypeClass.Offset.IsGigundo, UnitTypeClass.Bit.IsGigundo, str.UnitTypeClass.IsGigundo

%define UnitTypeClass.IsAnimating.Get(ptr_type,reg_output)                 ObjectTypeClass.GetBool                ptr_type, UnitTypeClass.Offset.IsAnimating, UnitTypeClass.Bit.IsAnimating, reg_output
%define UnitTypeClass.IsAnimating.Set(ptr_type,value)                      ObjectTypeClass.SetBool                ptr_type, UnitTypeClass.Offset.IsAnimating, UnitTypeClass.Bit.IsAnimating, value
%define UnitTypeClass.IsAnimating.Read(ptr_type,ptr_rules)                 ObjectTypeClass.ReadBool               ptr_type, ptr_rules, UnitTypeClass.Offset.IsAnimating, UnitTypeClass.Bit.IsAnimating, str.UnitTypeClass.IsAnimating

%define UnitTypeClass.IsJammer.Get(ptr_type,reg_output)                    ObjectTypeClass.GetBool                ptr_type, UnitTypeClass.Offset.IsJammer, UnitTypeClass.Bit.IsJammer, reg_output
%define UnitTypeClass.IsJammer.Set(ptr_type,value)                         ObjectTypeClass.SetBool                ptr_type, UnitTypeClass.Offset.IsJammer, UnitTypeClass.Bit.IsJammer, value
%define UnitTypeClass.IsJammer.Read(ptr_type,ptr_rules)                    ObjectTypeClass.ReadBool               ptr_type, ptr_rules, UnitTypeClass.Offset.IsJammer, UnitTypeClass.Bit.IsJammer, str.UnitTypeClass.IsJammer

%define UnitTypeClass.IsGapper.Get(ptr_type,reg_output)                    ObjectTypeClass.GetBool                ptr_type, UnitTypeClass.Offset.IsGapper, UnitTypeClass.Bit.IsGapper, reg_output
%define UnitTypeClass.IsGapper.Set(ptr_type,value)                         ObjectTypeClass.SetBool                ptr_type, UnitTypeClass.Offset.IsGapper, UnitTypeClass.Bit.IsGapper, value
%define UnitTypeClass.IsGapper.Read(ptr_type,ptr_rules)                    ObjectTypeClass.ReadBool               ptr_type, ptr_rules, UnitTypeClass.Offset.IsGapper, UnitTypeClass.Bit.IsGapper, str.UnitTypeClass.IsGapper

%define UnitTypeClass.IsNoFireWhileMoving.Get(ptr_type,reg_output)         ObjectTypeClass.GetBool                ptr_type, UnitTypeClass.Offset.IsNoFireWhileMoving, UnitTypeClass.Bit.IsNoFireWhileMoving, reg_output
%define UnitTypeClass.IsNoFireWhileMoving.Set(ptr_type,value)              ObjectTypeClass.SetBool                ptr_type, UnitTypeClass.Offset.IsNoFireWhileMoving, UnitTypeClass.Bit.IsNoFireWhileMoving, value
%define UnitTypeClass.IsNoFireWhileMoving.Read(ptr_type,ptr_rules)         ObjectTypeClass.ReadBool               ptr_type, ptr_rules, UnitTypeClass.Offset.IsNoFireWhileMoving, UnitTypeClass.Bit.IsNoFireWhileMoving, str.UnitTypeClass.IsNoFireWhileMoving

%define UnitTypeClass.IsNoSmoke.Get(ptr_type,reg_output)                    ObjectTypeClass.GetBool                ptr_type, UnitTypeClass.Offset.IsNoSmoke, UnitTypeClass.Bit.IsNoSmoke, reg_output
%define UnitTypeClass.IsNoSmoke.Set(ptr_type,value)                         ObjectTypeClass.SetBool                ptr_type, UnitTypeClass.Offset.IsNoSmoke, UnitTypeClass.Bit.IsNoSmoke, value
%define UnitTypeClass.IsNoSmoke.Read(ptr_type,ptr_rules)                    ObjectTypeClass.ReadBool               ptr_type, ptr_rules, UnitTypeClass.Offset.IsNoSmoke, UnitTypeClass.Bit.IsNoSmoke, str.UnitTypeClass.IsNoSmoke


%define UnitTypeClass.Type.Get(ptr_type,reg_output)                        ObjectTypeClass.GetInt                 ptr_type, UnitTypeClass.Offset.Type, reg_output
%define UnitTypeClass.Type.Set(ptr_type,value)                             ObjectTypeClass.SetInt                 ptr_type, UnitTypeClass.Offset.Type, value
%define UnitTypeClass.Type.Read(ptr_type,ptr_rules)                        ObjectTypeClass.ReadInt                ptr_type, ptr_rules, UnitTypeClass.Offset.Type, str.UnitTypeClass.Type

%define UnitTypeClass.TurretOffset.Get(ptr_type,reg_output)                ObjectTypeClass.GetByte                ptr_type, UnitTypeClass.Offset.TurretOffset, reg_output
%define UnitTypeClass.TurretOffset.Set(ptr_type,value)                     ObjectTypeClass.SetByte                ptr_type, UnitTypeClass.Offset.TurretOffset, value
%define UnitTypeClass.TurretOffset.Read(ptr_type,ptr_rules)                ObjectTypeClass.ReadByte               ptr_type, ptr_rules, UnitTypeClass.Offset.TurretOffset, str.UnitTypeClass.TurretOffset

%define UnitTypeClass.DefaultMission.Get(ptr_type,reg_output)              ObjectTypeClass.GetByte                ptr_type, UnitTypeClass.Offset.DefaultMission, reg_output
%define UnitTypeClass.DefaultMission.Set(ptr_type,value)                   ObjectTypeClass.SetByte                ptr_type, UnitTypeClass.Offset.DefaultMission, value
%define UnitTypeClass.DefaultMission.Read(ptr_type,ptr_rules)              ObjectTypeClass.ReadByte               ptr_type, ptr_rules, UnitTypeClass.Offset.DefaultMission, str.UnitTypeClass.DefaultMission

%define UnitTypeClass.Explosion.Get(ptr_type,reg_output)                   ObjectTypeClass.GetByte                ptr_type, UnitTypeClass.Offset.Explosion, reg_output
%define UnitTypeClass.Explosion.Set(ptr_type,value)                        ObjectTypeClass.SetByte                ptr_type, UnitTypeClass.Offset.Explosion, value
%define UnitTypeClass.Explosion.Read(ptr_type,ptr_rules)                   ObjectTypeClass.ReadByte               ptr_type, ptr_rules, UnitTypeClass.Offset.Explosion, str.UnitTypeClass.Explosion

%define UnitTypeClass.MaxSize.Get(ptr_type,reg_output)                     ObjectTypeClass.GetInt                 ptr_type, UnitTypeClass.Offset.MaxSize, reg_output
%define UnitTypeClass.MaxSize.Set(ptr_type,value)                          ObjectTypeClass.SetInt                 ptr_type, UnitTypeClass.Offset.MaxSize, value
%define UnitTypeClass.MaxSize.Read(ptr_type,ptr_rules)                     ObjectTypeClass.ReadInt                ptr_type, ptr_rules, UnitTypeClass.Offset.MaxSize, str.UnitTypeClass.MaxSize

%define UnitTypeClass.TurretAdjustX.Get(ptr_type,reg_output)               ObjectTypeClass.GetInt                 ptr_type, UnitTypeClass.Offset.TurretAdjustX, reg_output
%define UnitTypeClass.TurretAdjustX.Set(ptr_type,value)                    ObjectTypeClass.SetInt                 ptr_type, UnitTypeClass.Offset.TurretAdjustX, value
%define UnitTypeClass.TurretAdjustX.Read(ptr_type,ptr_rules)               ObjectTypeClass.ReadInt                ptr_type, ptr_rules, UnitTypeClass.Offset.TurretAdjustX, str.UnitTypeClass.TurretAdjustX

%define UnitTypeClass.TurretAdjustY.Get(ptr_type,reg_output)               ObjectTypeClass.GetInt                 ptr_type, UnitTypeClass.Offset.TurretAdjustY, reg_output
%define UnitTypeClass.TurretAdjustY.Set(ptr_type,value)                    ObjectTypeClass.SetInt                 ptr_type, UnitTypeClass.Offset.TurretAdjustY, value
%define UnitTypeClass.TurretAdjustY.Read(ptr_type,ptr_rules)               ObjectTypeClass.ReadInt                ptr_type, ptr_rules, UnitTypeClass.Offset.TurretAdjustY, str.UnitTypeClass.TurretAdjustY

%define UnitTypeClass.TurretFrameStart.Get(ptr_type,reg_output)            ObjectTypeClass.GetWord                ptr_type, UnitTypeClass.Offset.TurretFrameStart, reg_output
%define UnitTypeClass.TurretFrameStart.Set(ptr_type,value)                 ObjectTypeClass.SetWord                ptr_type, UnitTypeClass.Offset.TurretFrameStart, value
%define UnitTypeClass.TurretFrameStart.Read(ptr_type,ptr_rules)            ObjectTypeClass.ReadWord               ptr_type, ptr_rules, UnitTypeClass.Offset.TurretFrameStart, str.UnitTypeClass.TurretFrameStart

%define UnitTypeClass.TurretFrameCount.Get(ptr_type,reg_output)            ObjectTypeClass.GetWord                ptr_type, UnitTypeClass.Offset.TurretFrameCount, reg_output
%define UnitTypeClass.TurretFrameCount.Set(ptr_type,value)                 ObjectTypeClass.SetWord                ptr_type, UnitTypeClass.Offset.TurretFrameCount, value
%define UnitTypeClass.TurretFrameCount.Read(ptr_type,ptr_rules)            ObjectTypeClass.ReadWord               ptr_type, ptr_rules, UnitTypeClass.Offset.TurretFrameCount, str.UnitTypeClass.TurretFrameCount

%define UnitTypeClass.DeploysInto.Get(ptr_type,reg_output)                 ObjectTypeClass.GetByte                ptr_type, UnitTypeClass.Offset.DeploysInto, reg_output
%define UnitTypeClass.DeploysInto.Set(ptr_type,value)                      ObjectTypeClass.SetByte                ptr_type, UnitTypeClass.Offset.DeploysInto, value
%define UnitTypeClass.DeploysInto.Read(ptr_type,ptr_rules, function)       ObjectTypeClass.ReadStringToByteExt    ptr_type, ptr_rules, UnitTypeClass.Offset.DeploysInto, str.UnitTypeClass.DeploysInto, function

%define UnitTypeClass.AmmoReloadRate.Get(ptr_type,reg_output)                    ObjectTypeClass.GetInt                 ptr_type, UnitTypeClass.Offset.AmmoReloadRate, reg_output
%define UnitTypeClass.AmmoReloadRate.Set(ptr_type,value)                         ObjectTypeClass.SetInt                 ptr_type, UnitTypeClass.Offset.AmmoReloadRate, value
%define UnitTypeClass.AmmoReloadRate.Read(ptr_type,ptr_rules)                    ObjectTypeClass.ReadInt                ptr_type, ptr_rules, UnitTypeClass.Offset.AmmoReloadRate, str.UnitTypeClass.AmmoReloadRate

%define UnitTypeClass.AmmoReloadAmount.Get(ptr_type,reg_output)                  ObjectTypeClass.GetInt                 ptr_type, UnitTypeClass.Offset.AmmoReloadAmount, reg_output
%define UnitTypeClass.AmmoReloadAmount.Set(ptr_type,value)                       ObjectTypeClass.SetInt                 ptr_type, UnitTypeClass.Offset.AmmoReloadAmount, value
%define UnitTypeClass.AmmoReloadAmount.Read(ptr_type,ptr_rules)                  ObjectTypeClass.ReadInt                ptr_type, ptr_rules, UnitTypeClass.Offset.AmmoReloadAmount, str.UnitTypeClass.AmmoReloadAmount
