;----------------------------------------------------------------
; inc/types/buildingtypeclass.asm
;
; Macros to access BuildingTypeClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_BUILDINGTYPECLASS
%define TYPES_BUILDINGTYPECLASS

cextern BuildingTypeClass.Count
cextern BuildingTypeClass.Array

%define        BSIZE_11    0
%define        BSIZE_21    1
%define        BSIZE_12    2
%define        BSIZE_22    3
%define        BSIZE_23    4
%define        BSIZE_32    5
%define        BSIZE_33    6
%define        BSIZE_42    7
%define        BSIZE_55    8

; define building type field definitions
%define BuildingTypeClass.Offset.IsBase                    0x192    ; BOOL // Already supported by game INI
%define BuildingTypeClass.Bit.IsBase                       1    
%define BuildingTypeClass.Offset.IsFake                    0x192    ; BOOL
%define BuildingTypeClass.Bit.IsFake                       2    
%define BuildingTypeClass.Offset.IsBibbed                  0x192    ; BOOL // Already supported by game INI
%define BuildingTypeClass.Bit.IsBibbed                     3    
%define BuildingTypeClass.Offset.IsWall                    0x192    ; BOOL
%define BuildingTypeClass.Bit.IsWall                       4    
%define BuildingTypeClass.Offset.IsSimpleDamage            0x192    ; BOOL
%define BuildingTypeClass.Bit.IsSimpleDamage               5    
%define BuildingTypeClass.Offset.IsCaptureable             0x192    ; BOOL // Already supported by game INI
%define BuildingTypeClass.Bit.IsCaptureable                6    
%define BuildingTypeClass.Offset.IsRegulated               0x192    ; BOOL
%define BuildingTypeClass.Bit.IsRegulated                  7    
%define BuildingTypeClass.Offset.IsPowered                 0x192    ; BOOL // Already supported by game INI
%define BuildingTypeClass.Bit.IsPowered                    8    
%define BuildingTypeClass.Offset.IsUnsellable              0x193    ; BOOL // Already supported by game INI
%define BuildingTypeClass.Bit.IsUnsellable                 1

;added
%define BuildingTypeClass.Offset.IsJammable                0x193    ; BOOL // 
%define BuildingTypeClass.Bit.IsJammable                   2
%define BuildingTypeClass.Offset.IsRadar                   0x193    ; BOOL // 
%define BuildingTypeClass.Bit.IsRadar                      3
%define BuildingTypeClass.Offset.IsRefinery                0x193    ; BOOL // 
%define BuildingTypeClass.Bit.IsRefinery                   4
%define BuildingTypeClass.Offset.IsSilo                    0x193    ; BOOL // 
%define BuildingTypeClass.Bit.IsSilo                       5
%define BuildingTypeClass.Offset.IsKennel                  0x193    ; BOOL // 
%define BuildingTypeClass.Bit.IsKennel                     6
%define BuildingTypeClass.Offset.IsAirfield                0x193    ; BOOL // 
%define BuildingTypeClass.Bit.IsAirfield                   7
%define BuildingTypeClass.Offset.IsHelipad                 0x193    ; BOOL // 
%define BuildingTypeClass.Bit.IsHelipad                    8
%define BuildingTypeClass.Offset.IsRepairPad               0x194    ; BOOL // 
%define BuildingTypeClass.Bit.IsRepairPad                  1


%define BuildingTypeClass.Offset.FoundationFace            0x196    ; byte, FacingType (-1)-7
%define BuildingTypeClass.Offset.Adjacent                  0x197    ; INT
%define BuildingTypeClass.Offset.FactoryType               0x19B    ; byte, AIRCRAFT_TYPE=2, BUILDING_TYPE=6, INFANTRY_TYPE=14, UNIT_TYPE=29, VESSEL_TYPE=31
%define BuildingTypeClass.Offset.ExitCoordX                0x19C    ; word
%define BuildingTypeClass.Offset.ExitCoordY                0x19E    ; word
%define BuildingTypeClass.Offset.ExitList                  0x1A0    ; INT PTR to word*
%define BuildingTypeClass.Offset.Type                      0x1A4    ; byte
%define BuildingTypeClass.Offset.StartFace                 0x1A5    ; byte, DirType 0-255
%define BuildingTypeClass.Offset.Capacity                  0x1A6    ; INT
%define BuildingTypeClass.Offset.Power                     0x1AA    ; INT
%define BuildingTypeClass.Offset.Drain                     0x1AE    ; INT
%define BuildingTypeClass.Offset.BSize                     0x1B2    ; byte, BSizeType 0-8, BSIZE_11, BSIZE_21, BSIZE_12, BSIZE_22, BSIZE_23, BSIZE_32, BSIZE_33, BSIZE_42, BSIZE_55 
%define BuildingTypeClass.Offset.Anim_Construct_Start      0x1B3    ; INT
%define BuildingTypeClass.Offset.Anim_Construct_Count      0x1B7    ; INT
%define BuildingTypeClass.Offset.Anim_Construct_Rate       0x1BB    ; INT
%define BuildingTypeClass.Offset.Anim_Idle_Start           0x1BF    ; INT
%define BuildingTypeClass.Offset.Anim_Idle_Count           0x1C3    ; INT
%define BuildingTypeClass.Offset.Anim_Idle_Rate            0x1C7    ; INT
%define BuildingTypeClass.Offset.Anim_Active_Start         0x1CB    ; INT
%define BuildingTypeClass.Offset.Anim_Active_Count         0x1CF    ; INT
%define BuildingTypeClass.Offset.Anim_Active_Rate          0x1D3    ; INT
%define BuildingTypeClass.Offset.Anim_Full_Start           0x1D7    ; INT
%define BuildingTypeClass.Offset.Anim_Full_Count           0x1DB    ; INT
%define BuildingTypeClass.Offset.Anim_Full_Rate            0x1DF    ; INT
%define BuildingTypeClass.Offset.Anim_Aux1_Start           0x1E3    ; INT
%define BuildingTypeClass.Offset.Anim_Aux1_Count           0x1E7    ; INT
%define BuildingTypeClass.Offset.Anim_Aux1_Rate            0x1EB    ; INT
%define BuildingTypeClass.Offset.Anim_Aux2_Start           0x1EF    ; INT
%define BuildingTypeClass.Offset.Anim_Aux2_Count           0x1F3    ; INT
%define BuildingTypeClass.Offset.Anim_Aux2_Rate            0x1F7    ; INT
%define BuildingTypeClass.Offset.OccupyList                0x1FB    ; INT PTR to word*
%define BuildingTypeClass.Offset.OverlapList               0x1FF    ; INT PTR to word*
%define BuildingTypeClass.Offset.BuildupData               0x203    ; INT PTR to FUNC

