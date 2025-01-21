;----------------------------------------------------------------
; src/macros/housetypeclass.asm
;
; Macros to access HouseTypeClass offsets
;
;----------------------------------------------------------------

; define house type class field definitions
; abstract type
; AbstractTypeClass__Coord_Fixup()   0x021 
%define HouseTypeClass.Offset.House              0x025    ; byte (HousesType)
%define HouseTypeClass.Offset.Suffix             0x026    ; many bytes
;%define HouseTypeClass.Offset.Lemon              0x025    ; INT
%define HouseTypeClass.Offset.RemapColor         0x12A    ; byte (PlayerColorType)
%define HouseTypeClass.Offset.Prefix             0x12B    ; byte

%define HouseTypeClass.Offset.FirepowerBias      0x12C    ; word (Fixed)
%define HouseTypeClass.Offset.GroundspeedBias    0x12E    ; word (Fixed)
%define HouseTypeClass.Offset.AirspeedBias       0x130    ; word (Fixed)
%define HouseTypeClass.Offset.ArmorBias          0x132    ; word (Fixed)
%define HouseTypeClass.Offset.ROFBias            0x134    ; word (Fixed)
%define HouseTypeClass.Offset.CostBias           0x136    ; word (Fixed)
%define HouseTypeClass.Offset.BuildSpeedBias     0x138    ; word (Fixed)
;0x13A (original)
;%define HouseTypeClass.Offset.HeliUnit           0x13A    ; byte


; INI String controls
;str.HouseTypeClass.HeliUnit                      db"HeliUnit",0               ;new ini feature

%define HouseTypeClass.FromIndex(d_index,reg_output)                        AbstractTypeClass.FromIndex            d_index, HouseTypeClass.Count, HouseTypeClass.Array, reg_output
%define HouseTypeClass.FromID(d_index,reg_output)                           AbstractTypeClass.FromID               d_index, HouseTypeClass.Count, HouseTypeClass.Array, reg_output

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

;%define HouseTypeClass.HeliUnit.Get(ptr_type,reg_output)                   ObjectTypeClass.GetByte                ptr_type, HouseTypeClass.Offset.HeliUnit, reg_output
;%define HouseTypeClass.HeliUnit.Set(ptr_type,value)                        ObjectTypeClass.SetByte                ptr_type, HouseTypeClass.Offset.HeliUnit, value
;%define HouseTypeClass.HeliUnit.Read(ptr_type,ptr_rules)                   ObjectTypeClass.ReadByte               ptr_type, ptr_rules, HouseTypeClass.Offset.HeliUnit, str.HouseTypeClass.HeliUnit

