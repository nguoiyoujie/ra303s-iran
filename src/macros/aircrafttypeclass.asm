;----------------------------------------------------------------
; src/macros/aircrafttypeclass.asm
;
; Macros to access AircraftTypeClass offsets
;
;----------------------------------------------------------------

; define aircraft type field definitions
%define AircraftTypeClass.Offset.IsFixedWing                 0x192    ; BOOL, BIT 1
%define AircraftTypeClass.Bit.IsFixedWing                    1    
%define AircraftTypeClass.Offset.IsLandable                  0x192    ; BOOL, BIT 2
%define AircraftTypeClass.Bit.IsLandable                     2    
%define AircraftTypeClass.Offset.IsRotorEquipped             0x192    ; BOOL, BIT 3
%define AircraftTypeClass.Bit.IsRotorEquipped                3    
%define AircraftTypeClass.Offset.IsRotorCustom               0x192    ; BOOL, BIT 4
%define AircraftTypeClass.Bit.IsRotorCustom                  4    
; 0x193, 0x194 and 0x195 are empty...                        
%define AircraftTypeClass.Offset.Type                        0x196    ; byte
%define AircraftTypeClass.Offset.DefaultMission              0x197    ; byte
%define AircraftTypeClass.Offset.PreferredBuilding           0x198    ; byte ; hardcode to 0E (Helipad) or 10 (Airstrip) depending on IsFixedWing for now
%define AircraftTypeClass.Offset.LandingSpeed                0x199    ; INT

; Extended space (>= 0x19D)
%define AircraftTypeClass.Offset.ExtendedPrerequisite        0x19D    ; INTx8
%define AircraftTypeClass.Offset.Response_Select             0x21D    ; INT
%define AircraftTypeClass.Offset.Response_Select_Data        0x221    ; word x16
%define AircraftTypeClass.Offset.Response_Move               0x241    ; INT
%define AircraftTypeClass.Offset.Response_Move_Data          0x245    ; word x16
%define AircraftTypeClass.Offset.Response_Attack             0x265    ; INT
%define AircraftTypeClass.Offset.Response_Attack_Data        0x269    ; word x16
;0x289

; INI String controls
str.AircraftTypeClass.IsFixedWing               db"IsFixedWing",0                 ;new ini feature
str.AircraftTypeClass.IsLandable                db"IsLandable",0                  ;new ini feature
str.AircraftTypeClass.IsRotorEquipped           db"IsRotorEquipped",0             ;new ini feature
str.AircraftTypeClass.IsRotorCustom             db"IsRotorCustom",0               ;new ini feature
str.AircraftTypeClass.PreferredBuilding         db"PreferredBuilding",0           ;internal feature
str.AircraftTypeClass.Type                      db"Type",0                        ;internal feature
str.AircraftTypeClass.DefaultMission            db"DefaultMission",0              ;internal feature
str.AircraftTypeClass.LandingSpeed              db"LandingSpeed",0                ;new ini feature
str.AircraftTypeClass.Response_Select           db"ResponseSelect",0              ;new ini feature
str.AircraftTypeClass.Response_Move             db"ResponseMove",0                ;new ini feature
str.AircraftTypeClass.Response_Attack           db"ResponseAttack",0              ;new ini feature

%define AircraftTypeClass.FromIndex(d_index,reg_output)                        AbstractTypeClass.FromIndex              d_index, AircraftTypeClass.Count, AircraftTypeClass.Array, reg_output
%define AircraftTypeClass.FromID(d_index,reg_output)                           AbstractTypeClass.FromID                 d_index, AircraftTypeClass.Count, AircraftTypeClass.Array, reg_output

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

%define AircraftTypeClass.IsFixedWing.Get(ptr_type,reg_output)                 ObjectTypeClass.GetBool                ptr_type, AircraftTypeClass.Offset.IsFixedWing, AircraftTypeClass.Bit.IsFixedWing, reg_output
%define AircraftTypeClass.IsFixedWing.Set(ptr_type,value)                      ObjectTypeClass.SetBool                ptr_type, AircraftTypeClass.Offset.IsFixedWing, AircraftTypeClass.Bit.IsFixedWing, value
%define AircraftTypeClass.IsFixedWing.Read(ptr_type,ptr_rules)                 ObjectTypeClass.ReadBool               ptr_type, ptr_rules, AircraftTypeClass.Offset.IsFixedWing, AircraftTypeClass.Bit.IsFixedWing, str.AircraftTypeClass.IsFixedWing