; Extended space (>= 0x207)
%define BuildingTypeClass.Offset.ExtendedPrerequisite      0x207    ; INTx8
%define BuildingTypeClass.Offset.WarFactoryOverlayAnim     0x227    ; INT PTR
%define BuildingTypeClass.Offset.WarFactoryOverlayFrames   0x22B    ; INT
%define BuildingTypeClass.Offset.WarFactoryOverlayRate     0x22F    ; INT
%define BuildingTypeClass.Offset.WarFactoryExitFacing      0x233    ; byte
%define BuildingTypeClass.Offset.WarFactoryExitTrack       0x234    ; byte
%define BuildingTypeClass.Offset.UndeploysInto             0x235    ; byte
%define BuildingTypeClass.Offset.CustomFoundationList      0x236    ; INT PTR to string, then to word*
; Custom storages
%define BuildingTypeClass.Offset.CustomOccupyList          0x23A    ; word[32]
%define BuildingTypeClass.Offset.CustomOverlapList         0x27A    ; word[32]
;
%define BuildingTypeClass.Offset.SpreadExplosionDamage     0x2BA    ; INT
%define BuildingTypeClass.Offset.SpreadExplosionWarhead    0x2BE    ; INT PTR
;0x2C2
%define BuildingTypeClass.Offset.AIBuildLimit              0x2C2    ; INT
%define BuildingTypeClass.Offset.AIBuildType               0x2C6    ; byte (enum)
;0x2C7
%define BuildingTypeClass.Offset.SpecialWeapons            0x2C7    ; int, SpecialType flags, up to 32 values
%define BuildingTypeClass.Offset.FreeUnit                  0x2CB    ; byte
%define BuildingTypeClass.Offset.AILowPowerSellPriority    0x2CC    ; byte
%define BuildingTypeClass.Offset.AILowMoneySellPriority    0x2CD    ; byte
;0x2CE

; INI String controls
str.BuildingTypeClass.IsBase                    db"BaseNormal",0                  ;existing feature
str.BuildingTypeClass.IsFake                    db"Fake",0                        ;?
str.BuildingTypeClass.IsBibbed                  db"Bib",0                         ;existing feature
str.BuildingTypeClass.IsWall                    db"Wall",0                        ;?
str.BuildingTypeClass.IsSimpleDamage            db"IsSimpleDamage",0              ;new ini feature
str.BuildingTypeClass.IsCaptureable             db"Capturable",0                  ;existing feature
str.BuildingTypeClass.IsRegulated               db"ConstantAnimation",0           ;new ini feature
str.BuildingTypeClass.IsPowered                 db"Powered",0                     ;existing feature
str.BuildingTypeClass.IsUnsellable              db"Unsellable",0                  ;existing feature
str.BuildingTypeClass.IsJammable                db"IsJammable",0                  ;new feature
str.BuildingTypeClass.IsRadar                   db"IsRadar",0                     ;new feature
str.BuildingTypeClass.IsRefinery                db"IsRefinery",0                  ;new feature
str.BuildingTypeClass.IsSilo                    db"IsSilo",0                      ;new feature
str.BuildingTypeClass.IsKennel                  db"IsKennel",0                    ;new feature
str.BuildingTypeClass.IsAirfield                db"IsAirfield",0                  ;new feature
str.BuildingTypeClass.IsHelipad                 db"IsHelipad",0                   ;new feature
str.BuildingTypeClass.IsRepairPad               db"IsRepairPad",0                 ;new feature
str.BuildingTypeClass.FoundationFace            db"FoundationFace",0              ;internal feature
str.BuildingTypeClass.Adjacent                  db"Adjacent",0                    ;existing feature
str.BuildingTypeClass.SpecialWeapons            db"SpecialWeapons",0              ;new ini feature
str.BuildingTypeClass.FactoryType               db"FactoryType",0                 ;new ini feature
str.BuildingTypeClass.ExitCoordX                db"ExitCoordX",0                  ;new ini feature
str.BuildingTypeClass.ExitCoordY                db"ExitCoordY",0                  ;new ini feature
str.BuildingTypeClass.ExitList                  db"ExitList",0                    ;new ini feature
str.BuildingTypeClass.Type                      db"Type",0                        ;internal feature
str.BuildingTypeClass.StartFace                 db"StartFacing",0                 ;new ini feature
str.BuildingTypeClass.Capacity                  db"Storage",0                     ;existing feature
str.BuildingTypeClass.Power                     db"Power",0                       ;existing feature
str.BuildingTypeClass.Drain                     db"Drain",0                       ;paired with Power; need to zero Drain when Power is set to positive
str.BuildingTypeClass.BSize                     db"BSize",0                       ;new ini feature
str.BuildingTypeClass.Anim_Construct_Start      db"Anim_Construct_Start",0        ;new ini feature
str.BuildingTypeClass.Anim_Construct_Count      db"Anim_Construct_Count",0        ;new ini feature
str.BuildingTypeClass.Anim_Construct_Rate       db"Anim_Construct_Rate",0         ;new ini feature
str.BuildingTypeClass.Anim_Idle_Start           db"Anim_Idle_Start",0             ;new ini feature
str.BuildingTypeClass.Anim_Idle_Count           db"Anim_Idle_Count",0             ;new ini feature
str.BuildingTypeClass.Anim_Idle_Rate            db"Anim_Idle_Rate",0              ;new ini feature
str.BuildingTypeClass.Anim_Active_Start         db"Anim_Active_Start",0           ;new ini feature
str.BuildingTypeClass.Anim_Active_Count         db"Anim_Active_Count",0           ;new ini feature
str.BuildingTypeClass.Anim_Active_Rate          db"Anim_Active_Rate",0            ;new ini feature
str.BuildingTypeClass.Anim_Full_Start           db"Anim_Full_Start",0             ;new ini feature
str.BuildingTypeClass.Anim_Full_Count           db"Anim_Full_Count",0             ;new ini feature
str.BuildingTypeClass.Anim_Full_Rate            db"Anim_Full_Rate",0              ;new ini feature
str.BuildingTypeClass.Anim_Aux1_Start           db"Anim_Aux1_Start",0             ;new ini feature
str.BuildingTypeClass.Anim_Aux1_Count           db"Anim_Aux1_Count",0             ;new ini feature
str.BuildingTypeClass.Anim_Aux1_Rate            db"Anim_Aux1_Rate",0              ;new ini feature
str.BuildingTypeClass.Anim_Aux2_Start           db"Anim_Aux2_Start",0             ;new ini feature
str.BuildingTypeClass.Anim_Aux2_Count           db"Anim_Aux2_Count",0             ;new ini feature
str.BuildingTypeClass.Anim_Aux2_Rate            db"Anim_Aux2_Rate",0              ;new ini feature
str.BuildingTypeClass.OccupyList                db"OccupyList",0                  ;new ini feature
str.BuildingTypeClass.OverlapList               db"OverlapList",0                 ;new ini feature
str.BuildingTypeClass.BuildupData               db"BuildupData",0                 ;?
str.BuildingTypeClass.WarFactoryOverlayAnim     db"WarFactoryOverlayAnim",0       ;new ini feature
str.BuildingTypeClass.WarFactoryOverlayFrames   db"WarFactoryOverlayFrames",0     ;new ini feature
str.BuildingTypeClass.WarFactoryOverlayRate     db"WarFactoryOverlayRate",0       ;new ini feature
str.BuildingTypeClass.WarFactoryExitFacing      db"WarFactoryExitFacing",0        ;new ini feature
str.BuildingTypeClass.WarFactoryExitTrack       db"WarFactoryExitTrack",0         ;new ini feature
str.BuildingTypeClass.CustomFoundationList      db"CustomFoundationList",0        ;new ini feature
str.BuildingTypeClass.UndeploysInto             db"UndeploysInto",0               ;new ini feature
str.BuildingTypeClass.SpreadExplosionDamage     db"SpreadExplosionDamage",0       ;new ini feature
str.BuildingTypeClass.SpreadExplosionWarhead    db"SpreadExplosionWarhead",0      ;new ini feature
str.BuildingTypeClass.AIBuildLimit              db"AIBuildLimit",0                ;new ini feature
str.BuildingTypeClass.AIBuildType               db"AIBuildType",0                 ;new ini feature
str.BuildingTypeClass.FreeUnit                  db"FreeUnit",0                    ;new ini feature
str.BuildingTypeClass.AILowPowerSellPriority    db"AILowPowerSellPriority",0      ;new ini feature
str.BuildingTypeClass.AILowMoneySellPriority    db"AILowMoneySellPriority",0      ;new ini feature


