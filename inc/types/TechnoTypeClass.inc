;----------------------------------------------------------------
; inc/types/technotypeclass.asm
;
; Macros to access TechnoTypeClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_TECHNOTYPECLASS
%define TYPES_TECHNOTYPECLASS

; define techno type field definitions
%define TechnoTypeClass.Offset.Remap                  0x138    ; byte
%define TechnoTypeClass.Offset.IsDoubleOwned          0x139    ; BOOL // Already supported by game INI
%define TechnoTypeClass.Bit.IsDoubleOwned             1    
%define TechnoTypeClass.Offset.IsInvisible            0x139    ; BOOL // Already supported by game INI
%define TechnoTypeClass.Bit.IsInvisible               2    
%define TechnoTypeClass.Offset.IsLeader               0x139    ; BOOL
%define TechnoTypeClass.Bit.IsLeader                  3    
%define TechnoTypeClass.Offset.IsScanner              0x139    ; BOOL
%define TechnoTypeClass.Bit.IsScanner                 4    
%define TechnoTypeClass.Offset.IsNominal              0x139    ; BOOL // Already supported by game INI
%define TechnoTypeClass.Bit.IsNominal                 5    
%define TechnoTypeClass.Offset.IsTheater              0x139    ; BOOL
%define TechnoTypeClass.Bit.IsTheater                 6    
%define TechnoTypeClass.Offset.HasTurret              0x139    ; BOOL
%define TechnoTypeClass.Bit.HasTurret                 7    
%define TechnoTypeClass.Offset.IsRepairable           0x139    ; BOOL // Already supported by game INI
%define TechnoTypeClass.Bit.IsRepairable              8    

%define TechnoTypeClass.Offset.IsCrew                 0x13A    ; BOOL // Already supported by game INI
%define TechnoTypeClass.Bit.IsCrew                    1    
%define TechnoTypeClass.Offset.IsRemappable           0x13A    ; BOOL // Already supported by game INI
%define TechnoTypeClass.Bit.IsRemappable              2    
%define TechnoTypeClass.Offset.IsCloakable            0x13A    ; BOOL // Already supported by game INI
%define TechnoTypeClass.Bit.IsCloakable               3    
%define TechnoTypeClass.Offset.IsSelfHealing          0x13A    ; BOOL // Already supported by game INI
%define TechnoTypeClass.Bit.IsSelfHealing             4    
%define TechnoTypeClass.Offset.IsExploding            0x13A    ; BOOL // Already supported by game INI
%define TechnoTypeClass.Bit.IsExploding               5    
%define TechnoTypeClass.Offset.ManualAcquire          0x13A    ; BOOL
%define TechnoTypeClass.Bit.ManualAcquire             6    

; 0x13B and 0x13C were empty... 
%define TechnoTypeClass.Offset.PrereqType             0x13B    ; byte, new variable, occupying unused location
%define TechnoTypeClass.Offset.CloakSound             0x13C    ; byte, new variable, occupying unused location

;Risk/0x154, Reward/0x158 and Points/0x18E are assigned the same values. Collapse them to the same variable to free up 2 INTs worth of memory
%define TechnoTypeClass.Offset.MZone                  0x13D    ; byte
%define TechnoTypeClass.Offset.ThreatRange            0x13E    ; word?
%define TechnoTypeClass.Offset.MaxPassengers          0x140    ; INT
%define TechnoTypeClass.Offset.SightRange             0x144    ; INT
%define TechnoTypeClass.Offset.Cost                   0x148    ; INT
%define TechnoTypeClass.Offset.Level                  0x14C    ; word
%define TechnoTypeClass.Offset.Prerequisite           0x150    ; INT

