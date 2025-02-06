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

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

;%define StageClass.RTTI.Get(ptr_type,reg_output)                        GetByte                ptr_type, StageClass.Offset.RTTI, reg_output
;%define StageClass.RTTI.Set(ptr_type,value)                             SetByte                ptr_type, StageClass.Offset.RTTI, value

;%define StageClass.Index.Get(ptr_type,reg_output)                       GetInt                 ptr_type, StageClass.Offset.Index, reg_output
;%define StageClass.Index.Set(ptr_type,value)                            SetInt                 ptr_type, StageClass.Offset.Index, value

%endif
