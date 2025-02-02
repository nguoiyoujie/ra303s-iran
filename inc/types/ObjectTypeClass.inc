;----------------------------------------------------------------
; inc/types/objecttypeclass.asm
;
; Macros to access ObjectTypeClass offsets
;
;----------------------------------------------------------------


; define object type field definitions
%define ObjectTypeClass.Offset.Unknown                   0x021    ; INT // 5FAAD0 for infantry
%define ObjectTypeClass.Offset.GraphicName               0x025    ; byte[256] // 
%define ObjectTypeClass.Offset.IsCrushable               0x125    ; BOOL // Already supported by game INI
%define ObjectTypeClass.Bit.IsCrushable                  1    
%define ObjectTypeClass.Offset.IsStealthy                0x125    ; BOOL
%define ObjectTypeClass.Bit.IsStealthy                   2    
%define ObjectTypeClass.Offset.IsSelectable              0x125    ; BOOL
%define ObjectTypeClass.Bit.IsSelectable                 3    
%define ObjectTypeClass.Offset.IsLegalTarget             0x125    ; BOOL
%define ObjectTypeClass.Bit.IsLegalTarget                4    
%define ObjectTypeClass.Offset.IsInsignificant           0x125    ; BOOL
%define ObjectTypeClass.Bit.IsInsignificant              5    
%define ObjectTypeClass.Offset.IsImmune                  0x125    ; BOOL // Already supported by game INI
%define ObjectTypeClass.Bit.IsImmune                     6    
%define ObjectTypeClass.Offset.IsSentient                0x125    ; BOOL
%define ObjectTypeClass.Bit.IsSentient                   7    
%define ObjectTypeClass.Offset.IsFootprint               0x125    ; BOOL
%define ObjectTypeClass.Bit.IsFootprint                  8    
; 0x126, 0x127 and 0x128 are empty
%define ObjectTypeClass.Offset.Armor                     0x129    ; byte
%define ObjectTypeClass.Offset.MaxStrength               0x12A    ; word
%define ObjectTypeClass.Offset.ImageData                 0x12C    ; INT PTR
%define ObjectTypeClass.Offset.DimensionData             0x130    ; INT PTR
%define ObjectTypeClass.Offset.RadarIcon                 0x134    ; INT PTR
; 0x021 - 0x137

; INI String controls
str.ObjectTypeClass.GraphicName               db"Image",0                  ;existing ini
str.ObjectTypeClass.IsCrushable               db"Crushable",0              ;existing ini
str.ObjectTypeClass.IsStealthy                db"Stealthed",0              ;internal feature
str.ObjectTypeClass.IsSelectable              db"Selectable",0             ;internal feature
str.ObjectTypeClass.IsLegalTarget             db"LegalTarget",0            ;internal feature
str.ObjectTypeClass.IsInsignificant           db"Insignificant",0          ;internal feature
str.ObjectTypeClass.IsImmune                  db"Immune",0                 ;existing ini
str.ObjectTypeClass.IsSentient                db"Sentient",0               ;internal feature
str.ObjectTypeClass.IsFootprint               db"IsFootprint",0            ;internal feature
str.ObjectTypeClass.Armor                     db"Armor",0                  ;existing ini
str.ObjectTypeClass.MaxStrength               db"Strength",0               ;existing ini
str.ObjectTypeClass.ImageData                 db"ImageData",0              ;internal feature
str.ObjectTypeClass.DimensionData             db"DimensionData",0          ;internal feature
str.ObjectTypeClass.RadarIcon                 db"RadarIcon",0              ;internal feature


;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

%define ObjectTypeClass.IsSelectable.Get(ptr_type,reg_output)                GetBool                                ptr_type, ObjectTypeClass.Offset.IsSelectable, ObjectTypeClass.Bit.IsSelectable, reg_output
%define ObjectTypeClass.IsSelectable.Set(ptr_type,value)                     SetBool                                ptr_type, ObjectTypeClass.Offset.IsSelectable, ObjectTypeClass.Bit.IsSelectable, value
%define ObjectTypeClass.IsSelectable.Read(ptr_type,ptr_rules)                AbstractTypeClass.ReadBool             ptr_type, ptr_rules, ObjectTypeClass.Offset.IsSelectable, ObjectTypeClass.Bit.IsSelectable, str.ObjectTypeClass.IsSelectable

%define ObjectTypeClass.IsInsignificant.Get(ptr_type,reg_output)             GetBool                                ptr_type, ObjectTypeClass.Offset.IsInsignificant, ObjectTypeClass.Bit.IsInsignificant, reg_output
%define ObjectTypeClass.IsInsignificant.Set(ptr_type,value)                  SetBool                                ptr_type, ObjectTypeClass.Offset.IsInsignificant, ObjectTypeClass.Bit.IsInsignificant, value
%define ObjectTypeClass.IsInsignificant.Read(ptr_type,ptr_rules)             AbstractTypeClass.ReadBool             ptr_type, ptr_rules, ObjectTypeClass.Offset.IsInsignificant, ObjectTypeClass.Bit.IsInsignificant, str.ObjectTypeClass.IsSelectable


;%define ObjectTypeClass.RTTI.Get(ptr_type,reg_output)                        GetByte                                ptr_type, ObjectTypeClass.Offset.RTTI, reg_output
;%define ObjectTypeClass.RTTI.Set(ptr_type,value)                             SetByte                                ptr_type, ObjectTypeClass.Offset.RTTI, value
;%define ObjectTypeClass.RTTI.Read(ptr_type,ptr_rules)                        AbstractTypeClass.ReadByte             ptr_type, ptr_rules, ObjectTypeClass.Offset.RTTI, str.ObjectTypeClass.RTTI  

;%define ObjectTypeClass.Index.Get(ptr_type,reg_output)                       GetInt                                 ptr_type, ObjectTypeClass.Offset.Index, reg_output
;%define ObjectTypeClass.Index.Set(ptr_type,value)                            SetInt                                 ptr_type, ObjectTypeClass.Offset.Index, value
;%define ObjectTypeClass.Index.Read(ptr_type,ptr_rules)                       AbstractTypeClass.ReadInt              ptr_type, ptr_rules, ObjectTypeClass.Offset.Index, str.ObjectTypeClass.Index

;%define ObjectTypeClass.StringTableName.Get(ptr_type,reg_output)             GetInt                                 ptr_type, ObjectTypeClass.Offset.StringTableName, reg_output
;%define ObjectTypeClass.StringTableName.Set(ptr_type,value)                  SetInt                                 ptr_type, ObjectTypeClass.Offset.StringTableName, value
;%define ObjectTypeClass.StringTableName.Read(ptr_type,ptr_rules)             AbstractTypeClass.ReadInt              ptr_type, ptr_rules, ObjectTypeClass.Offset.StringTableName, str.ObjectTypeClass.StringTableName