; Replace Risk, Reward with other data
;%define TechnoTypeClass.Offset.Risk                   0x154    ; INT 
;%define TechnoTypeClass.Offset.Reward                 0x158    ; INT
%define TechnoTypeClass.Offset.DeathWeapon            0x154    ; INT 
; expanding the prereq system to cover 256 values will required space for 8 INTs
%define TechnoTypeClass.Offset.ExtPrerequisiteOffset  0x158    ; word 

%define TechnoTypeClass.Offset.MaxSpeed               0x15C    ; byte
%define TechnoTypeClass.Offset.Speed                  0x15D    ; byte
%define TechnoTypeClass.Offset.MaxAmmo                0x15E    ; INT
%define TechnoTypeClass.Offset.Ownable                0x162    ; LONG? / 4
;%define TechnoTypeClass.Offset.CameoData              0x166    ; INT
%define TechnoTypeClass.Offset.Facings                0x16A    ; INT
%define TechnoTypeClass.Offset.ROT                    0x16E    ; INT
%define TechnoTypeClass.Offset.PrimaryWeapon          0x172    ; INT
%define TechnoTypeClass.Offset.SecondaryWeapon        0x176    ; INT?
%define TechnoTypeClass.Offset.VerticalOffset         0x17A    ; INT
%define TechnoTypeClass.Offset.PrimaryOffset          0x17E    ; INT
%define TechnoTypeClass.Offset.PrimaryLateral         0x182    ; INT 
%define TechnoTypeClass.Offset.SecondaryOffset        0x186    ; INT
%define TechnoTypeClass.Offset.SecondaryLateral       0x18A    ; INT
%define TechnoTypeClass.Offset.Points                 0x18E    ; INT
; 0x021 - 0x191
; limit is 0x191, extended class data goes to 0x192 onwards 

; INI String controls
str.TechnoTypeClass.IsDoubleOwned             db"DoubleOwned",0                 ;existing feature
str.TechnoTypeClass.IsInvisible               db"Invisible",0                   ;existing feature
str.TechnoTypeClass.IsLeader                  db"Leader",0                      ;internal feature
str.TechnoTypeClass.IsScanner                 db"Sensors",0                     ;existing feature
str.TechnoTypeClass.IsNominal                 db"Nominal",0                     ;new ini feature
str.TechnoTypeClass.IsTheater                 db"IsTheater",0                   ;new ini feature
str.TechnoTypeClass.HasTurret                 db"HasTurret",0                   ;new ini feature
str.TechnoTypeClass.IsRepairable              db"Repairable",0                  ;new ini feature
str.TechnoTypeClass.IsCrew                    db"Crewed",0                      ;existing feature
str.TechnoTypeClass.IsRemappable              db"IsRemappable",0                ;internal feature
str.TechnoTypeClass.IsCloakable               db"Cloakable",0                   ;existing feature
str.TechnoTypeClass.IsSelfHealing             db"SelfHealing",0                 ;existing feature
str.TechnoTypeClass.IsExploding               db"Explodes",0                    ;existing feature
str.TechnoTypeClass.ManualAcquire             db"ManualAcquire",0               ;new feature

str.TechnoTypeClass.PrereqType                db"PrerequisiteType",0            ;new feature
str.TechnoTypeClass.CloakSound                db"CloakSound",0                  ;new feature

str.TechnoTypeClass.MZone                     db"MovementZone",0                ;internal feature
str.TechnoTypeClass.ThreatRange               db"GuardRange",0                  ;existing feature
str.TechnoTypeClass.MaxPassengers             db"Passengers",0                  ;existing feature
str.TechnoTypeClass.SightRange                db"Sight",0                       ;existing feature
str.TechnoTypeClass.Cost                      db"Cost",0                        ;existing feature
str.TechnoTypeClass.Level                     db"TechLevel",0                   ;existing feature
str.TechnoTypeClass.Prerequisite              db"Prerequisite",0                ;existing feature
str.TechnoTypeClass.Risk                      db"Points",0                      ;existing feature
str.TechnoTypeClass.Reward                    db"Points",0                      ;existing feature
str.TechnoTypeClass.MaxSpeed                  db"Speed",0                       ;existing feature
str.TechnoTypeClass.Speed                     db"Speed",0                       ;existing feature
str.TechnoTypeClass.MaxAmmo                   db"Ammo",0                        ;existing feature
str.TechnoTypeClass.Ownable                   db"Owner",0                       ;existing feature

