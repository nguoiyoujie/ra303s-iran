
; define array location where aircraft type classes are stored
%define Array_VesselTypeClass              0x0065DF6C
%define Count_VesselTypeClass              0x0065DF44

; define aircraft type field definitions
%define VesselTypeClass.Offset.IsPieceOfEight            0x192    ; BOOL, BIT 1
%define VesselTypeClass.Bit.IsPieceOfEight               1    
; 0x193, 0x194 and 0x195 are empty... 
%define VesselTypeClass.Offset.Type                      0x196    ; BYTE
%define VesselTypeClass.Offset.TurretOffset              0x197    ; BYTE
%define VesselTypeClass.Offset.DefaultMission            0x198    ; BYTE
%define VesselTypeClass.Offset.Explosion                 0x199    ; BYTE
%define VesselTypeClass.Offset.MaxSize                   0x19A    ; INT

; INI String controls
str.VesselTypeClass.IsPieceOfEight            db"IsPieceOfEight",0              ;new ini feature
str.VesselTypeClass.Type                      db"Type",0                        ;internal feature
str.VesselTypeClass.TurretOffset              db"TurretOffset",0                ;internal feature
str.VesselTypeClass.DefaultMission            db"DefaultMission",0              ;internal feature
str.VesselTypeClass.Explosion                 db"Explosion",0                   ;internal feature
str.VesselTypeClass.MaxSize                   db"MaxSize",0                     ;internal feature

%define VesselTypeClass.FromIndex(d_index,reg_output)                        TechnoTypeClass.FromIndex              d_index, Count_VesselTypeClass, Array_VesselTypeClass, reg_output
%define VesselTypeClass.FromID(d_index,reg_output)                           TechnoTypeClass.FromID                 d_index, Count_VesselTypeClass, Array_VesselTypeClass, reg_output

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

%define VesselTypeClass.IsPieceOfEight.Get(ptr_type,reg_output)              ObjectTypeClass.GetBool                ptr_type, VesselTypeClass.Offset.IsPieceOfEight, VesselTypeClass.Bit.IsPieceOfEight, reg_output
%define VesselTypeClass.IsPieceOfEight.Set(ptr_type,value)                   ObjectTypeClass.SetBool                ptr_type, VesselTypeClass.Offset.IsPieceOfEight, VesselTypeClass.Bit.IsPieceOfEight, value
%define VesselTypeClass.IsPieceOfEight.Read(ptr_type,ptr_rules)              ObjectTypeClass.ReadBool               ptr_type, ptr_rules, VesselTypeClass.Offset.IsPieceOfEight, VesselTypeClass.Bit.IsPieceOfEight, str.VesselTypeClass.IsPieceOfEight

%define VesselTypeClass.Type.Get(ptr_type,reg_output)                        ObjectTypeClass.GetInt                 ptr_type, VesselTypeClass.Offset.Type, reg_output
%define VesselTypeClass.Type.Set(ptr_type,value)                             ObjectTypeClass.SetInt                 ptr_type, VesselTypeClass.Offset.Type, value
%define VesselTypeClass.Type.Read(ptr_type,ptr_rules)                        ObjectTypeClass.ReadInt                ptr_type, ptr_rules, VesselTypeClass.Offset.Type, str.VesselTypeClass.Type

%define VesselTypeClass.TurretOffset.Get(ptr_type,reg_output)                ObjectTypeClass.GetByte                ptr_type, VesselTypeClass.Offset.TurretOffset, reg_output
%define VesselTypeClass.TurretOffset.Set(ptr_type,value)                     ObjectTypeClass.SetByte                ptr_type, VesselTypeClass.Offset.TurretOffset, value
%define VesselTypeClass.TurretOffset.Read(ptr_type,ptr_rules)                ObjectTypeClass.ReadByte               ptr_type, ptr_rules, VesselTypeClass.Offset.TurretOffset, str.VesselTypeClass.TurretOffset  

%define VesselTypeClass.DefaultMission.Get(ptr_type,reg_output)              ObjectTypeClass.GetByte                ptr_type, VesselTypeClass.Offset.DefaultMission, reg_output
%define VesselTypeClass.DefaultMission.Set(ptr_type,value)                   ObjectTypeClass.SetByte                ptr_type, VesselTypeClass.Offset.DefaultMission, value
%define VesselTypeClass.DefaultMission.Read(ptr_type,ptr_rules)              ObjectTypeClass.ReadByte               ptr_type, ptr_rules, VesselTypeClass.Offset.DefaultMission, str.VesselTypeClass.DefaultMission  

%define VesselTypeClass.Explosion.Get(ptr_type,reg_output)                   ObjectTypeClass.GetByte                ptr_type, VesselTypeClass.Offset.Explosion, reg_output
%define VesselTypeClass.Explosion.Set(ptr_type,value)                        ObjectTypeClass.SetByte                ptr_type, VesselTypeClass.Offset.Explosion, value
%define VesselTypeClass.Explosion.Read(ptr_type,ptr_rules)                   ObjectTypeClass.ReadByte               ptr_type, ptr_rules, VesselTypeClass.Offset.Explosion, str.VesselTypeClass.Explosion  

%define VesselTypeClass.MaxSize.Get(ptr_type,reg_output)                     ObjectTypeClass.GetInt                 ptr_type, VesselTypeClass.Offset.MaxSize, reg_output
%define VesselTypeClass.MaxSize.Set(ptr_type,value)                          ObjectTypeClass.SetInt                 ptr_type, VesselTypeClass.Offset.MaxSize, value
%define VesselTypeClass.MaxSize.Read(ptr_type,ptr_rules)                     ObjectTypeClass.ReadInt                ptr_type, ptr_rules, VesselTypeClass.Offset.MaxSize, str.VesselTypeClass.MaxSize






