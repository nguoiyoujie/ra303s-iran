;----------------------------------------------------------------
; inc/types/CellClass.inc
;
; Macros to access CellClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_CELLCLASS
%define TYPES_CELLCLASS

; define object type field definitions
%define CellClass.Offset.ID                       0x000    ; word
%define CellClass.Offset.IsPlot                   0x002    ; bool
%define CellClass.Bit.IsPlot                      1
%define CellClass.Offset.IsCursorHere             0x002    ; bool
%define CellClass.Bit.IsCursorHere                2
%define CellClass.Offset.IsMapped                 0x002    ; bool
%define CellClass.Bit.IsMapped                    3
%define CellClass.Offset.IsVisible                0x002    ; bool
%define CellClass.Bit.IsVisible                   4
%define CellClass.Offset.IsWaypoint               0x002    ; bool
%define CellClass.Bit.IsWaypoint                  5
%define CellClass.Offset.IsRadarCursor            0x002    ; bool
%define CellClass.Bit.IsRadarCursor               6
%define CellClass.Offset.IsFlagged                0x002    ; bool
%define CellClass.Bit.IsFlagged                   7
%define CellClass.Offset.IsToShroud               0x002    ; bool
%define CellClass.Bit.IsToShroud                  8
; 0x002, 0x003, 0x004 are empty
%define CellClass.Offset.Zones                    0x006    ; 4 * byte
%define CellClass.Offset.Jammed                   0x00A    ; word
%define CellClass.Offset.Trigger                  0x00C    ; CCPtr<TriggerClass>
%define CellClass.Offset.TType                    0x010    ; word
%define CellClass.Offset.TIcon                    0x012    ; byte
%define CellClass.Offset.Overlay                  0x013    ; byte
%define CellClass.Offset.OverlayData              0x014    ; byte
%define CellClass.Offset.Smudge                   0x015    ; byte
%define CellClass.Offset.SmudgeData               0x016    ; byte
%define CellClass.Offset.Owner                    0x017    ; byte
%define CellClass.Offset.InfType                  0x018    ; byte
%define CellClass.Offset.OccupierPtr              0x019    ; ptr
%define CellClass.Offset.Overlapper               0x01D    ; ptr * 6
%define CellClass.Offset.Flag                     0x035    ; byte
;%define CellClass.Offset.Land                     0x036    ; byte
;%define CellClass.Offset.OverrideLand             0x037    ; byte
%define CellClass.Offset.CTFFlag                  0x036    ; ptr
; 0x03A

; Generally, object instances are not read by INI

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

;%define CellClass.RTTI.Get(ptr_type,reg_output)                        GetByte                ptr_type, CellClass.Offset.RTTI, reg_output
;%define CellClass.RTTI.Set(ptr_type,value)                             SetByte                ptr_type, CellClass.Offset.RTTI, value

;%define CellClass.Index.Get(ptr_type,reg_output)                       GetInt                 ptr_type, CellClass.Offset.Index, reg_output
;%define CellClass.Index.Set(ptr_type,value)                            SetInt                 ptr_type, CellClass.Offset.Index, value

%endif
