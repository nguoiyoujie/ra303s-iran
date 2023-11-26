;----------------------------------------------------------------
; src/macros/infantrytypeclass.asm
;
; Macros to access InfantryTypeClass offsets
;
;----------------------------------------------------------------

; define array location where infantry type classes are stored
%define InfantryTypeClass.Array            0x0065DE3C
%define InfantryTypeClass.Count            0x0065DE14

; define infantry type field definitions
%define InfantryTypeClass.Offset.IsFemale                  0x192    ; BOOL
%define InfantryTypeClass.Bit.IsFemale                     1    
%define InfantryTypeClass.Offset.IsCrawling                0x192    ; BOOL
%define InfantryTypeClass.Bit.IsCrawling                   2    
%define InfantryTypeClass.Offset.IsCapture                 0x192    ; BOOL // Already supported by game INI
%define InfantryTypeClass.Bit.IsCapture                    3    
%define InfantryTypeClass.Offset.IsFraidyCat               0x192    ; BOOL // Already supported by game INI
%define InfantryTypeClass.Bit.IsFraidyCat                  4    
%define InfantryTypeClass.Offset.IsCivilian                0x192    ; BOOL
%define InfantryTypeClass.Bit.IsCivilian                   5    
%define InfantryTypeClass.Offset.IsBomber                  0x192    ; BOOL // Already supported by game INI
%define InfantryTypeClass.Bit.IsBomber                     6    
%define InfantryTypeClass.Offset.IsDog                     0x192    ; BOOL // Already supported by game INI
%define InfantryTypeClass.Bit.IsDog                        7    
%define InfantryTypeClass.Offset.IsRemapOverride           0x192    ; BOOL // Already supported by game INI
%define InfantryTypeClass.Bit.IsRemapOverride              8    
; 0x193, 0x194 and 0x195 are empty... 
%define InfantryTypeClass.Offset.Type                      0x196    ; byte
%define InfantryTypeClass.Offset.Pip                       0x197    ; byte, PipEnum: 0 PIP_EMPTY, 1 PIP_FULL, 5 PIP_ENGINEER, 6 PIP_CIVILIAN, 7 PIP_COMMANDO, others for funky results, might be able to add new pips by extending pips.shp beyond 22 frames?
%define InfantryTypeClass.Offset.DoControls                0x198    ; INT PTR to STRUCT
%define InfantryTypeClass.Offset.FireFrame                 0x19C    ; byte
%define InfantryTypeClass.Offset.ProneFireFrame            0x19D    ; byte
%define InfantryTypeClass.Offset.OverrideRemap             0x19E    ; INT PTR to byte*

; Extended space (>= 0x1A2)
%define InfantryTypeClass.Offset.ExtendedPrerequisite              0x1A2    ; INTx8

; INI String controls
str.InfantryTypeClass.IsFemale                  db"IsFemale",0                    ;new ini feature
str.InfantryTypeClass.IsCrawling                db"IsCrawling",0                  ;new ini feature
str.InfantryTypeClass.IsCapture                 db"Infiltrate",0                  ;existing ini
str.InfantryTypeClass.IsFraidyCat               db"IsFraidyCat",0                 ;existing ini
str.InfantryTypeClass.IsCivilian                db"IsCivilian",0                  ;new ini feature
str.InfantryTypeClass.IsBomber                  db"C4",0                          ;existing ini
str.InfantryTypeClass.IsDog                     db"IsDog",0                       ;existing ini
str.InfantryTypeClass.IsRemapOverride           db"IsRemapOverride",0             ;for civilian remap
str.InfantryTypeClass.Type                      db"Type",0                        ;?to check?
str.InfantryTypeClass.Pip                       db"Pip",0                         ;new ini feature
str.InfantryTypeClass.DoControls                db"DoControls",0                  ;?to implement?
str.InfantryTypeClass.FireFrame                 db"FireFrame",0                   ;new ini feature
str.InfantryTypeClass.ProneFireFrame            db"ProneFireFrame",0              ;new ini feature
str.InfantryTypeClass.OverrideRemap             db"OverrideRemap",0               ;for civilian remap


%define InfantryTypeClass.FromIndex(d_index,reg_output)                        TechnoTypeClass.FromIndex              d_index, InfantryTypeClass.Count, InfantryTypeClass.Array, reg_output
%define InfantryTypeClass.FromID(d_index,reg_output)                           TechnoTypeClass.FromID                 d_index, InfantryTypeClass.Count, InfantryTypeClass.Array, reg_output

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