str.TechnoTypeClass.Facings                   db"Facings",0                     ;new ini feature
str.TechnoTypeClass.ROT                       db"ROT",0                         ;existing feature
str.TechnoTypeClass.PrimaryWeapon             db"Primary",0                     ;existing feature
str.TechnoTypeClass.SecondaryWeapon           db"Secondary",0                   ;existing feature
str.TechnoTypeClass.VerticalOffset            db"VerticalOffset",0              ;new ini feature
str.TechnoTypeClass.PrimaryOffset             db"PrimaryOffset",0               ;new ini feature
str.TechnoTypeClass.PrimaryLateral            db"PrimaryLateral",0              ;new ini feature
str.TechnoTypeClass.SecondaryOffset           db"SecondaryOffset",0             ;new ini feature
str.TechnoTypeClass.SecondaryLateral          db"SecondaryLateral",0            ;new ini feature
str.TechnoTypeClass.Points                    db"Points",0                      ;existing feature

str.TechnoTypeClass.DeathWeapon               db"DeathWeapon",0                 ;existing feature


%define TechnoTypeClass.IsDoubleOwned.Get(ptr_type,reg_output)               GetBool                                ptr_type, TechnoTypeClass.Offset.IsDoubleOwned, TechnoTypeClass.Bit.IsDoubleOwned, reg_output
%define TechnoTypeClass.IsDoubleOwned.Set(ptr_type,value)                    SetBool                                ptr_type, TechnoTypeClass.Offset.IsDoubleOwned, TechnoTypeClass.Bit.IsDoubleOwned, value
%define TechnoTypeClass.IsDoubleOwned.Read(ptr_type,ptr_rules)               AbstractTypeClass.ReadBool             ptr_type, ptr_rules, TechnoTypeClass.Offset.IsDoubleOwned, TechnoTypeClass.Bit.IsDoubleOwned, str.TechnoTypeClass.IsDoubleOwned

%define TechnoTypeClass.IsInvisible.Get(ptr_type,reg_output)                 GetBool                                ptr_type, TechnoTypeClass.Offset.IsInvisible, TechnoTypeClass.Bit.IsInvisible, reg_output
%define TechnoTypeClass.IsInvisible.Set(ptr_type,value)                      SetBool                                ptr_type, TechnoTypeClass.Offset.IsInvisible, TechnoTypeClass.Bit.IsInvisible, value
%define TechnoTypeClass.IsInvisible.Read(ptr_type,ptr_rules)                 AbstractTypeClass.ReadBool             ptr_type, ptr_rules, TechnoTypeClass.Offset.IsInvisible, TechnoTypeClass.Bit.IsInvisible, str.TechnoTypeClass.IsInvisible

%define TechnoTypeClass.IsLeader.Get(ptr_type,reg_output)                    GetBool                                ptr_type, TechnoTypeClass.Offset.IsLeader, TechnoTypeClass.Bit.IsLeader, reg_output
%define TechnoTypeClass.IsLeader.Set(ptr_type,value)                         SetBool                                ptr_type, TechnoTypeClass.Offset.IsLeader, TechnoTypeClass.Bit.IsLeader, value
%define TechnoTypeClass.IsLeader.Read(ptr_type,ptr_rules)                    AbstractTypeClass.ReadBool             ptr_type, ptr_rules, TechnoTypeClass.Offset.IsLeader, TechnoTypeClass.Bit.IsLeader, str.TechnoTypeClass.IsLeader

