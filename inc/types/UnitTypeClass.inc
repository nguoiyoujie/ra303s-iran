;----------------------------------------------------------------
; inc/types/unittypeclass.asm
;
; Macros to access UnitTypeClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_UNITTYPECLASS
%define TYPES_UNITTYPECLASS

cextern UnitTypeClass.Count
cextern UnitTypeClass.Array

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
%define UnitTypeClass.Offset.IsWaterBound                  0x193    ; BOOL
%define UnitTypeClass.Bit.IsWaterBound                     5    
%define UnitTypeClass.Offset.Anim_HasAPCDoor               0x193    ; BOOL
%define UnitTypeClass.Bit.Anim_HasAPCDoor                  6   
%define UnitTypeClass.Offset.UsePrimaryColor               0x193    ; BOOL
%define UnitTypeClass.Bit.UsePrimaryColor                  7    
; 0x194 and 0x195 are empty...  
%define UnitTypeClass.Offset.Type                          0x196    ; byte
%define UnitTypeClass.Offset.TurretOffset                  0x197    ; byte
%define UnitTypeClass.Offset.DefaultMission                0x198    ; byte
%define UnitTypeClass.Offset.Explosion                     0x199    ; byte
%define UnitTypeClass.Offset.MaxSize                       0x19A    ; INT

; Extended space (>= 0x19E)
; Common space for UnitTypeClass and VesselTypeClass (pseudo-DriveClass)
%define UnitTypeClass.Offset.ExtendedPrerequisite          0x19E    ; INTx8
%define UnitTypeClass.Offset.AmmoReloadRate                0x21E    ; INT
%define UnitTypeClass.Offset.AmmoReloadAmount              0x222    ; INT
%define UnitTypeClass.Offset.Response_Select               0x226    ; INT
%define UnitTypeClass.Offset.Response_Select_Data          0x22A    ; word x16
%define UnitTypeClass.Offset.Response_Move                 0x24A    ; INT
%define UnitTypeClass.Offset.Response_Move_Data            0x24E    ; word x16
%define UnitTypeClass.Offset.Response_Attack               0x26E    ; INT
%define UnitTypeClass.Offset.Response_Attack_Data          0x272    ; word x16
%define UnitTypeClass.Offset.Response_Harvest              0x292    ; INT
%define UnitTypeClass.Offset.Response_Harvest_Data         0x296    ; word x16
%define UnitTypeClass.Offset.Response_Enter                0x2B6    ; INT
%define UnitTypeClass.Offset.Response_Enter_Data           0x2BA    ; word x16
%define UnitTypeClass.Offset.Response_Deploy               0x2DA    ; INT
%define UnitTypeClass.Offset.Response_Deploy_Data          0x2DE    ; word x16
;0x2FE
; unique space
%define UnitTypeClass.Offset.TurretAdjustX                 0x2FE    ; INT
%define UnitTypeClass.Offset.TurretAdjustY                 0x302    ; INT
%define UnitTypeClass.Offset.TurretFrameStart              0x306    ; word
%define UnitTypeClass.Offset.TurretFrameCount              0x308    ; word
%define UnitTypeClass.Offset.DeploysInto                   0x30A    ; byte
%define UnitTypeClass.Offset.AmmoImageCount                0x30B    ; byte
%define UnitTypeClass.Offset.AmmoTurretCount               0x30C    ; byte
;0x30D