%define BuildingTypeClass.FromIndex(d_index,reg_output)                        AbstractTypeClass.FromIndex              d_index, BuildingTypeClass.Count, BuildingTypeClass.Array, reg_output
%define BuildingTypeClass.FromID(d_index,reg_output)                           AbstractTypeClass.FromID                 d_index, BuildingTypeClass.Count, BuildingTypeClass.Array, reg_output

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

%define BuildingTypeClass.IsBase.Get(ptr_type,reg_output)                      GetBool                                ptr_type, BuildingTypeClass.Offset.IsBase, BuildingTypeClass.Bit.IsBase, reg_output
%define BuildingTypeClass.IsBase.Set(ptr_type,value)                           SetBool                                ptr_type, BuildingTypeClass.Offset.IsBase, BuildingTypeClass.Bit.IsBase, value
%define BuildingTypeClass.IsBase.Read(ptr_type,ptr_rules)                      AbstractTypeClass.ReadBool             ptr_type, ptr_rules, BuildingTypeClass.Offset.IsBase, BuildingTypeClass.Bit.IsBase, str.BuildingTypeClass.IsBase

%define BuildingTypeClass.IsFake.Get(ptr_type,reg_output)                      GetBool                                ptr_type, BuildingTypeClass.Offset.IsFake, BuildingTypeClass.Bit.IsFake, reg_output
%define BuildingTypeClass.IsFake.Set(ptr_type,value)                           SetBool                                ptr_type, BuildingTypeClass.Offset.IsFake, BuildingTypeClass.Bit.IsFake, value
%define BuildingTypeClass.IsFake.Read(ptr_type,ptr_rules)                      AbstractTypeClass.ReadBool             ptr_type, ptr_rules, BuildingTypeClass.Offset.IsFake, BuildingTypeClass.Bit.IsFake, str.BuildingTypeClass.IsFake

%define BuildingTypeClass.IsBibbed.Get(ptr_type,reg_output)                    GetBool                                ptr_type, BuildingTypeClass.Offset.IsBibbed, BuildingTypeClass.Bit.IsBibbed, reg_output
%define BuildingTypeClass.IsBibbed.Set(ptr_type,value)                         SetBool                                ptr_type, BuildingTypeClass.Offset.IsBibbed, BuildingTypeClass.Bit.IsBibbed, value
%define BuildingTypeClass.IsBibbed.Read(ptr_type,ptr_rules)                    AbstractTypeClass.ReadBool             ptr_type, ptr_rules, BuildingTypeClass.Offset.IsBibbed, BuildingTypeClass.Bit.IsBibbed, str.BuildingTypeClass.IsBibbed

%define BuildingTypeClass.IsWall.Get(ptr_type,reg_output)                      GetBool                                ptr_type, BuildingTypeClass.Offset.IsWall, BuildingTypeClass.Bit.IsWall, reg_output
%define BuildingTypeClass.IsWall.Set(ptr_type,value)                           SetBool                                ptr_type, BuildingTypeClass.Offset.IsWall, BuildingTypeClass.Bit.IsWall, value
%define BuildingTypeClass.IsWall.Read(ptr_type,ptr_rules)                      AbstractTypeClass.ReadBool             ptr_type, ptr_rules, BuildingTypeClass.Offset.IsWall, BuildingTypeClass.Bit.IsWall, str.BuildingTypeClass.IsWall

%define BuildingTypeClass.IsCaptureable.Get(ptr_type,reg_output)               GetBool                                ptr_type, BuildingTypeClass.Offset.IsCaptureable, BuildingTypeClass.Bit.IsCaptureable, reg_output
%define BuildingTypeClass.IsCaptureable.Set(ptr_type,value)                    SetBool                                ptr_type, BuildingTypeClass.Offset.IsCaptureable, BuildingTypeClass.Bit.IsCaptureable, value
%define BuildingTypeClass.IsCaptureable.Read(ptr_type,ptr_rules)               AbstractTypeClass.ReadBool             ptr_type, ptr_rules, BuildingTypeClass.Offset.IsCaptureable, BuildingTypeClass.Bit.IsCaptureable, str.BuildingTypeClass.IsCaptureable