%define AircraftTypeClass.IsLandable.Get(ptr_type,reg_output)                  ObjectTypeClass.GetBool                ptr_type, AircraftTypeClass.Offset.IsLandable, AircraftTypeClass.Bit.IsLandable, reg_output
%define AircraftTypeClass.IsLandable.Set(ptr_type,value)                       ObjectTypeClass.SetBool                ptr_type, AircraftTypeClass.Offset.IsLandable, AircraftTypeClass.Bit.IsLandable, value
%define AircraftTypeClass.IsLandable.Read(ptr_type,ptr_rules)                  ObjectTypeClass.ReadBool               ptr_type, ptr_rules, AircraftTypeClass.Offset.IsLandable, AircraftTypeClass.Bit.IsLandable, str.AircraftTypeClass.IsLandable

%define AircraftTypeClass.IsRotorEquipped.Get(ptr_type,reg_output)             ObjectTypeClass.GetBool                ptr_type, AircraftTypeClass.Offset.IsRotorEquipped, AircraftTypeClass.Bit.IsRotorEquipped, reg_output
%define AircraftTypeClass.IsRotorEquipped.Set(ptr_type,value)                  ObjectTypeClass.SetBool                ptr_type, AircraftTypeClass.Offset.IsRotorEquipped, AircraftTypeClass.Bit.IsRotorEquipped, value
%define AircraftTypeClass.IsRotorEquipped.Read(ptr_type,ptr_rules)             ObjectTypeClass.ReadBool               ptr_type, ptr_rules, AircraftTypeClass.Offset.IsRotorEquipped, AircraftTypeClass.Bit.IsRotorEquipped, str.AircraftTypeClass.IsRotorEquipped

%define AircraftTypeClass.IsRotorCustom.Get(ptr_type,reg_output)               ObjectTypeClass.GetBool                ptr_type, AircraftTypeClass.Offset.IsRotorCustom, AircraftTypeClass.Bit.IsRotorCustom, reg_output
%define AircraftTypeClass.IsRotorCustom.Set(ptr_type,value)                    ObjectTypeClass.SetBool                ptr_type, AircraftTypeClass.Offset.IsRotorCustom, AircraftTypeClass.Bit.IsRotorCustom, value
%define AircraftTypeClass.IsRotorCustom.Read(ptr_type,ptr_rules)               ObjectTypeClass.ReadBool               ptr_type, ptr_rules, AircraftTypeClass.Offset.IsRotorCustom, AircraftTypeClass.Bit.IsRotorCustom, str.AircraftTypeClass.IsRotorCustom

%define AircraftTypeClass.Type.Get(ptr_type,reg_output)                        ObjectTypeClass.GetInt                 ptr_type, AircraftTypeClass.Offset.Type, reg_output
%define AircraftTypeClass.Type.Set(ptr_type,value)                             ObjectTypeClass.SetInt                 ptr_type, AircraftTypeClass.Offset.Type, value
%define AircraftTypeClass.Type.Read(ptr_type,ptr_rules)                        ObjectTypeClass.ReadInt                ptr_type, ptr_rules, AircraftTypeClass.Offset.Type, str.AircraftTypeClass.Type

%define AircraftTypeClass.DefaultMission.Get(ptr_type,reg_output)              ObjectTypeClass.GetByte                ptr_type, AircraftTypeClass.Offset.DefaultMission, reg_output
%define AircraftTypeClass.DefaultMission.Set(ptr_type,value)                   ObjectTypeClass.SetByte                ptr_type, AircraftTypeClass.Offset.DefaultMission, value
%define AircraftTypeClass.DefaultMission.Read(ptr_type,ptr_rules)              ObjectTypeClass.ReadByte               ptr_type, ptr_rules, AircraftTypeClass.Offset.DefaultMission, str.AircraftTypeClass.DefaultMission  

