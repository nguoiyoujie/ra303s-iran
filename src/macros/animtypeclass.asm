;----------------------------------------------------------------
; src/macros/animtypeclass.asm
;
; Macros to access AnimTypeClass offsets
;
;----------------------------------------------------------------
; NOTE: for the moment this does nothing as AnimTypes did not come with Read_INI. That has to be implemented firxt.

; define anim type field definitions
%define AnimTypeClass.Offset.IsNormalized                  0x138    ; BOOL
%define AnimTypeClass.Bit.IsNormalized                     1    
%define AnimTypeClass.Offset.IsGroundLayer                 0x138    ; BOOL
%define AnimTypeClass.Bit.IsGroundLayer                    2    
%define AnimTypeClass.Offset.IsTranslucent                 0x138    ; BOOL
%define AnimTypeClass.Bit.IsTranslucent                    3    
%define AnimTypeClass.Offset.IsWhiteTrans                  0x138    ; BOOL
%define AnimTypeClass.Bit.IsWhiteTrans                     4    
%define AnimTypeClass.Offset.IsFlameThrower                0x138    ; BOOL ; not used in RA1
%define AnimTypeClass.Bit.IsFlameThrower                   5    
%define AnimTypeClass.Offset.IsScorcher                    0x138    ; BOOL
%define AnimTypeClass.Bit.IsScorcher                       6    
%define AnimTypeClass.Offset.IsCraterForming               0x138    ; BOOL
%define AnimTypeClass.Bit.IsCraterForming                  7    
%define AnimTypeClass.Offset.IsSticky                      0x138    ; BOOL ; not used in RA1
%define AnimTypeClass.Bit.IsSticky                         8    
%define AnimTypeClass.Offset.IsTheater                     0x139    ; BOOL
%define AnimTypeClass.Bit.IsTheater                        1
; 0x13A and 0x13B are unused due to padding
%define AnimTypeClass.Offset.Type                          0x13C   ; byte (AnimType)
%define AnimTypeClass.Offset.Size                          0x13D   ; INT
%define AnimTypeClass.Offset.Biggest                       0x141   ; INT
%define AnimTypeClass.Offset.Damage                        0x145   ; fixed // fixed is word, in units of 1/256
%define AnimTypeClass.Offset.Delay                         0x147   ; INT
%define AnimTypeClass.Offset.Start                         0x14B   ; INT
%define AnimTypeClass.Offset.LoopStart                     0x14F   ; INT
%define AnimTypeClass.Offset.LoopEnd                       0x153   ; INT
%define AnimTypeClass.Offset.Stages                        0x157   ; INT
%define AnimTypeClass.Offset.Loops                         0x15B   ; INT
%define AnimTypeClass.Offset.Sound                         0x15F   ; word (VocType)
%define AnimTypeClass.Offset.ChainTo                       0x161   ; byte (AnimType)
; 0x162

;
;; INI String controls
%define str.AnimTypeClass.IsNormalized          db"IsNormalized",0                 ;internal feature
%define str.AnimTypeClass.IsGroundLayer         db"IsGroundLayer",0                ;internal feature
%define str.AnimTypeClass.IsTranslucent         db"IsTranslucent",0                ;internal feature
%define str.AnimTypeClass.IsWhiteTrans          db"IsWhiteTrans",0                 ;internal feature
%define str.AnimTypeClass.IsFlameThrower        db"IsFlameThrower",0               ;internal feature
%define str.AnimTypeClass.IsScorcher            db"IsScorcher",0                   ;internal feature
%define str.AnimTypeClass.IsCraterForming       db"IsCraterForming",0              ;internal feature
%define str.AnimTypeClass.IsSticky              db"IsSticky",0                     ;internal feature
%define str.AnimTypeClass.IsTheater             db"IsTheater",0                    ;internal feature
%define str.AnimTypeClass.Biggest               db"Biggest",0                      ;internal feature
%define str.AnimTypeClass.Damage                db"Damage",0                       ;internal feature
%define str.AnimTypeClass.Delay                 db"Delay",0                        ;internal feature
%define str.AnimTypeClass.Start                 db"Start",0                        ;internal feature
%define str.AnimTypeClass.LoopStart             db"LoopStart",0                    ;internal feature
%define str.AnimTypeClass.LoopEnd               db"LoopEnd",0                      ;internal feature
%define str.AnimTypeClass.Stages                db"Stages",0                       ;internal feature
%define str.AnimTypeClass.Loops                 db"Loops",0                        ;internal feature
%define str.AnimTypeClass.Sound                 db"Sound",0                        ;internal feature
%define str.AnimTypeClass.ChainTo               db"ChainTo",0                      ;internal feature