%define BuildingTypeClass.IsSimpleDamage.Get(ptr_type,reg_output)              GetBool                                ptr_type, BuildingTypeClass.Offset.IsSimpleDamage, BuildingTypeClass.Bit.IsSimpleDamage, reg_output
%define BuildingTypeClass.IsSimpleDamage.Set(ptr_type,value)                   SetBool                                ptr_type, BuildingTypeClass.Offset.IsSimpleDamage, BuildingTypeClass.Bit.IsSimpleDamage, value
%define BuildingTypeClass.IsSimpleDamage.Read(ptr_type,ptr_rules)              AbstractTypeClass.ReadBool             ptr_type, ptr_rules, BuildingTypeClass.Offset.IsSimpleDamage, BuildingTypeClass.Bit.IsSimpleDamage, str.BuildingTypeClass.IsSimpleDamage

%define BuildingTypeClass.IsRegulated.Get(ptr_type,reg_output)                 GetBool                                ptr_type, BuildingTypeClass.Offset.IsRegulated, BuildingTypeClass.Bit.IsRegulated, reg_output
%define BuildingTypeClass.IsRegulated.Set(ptr_type,value)                      SetBool                                ptr_type, BuildingTypeClass.Offset.IsRegulated, BuildingTypeClass.Bit.IsRegulated, value
%define BuildingTypeClass.IsRegulated.Read(ptr_type,ptr_rules)                 AbstractTypeClass.ReadBool             ptr_type, ptr_rules, BuildingTypeClass.Offset.IsRegulated, BuildingTypeClass.Bit.IsRegulated, str.BuildingTypeClass.IsRegulated

%define BuildingTypeClass.IsPowered.Get(ptr_type,reg_output)                   GetBool                                ptr_type, BuildingTypeClass.Offset.IsPowered, BuildingTypeClass.Bit.IsPowered, reg_output
%define BuildingTypeClass.IsPowered.Set(ptr_type,value)                        SetBool                                ptr_type, BuildingTypeClass.Offset.IsPowered, BuildingTypeClass.Bit.IsPowered, value
%define BuildingTypeClass.IsPowered.Read(ptr_type,ptr_rules)                   AbstractTypeClass.ReadBool             ptr_type, ptr_rules, BuildingTypeClass.Offset.IsPowered, BuildingTypeClass.Bit.IsPowered, str.BuildingTypeClass.IsPowered

%define BuildingTypeClass.IsJammable.Get(ptr_type,reg_output)                  GetBool                                ptr_type, BuildingTypeClass.Offset.IsJammable, BuildingTypeClass.Bit.IsJammable, reg_output
%define BuildingTypeClass.IsJammable.Set(ptr_type,value)                       SetBool                                ptr_type, BuildingTypeClass.Offset.IsJammable, BuildingTypeClass.Bit.IsJammable, value
%define BuildingTypeClass.IsJammable.Read(ptr_type,ptr_rules)                  AbstractTypeClass.ReadBool             ptr_type, ptr_rules, BuildingTypeClass.Offset.IsJammable, BuildingTypeClass.Bit.IsJammable, str.BuildingTypeClass.IsJammable

%define BuildingTypeClass.IsRadar.Get(ptr_type,reg_output)                     GetBool                                ptr_type, BuildingTypeClass.Offset.IsRadar, BuildingTypeClass.Bit.IsRadar, reg_output
%define BuildingTypeClass.IsRadar.Set(ptr_type,value)                          SetBool                                ptr_type, BuildingTypeClass.Offset.IsRadar, BuildingTypeClass.Bit.IsRadar, value
%define BuildingTypeClass.IsRadar.Read(ptr_type,ptr_rules)                     AbstractTypeClass.ReadBool             ptr_type, ptr_rules, BuildingTypeClass.Offset.IsRadar, BuildingTypeClass.Bit.IsRadar, str.BuildingTypeClass.IsRadar

%define BuildingTypeClass.IsRefinery.Get(ptr_type,reg_output)                  GetBool                                ptr_type, BuildingTypeClass.Offset.IsRefinery, BuildingTypeClass.Bit.IsRefinery, reg_output
%define BuildingTypeClass.IsRefinery.Set(ptr_type,value)                       SetBool                                ptr_type, BuildingTypeClass.Offset.IsRefinery, BuildingTypeClass.Bit.IsRefinery, value
%define BuildingTypeClass.IsRefinery.Read(ptr_type,ptr_rules)                  AbstractTypeClass.ReadBool             ptr_type, ptr_rules, BuildingTypeClass.Offset.IsRefinery, BuildingTypeClass.Bit.IsRefinery, str.BuildingTypeClass.IsRefinery

%define BuildingTypeClass.IsSilo.Get(ptr_type,reg_output)                      GetBool                                ptr_type, BuildingTypeClass.Offset.IsSilo, BuildingTypeClass.Bit.IsSilo, reg_output
%define BuildingTypeClass.IsSilo.Set(ptr_type,value)                           SetBool                                ptr_type, BuildingTypeClass.Offset.IsSilo, BuildingTypeClass.Bit.IsSilo, value
%define BuildingTypeClass.IsSilo.Read(ptr_type,ptr_rules)                      AbstractTypeClass.ReadBool             ptr_type, ptr_rules, BuildingTypeClass.Offset.IsSilo, BuildingTypeClass.Bit.IsSilo, str.BuildingTypeClass.IsSilo

%define BuildingTypeClass.IsKennel.Get(ptr_type,reg_output)                    GetBool                                ptr_type, BuildingTypeClass.Offset.IsKennel, BuildingTypeClass.Bit.IsKennel, reg_output
%define BuildingTypeClass.IsKennel.Set(ptr_type,value)                         SetBool                                ptr_type, BuildingTypeClass.Offset.IsKennel, BuildingTypeClass.Bit.IsKennel, value
%define BuildingTypeClass.IsKennel.Read(ptr_type,ptr_rules)                    AbstractTypeClass.ReadBool             ptr_type, ptr_rules, BuildingTypeClass.Offset.IsKennel, BuildingTypeClass.Bit.IsKennel, str.BuildingTypeClass.IsKennel

