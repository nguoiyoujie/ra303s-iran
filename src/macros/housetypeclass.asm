;----------------------------------------------------------------
; src/macros/housetypeclass.asm
;
; Macros to access HouseTypeClass offsets
;
;----------------------------------------------------------------

; define house type class field definitions
; abstract type
%define HouseTypeClass.Offset.House              0x021    ; byte (HousesType)
%define HouseTypeClass.Offset.Suffix             0x022    ; 4 bytes
%define HouseTypeClass.Offset.Lemon              0x025    ; INT
%define HouseTypeClass.Offset.RemapColor         0x029    ; byte (PlayerColorType)
%define HouseTypeClass.Offset.Prefix             0x02A    ; byte

%define HouseTypeClass.Offset.FirepowerBias      0x02B    ; word (Fixed)
%define HouseTypeClass.Offset.GroundspeedBias    0x02D    ; word (Fixed)
%define HouseTypeClass.Offset.AirspeedBias       0x02F    ; word (Fixed)
%define HouseTypeClass.Offset.ArmorBias          0x031    ; word (Fixed)
%define HouseTypeClass.Offset.ROFBias            0x033    ; word (Fixed)
%define HouseTypeClass.Offset.CostBias           0x035    ; word (Fixed)
%define HouseTypeClass.Offset.BuildSpeedBias     0x037    ; word (Fixed)
;0x039