%define TechnoTypeClass.IsScanner.Get(ptr_type,reg_output)                   GetBool                                ptr_type, TechnoTypeClass.Offset.IsScanner, TechnoTypeClass.Bit.IsScanner, reg_output
%define TechnoTypeClass.IsScanner.Set(ptr_type,value)                        SetBool                                ptr_type, TechnoTypeClass.Offset.IsScanner, TechnoTypeClass.Bit.IsScanner, value
%define TechnoTypeClass.IsScanner.Read(ptr_type,ptr_rules)                   AbstractTypeClass.ReadBool             ptr_type, ptr_rules, TechnoTypeClass.Offset.IsScanner, TechnoTypeClass.Bit.IsScanner, str.TechnoTypeClass.IsScanner

%define TechnoTypeClass.IsNominal.Get(ptr_type,reg_output)                   GetBool                                ptr_type, TechnoTypeClass.Offset.IsNominal, TechnoTypeClass.Bit.IsNominal, reg_output
%define TechnoTypeClass.IsNominal.Set(ptr_type,value)                        SetBool                                ptr_type, TechnoTypeClass.Offset.IsNominal, TechnoTypeClass.Bit.IsNominal, value
%define TechnoTypeClass.IsNominal.Read(ptr_type,ptr_rules)                   AbstractTypeClass.ReadBool             ptr_type, ptr_rules, TechnoTypeClass.Offset.IsNominal, TechnoTypeClass.Bit.IsNominal, str.TechnoTypeClass.IsNominal

%define TechnoTypeClass.IsTheater.Get(ptr_type,reg_output)                   GetBool                                ptr_type, TechnoTypeClass.Offset.IsTheater, TechnoTypeClass.Bit.IsTheater, reg_output
%define TechnoTypeClass.IsTheater.Set(ptr_type,value)                        SetBool                                ptr_type, TechnoTypeClass.Offset.IsTheater, TechnoTypeClass.Bit.IsTheater, value
%define TechnoTypeClass.IsTheater.Read(ptr_type,ptr_rules)                   AbstractTypeClass.ReadBool             ptr_type, ptr_rules, TechnoTypeClass.Offset.IsTheater, TechnoTypeClass.Bit.IsTheater, str.TechnoTypeClass.IsTheater

%define TechnoTypeClass.HasTurret.Get(ptr_type,reg_output)                   GetBool                                ptr_type, TechnoTypeClass.Offset.HasTurret, TechnoTypeClass.Bit.HasTurret, reg_output
%define TechnoTypeClass.HasTurret.Set(ptr_type,value)                        SetBool                                ptr_type, TechnoTypeClass.Offset.HasTurret, TechnoTypeClass.Bit.HasTurret, value
%define TechnoTypeClass.HasTurret.Read(ptr_type,ptr_rules)                   AbstractTypeClass.ReadBool             ptr_type, ptr_rules, TechnoTypeClass.Offset.HasTurret, TechnoTypeClass.Bit.HasTurret, str.TechnoTypeClass.HasTurret

%define TechnoTypeClass.IsRepairable.Get(ptr_type,reg_output)                GetBool                                ptr_type, TechnoTypeClass.Offset.IsRepairable, TechnoTypeClass.Bit.IsRepairable, reg_output
%define TechnoTypeClass.IsRepairable.Set(ptr_type,value)                     SetBool                                ptr_type, TechnoTypeClass.Offset.IsRepairable, TechnoTypeClass.Bit.IsRepairable, value
%define TechnoTypeClass.IsRepairable.Read(ptr_type,ptr_rules)                AbstractTypeClass.ReadBool             ptr_type, ptr_rules, TechnoTypeClass.Offset.IsRepairable, TechnoTypeClass.Bit.IsRepairable, str.TechnoTypeClass.IsRepairable