;%define AnimTypeClass.FromIndex(d_index,reg_output)                        AbstractTypeClass.FromIndex              d_index, AircraftTypeClass.Count, ;%define AircraftTypeClass.FromIndex(d_index,reg_output)                        AbstractTypeClass.FromIndex              d_index, AircraftTypeClass.Array, reg_output
;%define AnimTypeClass.FromID(d_index,reg_output)                           AbstractTypeClass.FromID                 d_index, AircraftTypeClass.Count, ;%define AircraftTypeClass.FromID(d_index,reg_output)                           AbstractTypeClass.FromID                 d_index, AircraftTypeClass.Array, reg_output
;
;;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;
;
;%define AircraftTypeClass.IsFixedWing.Get(ptr_type,reg_output)                 GetBool                                ptr_type, AircraftTypeClass.Offset.IsFixedWing, AircraftTypeClass.Bit.IsFixedWing, reg_output
;%define AircraftTypeClass.IsFixedWing.Set(ptr_type,value)                      SetBool                                ptr_type, AircraftTypeClass.Offset.IsFixedWing, AircraftTypeClass.Bit.IsFixedWing, value
;%define AircraftTypeClass.IsFixedWing.Read(ptr_type,ptr_rules)                 AbstractTypeClass.ReadBool             ptr_type, ptr_rules, AircraftTypeClass.Offset.IsFixedWing, AircraftTypeClass.Bit.IsFixedWing, str.AircraftTypeClass.IsFixedWing
;
;%define AircraftTypeClass.IsLandable.Get(ptr_type,reg_output)                  GetBool                                ptr_type, AircraftTypeClass.Offset.IsLandable, AircraftTypeClass.Bit.IsLandable, reg_output
;%define AircraftTypeClass.IsLandable.Set(ptr_type,value)                       SetBool                                ptr_type, AircraftTypeClass.Offset.IsLandable, AircraftTypeClass.Bit.IsLandable, value
;%define AircraftTypeClass.IsLandable.Read(ptr_type,ptr_rules)                  AbstractTypeClass.ReadBool             ptr_type, ptr_rules, AircraftTypeClass.Offset.IsLandable, AircraftTypeClass.Bit.IsLandable, str.AircraftTypeClass.IsLandable
;
;%define AircraftTypeClass.IsRotorEquipped.Get(ptr_type,reg_output)             GetBool                                ptr_type, AircraftTypeClass.Offset.IsRotorEquipped, AircraftTypeClass.Bit.IsRotorEquipped, reg_output
;%define AircraftTypeClass.IsRotorEquipped.Set(ptr_type,value)                  SetBool                                ptr_type, AircraftTypeClass.Offset.IsRotorEquipped, AircraftTypeClass.Bit.IsRotorEquipped, value
;%define AircraftTypeClass.IsRotorEquipped.Read(ptr_type,ptr_rules)             AbstractTypeClass.ReadBool             ptr_type, ptr_rules, AircraftTypeClass.Offset.IsRotorEquipped, AircraftTypeClass.Bit.IsRotorEquipped, str.AircraftTypeClass.IsRotorEquipped
;
;%define AircraftTypeClass.IsRotorCustom.Get(ptr_type,reg_output)               GetBool                                ptr_type, AircraftTypeClass.Offset.IsRotorCustom, AircraftTypeClass.Bit.IsRotorCustom, reg_output
;%define AircraftTypeClass.IsRotorCustom.Set(ptr_type,value)                    SetBool                                ptr_type, AircraftTypeClass.Offset.IsRotorCustom, AircraftTypeClass.Bit.IsRotorCustom, value
;%define AircraftTypeClass.IsRotorCustom.Read(ptr_type,ptr_rules)               AbstractTypeClass.ReadBool             ptr_type, ptr_rules, AircraftTypeClass.Offset.IsRotorCustom, AircraftTypeClass.Bit.IsRotorCustom, str.AircraftTypeClass.IsRotorCustom
;
;%define AircraftTypeClass.Type.Get(ptr_type,reg_output)                        GetInt                                 ptr_type, AircraftTypeClass.Offset.Type, reg_output
;%define AircraftTypeClass.Type.Set(ptr_type,value)                             SetInt                                 ptr_type, AircraftTypeClass.Offset.Type, value
;%define AircraftTypeClass.Type.Read(ptr_type,ptr_rules)                        AbstractTypeClass.ReadInt              ptr_type, ptr_rules, AircraftTypeClass.Offset.Type, str.AircraftTypeClass.Type
;
;%define AircraftTypeClass.DefaultMission.Get(ptr_type,reg_output)              GetByte                                ptr_type, AircraftTypeClass.Offset.DefaultMission, reg_output
;%define AircraftTypeClass.DefaultMission.Set(ptr_type,value)                   SetByte                                ptr_type, AircraftTypeClass.Offset.DefaultMission, value
;%define AircraftTypeClass.DefaultMission.Read(ptr_type,ptr_rules)              AbstractTypeClass.ReadByte             ptr_type, ptr_rules, AircraftTypeClass.Offset.DefaultMission, str.AircraftTypeClass.DefaultMission  
;
;%define AircraftTypeClass.PreferredBuilding.Get(ptr_type,reg_output)           GetByte                                ptr_type, AircraftTypeClass.Offset.PreferredBuilding, reg_output
;%define AircraftTypeClass.PreferredBuilding.Set(ptr_type,value)                SetByte                                ptr_type, AircraftTypeClass.Offset.PreferredBuilding, value
;;%define AircraftTypeClass.PreferredBuilding.Read(ptr_type,ptr_rules)           AbstractTypeClass.ReadByte             ptr_type, ptr_rules, AircraftTypeClass.Offset.PreferredBuilding, str.AircraftTypeClass.PreferredBuilding  
;
;%define AircraftTypeClass.LandingSpeed.Get(ptr_type,reg_output)                GetInt                                 ptr_type, AircraftTypeClass.Offset.LandingSpeed, reg_output
;%define AircraftTypeClass.LandingSpeed.Set(ptr_type,value)                     SetInt                                 ptr_type, AircraftTypeClass.Offset.LandingSpeed, value
;%define AircraftTypeClass.LandingSpeed.Read(ptr_type,ptr_rules)                AbstractTypeClass.ReadInt              ptr_type, ptr_rules, AircraftTypeClass.Offset.LandingSpeed, str.AircraftTypeClass.LandingSpeed