%define BuildingTypeClass.IsAirfield.Get(ptr_type,reg_output)                  GetBool                                ptr_type, BuildingTypeClass.Offset.IsAirfield, BuildingTypeClass.Bit.IsAirfield, reg_output
%define BuildingTypeClass.IsAirfield.Set(ptr_type,value)                       SetBool                                ptr_type, BuildingTypeClass.Offset.IsAirfield, BuildingTypeClass.Bit.IsAirfield, value
%define BuildingTypeClass.IsAirfield.Read(ptr_type,ptr_rules)                  AbstractTypeClass.ReadBool             ptr_type, ptr_rules, BuildingTypeClass.Offset.IsAirfield, BuildingTypeClass.Bit.IsAirfield, str.BuildingTypeClass.IsAirfield

%define BuildingTypeClass.IsHelipad.Get(ptr_type,reg_output)                   GetBool                                ptr_type, BuildingTypeClass.Offset.IsHelipad, BuildingTypeClass.Bit.IsHelipad, reg_output
%define BuildingTypeClass.IsHelipad.Set(ptr_type,value)                        SetBool                                ptr_type, BuildingTypeClass.Offset.IsHelipad, BuildingTypeClass.Bit.IsHelipad, value
%define BuildingTypeClass.IsHelipad.Read(ptr_type,ptr_rules)                   AbstractTypeClass.ReadBool             ptr_type, ptr_rules, BuildingTypeClass.Offset.IsHelipad, BuildingTypeClass.Bit.IsHelipad, str.BuildingTypeClass.IsHelipad

%define BuildingTypeClass.IsRepairPad.Get(ptr_type,reg_output)                 GetBool                                ptr_type, BuildingTypeClass.Offset.IsRepairPad, BuildingTypeClass.Bit.IsRepairPad, reg_output
%define BuildingTypeClass.IsRepairPad.Set(ptr_type,value)                      SetBool                                ptr_type, BuildingTypeClass.Offset.IsRepairPad, BuildingTypeClass.Bit.IsRepairPad, value
%define BuildingTypeClass.IsRepairPad.Read(ptr_type,ptr_rules)                 AbstractTypeClass.ReadBool             ptr_type, ptr_rules, BuildingTypeClass.Offset.IsRepairPad, BuildingTypeClass.Bit.IsRepairPad, str.BuildingTypeClass.IsRepairPad

%define BuildingTypeClass.SpecialWeapons.Get(ptr_type,reg_output)              GetInt                                 ptr_type, BuildingTypeClass.Offset.SpecialWeapons, reg_output
%define BuildingTypeClass.SpecialWeapons.Set(ptr_type,value)                   SetInt                                 ptr_type, BuildingTypeClass.Offset.SpecialWeapons, value
%define BuildingTypeClass.SpecialWeapons.Read(ptr_type,ptr_rules,function)     AbstractTypeClass.ReadStringExt        ptr_type, ptr_rules, BuildingTypeClass.Offset.SpecialWeapons, str.BuildingTypeClass.SpecialWeapons, function


; read and translate to value, AircraftType=2, BuildingType=6, InfantryType=14, UnitType=29, VesselType=31
%define BuildingTypeClass.FactoryType.Get(ptr_type,reg_output)                 GetByte                                ptr_type, BuildingTypeClass.Offset.FactoryType, reg_output
%define BuildingTypeClass.FactoryType.Set(ptr_type,value)                      SetByte                                ptr_type, BuildingTypeClass.Offset.FactoryType, value
%define BuildingTypeClass.FactoryType.Read(ptr_type,ptr_rules,function)        AbstractTypeClass.ReadStringToByteExt  ptr_type, ptr_rules, BuildingTypeClass.Offset.FactoryType, str.BuildingTypeClass.FactoryType, function

%define BuildingTypeClass.ExitCoordX.Get(ptr_type,reg_output)                  GetWord                                ptr_type, BuildingTypeClass.Offset.ExitCoordX, reg_output
%define BuildingTypeClass.ExitCoordX.Set(ptr_type,value)                       SetWord                                ptr_type, BuildingTypeClass.Offset.ExitCoordX, value
%define BuildingTypeClass.ExitCoordX.Read(ptr_type,ptr_rules)                  AbstractTypeClass.ReadWord             ptr_type, ptr_rules, BuildingTypeClass.Offset.ExitCoordX, str.BuildingTypeClass.ExitCoordX

%define BuildingTypeClass.ExitCoordY.Get(ptr_type,reg_output)                  GetWord                                ptr_type, BuildingTypeClass.Offset.ExitCoordY, reg_output
%define BuildingTypeClass.ExitCoordY.Set(ptr_type,value)                       SetWord                                ptr_type, BuildingTypeClass.Offset.ExitCoordY, value
%define BuildingTypeClass.ExitCoordY.Read(ptr_type,ptr_rules)                  AbstractTypeClass.ReadWord             ptr_type, ptr_rules, BuildingTypeClass.Offset.ExitCoordY, str.BuildingTypeClass.ExitCoordY

; read and translate to pointer
%define BuildingTypeClass.ExitList.Get(ptr_type,reg_output)                    GetInt                                 ptr_type, BuildingTypeClass.Offset.ExitList, reg_output
%define BuildingTypeClass.ExitList.Set(ptr_type,value)                         SetInt                                 ptr_type, BuildingTypeClass.Offset.ExitList, value
%define BuildingTypeClass.ExitList.Read(ptr_type,ptr_rules,function)           AbstractTypeClass.ReadIntExt           ptr_type, ptr_rules, BuildingTypeClass.Offset.ExitList, str.BuildingTypeClass.ExitList, function

%define BuildingTypeClass.Power.Get(ptr_type,reg_output)                       GetInt                                 ptr_type, BuildingTypeClass.Offset.Power, reg_output
%define BuildingTypeClass.Power.Set(ptr_type,value)                            SetInt                                 ptr_type, BuildingTypeClass.Offset.Power, value
%define BuildingTypeClass.Power.Read(ptr_type,ptr_rules)                       AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.Power, str.BuildingTypeClass.Power

%define BuildingTypeClass.Drain.Get(ptr_type,reg_output)                       GetInt                                 ptr_type, BuildingTypeClass.Offset.Drain, reg_output
%define BuildingTypeClass.Drain.Set(ptr_type,value)                            SetInt                                 ptr_type, BuildingTypeClass.Offset.Drain, value
%define BuildingTypeClass.Drain.Read(ptr_type,ptr_rules)                       AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.Drain, str.BuildingTypeClass.Drain