%define TechnoTypeClass.IsCrew.Get(ptr_type,reg_output)                      GetBool                                ptr_type, TechnoTypeClass.Offset.IsCrew, TechnoTypeClass.Bit.IsCrew, reg_output
%define TechnoTypeClass.IsCrew.Set(ptr_type,value)                           SetBool                                ptr_type, TechnoTypeClass.Offset.IsCrew, TechnoTypeClass.Bit.IsCrew, value
%define TechnoTypeClass.IsCrew.Read(ptr_type,ptr_rules)                      AbstractTypeClass.ReadBool             ptr_type, ptr_rules, TechnoTypeClass.Offset.IsCrew, TechnoTypeClass.Bit.IsCrew, str.TechnoTypeClass.IsCrew

%define TechnoTypeClass.IsRemappable.Get(ptr_type,reg_output)                GetBool                                ptr_type, TechnoTypeClass.Offset.IsRemappable, TechnoTypeClass.Bit.IsRemappable, reg_output
%define TechnoTypeClass.IsRemappable.Set(ptr_type,value)                     SetBool                                ptr_type, TechnoTypeClass.Offset.IsRemappable, TechnoTypeClass.Bit.IsRemappable, value
%define TechnoTypeClass.IsRemappable.Read(ptr_type,ptr_rules)                AbstractTypeClass.ReadBool             ptr_type, ptr_rules, TechnoTypeClass.Offset.IsRemappable, TechnoTypeClass.Bit.IsRemappable, str.TechnoTypeClass.IsRemappable

%define TechnoTypeClass.IsCloakable.Get(ptr_type,reg_output)                 GetBool                                ptr_type, TechnoTypeClass.Offset.IsCloakable, TechnoTypeClass.Bit.IsCloakable, reg_output
%define TechnoTypeClass.IsCloakable.Set(ptr_type,value)                      SetBool                                ptr_type, TechnoTypeClass.Offset.IsCloakable, TechnoTypeClass.Bit.IsCloakable, value
%define TechnoTypeClass.IsCloakable.Read(ptr_type,ptr_rules)                 AbstractTypeClass.ReadBool             ptr_type, ptr_rules, TechnoTypeClass.Offset.IsCloakable, TechnoTypeClass.Bit.IsCloakable, str.TechnoTypeClass.IsCloakable

%define TechnoTypeClass.IsSelfHealing.Get(ptr_type,reg_output)               GetBool                                ptr_type, TechnoTypeClass.Offset.IsSelfHealing, TechnoTypeClass.Bit.IsSelfHealing, reg_output
%define TechnoTypeClass.IsSelfHealing.Set(ptr_type,value)                    SetBool                                ptr_type, TechnoTypeClass.Offset.IsSelfHealing, TechnoTypeClass.Bit.IsSelfHealing, value
%define TechnoTypeClass.IsSelfHealing.Read(ptr_type,ptr_rules)               AbstractTypeClass.ReadBool             ptr_type, ptr_rules, TechnoTypeClass.Offset.IsSelfHealing, TechnoTypeClass.Bit.IsSelfHealing, str.TechnoTypeClass.IsSelfHealing

%define TechnoTypeClass.IsExploding.Get(ptr_type,reg_output)                 GetBool                                ptr_type, TechnoTypeClass.Offset.IsExploding, TechnoTypeClass.Bit.IsExploding, reg_output
%define TechnoTypeClass.IsExploding.Set(ptr_type,value)                      SetBool                                ptr_type, TechnoTypeClass.Offset.IsExploding, TechnoTypeClass.Bit.IsExploding, value
%define TechnoTypeClass.IsExploding.Read(ptr_type,ptr_rules)                 AbstractTypeClass.ReadBool             ptr_type, ptr_rules, TechnoTypeClass.Offset.IsExploding, TechnoTypeClass.Bit.IsExploding, str.TechnoTypeClass.IsExploding