%define InfantryTypeClass.IsFemale.Get(ptr_type,reg_output)                    ObjectTypeClass.GetBool                ptr_type, InfantryTypeClass.Offset.IsFemale, InfantryTypeClass.Bit.IsFemale, reg_output
%define InfantryTypeClass.IsFemale.Set(ptr_type,value)                         ObjectTypeClass.SetBool                ptr_type, InfantryTypeClass.Offset.IsFemale, InfantryTypeClass.Bit.IsFemale, value
%define InfantryTypeClass.IsFemale.Read(ptr_type,ptr_rules)                    ObjectTypeClass.ReadBool               ptr_type, ptr_rules, InfantryTypeClass.Offset.IsFemale, InfantryTypeClass.Bit.IsFemale, str.InfantryTypeClass.IsFemale

%define InfantryTypeClass.IsCrawling.Get(ptr_type,reg_output)                  ObjectTypeClass.GetBool                ptr_type, InfantryTypeClass.Offset.IsCrawling, InfantryTypeClass.Bit.IsCrawling, reg_output
%define InfantryTypeClass.IsCrawling.Set(ptr_type,value)                       ObjectTypeClass.SetBool                ptr_type, InfantryTypeClass.Offset.IsCrawling, InfantryTypeClass.Bit.IsCrawling, value
%define InfantryTypeClass.IsCrawling.Read(ptr_type,ptr_rules)                  ObjectTypeClass.ReadBool               ptr_type, ptr_rules, InfantryTypeClass.Offset.IsCrawling, InfantryTypeClass.Bit.IsCrawling, str.InfantryTypeClass.IsCrawling

%define InfantryTypeClass.IsCapture.Get(ptr_type,reg_output)                   ObjectTypeClass.GetBool                ptr_type, InfantryTypeClass.Offset.IsCapture, InfantryTypeClass.Bit.IsCapture, reg_output
%define InfantryTypeClass.IsCapture.Set(ptr_type,value)                        ObjectTypeClass.SetBool                ptr_type, InfantryTypeClass.Offset.IsCapture, InfantryTypeClass.Bit.IsCapture, value
%define InfantryTypeClass.IsCapture.Read(ptr_type,ptr_rules)                   ObjectTypeClass.ReadBool               ptr_type, ptr_rules, InfantryTypeClass.Offset.IsCapture, InfantryTypeClass.Bit.IsCapture, str.InfantryTypeClass.IsCapture

%define InfantryTypeClass.IsFraidyCat.Get(ptr_type,reg_output)                 ObjectTypeClass.GetBool                ptr_type, InfantryTypeClass.Offset.IsFraidyCat, InfantryTypeClass.Bit.IsFraidyCat, reg_output
%define InfantryTypeClass.IsFraidyCat.Set(ptr_type,value)                      ObjectTypeClass.SetBool                ptr_type, InfantryTypeClass.Offset.IsFraidyCat, InfantryTypeClass.Bit.IsFraidyCat, value
%define InfantryTypeClass.IsFraidyCat.Read(ptr_type,ptr_rules)                 ObjectTypeClass.ReadBool               ptr_type, ptr_rules, InfantryTypeClass.Offset.IsFraidyCat, InfantryTypeClass.Bit.IsFraidyCat, str.InfantryTypeClass.IsFraidyCat

%define InfantryTypeClass.IsCivilian.Get(ptr_type,reg_output)                  ObjectTypeClass.GetBool                ptr_type, InfantryTypeClass.Offset.IsCivilian, InfantryTypeClass.Bit.IsCivilian, reg_output
%define InfantryTypeClass.IsCivilian.Set(ptr_type,value)                       ObjectTypeClass.SetBool                ptr_type, InfantryTypeClass.Offset.IsCivilian, InfantryTypeClass.Bit.IsCivilian, value
%define InfantryTypeClass.IsCivilian.Read(ptr_type,ptr_rules)                  ObjectTypeClass.ReadBool               ptr_type, ptr_rules, InfantryTypeClass.Offset.IsCivilian, InfantryTypeClass.Bit.IsCivilian, str.InfantryTypeClass.IsCivilian