; byte enum, valid values 0-8, BSIZE_11, BSIZE_21, BSIZE_12, BSIZE_22, BSIZE_23, BSIZE_32, BSIZE_33, BSIZE_42, BSIZE_55
%define BuildingTypeClass.BSize.Get(ptr_type,reg_output)                       GetByte                                ptr_type, BuildingTypeClass.Offset.BSize, reg_output
%define BuildingTypeClass.BSize.Set(ptr_type,value)                            SetByte                                ptr_type, BuildingTypeClass.Offset.BSize, value
%define BuildingTypeClass.BSize.Read(ptr_type,ptr_rules)                       AbstractTypeClass.ReadByte             ptr_type, ptr_rules, BuildingTypeClass.Offset.BSize, str.BuildingTypeClass.BSize  

%define BuildingTypeClass.Anim_Construct_Start.Get(ptr_type,reg_output)        GetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Construct_Start, reg_output
%define BuildingTypeClass.Anim_Construct_Start.Set(ptr_type,value)             SetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Construct_Start, value
%define BuildingTypeClass.Anim_Construct_Start.Read(ptr_type,ptr_rules)        AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.Anim_Construct_Start, str.BuildingTypeClass.Anim_Construct_Start

%define BuildingTypeClass.Anim_Construct_Count.Get(ptr_type,reg_output)        GetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Construct_Count, reg_output
%define BuildingTypeClass.Anim_Construct_Count.Set(ptr_type,value)             SetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Construct_Count, value
%define BuildingTypeClass.Anim_Construct_Count.Read(ptr_type,ptr_rules)        AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.Anim_Construct_Count, str.BuildingTypeClass.Anim_Construct_Count

%define BuildingTypeClass.Anim_Construct_Rate.Get(ptr_type,reg_output)         GetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Construct_Rate, reg_output
%define BuildingTypeClass.Anim_Construct_Rate.Set(ptr_type,value)              SetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Construct_Rate, value
%define BuildingTypeClass.Anim_Construct_Rate.Read(ptr_type,ptr_rules)         AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.Anim_Construct_Rate, str.BuildingTypeClass.Anim_Construct_Rate

%define BuildingTypeClass.Anim_Idle_Start.Get(ptr_type,reg_output)             GetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Idle_Start, reg_output
%define BuildingTypeClass.Anim_Idle_Start.Set(ptr_type,value)                  SetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Idle_Start, value
%define BuildingTypeClass.Anim_Idle_Start.Read(ptr_type,ptr_rules)             AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.Anim_Idle_Start, str.BuildingTypeClass.Anim_Idle_Start

%define BuildingTypeClass.Anim_Idle_Count.Get(ptr_type,reg_output)             GetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Idle_Count, reg_output
%define BuildingTypeClass.Anim_Idle_Count.Set(ptr_type,value)                  SetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Idle_Count, value
%define BuildingTypeClass.Anim_Idle_Count.Read(ptr_type,ptr_rules)             AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.Anim_Idle_Count, str.BuildingTypeClass.Anim_Idle_Count

%define BuildingTypeClass.Anim_Idle_Rate.Get(ptr_type,reg_output)              GetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Idle_Rate, reg_output
%define BuildingTypeClass.Anim_Idle_Rate.Set(ptr_type,value)                   SetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Idle_Rate, value
%define BuildingTypeClass.Anim_Idle_Rate.Read(ptr_type,ptr_rules)              AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.Anim_Idle_Rate, str.BuildingTypeClass.Anim_Idle_Rate

%define BuildingTypeClass.Anim_Active_Start.Get(ptr_type,reg_output)           GetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Active_Start, reg_output
%define BuildingTypeClass.Anim_Active_Start.Set(ptr_type,value)                SetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Active_Start, value
%define BuildingTypeClass.Anim_Active_Start.Read(ptr_type,ptr_rules)           AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.Anim_Active_Start, str.BuildingTypeClass.Anim_Active_Start

%define BuildingTypeClass.Anim_Active_Count.Get(ptr_type,reg_output)           GetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Active_Count, reg_output
%define BuildingTypeClass.Anim_Active_Count.Set(ptr_type,value)                SetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Active_Count, value
%define BuildingTypeClass.Anim_Active_Count.Read(ptr_type,ptr_rules)           AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.Anim_Active_Count, str.BuildingTypeClass.Anim_Active_Count

%define BuildingTypeClass.Anim_Active_Rate.Get(ptr_type,reg_output)            GetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Active_Rate, reg_output
%define BuildingTypeClass.Anim_Active_Rate.Set(ptr_type,value)                 SetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Active_Rate, value
%define BuildingTypeClass.Anim_Active_Rate.Read(ptr_type,ptr_rules)            AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.Anim_Active_Rate, str.BuildingTypeClass.Anim_Active_Rate

%define BuildingTypeClass.Anim_Full_Start.Get(ptr_type,reg_output)             GetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Full_Start, reg_output
%define BuildingTypeClass.Anim_Full_Start.Set(ptr_type,value)                  SetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Full_Start, value
%define BuildingTypeClass.Anim_Full_Start.Read(ptr_type,ptr_rules)             AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.Anim_Full_Start, str.BuildingTypeClass.Anim_Full_Start

%define BuildingTypeClass.Anim_Full_Count.Get(ptr_type,reg_output)             GetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Full_Count, reg_output
%define BuildingTypeClass.Anim_Full_Count.Set(ptr_type,value)                  SetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Full_Count, value
%define BuildingTypeClass.Anim_Full_Count.Read(ptr_type,ptr_rules)             AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.Anim_Full_Count, str.BuildingTypeClass.Anim_Full_Count

%define BuildingTypeClass.Anim_Full_Rate.Get(ptr_type,reg_output)              GetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Full_Rate, reg_output
%define BuildingTypeClass.Anim_Full_Rate.Set(ptr_type,value)                   SetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Full_Rate, value
%define BuildingTypeClass.Anim_Full_Rate.Read(ptr_type,ptr_rules)              AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.Anim_Full_Rate, str.BuildingTypeClass.Anim_Full_Rate

%define BuildingTypeClass.Anim_Aux1_Start.Get(ptr_type,reg_output)             GetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Aux1_Start, reg_output
%define BuildingTypeClass.Anim_Aux1_Start.Set(ptr_type,value)                  SetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Aux1_Start, value
%define BuildingTypeClass.Anim_Aux1_Start.Read(ptr_type,ptr_rules)             AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.Anim_Aux1_Start, str.BuildingTypeClass.Anim_Aux1_Start

%define BuildingTypeClass.Anim_Aux1_Count.Get(ptr_type,reg_output)             GetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Aux1_Count, reg_output
%define BuildingTypeClass.Anim_Aux1_Count.Set(ptr_type,value)                  SetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Aux1_Count, value
%define BuildingTypeClass.Anim_Aux1_Count.Read(ptr_type,ptr_rules)             AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.Anim_Aux1_Count, str.BuildingTypeClass.Anim_Aux1_Count