%define UnitTypeClass.Offset.AIBuildLimit                  0x30E    ; INT
%define UnitTypeClass.Offset.AIBuildWeight                 0x312    ; INT
;0x316

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
str.UnitTypeClass.IsWaterBound                  db"WaterBound",0                  ;new ini feature
str.UnitTypeClass.Anim_HasAPCDoor               db"HasAPCDoor",0                  ;new ini feature
str.UnitTypeClass.UsePrimaryColor               db"UsePrimaryColor",0             ;new ini feature
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
str.UnitTypeClass.Response_Select               db"ResponseSelect",0              ;new ini feature
str.UnitTypeClass.Response_Move                 db"ResponseMove",0                ;new ini feature
str.UnitTypeClass.Response_Attack               db"ResponseAttack",0              ;new ini feature
str.UnitTypeClass.Response_Harvest              db"ResponseHarvest",0             ;new ini feature
str.UnitTypeClass.Response_Enter                db"ResponseEnter",0               ;new ini feature
str.UnitTypeClass.Response_Deploy               db"ResponseDeploy",0              ;new ini feature
str.UnitTypeClass.AmmoReloadRate                db"AmmoReloadRate",0              ;new ini feature
str.UnitTypeClass.AmmoReloadAmount              db"AmmoReloadAmount",0            ;new ini feature
str.UnitTypeClass.AmmoImageCount                db"AmmoImageCount",0              ;new ini feature
str.UnitTypeClass.AmmoTurretCount               db"AmmoTurretCount",0             ;new ini feature

str.UnitTypeClass.AIBuildLimit                  db"AIBuildLimit",0         
str.UnitTypeClass.AIBuildWeight                 db"AIBuildWeight",0     

%define UnitTypeClass.FromIndex(d_index,reg_output)                        AbstractTypeClass.FromIndex              d_index, UnitTypeClass.Count, UnitTypeClass.Array, reg_output
%define UnitTypeClass.FromID(d_index,reg_output)                           AbstractTypeClass.FromID                 d_index, UnitTypeClass.Count, UnitTypeClass.Array, reg_output

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

%define UnitTypeClass.IsCrateGoodie.Get(ptr_type,reg_output)               GetBool                                ptr_type, UnitTypeClass.Offset.IsCrateGoodie, UnitTypeClass.Bit.IsCrateGoodie, reg_output
%define UnitTypeClass.IsCrateGoodie.Set(ptr_type,value)                    SetBool                                ptr_type, UnitTypeClass.Offset.IsCrateGoodie, UnitTypeClass.Bit.IsCrateGoodie, value
%define UnitTypeClass.IsCrateGoodie.Read(ptr_type,ptr_rules)               AbstractTypeClass.ReadBool             ptr_type, ptr_rules, UnitTypeClass.Offset.IsCrateGoodie, UnitTypeClass.Bit.IsCrateGoodie, str.UnitTypeClass.IsCrateGoodie

%define UnitTypeClass.Crusher.Get(ptr_type,reg_output)                     GetBool                                ptr_type, UnitTypeClass.Offset.Crusher, UnitTypeClass.Bit.Crusher, reg_output
%define UnitTypeClass.Crusher.Set(ptr_type,value)                          SetBool                                ptr_type, UnitTypeClass.Offset.Crusher, UnitTypeClass.Bit.Crusher, value
%define UnitTypeClass.Crusher.Read(ptr_type,ptr_rules)                     AbstractTypeClass.ReadBool             ptr_type, ptr_rules, UnitTypeClass.Offset.Crusher, UnitTypeClass.Bit.Crusher, str.UnitTypeClass.Crusher

%define UnitTypeClass.IsToHarvest.Get(ptr_type,reg_output)                 GetBool                                ptr_type, UnitTypeClass.Offset.IsToHarvest, UnitTypeClass.Bit.IsToHarvest, reg_output
%define UnitTypeClass.IsToHarvest.Set(ptr_type,value)                      SetBool                                ptr_type, UnitTypeClass.Offset.IsToHarvest, UnitTypeClass.Bit.IsToHarvest, value
%define UnitTypeClass.IsToHarvest.Read(ptr_type,ptr_rules)                 AbstractTypeClass.ReadBool             ptr_type, ptr_rules, UnitTypeClass.Offset.IsToHarvest, UnitTypeClass.Bit.IsToHarvest, str.UnitTypeClass.IsToHarvest