%define TechnoTypeClass.ManualAcquire.Get(ptr_type,reg_output)                 GetBool                                ptr_type, TechnoTypeClass.Offset.ManualAcquire, TechnoTypeClass.Bit.ManualAcquire, reg_output
%define TechnoTypeClass.ManualAcquire.Set(ptr_type,value)                      SetBool                                ptr_type, TechnoTypeClass.Offset.ManualAcquire, TechnoTypeClass.Bit.ManualAcquire, value
%define TechnoTypeClass.ManualAcquire.Read(ptr_type,ptr_rules)                 AbstractTypeClass.ReadBool             ptr_type, ptr_rules, TechnoTypeClass.Offset.ManualAcquire, TechnoTypeClass.Bit.ManualAcquire, str.TechnoTypeClass.ManualAcquire

%define TechnoTypeClass.PrereqType.Get(ptr_type,reg_output)                  GetByte                                ptr_type, TechnoTypeClass.Offset.PrereqType, reg_output
%define TechnoTypeClass.PrereqType.Set(ptr_type,value)                       SetByte                                ptr_type, TechnoTypeClass.Offset.PrereqType, value
%define TechnoTypeClass.PrereqType.Read(ptr_type,ptr_rules,function)         AbstractTypeClass.ReadStringToByteExt  ptr_type, ptr_rules, TechnoTypeClass.Offset.PrereqType, str.TechnoTypeClass.PrereqType, function

%define TechnoTypeClass.CloakSound.Get(ptr_type,reg_output)                  GetByte                                ptr_type, TechnoTypeClass.Offset.CloakSound, reg_output
%define TechnoTypeClass.CloakSound.Set(ptr_type,value)                       SetByte                                ptr_type, TechnoTypeClass.Offset.CloakSound, value
%define TechnoTypeClass.CloakSound.Read(ptr_type,ptr_rules,function)         AbstractTypeClass.ReadStringToByteExt  ptr_type, ptr_rules, TechnoTypeClass.Offset.CloakSound, str.TechnoTypeClass.CloakSound, function

%define TechnoTypeClass.Prerequisite.Get(ptr_type,reg_output)                GetInt                                ptr_type, TechnoTypeClass.Offset.Prerequisite, reg_output
%define TechnoTypeClass.Prerequisite.Set(ptr_type,value)                     SetInt                                ptr_type, TechnoTypeClass.Offset.Prerequisite, value
%define TechnoTypeClass.Prerequisite.Read(ptr_type,ptr_rules,function)       AbstractTypeClass.ReadStringExt        ptr_type, ptr_rules, TechnoTypeClass.Offset.Prerequisite, str.TechnoTypeClass.Prerequisite, function

%define TechnoTypeClass.MaxPassengers.Get(ptr_type,reg_output)               GetInt                                 ptr_type, TechnoTypeClass.Offset.MaxPassengers, reg_output
%define TechnoTypeClass.MaxPassengers.Set(ptr_type,value)                    SetInt                                 ptr_type, TechnoTypeClass.Offset.MaxPassengers, value
%define TechnoTypeClass.MaxPassengers.Read(ptr_type,ptr_rules)               AbstractTypeClass.ReadInt              ptr_type, ptr_rules, TechnoTypeClass.Offset.MaxPassengers, str.TechnoTypeClass.MaxPassengers

%define TechnoTypeClass.DeathWeapon.Get(ptr_type,reg_output)                 GetInt                                 ptr_type, TechnoTypeClass.Offset.DeathWeapon, reg_output
%define TechnoTypeClass.DeathWeapon.Set(ptr_type,value)                      SetInt                                 ptr_type, TechnoTypeClass.Offset.DeathWeapon, value
;%define TechnoTypeClass.DeathWeapon.Read(ptr_type,ptr_rules)                 AbstractTypeClass.ReadInt              ptr_type, ptr_rules, TechnoTypeClass.Offset.DeathWeapon, str.TechnoTypeClass.DeathWeapon
%define TechnoTypeClass.DeathWeapon.Read(ptr_type,ptr_rules,function)        AbstractTypeClass.ReadStringExt        ptr_type, ptr_rules, TechnoTypeClass.Offset.DeathWeapon, str.TechnoTypeClass.DeathWeapon, function

