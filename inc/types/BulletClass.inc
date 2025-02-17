;----------------------------------------------------------------
; inc/types/bulletclass.asm
;
; Macros to access BulletClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_BULLETCLASS
%define TYPES_BULLETCLASS

; define instance field definitions
%define BulletClass.Offset.Class                  0x034    ; INT
%define BulletClass.Offset.Payback                0x038    ; INT
%define BulletClass.Offset.PrimaryFacing          0x03C    ; 2 bytes

%define BulletClass.Offset.IsInaccurate           0x03E    ; bool
%define BulletClass.Bit.IsInaccurate              1    
%define BulletClass.Offset.IsToAnimate            0x03E    ; bool
%define BulletClass.Bit.IsToAnimate               2    
%define BulletClass.Offset.IsLocked               0x03E    ; bool
%define BulletClass.Bit.IsLocked                  3    

; 0x03F,0x040 and 0x041 are empty... 
%define BulletClass.Offset.TarCom                 0x042    ; TARGET (dword)
%define BulletClass.Offset.MaxSpeed               0x046    ; INT
%define BulletClass.Offset.Warhead                0x04A    ; byte
;0x04B


%endif