%define UnitTypeClass.IsRotatingTurret.Get(ptr_type,reg_output)            GetBool                                ptr_type, UnitTypeClass.Offset.IsRotatingTurret, UnitTypeClass.Bit.IsRotatingTurret, reg_output
%define UnitTypeClass.IsRotatingTurret.Set(ptr_type,value)                 SetBool                                ptr_type, UnitTypeClass.Offset.IsRotatingTurret, UnitTypeClass.Bit.IsRotatingTurret, value
%define UnitTypeClass.IsRotatingTurret.Read(ptr_type,ptr_rules)            AbstractTypeClass.ReadBool             ptr_type, ptr_rules, UnitTypeClass.Offset.IsRotatingTurret, UnitTypeClass.Bit.IsRotatingTurret, str.UnitTypeClass.IsRotatingTurret

%define UnitTypeClass.IsFireAnim.Get(ptr_type,reg_output)                  GetBool                                ptr_type, UnitTypeClass.Offset.IsFireAnim, UnitTypeClass.Bit.IsFireAnim, reg_output
%define UnitTypeClass.IsFireAnim.Set(ptr_type,value)                       SetBool                                ptr_type, UnitTypeClass.Offset.IsFireAnim, UnitTypeClass.Bit.IsFireAnim, value
%define UnitTypeClass.IsFireAnim.Read(ptr_type,ptr_rules)                  AbstractTypeClass.ReadBool             ptr_type, ptr_rules, UnitTypeClass.Offset.IsFireAnim, UnitTypeClass.Bit.IsFireAnim, str.UnitTypeClass.IsFireAnim

%define UnitTypeClass.IsLockTurret.Get(ptr_type,reg_output)                GetBool                                ptr_type, UnitTypeClass.Offset.IsLockTurret, UnitTypeClass.Bit.IsLockTurret, reg_output
%define UnitTypeClass.IsLockTurret.Set(ptr_type,value)                     SetBool                                ptr_type, UnitTypeClass.Offset.IsLockTurret, UnitTypeClass.Bit.IsLockTurret, value
%define UnitTypeClass.IsLockTurret.Read(ptr_type,ptr_rules)                AbstractTypeClass.ReadBool             ptr_type, ptr_rules, UnitTypeClass.Offset.IsLockTurret, UnitTypeClass.Bit.IsLockTurret, str.UnitTypeClass.IsLockTurret

%define UnitTypeClass.IsGigundo.Get(ptr_type,reg_output)                   GetBool                                ptr_type, UnitTypeClass.Offset.IsGigundo, UnitTypeClass.Bit.IsGigundo, reg_output
%define UnitTypeClass.IsGigundo.Set(ptr_type,value)                        SetBool                                ptr_type, UnitTypeClass.Offset.IsGigundo, UnitTypeClass.Bit.IsGigundo, value
%define UnitTypeClass.IsGigundo.Read(ptr_type,ptr_rules)                   AbstractTypeClass.ReadBool             ptr_type, ptr_rules, UnitTypeClass.Offset.IsGigundo, UnitTypeClass.Bit.IsGigundo, str.UnitTypeClass.IsGigundo

%define UnitTypeClass.IsAnimating.Get(ptr_type,reg_output)                 GetBool                                ptr_type, UnitTypeClass.Offset.IsAnimating, UnitTypeClass.Bit.IsAnimating, reg_output
%define UnitTypeClass.IsAnimating.Set(ptr_type,value)                      SetBool                                ptr_type, UnitTypeClass.Offset.IsAnimating, UnitTypeClass.Bit.IsAnimating, value
%define UnitTypeClass.IsAnimating.Read(ptr_type,ptr_rules)                 AbstractTypeClass.ReadBool             ptr_type, ptr_rules, UnitTypeClass.Offset.IsAnimating, UnitTypeClass.Bit.IsAnimating, str.UnitTypeClass.IsAnimating