%define TechnoTypeClass.ExtPrerequisiteOffset.Get(ptr_type,reg_output)       GetWord                                ptr_type, TechnoTypeClass.Offset.ExtPrerequisiteOffset, reg_output
%define TechnoTypeClass.ExtPrerequisiteOffset.Set(ptr_type,value)            SetWord                                ptr_type, TechnoTypeClass.Offset.ExtPrerequisiteOffset, value

%define TechnoTypeClass.Facings.Get(ptr_type,reg_output)                     GetByte                                ptr_type, TechnoTypeClass.Offset.Facings, reg_output
%define TechnoTypeClass.Facings.Set(ptr_type,value)                          SetByte                                ptr_type, TechnoTypeClass.Offset.Facings, value
%define TechnoTypeClass.Facings.Read(ptr_type,ptr_rules)                     AbstractTypeClass.ReadByte             ptr_type, ptr_rules, TechnoTypeClass.Offset.Facings, str.TechnoTypeClass.Facings

%define TechnoTypeClass.MZone.Get(ptr_type,reg_output)                       GetByte                                ptr_type, TechnoTypeClass.Offset.MZone, reg_output
%define TechnoTypeClass.MZone.Set(ptr_type,value)                            SetByte                                ptr_type, TechnoTypeClass.Offset.MZone, value

%define TechnoTypeClass.Speed.Get(ptr_type,reg_output)                       GetByte                                ptr_type, TechnoTypeClass.Offset.Speed, reg_output
%define TechnoTypeClass.Speed.Set(ptr_type,value)                            SetByte                                ptr_type, TechnoTypeClass.Offset.Speed, value

%define TechnoTypeClass.MaxAmmo.Get(ptr_type,reg_output)                     GetInt                                 ptr_type, TechnoTypeClass.Offset.MaxAmmo, reg_output
%define TechnoTypeClass.MaxAmmo.Set(ptr_type,value)                          SetInt                                 ptr_type, TechnoTypeClass.Offset.MaxAmmo, value
%define TechnoTypeClass.MaxAmmo.Read(ptr_type,ptr_rules)                     AbstractTypeClass.ReadInt              ptr_type, ptr_rules, TechnoTypeClass.Offset.MaxAmmo, str.TechnoTypeClass.MaxAmmo

%define TechnoTypeClass.PrimaryWeapon.Get(ptr_type,reg_output)               GetInt                                 ptr_type, TechnoTypeClass.Offset.PrimaryWeapon, reg_output
%define TechnoTypeClass.PrimaryWeapon.Set(ptr_type,value)                    SetInt                                 ptr_type, TechnoTypeClass.Offset.PrimaryWeapon, value
;%define TechnoTypeClass.PrimaryWeapon.Read(ptr_type,ptr_rules)               AbstractTypeClass.ReadInt              ptr_type, ptr_rules, TechnoTypeClass.Offset.PrimaryWeapon, str.TechnoTypeClass.PrimaryWeapon
%define TechnoTypeClass.PrimaryWeapon.Read(ptr_type,ptr_rules,function)      AbstractTypeClass.ReadStringExt        ptr_type, ptr_rules, TechnoTypeClass.Offset.PrimaryWeapon, str.TechnoTypeClass.PrimaryWeapon, function