%define AircraftTypeClass.PreferredBuilding.Get(ptr_type,reg_output)           ObjectTypeClass.GetByte                ptr_type, AircraftTypeClass.Offset.PreferredBuilding, reg_output
%define AircraftTypeClass.PreferredBuilding.Set(ptr_type,value)                ObjectTypeClass.SetByte                ptr_type, AircraftTypeClass.Offset.PreferredBuilding, value
;%define AircraftTypeClass.PreferredBuilding.Read(ptr_type,ptr_rules)           ObjectTypeClass.ReadByte               ptr_type, ptr_rules, AircraftTypeClass.Offset.PreferredBuilding, str.AircraftTypeClass.PreferredBuilding  

%define AircraftTypeClass.LandingSpeed.Get(ptr_type,reg_output)                ObjectTypeClass.GetInt                 ptr_type, AircraftTypeClass.Offset.LandingSpeed, reg_output
%define AircraftTypeClass.LandingSpeed.Set(ptr_type,value)                     ObjectTypeClass.SetInt                 ptr_type, AircraftTypeClass.Offset.LandingSpeed, value
%define AircraftTypeClass.LandingSpeed.Read(ptr_type,ptr_rules)                ObjectTypeClass.ReadInt                ptr_type, ptr_rules, AircraftTypeClass.Offset.LandingSpeed, str.AircraftTypeClass.LandingSpeed

%define AircraftTypeClass.Response_Select.Get(ptr_type,reg_output)             ObjectTypeClass.GetInt                 ptr_type, AircraftTypeClass.Offset.Response_Select, reg_output
%define AircraftTypeClass.Response_Select_Data.Get(ptr_type,reg_output)        ObjectTypeClass.GetWord                ptr_type, AircraftTypeClass.Offset.Response_Select_Data, reg_output
%define AircraftTypeClass.Response_Select.Read(ptr_type,ptr_rules,function)    ObjectTypeClass.ReadStringExt          ptr_type, ptr_rules, AircraftTypeClass.Offset.Response_Select, str.AircraftTypeClass.Response_Select, function

%define AircraftTypeClass.Response_Move.Get(ptr_type,reg_output)               ObjectTypeClass.GetInt                 ptr_type, AircraftTypeClass.Offset.Response_Move, reg_output
%define AircraftTypeClass.Response_Move_Data.Get(ptr_type,reg_output)          ObjectTypeClass.GetWord                ptr_type, AircraftTypeClass.Offset.Response_Move_Data, reg_output
%define AircraftTypeClass.Response_Move.Read(ptr_type,ptr_rules,function)      ObjectTypeClass.ReadStringExt          ptr_type, ptr_rules, AircraftTypeClass.Offset.Response_Move, str.AircraftTypeClass.Response_Move, function

%define AircraftTypeClass.Response_Attack.Get(ptr_type,reg_output)             ObjectTypeClass.GetInt                 ptr_type, AircraftTypeClass.Offset.Response_Attack, reg_output
%define AircraftTypeClass.Response_Attack_Data.Get(ptr_type,reg_output)        ObjectTypeClass.GetWord                ptr_type, AircraftTypeClass.Offset.Response_Attack_Data, reg_output
%define AircraftTypeClass.Response_Attack.Read(ptr_type,ptr_rules,function)    ObjectTypeClass.ReadStringExt          ptr_type, ptr_rules, AircraftTypeClass.Offset.Response_Attack, str.AircraftTypeClass.Response_Attack, function


_GetAircraftTypeIDFromString:
    ;select UnitType by performing string compare on eax
    push ebx
    cmp  eax,0
    jle  .Retn ; just return 0
    AircraftTypeClass.FromID(eax,ebx)
    ;in case the ID was invalid...
    test ebx,ebx
    jz   .Retn ; just return 0
    mov  ebx,dword [ebx+1]; index
	;ObjectTypeClass.ID ebx,ebx
    mov  eax,ebx
.Retn:
    pop ebx
    retn