%define UnitTypeClass.IsJammer.Get(ptr_type,reg_output)                    GetBool                                ptr_type, UnitTypeClass.Offset.IsJammer, UnitTypeClass.Bit.IsJammer, reg_output
%define UnitTypeClass.IsJammer.Set(ptr_type,value)                         SetBool                                ptr_type, UnitTypeClass.Offset.IsJammer, UnitTypeClass.Bit.IsJammer, value
%define UnitTypeClass.IsJammer.Read(ptr_type,ptr_rules)                    AbstractTypeClass.ReadBool             ptr_type, ptr_rules, UnitTypeClass.Offset.IsJammer, UnitTypeClass.Bit.IsJammer, str.UnitTypeClass.IsJammer

%define UnitTypeClass.IsGapper.Get(ptr_type,reg_output)                    GetBool                                ptr_type, UnitTypeClass.Offset.IsGapper, UnitTypeClass.Bit.IsGapper, reg_output
%define UnitTypeClass.IsGapper.Set(ptr_type,value)                         SetBool                                ptr_type, UnitTypeClass.Offset.IsGapper, UnitTypeClass.Bit.IsGapper, value
%define UnitTypeClass.IsGapper.Read(ptr_type,ptr_rules)                    AbstractTypeClass.ReadBool             ptr_type, ptr_rules, UnitTypeClass.Offset.IsGapper, UnitTypeClass.Bit.IsGapper, str.UnitTypeClass.IsGapper

%define UnitTypeClass.IsNoFireWhileMoving.Get(ptr_type,reg_output)         GetBool                                ptr_type, UnitTypeClass.Offset.IsNoFireWhileMoving, UnitTypeClass.Bit.IsNoFireWhileMoving, reg_output
%define UnitTypeClass.IsNoFireWhileMoving.Set(ptr_type,value)              SetBool                                ptr_type, UnitTypeClass.Offset.IsNoFireWhileMoving, UnitTypeClass.Bit.IsNoFireWhileMoving, value
%define UnitTypeClass.IsNoFireWhileMoving.Read(ptr_type,ptr_rules)         AbstractTypeClass.ReadBool             ptr_type, ptr_rules, UnitTypeClass.Offset.IsNoFireWhileMoving, UnitTypeClass.Bit.IsNoFireWhileMoving, str.UnitTypeClass.IsNoFireWhileMoving

%define UnitTypeClass.IsNoSmoke.Get(ptr_type,reg_output)                   GetBool                                ptr_type, UnitTypeClass.Offset.IsNoSmoke, UnitTypeClass.Bit.IsNoSmoke, reg_output
%define UnitTypeClass.IsNoSmoke.Set(ptr_type,value)                        SetBool                                ptr_type, UnitTypeClass.Offset.IsNoSmoke, UnitTypeClass.Bit.IsNoSmoke, value
%define UnitTypeClass.IsNoSmoke.Read(ptr_type,ptr_rules)                   AbstractTypeClass.ReadBool             ptr_type, ptr_rules, UnitTypeClass.Offset.IsNoSmoke, UnitTypeClass.Bit.IsNoSmoke, str.UnitTypeClass.IsNoSmoke

%define UnitTypeClass.IsWaterBound.Get(ptr_type,reg_output)                GetBool                                ptr_type, UnitTypeClass.Offset.IsWaterBound, UnitTypeClass.Bit.IsWaterBound, reg_output
%define UnitTypeClass.IsWaterBound.Set(ptr_type,value)                     SetBool                                ptr_type, UnitTypeClass.Offset.IsWaterBound, UnitTypeClass.Bit.IsWaterBound, value
%define UnitTypeClass.IsWaterBound.Read(ptr_type,ptr_rules)                AbstractTypeClass.ReadBool             ptr_type, ptr_rules, UnitTypeClass.Offset.IsWaterBound, UnitTypeClass.Bit.IsWaterBound, str.UnitTypeClass.IsWaterBound