%define BuildingTypeClass.Anim_Aux1_Rate.Get(ptr_type,reg_output)              GetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Aux1_Rate, reg_output
%define BuildingTypeClass.Anim_Aux1_Rate.Set(ptr_type,value)                   SetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Aux1_Rate, value
%define BuildingTypeClass.Anim_Aux1_Rate.Read(ptr_type,ptr_rules)              AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.Anim_Aux1_Rate, str.BuildingTypeClass.Anim_Aux1_Rate

%define BuildingTypeClass.Anim_Aux2_Start.Get(ptr_type,reg_output)             GetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Aux2_Start, reg_output
%define BuildingTypeClass.Anim_Aux2_Start.Set(ptr_type,value)                  SetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Aux2_Start, value
%define BuildingTypeClass.Anim_Aux2_Start.Read(ptr_type,ptr_rules)             AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.Anim_Aux2_Start, str.BuildingTypeClass.Anim_Aux2_Start

%define BuildingTypeClass.Anim_Aux2_Count.Get(ptr_type,reg_output)             GetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Aux2_Count, reg_output
%define BuildingTypeClass.Anim_Aux2_Count.Set(ptr_type,value)                  SetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Aux2_Count, value
%define BuildingTypeClass.Anim_Aux2_Count.Read(ptr_type,ptr_rules)             AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.Anim_Aux2_Count, str.BuildingTypeClass.Anim_Aux2_Count

%define BuildingTypeClass.Anim_Aux2_Rate.Get(ptr_type,reg_output)              GetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Aux2_Rate, reg_output
%define BuildingTypeClass.Anim_Aux2_Rate.Set(ptr_type,value)                   SetInt                                 ptr_type, BuildingTypeClass.Offset.Anim_Aux2_Rate, value
%define BuildingTypeClass.Anim_Aux2_Rate.Read(ptr_type,ptr_rules)              AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.Anim_Aux2_Rate, str.BuildingTypeClass.Anim_Aux2_Rate

; read and translate to pointer
%define BuildingTypeClass.OccupyList.Get(ptr_type,reg_output)                  GetInt                                 ptr_type, BuildingTypeClass.Offset.OccupyList, reg_output
%define BuildingTypeClass.OccupyList.Set(ptr_type,value)                       SetInt                                 ptr_type, BuildingTypeClass.Offset.OccupyList, value
%define BuildingTypeClass.OccupyList.Read(ptr_type,ptr_rules,function)         AbstractTypeClass.ReadIntExt           ptr_type, ptr_rules, BuildingTypeClass.Offset.OccupyList, str.BuildingTypeClass.OccupyList, function

; read and translate to pointer
%define BuildingTypeClass.OverlapList.Get(ptr_type,reg_output)                 GetInt                                 ptr_type, BuildingTypeClass.Offset.OverlapList, reg_output
%define BuildingTypeClass.OverlapList.Set(ptr_type,value)                      SetInt                                 ptr_type, BuildingTypeClass.Offset.OverlapList, value
%define BuildingTypeClass.OverlapList.Read(ptr_type,ptr_rules,function)        AbstractTypeClass.ReadIntExt           ptr_type, ptr_rules, BuildingTypeClass.Offset.OverlapList, str.BuildingTypeClass.OverlapList, function

%define BuildingTypeClass.WarFactoryOverlayAnim.Get(ptr_type,reg_output)       GetInt                                 ptr_type, BuildingTypeClass.Offset.WarFactoryOverlayAnim, reg_output
%define BuildingTypeClass.WarFactoryOverlayAnim.Set(ptr_type,value)            SetInt                                 ptr_type, BuildingTypeClass.Offset.WarFactoryOverlayAnim, value
%define BuildingTypeClass.WarFactoryOverlayAnim.Read(ptr_type,ptr_rules,function)       AbstractTypeClass.ReadStringExt        ptr_type, ptr_rules, BuildingTypeClass.Offset.WarFactoryOverlayAnim, str.BuildingTypeClass.WarFactoryOverlayAnim, function

%define BuildingTypeClass.WarFactoryOverlayFrames.Get(ptr_type,reg_output)     GetInt                                 ptr_type, BuildingTypeClass.Offset.WarFactoryOverlayFrames, reg_output
%define BuildingTypeClass.WarFactoryOverlayFrames.Set(ptr_type,value)          SetInt                                 ptr_type, BuildingTypeClass.Offset.WarFactoryOverlayFrames, value
%define BuildingTypeClass.WarFactoryOverlayFrames.Read(ptr_type,ptr_rules)     AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.WarFactoryOverlayFrames, str.BuildingTypeClass.WarFactoryOverlayFrames

%define BuildingTypeClass.WarFactoryOverlayRate.Get(ptr_type,reg_output)       GetInt                                 ptr_type, BuildingTypeClass.Offset.WarFactoryOverlayRate, reg_output
%define BuildingTypeClass.WarFactoryOverlayRate.Set(ptr_type,value)            SetInt                                 ptr_type, BuildingTypeClass.Offset.WarFactoryOverlayRate, value
%define BuildingTypeClass.WarFactoryOverlayRate.Read(ptr_type,ptr_rules)       AbstractTypeClass.ReadInt              ptr_type, ptr_rules, BuildingTypeClass.Offset.WarFactoryOverlayRate, str.BuildingTypeClass.WarFactoryOverlayRate

%define BuildingTypeClass.WarFactoryExitFacing.Get(ptr_type,reg_output)        GetByte                                ptr_type, BuildingTypeClass.Offset.WarFactoryExitFacing, reg_output
%define BuildingTypeClass.WarFactoryExitFacing.Set(ptr_type,value)             SetByte                                ptr_type, BuildingTypeClass.Offset.WarFactoryExitFacing, value
%define BuildingTypeClass.WarFactoryExitFacing.Read(ptr_type,ptr_rules)        AbstractTypeClass.ReadByte             ptr_type, ptr_rules, BuildingTypeClass.Offset.WarFactoryExitFacing, str.BuildingTypeClass.WarFactoryExitFacing

