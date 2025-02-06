;----------------------------------------------------------------
; inc/types/MissionClass.inc
;
; Macros to access MissionClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_MISSIONCLASS
%define TYPES_MISSIONCLASS

; define object type field definitions
%define MissionClass.Offset.Misison                   0x029    ; byte
%define MissionClass.Offset.SuspendedMisison          0x02A    ; byte
%define MissionClass.Offset.MisisonQueue              0x02B    ; byte
%define MissionClass.Offset.Status                    0x02C    ; int
; 0x030

; Generally, object instances are not read by INI

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

;%define MissionClass.RTTI.Get(ptr_type,reg_output)                        GetByte                ptr_type, MissionClass.Offset.RTTI, reg_output
;%define MissionClass.RTTI.Set(ptr_type,value)                             SetByte                ptr_type, MissionClass.Offset.RTTI, value

;%define MissionClass.Index.Get(ptr_type,reg_output)                       GetInt                 ptr_type, MissionClass.Offset.Index, reg_output
;%define MissionClass.Index.Set(ptr_type,value)                            SetInt                 ptr_type, MissionClass.Offset.Index, value

%endif