%define UnitTypeClass.Anim_HasAPCDoor.Get(ptr_type,reg_output)             GetBool                                ptr_type, UnitTypeClass.Offset.Anim_HasAPCDoor, UnitTypeClass.Bit.Anim_HasAPCDoor, reg_output
%define UnitTypeClass.Anim_HasAPCDoor.Set(ptr_type,value)                  SetBool                                ptr_type, UnitTypeClass.Offset.Anim_HasAPCDoor, UnitTypeClass.Bit.Anim_HasAPCDoor, value
%define UnitTypeClass.Anim_HasAPCDoor.Read(ptr_type,ptr_rules)             AbstractTypeClass.ReadBool             ptr_type, ptr_rules, UnitTypeClass.Offset.Anim_HasAPCDoor, UnitTypeClass.Bit.Anim_HasAPCDoor, str.UnitTypeClass.Anim_HasAPCDoor

%define UnitTypeClass.UsePrimaryColor.Get(ptr_type,reg_output)             GetBool                                ptr_type, UnitTypeClass.Offset.UsePrimaryColor, UnitTypeClass.Bit.UsePrimaryColor, reg_output
%define UnitTypeClass.UsePrimaryColor.Set(ptr_type,value)                  SetBool                                ptr_type, UnitTypeClass.Offset.UsePrimaryColor, UnitTypeClass.Bit.UsePrimaryColor, value
%define UnitTypeClass.UsePrimaryColor.Read(ptr_type,ptr_rules)             AbstractTypeClass.ReadBool             ptr_type, ptr_rules, UnitTypeClass.Offset.UsePrimaryColor, UnitTypeClass.Bit.UsePrimaryColor, str.UnitTypeClass.UsePrimaryColor

%define UnitTypeClass.Type.Get(ptr_type,reg_output)                        GetInt                                 ptr_type, UnitTypeClass.Offset.Type, reg_output
%define UnitTypeClass.Type.Set(ptr_type,value)                             SetInt                                 ptr_type, UnitTypeClass.Offset.Type, value
%define UnitTypeClass.Type.Read(ptr_type,ptr_rules)                        AbstractTypeClass.ReadInt              ptr_type, ptr_rules, UnitTypeClass.Offset.Type, str.UnitTypeClass.Type

%define UnitTypeClass.TurretOffset.Get(ptr_type,reg_output)                GetByte                                ptr_type, UnitTypeClass.Offset.TurretOffset, reg_output
%define UnitTypeClass.TurretOffset.Set(ptr_type,value)                     SetByte                                ptr_type, UnitTypeClass.Offset.TurretOffset, value
%define UnitTypeClass.TurretOffset.Read(ptr_type,ptr_rules)                AbstractTypeClass.ReadByte             ptr_type, ptr_rules, UnitTypeClass.Offset.TurretOffset, str.UnitTypeClass.TurretOffset

%define UnitTypeClass.DefaultMission.Get(ptr_type,reg_output)              GetByte                                ptr_type, UnitTypeClass.Offset.DefaultMission, reg_output
%define UnitTypeClass.DefaultMission.Set(ptr_type,value)                   SetByte                                ptr_type, UnitTypeClass.Offset.DefaultMission, value
%define UnitTypeClass.DefaultMission.Read(ptr_type,ptr_rules)              AbstractTypeClass.ReadByte             ptr_type, ptr_rules, UnitTypeClass.Offset.DefaultMission, str.UnitTypeClass.DefaultMission

%define UnitTypeClass.Explosion.Get(ptr_type,reg_output)                   GetByte                                ptr_type, UnitTypeClass.Offset.Explosion, reg_output
%define UnitTypeClass.Explosion.Set(ptr_type,value)                        SetByte                                ptr_type, UnitTypeClass.Offset.Explosion, value
%define UnitTypeClass.Explosion.Read(ptr_type,ptr_rules)                   AbstractTypeClass.ReadByte             ptr_type, ptr_rules, UnitTypeClass.Offset.Explosion, str.UnitTypeClass.Explosion

