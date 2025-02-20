;----------------------------------------------------------------
; inc/types/StageClass.inc
;
; Macros to access StageClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_STAGECLASS
%define TYPES_STAGECLASS

; define object type field definitions
%define StageClass.Offset.Stage                     0x042    ; int
%define StageClass.Offset.Timer                     0x046    ; CDTimerClass<FrameTimerClass> 9 bytes
%define StageClass.Offset.Rate                      0x04F    ; int
; 0x053

; Generally, object instances are not read by INI

%endif