%define InfantryTypeClass.IsBomber.Get(ptr_type,reg_output)                    ObjectTypeClass.GetBool                ptr_type, InfantryTypeClass.Offset.IsBomber, InfantryTypeClass.Bit.IsBomber, reg_output
%define InfantryTypeClass.IsBomber.Set(ptr_type,value)                         ObjectTypeClass.SetBool                ptr_type, InfantryTypeClass.Offset.IsBomber, InfantryTypeClass.Bit.IsBomber, value
%define InfantryTypeClass.IsBomber.Read(ptr_type,ptr_rules)                    ObjectTypeClass.ReadBool               ptr_type, ptr_rules, InfantryTypeClass.Offset.IsBomber, InfantryTypeClass.Bit.IsBomber, str.InfantryTypeClass.IsBomber

%define InfantryTypeClass.IsDog.Get(ptr_type,reg_output)                       ObjectTypeClass.GetBool                ptr_type, InfantryTypeClass.Offset.IsDog, InfantryTypeClass.Bit.IsDog, reg_output
%define InfantryTypeClass.IsDog.Set(ptr_type,value)                            ObjectTypeClass.SetBool                ptr_type, InfantryTypeClass.Offset.IsDog, InfantryTypeClass.Bit.IsDog, value
%define InfantryTypeClass.IsDog.Read(ptr_type,ptr_rules)                       ObjectTypeClass.ReadBool               ptr_type, ptr_rules, InfantryTypeClass.Offset.IsDog, InfantryTypeClass.Bit.IsDog, str.InfantryTypeClass.IsDog

%define InfantryTypeClass.IsRemapOverride.Get(ptr_type,reg_output)             ObjectTypeClass.GetBool                ptr_type, InfantryTypeClass.Offset.IsRemapOverride, InfantryTypeClass.Bit.IsRemapOverride, reg_output
%define InfantryTypeClass.IsRemapOverride.Set(ptr_type,value)                  ObjectTypeClass.SetBool                ptr_type, InfantryTypeClass.Offset.IsRemapOverride, InfantryTypeClass.Bit.IsRemapOverride, value
%define InfantryTypeClass.IsRemapOverride.Read(ptr_type,ptr_rules)             ObjectTypeClass.ReadBool               ptr_type, ptr_rules, InfantryTypeClass.Offset.IsRemapOverride, InfantryTypeClass.Bit.IsRemapOverride, str.InfantryTypeClass.IsRemapOverride

%define InfantryTypeClass.Type.Get(ptr_type,reg_output)                        ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.Type, reg_output
%define InfantryTypeClass.Type.Set(ptr_type,value)                             ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.Type, value
%define InfantryTypeClass.Type.Read(ptr_type,ptr_rules)                        ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.Type, str.InfantryTypeClass.Type

%define InfantryTypeClass.Pip.Get(ptr_type,reg_output)                         ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.Pip, reg_output
%define InfantryTypeClass.Pip.Set(ptr_type,value)                              ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.Pip, value
%define InfantryTypeClass.Pip.Read(ptr_type,ptr_rules)                         ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.Pip, str.InfantryTypeClass.Pip

%define InfantryTypeClass.DoControls.Get(ptr_type,reg_output)                  ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls, reg_output
%define InfantryTypeClass.DoControls.Set(ptr_type,value)                       ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls, value
%define InfantryTypeClass.DoControls.Read(ptr_type,ptr_rules,function)         ObjectTypeClass.ReadStringExt          ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls, str.InfantryTypeClass.DoControls, function

%define InfantryTypeClass.FireFrame.Get(ptr_type,reg_output)                   ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.FireFrame, reg_output
%define InfantryTypeClass.FireFrame.Set(ptr_type,value)                        ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.FireFrame, value
%define InfantryTypeClass.FireFrame.Read(ptr_type,ptr_rules)                   ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.FireFrame, str.InfantryTypeClass.FireFrame

%define InfantryTypeClass.ProneFireFrame.Get(ptr_type,reg_output)              ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.ProneFireFrame, reg_output
%define InfantryTypeClass.ProneFireFrame.Set(ptr_type,value)                   ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.ProneFireFrame, value
%define InfantryTypeClass.ProneFireFrame.Read(ptr_type,ptr_rules)              ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.ProneFireFrame, str.InfantryTypeClass.ProneFireFrame

%define InfantryTypeClass.OverrideRemap.Get(ptr_type,reg_output)               ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.OverrideRemap, reg_output
%define InfantryTypeClass.OverrideRemap.Set(ptr_type,value)                    ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.OverrideRemap, value
;%define InfantryTypeClass.OverrideRemap.Read(ptr_type,ptr_rules)               ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.OverrideRemap, str.InfantryTypeClass.OverrideRemap