%define UnitTypeClass.MaxSize.Get(ptr_type,reg_output)                     GetInt                                 ptr_type, UnitTypeClass.Offset.MaxSize, reg_output
%define UnitTypeClass.MaxSize.Set(ptr_type,value)                          SetInt                                 ptr_type, UnitTypeClass.Offset.MaxSize, value
%define UnitTypeClass.MaxSize.Read(ptr_type,ptr_rules)                     AbstractTypeClass.ReadInt              ptr_type, ptr_rules, UnitTypeClass.Offset.MaxSize, str.UnitTypeClass.MaxSize

%define UnitTypeClass.TurretAdjustX.Get(ptr_type,reg_output)               GetInt                                 ptr_type, UnitTypeClass.Offset.TurretAdjustX, reg_output
%define UnitTypeClass.TurretAdjustX.Set(ptr_type,value)                    SetInt                                 ptr_type, UnitTypeClass.Offset.TurretAdjustX, value
%define UnitTypeClass.TurretAdjustX.Read(ptr_type,ptr_rules)               AbstractTypeClass.ReadInt              ptr_type, ptr_rules, UnitTypeClass.Offset.TurretAdjustX, str.UnitTypeClass.TurretAdjustX

%define UnitTypeClass.TurretAdjustY.Get(ptr_type,reg_output)               GetInt                                 ptr_type, UnitTypeClass.Offset.TurretAdjustY, reg_output
%define UnitTypeClass.TurretAdjustY.Set(ptr_type,value)                    SetInt                                 ptr_type, UnitTypeClass.Offset.TurretAdjustY, value
%define UnitTypeClass.TurretAdjustY.Read(ptr_type,ptr_rules)               AbstractTypeClass.ReadInt              ptr_type, ptr_rules, UnitTypeClass.Offset.TurretAdjustY, str.UnitTypeClass.TurretAdjustY

%define UnitTypeClass.TurretFrameStart.Get(ptr_type,reg_output)            GetWord                                ptr_type, UnitTypeClass.Offset.TurretFrameStart, reg_output
%define UnitTypeClass.TurretFrameStart.Set(ptr_type,value)                 SetWord                                ptr_type, UnitTypeClass.Offset.TurretFrameStart, value
%define UnitTypeClass.TurretFrameStart.Read(ptr_type,ptr_rules)            AbstractTypeClass.ReadWord             ptr_type, ptr_rules, UnitTypeClass.Offset.TurretFrameStart, str.UnitTypeClass.TurretFrameStart

%define UnitTypeClass.TurretFrameCount.Get(ptr_type,reg_output)            GetWord                                ptr_type, UnitTypeClass.Offset.TurretFrameCount, reg_output
%define UnitTypeClass.TurretFrameCount.Set(ptr_type,value)                 SetWord                                ptr_type, UnitTypeClass.Offset.TurretFrameCount, value
%define UnitTypeClass.TurretFrameCount.Read(ptr_type,ptr_rules)            AbstractTypeClass.ReadWord             ptr_type, ptr_rules, UnitTypeClass.Offset.TurretFrameCount, str.UnitTypeClass.TurretFrameCount

%define UnitTypeClass.DeploysInto.Get(ptr_type,reg_output)                 GetByte                                ptr_type, UnitTypeClass.Offset.DeploysInto, reg_output
%define UnitTypeClass.DeploysInto.Set(ptr_type,value)                      SetByte                                ptr_type, UnitTypeClass.Offset.DeploysInto, value
%define UnitTypeClass.DeploysInto.Read(ptr_type,ptr_rules, function)       AbstractTypeClass.ReadStringToByteExt  ptr_type, ptr_rules, UnitTypeClass.Offset.DeploysInto, str.UnitTypeClass.DeploysInto, function

