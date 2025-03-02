;----------------------------------------------------------------
; inc/types/MissionClass.inc
;
; Macros to access MissionClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_MISSIONCLASS
%define TYPES_MISSIONCLASS

; define object type field definitions
%define MissionClass.Offset.Mission                   0x027    ; byte
%define MissionClass.Offset.SuspendedMission          0x028    ; byte
%define MissionClass.Offset.MissionQueue              0x029    ; byte
%define MissionClass.Offset.Status                    0x02A    ; int
; 0x02D

%endif