%define TechnoTypeClass.SecondaryWeapon.Get(ptr_type,reg_output)             GetInt                                 ptr_type, TechnoTypeClass.Offset.SecondaryWeapon, reg_output
%define TechnoTypeClass.SecondaryWeapon.Set(ptr_type,value)                  SetInt                                 ptr_type, TechnoTypeClass.Offset.SecondaryWeapon, value
;%define TechnoTypeClass.SecondaryWeapon.Read(ptr_type,ptr_rules)             AbstractTypeClass.ReadInt              ptr_type, ptr_rules, TechnoTypeClass.Offset.SecondaryWeapon, str.TechnoTypeClass.SecondaryWeapon
%define TechnoTypeClass.SecondaryWeapon.Read(ptr_type,ptr_rules,function)    AbstractTypeClass.ReadStringExt        ptr_type, ptr_rules, TechnoTypeClass.Offset.SecondaryWeapon, str.TechnoTypeClass.SecondaryWeapon, function


%define TechnoTypeClass.VerticalOffset.Get(ptr_type,reg_output)              GetInt                                 ptr_type, TechnoTypeClass.Offset.VerticalOffset, reg_output
%define TechnoTypeClass.VerticalOffset.Set(ptr_type,value)                   SetInt                                 ptr_type, TechnoTypeClass.Offset.VerticalOffset, value
%define TechnoTypeClass.VerticalOffset.Read(ptr_type,ptr_rules)              AbstractTypeClass.ReadInt              ptr_type, ptr_rules, TechnoTypeClass.Offset.VerticalOffset, str.TechnoTypeClass.VerticalOffset

%define TechnoTypeClass.PrimaryOffset.Get(ptr_type,reg_output)               GetInt                                 ptr_type, TechnoTypeClass.Offset.PrimaryOffset, reg_output
%define TechnoTypeClass.PrimaryOffset.Set(ptr_type,value)                    SetInt                                 ptr_type, TechnoTypeClass.Offset.PrimaryOffset, value
%define TechnoTypeClass.PrimaryOffset.Read(ptr_type,ptr_rules)               AbstractTypeClass.ReadInt              ptr_type, ptr_rules, TechnoTypeClass.Offset.PrimaryOffset, str.TechnoTypeClass.PrimaryOffset

%define TechnoTypeClass.PrimaryLateral.Get(ptr_type,reg_output)              GetInt                                 ptr_type, TechnoTypeClass.Offset.PrimaryLateral, reg_output
%define TechnoTypeClass.PrimaryLateral.Set(ptr_type,value)                   SetInt                                 ptr_type, TechnoTypeClass.Offset.PrimaryLateral, value
%define TechnoTypeClass.PrimaryLateral.Read(ptr_type,ptr_rules)              AbstractTypeClass.ReadInt              ptr_type, ptr_rules, TechnoTypeClass.Offset.PrimaryLateral, str.TechnoTypeClass.PrimaryLateral

%define TechnoTypeClass.SecondaryOffset.Get(ptr_type,reg_output)             GetInt                                 ptr_type, TechnoTypeClass.Offset.SecondaryOffset, reg_output
%define TechnoTypeClass.SecondaryOffset.Set(ptr_type,value)                  SetInt                                 ptr_type, TechnoTypeClass.Offset.SecondaryOffset, value
%define TechnoTypeClass.SecondaryOffset.Read(ptr_type,ptr_rules)             AbstractTypeClass.ReadInt              ptr_type, ptr_rules, TechnoTypeClass.Offset.SecondaryOffset, str.TechnoTypeClass.SecondaryOffset

%define TechnoTypeClass.SecondaryLateral.Get(ptr_type,reg_output)            GetInt                                 ptr_type, TechnoTypeClass.Offset.SecondaryLateral, reg_output
%define TechnoTypeClass.SecondaryLateral.Set(ptr_type,value)                 SetInt                                 ptr_type, TechnoTypeClass.Offset.SecondaryLateral, value
%define TechnoTypeClass.SecondaryLateral.Read(ptr_type,ptr_rules)            AbstractTypeClass.ReadInt              ptr_type, ptr_rules, TechnoTypeClass.Offset.SecondaryLateral, str.TechnoTypeClass.SecondaryLateral

%endif