%define UnitTypeClass.AmmoReloadRate.Get(ptr_type,reg_output)              GetInt                                 ptr_type, UnitTypeClass.Offset.AmmoReloadRate, reg_output
%define UnitTypeClass.AmmoReloadRate.Set(ptr_type,value)                   SetInt                                 ptr_type, UnitTypeClass.Offset.AmmoReloadRate, value
%define UnitTypeClass.AmmoReloadRate.Read(ptr_type,ptr_rules)              AbstractTypeClass.ReadInt              ptr_type, ptr_rules, UnitTypeClass.Offset.AmmoReloadRate, str.UnitTypeClass.AmmoReloadRate

%define UnitTypeClass.AmmoReloadAmount.Get(ptr_type,reg_output)            GetInt                                 ptr_type, UnitTypeClass.Offset.AmmoReloadAmount, reg_output
%define UnitTypeClass.AmmoReloadAmount.Set(ptr_type,value)                 SetInt                                 ptr_type, UnitTypeClass.Offset.AmmoReloadAmount, value
%define UnitTypeClass.AmmoReloadAmount.Read(ptr_type,ptr_rules)            AbstractTypeClass.ReadInt              ptr_type, ptr_rules, UnitTypeClass.Offset.AmmoReloadAmount, str.UnitTypeClass.AmmoReloadAmount

%define UnitTypeClass.Response_Select.Get(ptr_type,reg_output)             GetInt                                 ptr_type, UnitTypeClass.Offset.Response_Select, reg_output
%define UnitTypeClass.Response_Select_Data.Get(ptr_type,reg_output)        GetWord                                ptr_type, UnitTypeClass.Offset.Response_Select_Data, reg_output
%define UnitTypeClass.Response_Select.Read(ptr_type,ptr_rules,function)    AbstractTypeClass.ReadStringExt        ptr_type, ptr_rules, UnitTypeClass.Offset.Response_Select, str.UnitTypeClass.Response_Select, function

%define UnitTypeClass.Response_Move.Get(ptr_type,reg_output)               GetInt                                 ptr_type, UnitTypeClass.Offset.Response_Move, reg_output
%define UnitTypeClass.Response_Move_Data.Get(ptr_type,reg_output)          GetWord                                ptr_type, UnitTypeClass.Offset.Response_Move_Data, reg_output
%define UnitTypeClass.Response_Move.Read(ptr_type,ptr_rules,function)      AbstractTypeClass.ReadStringExt        ptr_type, ptr_rules, UnitTypeClass.Offset.Response_Move, str.UnitTypeClass.Response_Move, function

%define UnitTypeClass.Response_Attack.Get(ptr_type,reg_output)             GetInt                                 ptr_type, UnitTypeClass.Offset.Response_Attack, reg_output
%define UnitTypeClass.Response_Attack_Data.Get(ptr_type,reg_output)        GetWord                                ptr_type, UnitTypeClass.Offset.Response_Attack_Data, reg_output
%define UnitTypeClass.Response_Attack.Read(ptr_type,ptr_rules,function)    AbstractTypeClass.ReadStringExt        ptr_type, ptr_rules, UnitTypeClass.Offset.Response_Attack, str.UnitTypeClass.Response_Attack, function

%define UnitTypeClass.Response_Harvest.Get(ptr_type,reg_output)            GetInt                                 ptr_type, UnitTypeClass.Offset.Response_Harvest, reg_output
%define UnitTypeClass.Response_Harvest_Data.Get(ptr_type,reg_output)       GetWord                                ptr_type, UnitTypeClass.Offset.Response_Harvest_Data, reg_output
%define UnitTypeClass.Response_Harvest.Read(ptr_type,ptr_rules,function)   AbstractTypeClass.ReadStringExt        ptr_type, ptr_rules, UnitTypeClass.Offset.Response_Harvest, str.UnitTypeClass.Response_Harvest, function