%define BuildingTypeClass.WarFactoryExitTrack.Get(ptr_type,reg_output)         GetByte                                ptr_type, BuildingTypeClass.Offset.WarFactoryExitTrack, reg_output
%define BuildingTypeClass.WarFactoryExitTrack.Set(ptr_type,value)              SetByte                                ptr_type, BuildingTypeClass.Offset.WarFactoryExitTrack, value
%define BuildingTypeClass.WarFactoryExitTrack.Read(ptr_type,ptr_rules)         AbstractTypeClass.ReadByte             ptr_type, ptr_rules, BuildingTypeClass.Offset.WarFactoryExitTrack, str.BuildingTypeClass.WarFactoryExitTrack

; read and translate to pointer
%define BuildingTypeClass.CustomFoundationList.Get(ptr_type,reg_output)             GetInt                                 ptr_type, BuildingTypeClass.Offset.CustomFoundationList, reg_output
%define BuildingTypeClass.CustomFoundationList.Set(ptr_type,value)                  SetInt                                 ptr_type, BuildingTypeClass.Offset.CustomFoundationList, value
%define BuildingTypeClass.CustomFoundationList.Read(ptr_type,ptr_rules,function)    AbstractTypeClass.ReadStringExt        ptr_type, ptr_rules, BuildingTypeClass.Offset.CustomFoundationList, str.BuildingTypeClass.CustomFoundationList, function

%define BuildingTypeClass.UndeploysInto.Get(ptr_type,reg_output)                    GetByte                                ptr_type, BuildingTypeClass.Offset.UndeploysInto, reg_output
%define BuildingTypeClass.UndeploysInto.Set(ptr_type,value)                         SetByte                                ptr_type, BuildingTypeClass.Offset.UndeploysInto, value
%define BuildingTypeClass.UndeploysInto.Read(ptr_type,ptr_rules, function)          AbstractTypeClass.ReadStringToByteExt  ptr_type, ptr_rules, BuildingTypeClass.Offset.UndeploysInto, str.BuildingTypeClass.UndeploysInto, function

%define BuildingTypeClass.SpreadExplosionDamage.Get(ptr_type,reg_output)                 GetInt                           ptr_type, BuildingTypeClass.Offset.SpreadExplosionDamage, reg_output
%define BuildingTypeClass.SpreadExplosionDamage.Set(ptr_type,value)                      SetInt                           ptr_type, BuildingTypeClass.Offset.SpreadExplosionDamage, value
%define BuildingTypeClass.SpreadExplosionDamage.Read(ptr_type,ptr_rules)                 AbstractTypeClass.ReadInt        ptr_type, ptr_rules, BuildingTypeClass.Offset.SpreadExplosionDamage, str.BuildingTypeClass.SpreadExplosionDamage

%define BuildingTypeClass.SpreadExplosionWarhead.Get(ptr_type,reg_output)                GetInt                           ptr_type, BuildingTypeClass.Offset.SpreadExplosionWarhead, reg_output
%define BuildingTypeClass.SpreadExplosionWarhead.Set(ptr_type,value)                     SetInt                           ptr_type, BuildingTypeClass.Offset.SpreadExplosionWarhead, value
%define BuildingTypeClass.SpreadExplosionWarhead.Read(ptr_type,ptr_rules, function)      AbstractTypeClass.ReadStringExt  ptr_type, ptr_rules, BuildingTypeClass.Offset.SpreadExplosionWarhead, str.BuildingTypeClass.SpreadExplosionWarhead, function

%define BuildingTypeClass.AIBuildLimit.Get(ptr_type,reg_output)                     GetInt                                ptr_type, BuildingTypeClass.Offset.AIBuildLimit, reg_output
%define BuildingTypeClass.AIBuildLimit.Set(ptr_type,value)                          SetInt                                ptr_type, BuildingTypeClass.Offset.AIBuildLimit, value
%define BuildingTypeClass.AIBuildLimit.Read(ptr_type,ptr_rules)                     AbstractTypeClass.ReadInt             ptr_type, ptr_rules, BuildingTypeClass.Offset.AIBuildLimit, str.BuildingTypeClass.AIBuildLimit

%define BuildingTypeClass.AIBuildType.Get(ptr_type,reg_output)                      GetByte                               ptr_type, BuildingTypeClass.Offset.AIBuildType, reg_output
%define BuildingTypeClass.AIBuildType.Set(ptr_type,value)                           SetByte                               ptr_type, BuildingTypeClass.Offset.AIBuildType, value
%define BuildingTypeClass.AIBuildType.Read(ptr_type,ptr_rules, function)            AbstractTypeClass.ReadStringToByteExt ptr_type, ptr_rules, BuildingTypeClass.Offset.AIBuildType, str.BuildingTypeClass.AIBuildType, function

%define BuildingTypeClass.FreeUnit.Get(ptr_type,reg_output)                         GetByte                                ptr_type, BuildingTypeClass.Offset.FreeUnit, reg_output
%define BuildingTypeClass.FreeUnit.Set(ptr_type,value)                              SetByte                                ptr_type, BuildingTypeClass.Offset.FreeUnit, value
%define BuildingTypeClass.FreeUnit.Read(ptr_type,ptr_rules,function)                AbstractTypeClass.ReadStringToByteExt  ptr_type, ptr_rules, BuildingTypeClass.Offset.FreeUnit, str.BuildingTypeClass.FreeUnit, function

%define BuildingTypeClass.AILowPowerSellPriority.Get(ptr_type,reg_output)         GetByte                                ptr_type, BuildingTypeClass.Offset.AILowPowerSellPriority, reg_output
%define BuildingTypeClass.AILowPowerSellPriority.Set(ptr_type,value)              SetByte                                ptr_type, BuildingTypeClass.Offset.AILowPowerSellPriority, value
%define BuildingTypeClass.AILowPowerSellPriority.Read(ptr_type,ptr_rules)         AbstractTypeClass.ReadByte             ptr_type, ptr_rules, BuildingTypeClass.Offset.AILowPowerSellPriority, str.BuildingTypeClass.AILowPowerSellPriority

%define BuildingTypeClass.AILowMoneySellPriority.Get(ptr_type,reg_output)         GetByte                                ptr_type, BuildingTypeClass.Offset.AILowMoneySellPriority, reg_output
%define BuildingTypeClass.AILowMoneySellPriority.Set(ptr_type,value)              SetByte                                ptr_type, BuildingTypeClass.Offset.AILowMoneySellPriority, value
%define BuildingTypeClass.AILowMoneySellPriority.Read(ptr_type,ptr_rules)         AbstractTypeClass.ReadByte             ptr_type, ptr_rules, BuildingTypeClass.Offset.AILowMoneySellPriority, str.BuildingTypeClass.AILowMoneySellPriority

%endif
