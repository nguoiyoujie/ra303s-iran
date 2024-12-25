;----------------------------------------------------------------
; src/macros/abstracttypeclass.asm
;
; Macros to access AbstractTypeClass offsets
;
;----------------------------------------------------------------

; define abstract type field definitions
%define AbstractTypeClass.Offset.RTTI                      0x000    ; byte
%define AbstractTypeClass.Offset.Index                     0x001    ; INT
%define AbstractTypeClass.Offset.ININame                   0x002    ; byte[24]
%define AbstractTypeClass.Offset.StringTableName           0x01D    ; INT
; 0x021

; INI String controls
str.AbstractTypeClass.RTTI                      db"RTTI",0                ;internal feature
str.AbstractTypeClass.Index                     db"Index",0               ;internal feature
str.AbstractTypeClass.StringTableName           db"DefaultMission",0      ;internal feature

%define AbstractTypeClass.FromIndex(d_index,reg_output)                        TechnoTypeClass.FromIndex              d_index, AbstractTypeClass.Count, AbstractTypeClass.Array, reg_output
%define AbstractTypeClass.FromID(d_index,reg_output)                           TechnoTypeClass.FromID                 d_index, AbstractTypeClass.Count, AbstractTypeClass.Array, reg_output

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

%define AbstractTypeClass.RTTI.Get(ptr_type,reg_output)                        ObjectTypeClass.GetByte                ptr_type, AbstractTypeClass.Offset.RTTI, reg_output
;%define AbstractTypeClass.RTTI.Set(ptr_type,value)                             ObjectTypeClass.SetByte                ptr_type, AbstractTypeClass.Offset.RTTI, value
;%define AbstractTypeClass.RTTI.Read(ptr_type,ptr_rules)                        ObjectTypeClass.ReadByte               ptr_type, ptr_rules, AbstractTypeClass.Offset.RTTI, str.AbstractTypeClass.RTTI  

%define AbstractTypeClass.Index.Get(ptr_type,reg_output)                       ObjectTypeClass.GetInt                 ptr_type, AbstractTypeClass.Offset.Index, reg_output
;%define AbstractTypeClass.Index.Set(ptr_type,value)                            ObjectTypeClass.SetInt                 ptr_type, AbstractTypeClass.Offset.Index, value
;%define AbstractTypeClass.Index.Read(ptr_type,ptr_rules)                       ObjectTypeClass.ReadInt                ptr_type, ptr_rules, AbstractTypeClass.Offset.Index, str.AbstractTypeClass.Index

%define AbstractTypeClass.StringTableName.Get(ptr_type,reg_output)             ObjectTypeClass.GetInt                 ptr_type, AbstractTypeClass.Offset.StringTableName, reg_output
;%define AbstractTypeClass.StringTableName.Set(ptr_type,value)                  ObjectTypeClass.SetInt                 ptr_type, AbstractTypeClass.Offset.StringTableName, value
;%define AbstractTypeClass.StringTableName.Read(ptr_type,ptr_rules)             ObjectTypeClass.ReadInt                ptr_type, ptr_rules, AbstractTypeClass.Offset.StringTableName, str.AbstractTypeClass.StringTableName