%define UnitTypeClass.Response_Enter.Get(ptr_type,reg_output)              GetInt                                 ptr_type, UnitTypeClass.Offset.Response_Enter, reg_output
%define UnitTypeClass.Response_Enter_Data.Get(ptr_type,reg_output)         GetWord                                ptr_type, UnitTypeClass.Offset.Response_Enter_Data, reg_output
%define UnitTypeClass.Response_Enter.Read(ptr_type,ptr_rules,function)     AbstractTypeClass.ReadStringExt        ptr_type, ptr_rules, UnitTypeClass.Offset.Response_Enter, str.UnitTypeClass.Response_Enter, function

%define UnitTypeClass.Response_Deploy.Get(ptr_type,reg_output)             GetInt                                 ptr_type, UnitTypeClass.Offset.Response_Deploy, reg_output
%define UnitTypeClass.Response_Deploy_Data.Get(ptr_type,reg_output)        GetWord                                ptr_type, UnitTypeClass.Offset.Response_Deploy_Data, reg_output
%define UnitTypeClass.Response_Deploy.Read(ptr_type,ptr_rules,function)    AbstractTypeClass.ReadStringExt        ptr_type, ptr_rules, UnitTypeClass.Offset.Response_Deploy, str.UnitTypeClass.Response_Deploy, function

%define UnitTypeClass.AmmoImageCount.Get(ptr_type,reg_output)              GetByte                                ptr_type, UnitTypeClass.Offset.AmmoImageCount, reg_output
%define UnitTypeClass.AmmoImageCount.Set(ptr_type,value)                   SetByte                                ptr_type, UnitTypeClass.Offset.AmmoImageCount, value
%define UnitTypeClass.AmmoImageCount.Read(ptr_type,ptr_rules)              AbstractTypeClass.ReadByte             ptr_type, ptr_rules, UnitTypeClass.Offset.AmmoImageCount, str.UnitTypeClass.AmmoImageCount

%define UnitTypeClass.AmmoTurretCount.Get(ptr_type,reg_output)             GetByte                                ptr_type, UnitTypeClass.Offset.AmmoTurretCount, reg_output
%define UnitTypeClass.AmmoTurretCount.Set(ptr_type,value)                  SetByte                                ptr_type, UnitTypeClass.Offset.AmmoTurretCount, value
%define UnitTypeClass.AmmoTurretCount.Read(ptr_type,ptr_rules)             AbstractTypeClass.ReadByte             ptr_type, ptr_rules, UnitTypeClass.Offset.AmmoTurretCount, str.UnitTypeClass.AmmoTurretCount

%define UnitTypeClass.AIBuildLimit.Get(ptr_type,reg_output)                GetInt                                 ptr_type, UnitTypeClass.Offset.AIBuildLimit, reg_output
%define UnitTypeClass.AIBuildLimit.Set(ptr_type,value)                     SetInt                                 ptr_type, UnitTypeClass.Offset.AIBuildLimit, value
%define UnitTypeClass.AIBuildLimit.Read(ptr_type,ptr_rules)                AbstractTypeClass.ReadInt              ptr_type, ptr_rules, UnitTypeClass.Offset.AIBuildLimit, str.UnitTypeClass.AIBuildLimit

%define UnitTypeClass.AIBuildWeight.Get(ptr_type,reg_output)               GetInt                                 ptr_type, UnitTypeClass.Offset.AIBuildWeight, reg_output
%define UnitTypeClass.AIBuildWeight.Set(ptr_type,value)                    SetInt                                 ptr_type, UnitTypeClass.Offset.AIBuildWeight, value
%define UnitTypeClass.AIBuildWeight.Read(ptr_type,ptr_rules)               AbstractTypeClass.ReadInt              ptr_type, ptr_rules, UnitTypeClass.Offset.AIBuildWeight, str.UnitTypeClass.AIBuildWeight
	
%endif
