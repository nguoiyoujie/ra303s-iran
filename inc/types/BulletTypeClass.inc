;----------------------------------------------------------------
; inc/types/bullettypeclass.asm
;
; Macros to access BulletTypeClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_BULLETTYPECLASS
%define TYPES_BULLETTYPECLASS

; define type field definitions
%define BulletTypeClass.Offset.IsHigh                 0x138    ; bool
%define BulletTypeClass.Bit.IsHigh                    1    
%define BulletTypeClass.Offset.IsShadow               0x138    ; bool
%define BulletTypeClass.Bit.IsShadow                  2    
%define BulletTypeClass.Offset.IsArcing               0x138    ; bool
%define BulletTypeClass.Bit.IsArcing                  3    
%define BulletTypeClass.Offset.IsDropping             0x138    ; bool
%define BulletTypeClass.Bit.IsDropping                4    
%define BulletTypeClass.Offset.IsInvisible            0x138    ; bool
%define BulletTypeClass.Bit.IsInvisible               5    
%define BulletTypeClass.Offset.IsProximityArmed       0x138    ; bool
%define BulletTypeClass.Bit.IsProximityArmed          6    
%define BulletTypeClass.Offset.IsFlameEquipped        0x138    ; bool
%define BulletTypeClass.Bit.IsFlameEquipped           7    
%define BulletTypeClass.Offset.IsFueled               0x138    ; bool
%define BulletTypeClass.Bit.IsFueled                  8    

%define BulletTypeClass.Offset.IsFaceless             0x139    ; bool
%define BulletTypeClass.Bit.IsFaceless                1    
%define BulletTypeClass.Offset.IsInaccurate           0x139    ; bool
%define BulletTypeClass.Bit.IsInaccurate              2    
%define BulletTypeClass.Offset.IsTranslucent          0x139    ; bool
%define BulletTypeClass.Bit.IsTranslucent             3    
%define BulletTypeClass.Offset.IsAntiAircraft         0x139    ; bool
%define BulletTypeClass.Bit.IsAntiAircraft            4    
%define BulletTypeClass.Offset.IsAntiGround           0x139    ; bool
%define BulletTypeClass.Bit.IsAntiGround              5    
%define BulletTypeClass.Offset.IsAntiSub              0x139    ; bool
%define BulletTypeClass.Bit.IsAntiSub                 6    
%define BulletTypeClass.Offset.IsDegenerate           0x139    ; bool
%define BulletTypeClass.Bit.IsDegenerate              7    
%define BulletTypeClass.Offset.IsSubSurface           0x139    ; bool
%define BulletTypeClass.Bit.IsSubSurface              8    

%define BulletTypeClass.Offset.IsParachuted           0x13A    ; bool
%define BulletTypeClass.Bit.IsParachuted              1    
%define BulletTypeClass.Offset.IsGigundo              0x13A    ; bool
%define BulletTypeClass.Bit.IsGigundo                 2    

; 0x13B is empty... 
%define BulletTypeClass.Offset.Type                   0x13C    ; byte
%define BulletTypeClass.Offset.ROT                    0x13D    ; byte
%define BulletTypeClass.Offset.Arming                 0x13E    ; INT
%define BulletTypeClass.Offset.Tumble                 0x142    ; INT
%define BulletTypeClass.Offset.TrailAnim              0x146    ; byte
;0x146

; INI String controls
str.BulletTypeClass.TrailAnim                         db"TrailAnim",0      ;new ini feature


%define BulletTypeClass.FromIndex(d_index,reg_output)                        AbstractTypeClass.FromIndex              d_index, BulletTypeClass.Count, BulletTypeClass.Array, reg_output
%define BulletTypeClass.FromID(d_index,reg_output)                           AbstractTypeClass.FromID                 d_index, BulletTypeClass.Count, BulletTypeClass.Array, reg_output

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

%define BulletTypeClass.TrailAnim.Get(ptr_type,reg_output)                   GetByte                                 ptr_type, BulletTypeClass.Offset.TrailAnim, reg_output
%define BulletTypeClass.TrailAnim.Set(ptr_type,value)                        SetByte                                 ptr_type, BulletTypeClass.Offset.TrailAnim, value
%define BulletTypeClass.TrailAnim.Read(ptr_type,ptr_rules,function)          AbstractTypeClass.ReadStringToByteExt   ptr_type, ptr_rules, BulletTypeClass.Offset.TrailAnim, str.BulletTypeClass.TrailAnim, function


%endif
