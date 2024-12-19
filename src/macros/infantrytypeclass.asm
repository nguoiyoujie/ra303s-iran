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

; DoControls (custom)
%define InfantryTypeClass.Offset.DoControls_Ready_Start            0x1C2    ; INT
%define InfantryTypeClass.Offset.DoControls_Ready_Count            0x1C6    ; byte
%define InfantryTypeClass.Offset.DoControls_Ready_Jump             0x1C7    ; byte
%define InfantryTypeClass.Offset.DoControls_Guard_Start            0x1C8    ; INT
%define InfantryTypeClass.Offset.DoControls_Guard_Count            0x1CC    ; byte
%define InfantryTypeClass.Offset.DoControls_Guard_Jump             0x1CD    ; byte
%define InfantryTypeClass.Offset.DoControls_Prone_Start            0x1CE    ; INT
%define InfantryTypeClass.Offset.DoControls_Prone_Count            0x1D2    ; byte
%define InfantryTypeClass.Offset.DoControls_Prone_Jump             0x1D3    ; byte
%define InfantryTypeClass.Offset.DoControls_Walk_Start             0x1D4    ; INT
%define InfantryTypeClass.Offset.DoControls_Walk_Count             0x1D8    ; byte
%define InfantryTypeClass.Offset.DoControls_Walk_Jump              0x1D9    ; byte
%define InfantryTypeClass.Offset.DoControls_Fire_Start             0x1DA    ; INT
%define InfantryTypeClass.Offset.DoControls_Fire_Count             0x1DE    ; byte
%define InfantryTypeClass.Offset.DoControls_Fire_Jump              0x1DF    ; byte
%define InfantryTypeClass.Offset.DoControls_LieDown_Start          0x1E0    ; INT
%define InfantryTypeClass.Offset.DoControls_LieDown_Count          0x1E4    ; byte
%define InfantryTypeClass.Offset.DoControls_LieDown_Jump           0x1E5    ; byte
%define InfantryTypeClass.Offset.DoControls_Crawl_Start            0x1E6    ; INT
%define InfantryTypeClass.Offset.DoControls_Crawl_Count            0x1EA    ; byte
%define InfantryTypeClass.Offset.DoControls_Crawl_Jump             0x1EB    ; byte
%define InfantryTypeClass.Offset.DoControls_GetUp_Start            0x1EC    ; INT
%define InfantryTypeClass.Offset.DoControls_GetUp_Count            0x1F0    ; byte
%define InfantryTypeClass.Offset.DoControls_GetUp_Jump             0x1F1    ; byte
%define InfantryTypeClass.Offset.DoControls_FireProne_Start        0x1F2    ; INT
%define InfantryTypeClass.Offset.DoControls_FireProne_Count        0x1F6    ; byte
%define InfantryTypeClass.Offset.DoControls_FireProne_Jump         0x1F7    ; byte
%define InfantryTypeClass.Offset.DoControls_Idle1_Start            0x1F8    ; INT
%define InfantryTypeClass.Offset.DoControls_Idle1_Count            0x1FC    ; byte
%define InfantryTypeClass.Offset.DoControls_Idle1_Jump             0x1FD    ; byte
%define InfantryTypeClass.Offset.DoControls_Idle2_Start            0x1FE    ; INT
%define InfantryTypeClass.Offset.DoControls_Idle2_Count            0x202    ; byte
%define InfantryTypeClass.Offset.DoControls_Idle2_Jump             0x203    ; byte
%define InfantryTypeClass.Offset.DoControls_Death1_Start           0x204    ; INT ; SA death
%define InfantryTypeClass.Offset.DoControls_Death1_Count           0x208    ; byte
%define InfantryTypeClass.Offset.DoControls_Death1_Jump            0x209    ; byte
%define InfantryTypeClass.Offset.DoControls_Death2_Start           0x20A    ; INT ; AP death
%define InfantryTypeClass.Offset.DoControls_Death2_Count           0x20E    ; byte
%define InfantryTypeClass.Offset.DoControls_Death2_Jump            0x20F    ; byte
%define InfantryTypeClass.Offset.DoControls_Death2b_Start          0x210    ; INT ; usused Death animation
%define InfantryTypeClass.Offset.DoControls_Death2b_Count          0x214    ; byte
%define InfantryTypeClass.Offset.DoControls_Death2b_Jump           0x215    ; byte
%define InfantryTypeClass.Offset.DoControls_Death3_Start           0x216    ; INT ; HE death
%define InfantryTypeClass.Offset.DoControls_Death3_Count           0x21A    ; byte
%define InfantryTypeClass.Offset.DoControls_Death3_Jump            0x21B    ; byte
%define InfantryTypeClass.Offset.DoControls_Death4_Start           0x21C    ; INT ; Fire death
%define InfantryTypeClass.Offset.DoControls_Death4_Count           0x220    ; byte
%define InfantryTypeClass.Offset.DoControls_Death4_Jump            0x221    ; byte
%define InfantryTypeClass.Offset.DoControls_Gesture1_Start         0x222    ; INT
%define InfantryTypeClass.Offset.DoControls_Gesture1_Count         0x226    ; byte
%define InfantryTypeClass.Offset.DoControls_Gesture1_Jump          0x227    ; byte
%define InfantryTypeClass.Offset.DoControls_Salute1_Start          0x228    ; INT
%define InfantryTypeClass.Offset.DoControls_Salute1_Count          0x22C    ; byte
%define InfantryTypeClass.Offset.DoControls_Salute1_Jump           0x22D    ; byte
%define InfantryTypeClass.Offset.DoControls_Gesture2_Start         0x22E    ; INT
%define InfantryTypeClass.Offset.DoControls_Gesture2_Count         0x232    ; byte
%define InfantryTypeClass.Offset.DoControls_Gesture2_Jump          0x233    ; byte
%define InfantryTypeClass.Offset.DoControls_Salute2_Start          0x234    ; INT
%define InfantryTypeClass.Offset.DoControls_Salute2_Count          0x238    ; byte
%define InfantryTypeClass.Offset.DoControls_Salute2_Jump           0x239    ; byte
%define InfantryTypeClass.Offset.DoControls_DogMaul_Start          0x23A    ; INT
%define InfantryTypeClass.Offset.DoControls_DogMaul_Count          0x23E    ; byte
%define InfantryTypeClass.Offset.DoControls_DogMaul_Jump           0x23F    ; byte
;0x240
%define InfantryTypeClass.Offset.Response_Select                   0x240    ; INT
%define InfantryTypeClass.Offset.Response_Select_Data              0x244    ; word x16
%define InfantryTypeClass.Offset.Response_Move                     0x264    ; INT
%define InfantryTypeClass.Offset.Response_Move_Data                0x268    ; word x16
%define InfantryTypeClass.Offset.Response_Attack                   0x288    ; INT
%define InfantryTypeClass.Offset.Response_Attack_Data              0x28C    ; word x16



; INI String controls
str.InfantryTypeClass.IsFemale                      db"IsFemale",0                    ;new ini feature
str.InfantryTypeClass.IsCrawling                    db"IsCrawling",0                  ;new ini feature
str.InfantryTypeClass.IsCapture                     db"Infiltrate",0                  ;existing ini
str.InfantryTypeClass.IsFraidyCat                   db"IsFraidyCat",0                 ;existing ini
str.InfantryTypeClass.IsCivilian                    db"IsCivilian",0                  ;new ini feature
str.InfantryTypeClass.IsBomber                      db"C4",0                          ;existing ini
str.InfantryTypeClass.IsDog                         db"IsDog",0                       ;existing ini
str.InfantryTypeClass.IsRemapOverride               db"IsRemapOverride",0             ;for civilian remap
str.InfantryTypeClass.Type                          db"Type",0                        ;?to check?
str.InfantryTypeClass.Pip                           db"Pip",0                         ;new ini feature
str.InfantryTypeClass.DoControls                    db"DoControls",0                  ;?to implement?
str.InfantryTypeClass.FireFrame                     db"FireFrame",0                   ;new ini feature
str.InfantryTypeClass.ProneFireFrame                db"ProneFireFrame",0              ;new ini feature
str.InfantryTypeClass.OverrideRemap                 db"OverrideRemap",0               ;for civilian remap
str.InfantryTypeClass.DoControls_Ready_Start        db"DoControls_Ready_Start",0               
str.InfantryTypeClass.DoControls_Ready_Count        db"DoControls_Ready_Count",0               
str.InfantryTypeClass.DoControls_Ready_Jump         db"DoControls_Ready_Jump",0      
str.InfantryTypeClass.DoControls_Guard_Start        db"DoControls_Guard_Start",0
str.InfantryTypeClass.DoControls_Guard_Count        db"DoControls_Guard_Count",0
str.InfantryTypeClass.DoControls_Guard_Jump         db"DoControls_Guard_Jump",0
str.InfantryTypeClass.DoControls_Prone_Start        db"DoControls_Prone_Start",0
str.InfantryTypeClass.DoControls_Prone_Count        db"DoControls_Prone_Count",0
str.InfantryTypeClass.DoControls_Prone_Jump         db"DoControls_Prone_Jump",0
str.InfantryTypeClass.DoControls_Walk_Start         db"DoControls_Walk_Start",0
str.InfantryTypeClass.DoControls_Walk_Count         db"DoControls_Walk_Count",0
str.InfantryTypeClass.DoControls_Walk_Jump          db"DoControls_Walk_Jump",0
str.InfantryTypeClass.DoControls_Fire_Start         db"DoControls_Fire_Start",0
str.InfantryTypeClass.DoControls_Fire_Count         db"DoControls_Fire_Count",0
str.InfantryTypeClass.DoControls_Fire_Jump          db"DoControls_Fire_Jump",0
str.InfantryTypeClass.DoControls_LieDown_Start      db"DoControls_LieDown_Start",0
str.InfantryTypeClass.DoControls_LieDown_Count      db"DoControls_LieDown_Count",0
str.InfantryTypeClass.DoControls_LieDown_Jump       db"DoControls_LieDown_Jump",0
str.InfantryTypeClass.DoControls_Crawl_Start        db"DoControls_Crawl_Start",0
str.InfantryTypeClass.DoControls_Crawl_Count        db"DoControls_Crawl_Count",0
str.InfantryTypeClass.DoControls_Crawl_Jump         db"DoControls_Crawl_Jump",0
str.InfantryTypeClass.DoControls_GetUp_Start        db"DoControls_GetUp_Start",0
str.InfantryTypeClass.DoControls_GetUp_Count        db"DoControls_GetUp_Count",0
str.InfantryTypeClass.DoControls_GetUp_Jump         db"DoControls_GetUp_Jump",0
str.InfantryTypeClass.DoControls_FireProne_Start    db"DoControls_FireProne_Start",0
str.InfantryTypeClass.DoControls_FireProne_Count    db"DoControls_FireProne_Count",0
str.InfantryTypeClass.DoControls_FireProne_Jump     db"DoControls_FireProne_Jump",0
str.InfantryTypeClass.DoControls_Idle1_Start        db"DoControls_Idle1_Start",0
str.InfantryTypeClass.DoControls_Idle1_Count        db"DoControls_Idle1_Count",0
str.InfantryTypeClass.DoControls_Idle1_Jump         db"DoControls_Idle1_Jump",0
str.InfantryTypeClass.DoControls_Idle2_Start        db"DoControls_Idle2_Start",0
str.InfantryTypeClass.DoControls_Idle2_Count        db"DoControls_Idle2_Count",0
str.InfantryTypeClass.DoControls_Idle2_Jump         db"DoControls_Idle2_Jump",0
str.InfantryTypeClass.DoControls_Death1_Start       db"DoControls_Death1_Start",0
str.InfantryTypeClass.DoControls_Death1_Count       db"DoControls_Death1_Count",0
str.InfantryTypeClass.DoControls_Death1_Jump        db"DoControls_Death1_Jump",0
str.InfantryTypeClass.DoControls_Death2_Start       db"DoControls_Death2_Start",0
str.InfantryTypeClass.DoControls_Death2_Count       db"DoControls_Death2_Count",0
str.InfantryTypeClass.DoControls_Death2_Jump        db"DoControls_Death2_Jump",0
str.InfantryTypeClass.DoControls_Death2b_Start      db"DoControls_Death2b_Start",0
str.InfantryTypeClass.DoControls_Death2b_Count      db"DoControls_Death2b_Count",0
str.InfantryTypeClass.DoControls_Death2b_Jump       db"DoControls_Death2b_Jump",0
str.InfantryTypeClass.DoControls_Death3_Start       db"DoControls_Death3_Start",0
str.InfantryTypeClass.DoControls_Death3_Count       db"DoControls_Death3_Count",0
str.InfantryTypeClass.DoControls_Death3_Jump        db"DoControls_Death3_Jump",0
str.InfantryTypeClass.DoControls_Death4_Start       db"DoControls_Death4_Start",0
str.InfantryTypeClass.DoControls_Death4_Count       db"DoControls_Death4_Count",0
str.InfantryTypeClass.DoControls_Death4_Jump        db"DoControls_Death4_Jump",0
str.InfantryTypeClass.DoControls_Gesture1_Start     db"DoControls_Gesture1_Start",0
str.InfantryTypeClass.DoControls_Gesture1_Count     db"DoControls_Gesture1_Count",0
str.InfantryTypeClass.DoControls_Gesture1_Jump      db"DoControls_Gesture1_Jump",0
str.InfantryTypeClass.DoControls_Salute1_Start      db"DoControls_Salute1_Start",0
str.InfantryTypeClass.DoControls_Salute1_Count      db"DoControls_Salute1_Count",0
str.InfantryTypeClass.DoControls_Salute1_Jump       db"DoControls_Salute1_Jump",0
str.InfantryTypeClass.DoControls_Gesture2_Start     db"DoControls_Gesture2_Start",0
str.InfantryTypeClass.DoControls_Gesture2_Count     db"DoControls_Gesture2_Count",0
str.InfantryTypeClass.DoControls_Gesture2_Jump      db"DoControls_Gesture2_Jump",0
str.InfantryTypeClass.DoControls_Salute2_Start      db"DoControls_Salute2_Start",0
str.InfantryTypeClass.DoControls_Salute2_Count      db"DoControls_Salute2_Count",0
str.InfantryTypeClass.DoControls_Salute2_Jump       db"DoControls_Salute2_Jump",0
str.InfantryTypeClass.DoControls_DogMaul_Start      db"DoControls_DogMaul_Start",0
str.InfantryTypeClass.DoControls_DogMaul_Count      db"DoControls_DogMaul_Count",0
str.InfantryTypeClass.DoControls_DogMaul_Jump       db"DoControls_DogMaul_Jump",0         
str.InfantryTypeClass.Response_Select               db"ResponseSelect",0         
str.InfantryTypeClass.Response_Move                 db"ResponseMove",0         
str.InfantryTypeClass.Response_Attack               db"ResponseAttack",0         



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

%define InfantryTypeClass.DoControls_Ready_Start.Get(ptr_type,reg_output)      ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Ready_Start, reg_output
%define InfantryTypeClass.DoControls_Ready_Start.Set(ptr_type,value)           ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Ready_Start, value
%define InfantryTypeClass.DoControls_Ready_Start.Read(ptr_type,ptr_rules)      ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Ready_Start, str.InfantryTypeClass.DoControls_Ready_Start

%define InfantryTypeClass.DoControls_Ready_Count.Get(ptr_type,reg_output)      ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Ready_Count, reg_output
%define InfantryTypeClass.DoControls_Ready_Count.Set(ptr_type,value)           ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Ready_Count, value
%define InfantryTypeClass.DoControls_Ready_Count.Read(ptr_type,ptr_rules)      ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Ready_Count, str.InfantryTypeClass.DoControls_Ready_Count

%define InfantryTypeClass.DoControls_Ready_Jump.Get(ptr_type,reg_output)       ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Ready_Jump, reg_output
%define InfantryTypeClass.DoControls_Ready_Jump.Set(ptr_type,value)            ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Ready_Jump, value
%define InfantryTypeClass.DoControls_Ready_Jump.Read(ptr_type,ptr_rules)       ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Ready_Jump, str.InfantryTypeClass.DoControls_Ready_Jump

%define InfantryTypeClass.DoControls_Guard_Start.Get(ptr_type,reg_output)      ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Guard_Start, reg_output
%define InfantryTypeClass.DoControls_Guard_Start.Set(ptr_type,value)           ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Guard_Start, value
%define InfantryTypeClass.DoControls_Guard_Start.Read(ptr_type,ptr_rules)      ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Guard_Start, str.InfantryTypeClass.DoControls_Guard_Start

%define InfantryTypeClass.DoControls_Guard_Count.Get(ptr_type,reg_output)      ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Guard_Count, reg_output
%define InfantryTypeClass.DoControls_Guard_Count.Set(ptr_type,value)           ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Guard_Count, value
%define InfantryTypeClass.DoControls_Guard_Count.Read(ptr_type,ptr_rules)      ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Guard_Count, str.InfantryTypeClass.DoControls_Guard_Count

%define InfantryTypeClass.DoControls_Guard_Jump.Get(ptr_type,reg_output)       ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Guard_Jump, reg_output
%define InfantryTypeClass.DoControls_Guard_Jump.Set(ptr_type,value)            ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Guard_Jump, value
%define InfantryTypeClass.DoControls_Guard_Jump.Read(ptr_type,ptr_rules)       ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Guard_Jump, str.InfantryTypeClass.DoControls_Guard_Jump

%define InfantryTypeClass.DoControls_Prone_Start.Get(ptr_type,reg_output)      ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Prone_Start, reg_output
%define InfantryTypeClass.DoControls_Prone_Start.Set(ptr_type,value)           ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Prone_Start, value
%define InfantryTypeClass.DoControls_Prone_Start.Read(ptr_type,ptr_rules)      ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Prone_Start, str.InfantryTypeClass.DoControls_Prone_Start

%define InfantryTypeClass.DoControls_Prone_Count.Get(ptr_type,reg_output)      ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Prone_Count, reg_output
%define InfantryTypeClass.DoControls_Prone_Count.Set(ptr_type,value)           ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Prone_Count, value
%define InfantryTypeClass.DoControls_Prone_Count.Read(ptr_type,ptr_rules)      ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Prone_Count, str.InfantryTypeClass.DoControls_Prone_Count

%define InfantryTypeClass.DoControls_Prone_Jump.Get(ptr_type,reg_output)       ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Prone_Jump, reg_output
%define InfantryTypeClass.DoControls_Prone_Jump.Set(ptr_type,value)            ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Prone_Jump, value
%define InfantryTypeClass.DoControls_Prone_Jump.Read(ptr_type,ptr_rules)       ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Prone_Jump, str.InfantryTypeClass.DoControls_Prone_Jump

%define InfantryTypeClass.DoControls_Walk_Start.Get(ptr_type,reg_output)       ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Walk_Start, reg_output
%define InfantryTypeClass.DoControls_Walk_Start.Set(ptr_type,value)            ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Walk_Start, value
%define InfantryTypeClass.DoControls_Walk_Start.Read(ptr_type,ptr_rules)       ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Walk_Start, str.InfantryTypeClass.DoControls_Walk_Start

%define InfantryTypeClass.DoControls_Walk_Count.Get(ptr_type,reg_output)       ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Walk_Count, reg_output
%define InfantryTypeClass.DoControls_Walk_Count.Set(ptr_type,value)            ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Walk_Count, value
%define InfantryTypeClass.DoControls_Walk_Count.Read(ptr_type,ptr_rules)       ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Walk_Count, str.InfantryTypeClass.DoControls_Walk_Count

%define InfantryTypeClass.DoControls_Walk_Jump.Get(ptr_type,reg_output)        ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Walk_Jump, reg_output
%define InfantryTypeClass.DoControls_Walk_Jump.Set(ptr_type,value)             ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Walk_Jump, value
%define InfantryTypeClass.DoControls_Walk_Jump.Read(ptr_type,ptr_rules)        ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Walk_Jump, str.InfantryTypeClass.DoControls_Walk_Jump

%define InfantryTypeClass.DoControls_Fire_Start.Get(ptr_type,reg_output)       ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Fire_Start, reg_output
%define InfantryTypeClass.DoControls_Fire_Start.Set(ptr_type,value)            ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Fire_Start, value
%define InfantryTypeClass.DoControls_Fire_Start.Read(ptr_type,ptr_rules)       ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Fire_Start, str.InfantryTypeClass.DoControls_Fire_Start

%define InfantryTypeClass.DoControls_Fire_Count.Get(ptr_type,reg_output)       ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Fire_Count, reg_output
%define InfantryTypeClass.DoControls_Fire_Count.Set(ptr_type,value)            ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Fire_Count, value
%define InfantryTypeClass.DoControls_Fire_Count.Read(ptr_type,ptr_rules)       ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Fire_Count, str.InfantryTypeClass.DoControls_Fire_Count

%define InfantryTypeClass.DoControls_Fire_Jump.Get(ptr_type,reg_output)        ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Fire_Jump, reg_output
%define InfantryTypeClass.DoControls_Fire_Jump.Set(ptr_type,value)             ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Fire_Jump, value
%define InfantryTypeClass.DoControls_Fire_Jump.Read(ptr_type,ptr_rules)        ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Fire_Jump, str.InfantryTypeClass.DoControls_Fire_Jump

%define InfantryTypeClass.DoControls_LieDown_Start.Get(ptr_type,reg_output)    ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_LieDown_Start, reg_output
%define InfantryTypeClass.DoControls_LieDown_Start.Set(ptr_type,value)         ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_LieDown_Start, value
%define InfantryTypeClass.DoControls_LieDown_Start.Read(ptr_type,ptr_rules)    ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_LieDown_Start, str.InfantryTypeClass.DoControls_LieDown_Start

%define InfantryTypeClass.DoControls_LieDown_Count.Get(ptr_type,reg_output)    ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_LieDown_Count, reg_output
%define InfantryTypeClass.DoControls_LieDown_Count.Set(ptr_type,value)         ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_LieDown_Count, value
%define InfantryTypeClass.DoControls_LieDown_Count.Read(ptr_type,ptr_rules)    ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_LieDown_Count, str.InfantryTypeClass.DoControls_LieDown_Count

%define InfantryTypeClass.DoControls_LieDown_Jump.Get(ptr_type,reg_output)     ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_LieDown_Jump, reg_output
%define InfantryTypeClass.DoControls_LieDown_Jump.Set(ptr_type,value)          ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_LieDown_Jump, value
%define InfantryTypeClass.DoControls_LieDown_Jump.Read(ptr_type,ptr_rules)     ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_LieDown_Jump, str.InfantryTypeClass.DoControls_LieDown_Jump

%define InfantryTypeClass.DoControls_Crawl_Start.Get(ptr_type,reg_output)      ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Crawl_Start, reg_output
%define InfantryTypeClass.DoControls_Crawl_Start.Set(ptr_type,value)           ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Crawl_Start, value
%define InfantryTypeClass.DoControls_Crawl_Start.Read(ptr_type,ptr_rules)      ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Crawl_Start, str.InfantryTypeClass.DoControls_Crawl_Start

%define InfantryTypeClass.DoControls_Crawl_Count.Get(ptr_type,reg_output)      ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Crawl_Count, reg_output
%define InfantryTypeClass.DoControls_Crawl_Count.Set(ptr_type,value)           ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Crawl_Count, value
%define InfantryTypeClass.DoControls_Crawl_Count.Read(ptr_type,ptr_rules)      ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Crawl_Count, str.InfantryTypeClass.DoControls_Crawl_Count

%define InfantryTypeClass.DoControls_Crawl_Jump.Get(ptr_type,reg_output)       ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Crawl_Jump, reg_output
%define InfantryTypeClass.DoControls_Crawl_Jump.Set(ptr_type,value)            ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Crawl_Jump, value
%define InfantryTypeClass.DoControls_Crawl_Jump.Read(ptr_type,ptr_rules)       ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Crawl_Jump, str.InfantryTypeClass.DoControls_Crawl_Jump

%define InfantryTypeClass.DoControls_GetUp_Start.Get(ptr_type,reg_output)      ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_GetUp_Start, reg_output
%define InfantryTypeClass.DoControls_GetUp_Start.Set(ptr_type,value)           ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_GetUp_Start, value
%define InfantryTypeClass.DoControls_GetUp_Start.Read(ptr_type,ptr_rules)      ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_GetUp_Start, str.InfantryTypeClass.DoControls_GetUp_Start

%define InfantryTypeClass.DoControls_GetUp_Count.Get(ptr_type,reg_output)      ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_GetUp_Count, reg_output
%define InfantryTypeClass.DoControls_GetUp_Count.Set(ptr_type,value)           ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_GetUp_Count, value
%define InfantryTypeClass.DoControls_GetUp_Count.Read(ptr_type,ptr_rules)      ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_GetUp_Count, str.InfantryTypeClass.DoControls_GetUp_Count

%define InfantryTypeClass.DoControls_GetUp_Jump.Get(ptr_type,reg_output)       ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_GetUp_Jump, reg_output
%define InfantryTypeClass.DoControls_GetUp_Jump.Set(ptr_type,value)            ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_GetUp_Jump, value
%define InfantryTypeClass.DoControls_GetUp_Jump.Read(ptr_type,ptr_rules)       ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_GetUp_Jump, str.InfantryTypeClass.DoControls_GetUp_Jump

%define InfantryTypeClass.DoControls_FireProne_Start.Get(ptr_type,reg_output)  ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_FireProne_Start, reg_output
%define InfantryTypeClass.DoControls_FireProne_Start.Set(ptr_type,value)       ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_FireProne_Start, value
%define InfantryTypeClass.DoControls_FireProne_Start.Read(ptr_type,ptr_rules)  ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_FireProne_Start, str.InfantryTypeClass.DoControls_FireProne_Start

%define InfantryTypeClass.DoControls_FireProne_Count.Get(ptr_type,reg_output)  ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_FireProne_Count, reg_output
%define InfantryTypeClass.DoControls_FireProne_Count.Set(ptr_type,value)       ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_FireProne_Count, value
%define InfantryTypeClass.DoControls_FireProne_Count.Read(ptr_type,ptr_rules)  ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_FireProne_Count, str.InfantryTypeClass.DoControls_FireProne_Count

%define InfantryTypeClass.DoControls_FireProne_Jump.Get(ptr_type,reg_output)   ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_FireProne_Jump, reg_output
%define InfantryTypeClass.DoControls_FireProne_Jump.Set(ptr_type,value)        ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_FireProne_Jump, value
%define InfantryTypeClass.DoControls_FireProne_Jump.Read(ptr_type,ptr_rules)   ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_FireProne_Jump, str.InfantryTypeClass.DoControls_FireProne_Jump

%define InfantryTypeClass.DoControls_Idle1_Start.Get(ptr_type,reg_output)      ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Idle1_Start, reg_output
%define InfantryTypeClass.DoControls_Idle1_Start.Set(ptr_type,value)           ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Idle1_Start, value
%define InfantryTypeClass.DoControls_Idle1_Start.Read(ptr_type,ptr_rules)      ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Idle1_Start, str.InfantryTypeClass.DoControls_Idle1_Start

%define InfantryTypeClass.DoControls_Idle1_Count.Get(ptr_type,reg_output)      ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Idle1_Count, reg_output
%define InfantryTypeClass.DoControls_Idle1_Count.Set(ptr_type,value)           ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Idle1_Count, value
%define InfantryTypeClass.DoControls_Idle1_Count.Read(ptr_type,ptr_rules)      ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Idle1_Count, str.InfantryTypeClass.DoControls_Idle1_Count

%define InfantryTypeClass.DoControls_Idle1_Jump.Get(ptr_type,reg_output)       ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Idle1_Jump, reg_output
%define InfantryTypeClass.DoControls_Idle1_Jump.Set(ptr_type,value)            ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Idle1_Jump, value
%define InfantryTypeClass.DoControls_Idle1_Jump.Read(ptr_type,ptr_rules)       ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Idle1_Jump, str.InfantryTypeClass.DoControls_Idle1_Jump

%define InfantryTypeClass.DoControls_Idle2_Start.Get(ptr_type,reg_output)      ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Idle2_Start, reg_output
%define InfantryTypeClass.DoControls_Idle2_Start.Set(ptr_type,value)           ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Idle2_Start, value
%define InfantryTypeClass.DoControls_Idle2_Start.Read(ptr_type,ptr_rules)      ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Idle2_Start, str.InfantryTypeClass.DoControls_Idle2_Start

%define InfantryTypeClass.DoControls_Idle2_Count.Get(ptr_type,reg_output)      ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Idle2_Count, reg_output
%define InfantryTypeClass.DoControls_Idle2_Count.Set(ptr_type,value)           ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Idle2_Count, value
%define InfantryTypeClass.DoControls_Idle2_Count.Read(ptr_type,ptr_rules)      ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Idle2_Count, str.InfantryTypeClass.DoControls_Idle2_Count

%define InfantryTypeClass.DoControls_Idle2_Jump.Get(ptr_type,reg_output)       ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Idle2_Jump, reg_output
%define InfantryTypeClass.DoControls_Idle2_Jump.Set(ptr_type,value)            ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Idle2_Jump, value
%define InfantryTypeClass.DoControls_Idle2_Jump.Read(ptr_type,ptr_rules)       ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Idle2_Jump, str.InfantryTypeClass.DoControls_Idle2_Jump

%define InfantryTypeClass.DoControls_Death1_Start.Get(ptr_type,reg_output)     ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Death1_Start, reg_output
%define InfantryTypeClass.DoControls_Death1_Start.Set(ptr_type,value)          ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Death1_Start, value
%define InfantryTypeClass.DoControls_Death1_Start.Read(ptr_type,ptr_rules)     ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Death1_Start, str.InfantryTypeClass.DoControls_Death1_Start
																			   
%define InfantryTypeClass.DoControls_Death1_Count.Get(ptr_type,reg_output)     ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Death1_Count, reg_output
%define InfantryTypeClass.DoControls_Death1_Count.Set(ptr_type,value)          ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Death1_Count, value
%define InfantryTypeClass.DoControls_Death1_Count.Read(ptr_type,ptr_rules)     ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Death1_Count, str.InfantryTypeClass.DoControls_Death1_Count
																			   
%define InfantryTypeClass.DoControls_Death1_Jump.Get(ptr_type,reg_output)      ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Death1_Jump, reg_output
%define InfantryTypeClass.DoControls_Death1_Jump.Set(ptr_type,value)           ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Death1_Jump, value
%define InfantryTypeClass.DoControls_Death1_Jump.Read(ptr_type,ptr_rules)      ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Death1_Jump, str.InfantryTypeClass.DoControls_Death1_Jump
																			   
%define InfantryTypeClass.DoControls_Death2_Start.Get(ptr_type,reg_output)     ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Death2_Start, reg_output
%define InfantryTypeClass.DoControls_Death2_Start.Set(ptr_type,value)          ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Death2_Start, value
%define InfantryTypeClass.DoControls_Death2_Start.Read(ptr_type,ptr_rules)     ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Death2_Start, str.InfantryTypeClass.DoControls_Death2_Start
																			   
%define InfantryTypeClass.DoControls_Death2_Count.Get(ptr_type,reg_output)     ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Death2_Count, reg_output
%define InfantryTypeClass.DoControls_Death2_Count.Set(ptr_type,value)          ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Death2_Count, value
%define InfantryTypeClass.DoControls_Death2_Count.Read(ptr_type,ptr_rules)     ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Death2_Count, str.InfantryTypeClass.DoControls_Death2_Count
																			   
%define InfantryTypeClass.DoControls_Death2_Jump.Get(ptr_type,reg_output)      ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Death2_Jump, reg_output
%define InfantryTypeClass.DoControls_Death2_Jump.Set(ptr_type,value)           ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Death2_Jump, value
%define InfantryTypeClass.DoControls_Death2_Jump.Read(ptr_type,ptr_rules)      ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Death2_Jump, str.InfantryTypeClass.DoControls_Death2_Jump

%define InfantryTypeClass.DoControls_Death2b_Start.Get(ptr_type,reg_output)    ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Death2b_Start, reg_output
%define InfantryTypeClass.DoControls_Death2b_Start.Set(ptr_type,value)         ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Death2b_Start, value
%define InfantryTypeClass.DoControls_Death2b_Start.Read(ptr_type,ptr_rules)    ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Death2b_Start, str.InfantryTypeClass.DoControls_Death2b_Start
																			   
%define InfantryTypeClass.DoControls_Death2b_Count.Get(ptr_type,reg_output)    ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Death2b_Count, reg_output
%define InfantryTypeClass.DoControls_Death2b_Count.Set(ptr_type,value)         ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Death2b_Count, value
%define InfantryTypeClass.DoControls_Death2b_Count.Read(ptr_type,ptr_rules)    ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Death2b_Count, str.InfantryTypeClass.DoControls_Death2b_Count
																			   
%define InfantryTypeClass.DoControls_Death2b_Jump.Get(ptr_type,reg_output)     ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Death2b_Jump, reg_output
%define InfantryTypeClass.DoControls_Death2b_Jump.Set(ptr_type,value)          ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Death2b_Jump, value
%define InfantryTypeClass.DoControls_Death2b_Jump.Read(ptr_type,ptr_rules)     ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Death2b_Jump, str.InfantryTypeClass.DoControls_Death2b_Jump
																			   
%define InfantryTypeClass.DoControls_Death3_Start.Get(ptr_type,reg_output)     ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Death3_Start, reg_output
%define InfantryTypeClass.DoControls_Death3_Start.Set(ptr_type,value)          ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Death3_Start, value
%define InfantryTypeClass.DoControls_Death3_Start.Read(ptr_type,ptr_rules)     ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Death3_Start, str.InfantryTypeClass.DoControls_Death3_Start
																			   
%define InfantryTypeClass.DoControls_Death3_Count.Get(ptr_type,reg_output)     ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Death3_Count, reg_output
%define InfantryTypeClass.DoControls_Death3_Count.Set(ptr_type,value)          ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Death3_Count, value
%define InfantryTypeClass.DoControls_Death3_Count.Read(ptr_type,ptr_rules)     ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Death3_Count, str.InfantryTypeClass.DoControls_Death3_Count
																			   
%define InfantryTypeClass.DoControls_Death3_Jump.Get(ptr_type,reg_output)      ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Death3_Jump, reg_output
%define InfantryTypeClass.DoControls_Death3_Jump.Set(ptr_type,value)           ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Death3_Jump, value
%define InfantryTypeClass.DoControls_Death3_Jump.Read(ptr_type,ptr_rules)      ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Death3_Jump, str.InfantryTypeClass.DoControls_Death3_Jump
																			   
%define InfantryTypeClass.DoControls_Death4_Start.Get(ptr_type,reg_output)     ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Death4_Start, reg_output
%define InfantryTypeClass.DoControls_Death4_Start.Set(ptr_type,value)          ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Death4_Start, value
%define InfantryTypeClass.DoControls_Death4_Start.Read(ptr_type,ptr_rules)     ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Death4_Start, str.InfantryTypeClass.DoControls_Death4_Start
																			   
%define InfantryTypeClass.DoControls_Death4_Count.Get(ptr_type,reg_output)     ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Death4_Count, reg_output
%define InfantryTypeClass.DoControls_Death4_Count.Set(ptr_type,value)          ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Death4_Count, value
%define InfantryTypeClass.DoControls_Death4_Count.Read(ptr_type,ptr_rules)     ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Death4_Count, str.InfantryTypeClass.DoControls_Death4_Count
																			   
%define InfantryTypeClass.DoControls_Death4_Jump.Get(ptr_type,reg_output)      ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Death4_Jump, reg_output
%define InfantryTypeClass.DoControls_Death4_Jump.Set(ptr_type,value)           ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Death4_Jump, value
%define InfantryTypeClass.DoControls_Death4_Jump.Read(ptr_type,ptr_rules)      ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Death4_Jump, str.InfantryTypeClass.DoControls_Death4_Jump
																			   
%define InfantryTypeClass.DoControls_Gesture1_Start.Get(ptr_type,reg_output)   ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Gesture1_Start, reg_output
%define InfantryTypeClass.DoControls_Gesture1_Start.Set(ptr_type,value)        ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Gesture1_Start, value
%define InfantryTypeClass.DoControls_Gesture1_Start.Read(ptr_type,ptr_rules)   ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Gesture1_Start, str.InfantryTypeClass.DoControls_Gesture1_Start
																			   
%define InfantryTypeClass.DoControls_Gesture1_Count.Get(ptr_type,reg_output)   ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Gesture1_Count, reg_output
%define InfantryTypeClass.DoControls_Gesture1_Count.Set(ptr_type,value)        ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Gesture1_Count, value
%define InfantryTypeClass.DoControls_Gesture1_Count.Read(ptr_type,ptr_rules)   ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Gesture1_Count, str.InfantryTypeClass.DoControls_Gesture1_Count
																			   
%define InfantryTypeClass.DoControls_Gesture1_Jump.Get(ptr_type,reg_output)    ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Gesture1_Jump, reg_output
%define InfantryTypeClass.DoControls_Gesture1_Jump.Set(ptr_type,value)         ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Gesture1_Jump, value
%define InfantryTypeClass.DoControls_Gesture1_Jump.Read(ptr_type,ptr_rules)    ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Gesture1_Jump, str.InfantryTypeClass.DoControls_Gesture1_Jump
																			   
%define InfantryTypeClass.DoControls_Salute1_Start.Get(ptr_type,reg_output)    ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Salute1_Start, reg_output
%define InfantryTypeClass.DoControls_Salute1_Start.Set(ptr_type,value)         ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Salute1_Start, value
%define InfantryTypeClass.DoControls_Salute1_Start.Read(ptr_type,ptr_rules)    ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Salute1_Start, str.InfantryTypeClass.DoControls_Salute1_Start
																			   
%define InfantryTypeClass.DoControls_Salute1_Count.Get(ptr_type,reg_output)    ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Salute1_Count, reg_output
%define InfantryTypeClass.DoControls_Salute1_Count.Set(ptr_type,value)         ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Salute1_Count, value
%define InfantryTypeClass.DoControls_Salute1_Count.Read(ptr_type,ptr_rules)    ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Salute1_Count, str.InfantryTypeClass.DoControls_Salute1_Count
																			   
%define InfantryTypeClass.DoControls_Salute1_Jump.Get(ptr_type,reg_output)     ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Salute1_Jump, reg_output
%define InfantryTypeClass.DoControls_Salute1_Jump.Set(ptr_type,value)          ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Salute1_Jump, value
%define InfantryTypeClass.DoControls_Salute1_Jump.Read(ptr_type,ptr_rules)     ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Salute1_Jump, str.InfantryTypeClass.DoControls_Salute1_Jump
																			   
%define InfantryTypeClass.DoControls_Gesture2_Start.Get(ptr_type,reg_output)   ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Gesture2_Start, reg_output
%define InfantryTypeClass.DoControls_Gesture2_Start.Set(ptr_type,value)        ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Gesture2_Start, value
%define InfantryTypeClass.DoControls_Gesture2_Start.Read(ptr_type,ptr_rules)   ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Gesture2_Start, str.InfantryTypeClass.DoControls_Gesture2_Start
																			   
%define InfantryTypeClass.DoControls_Gesture2_Count.Get(ptr_type,reg_output)   ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Gesture2_Count, reg_output
%define InfantryTypeClass.DoControls_Gesture2_Count.Set(ptr_type,value)        ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Gesture2_Count, value
%define InfantryTypeClass.DoControls_Gesture2_Count.Read(ptr_type,ptr_rules)   ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Gesture2_Count, str.InfantryTypeClass.DoControls_Gesture2_Count
																			   
%define InfantryTypeClass.DoControls_Gesture2_Jump.Get(ptr_type,reg_output)    ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Gesture2_Jump, reg_output
%define InfantryTypeClass.DoControls_Gesture2_Jump.Set(ptr_type,value)         ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Gesture2_Jump, value
%define InfantryTypeClass.DoControls_Gesture2_Jump.Read(ptr_type,ptr_rules)    ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Gesture2_Jump, str.InfantryTypeClass.DoControls_Gesture2_Jump
																			   
%define InfantryTypeClass.DoControls_Salute2_Start.Get(ptr_type,reg_output)    ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Salute2_Start, reg_output
%define InfantryTypeClass.DoControls_Salute2_Start.Set(ptr_type,value)         ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_Salute2_Start, value
%define InfantryTypeClass.DoControls_Salute2_Start.Read(ptr_type,ptr_rules)    ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Salute2_Start, str.InfantryTypeClass.DoControls_Salute2_Start
																			   
%define InfantryTypeClass.DoControls_Salute2_Count.Get(ptr_type,reg_output)    ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Salute2_Count, reg_output
%define InfantryTypeClass.DoControls_Salute2_Count.Set(ptr_type,value)         ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Salute2_Count, value
%define InfantryTypeClass.DoControls_Salute2_Count.Read(ptr_type,ptr_rules)    ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Salute2_Count, str.InfantryTypeClass.DoControls_Salute2_Count
																			   
%define InfantryTypeClass.DoControls_Salute2_Jump.Get(ptr_type,reg_output)     ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Salute2_Jump, reg_output
%define InfantryTypeClass.DoControls_Salute2_Jump.Set(ptr_type,value)          ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_Salute2_Jump, value
%define InfantryTypeClass.DoControls_Salute2_Jump.Read(ptr_type,ptr_rules)     ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_Salute2_Jump, str.InfantryTypeClass.DoControls_Salute2_Jump
																			   
%define InfantryTypeClass.DoControls_DogMaul_Start.Get(ptr_type,reg_output)    ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_DogMaul_Start, reg_output
%define InfantryTypeClass.DoControls_DogMaul_Start.Set(ptr_type,value)         ObjectTypeClass.SetInt                 ptr_type, InfantryTypeClass.Offset.DoControls_DogMaul_Start, value
%define InfantryTypeClass.DoControls_DogMaul_Start.Read(ptr_type,ptr_rules)    ObjectTypeClass.ReadInt                ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_DogMaul_Start, str.InfantryTypeClass.DoControls_DogMaul_Start
																			   
%define InfantryTypeClass.DoControls_DogMaul_Count.Get(ptr_type,reg_output)    ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_DogMaul_Count, reg_output
%define InfantryTypeClass.DoControls_DogMaul_Count.Set(ptr_type,value)         ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_DogMaul_Count, value
%define InfantryTypeClass.DoControls_DogMaul_Count.Read(ptr_type,ptr_rules)    ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_DogMaul_Count, str.InfantryTypeClass.DoControls_DogMaul_Count
																			   
%define InfantryTypeClass.DoControls_DogMaul_Jump.Get(ptr_type,reg_output)     ObjectTypeClass.GetByte                ptr_type, InfantryTypeClass.Offset.DoControls_DogMaul_Jump, reg_output
%define InfantryTypeClass.DoControls_DogMaul_Jump.Set(ptr_type,value)          ObjectTypeClass.SetByte                ptr_type, InfantryTypeClass.Offset.DoControls_DogMaul_Jump, value
%define InfantryTypeClass.DoControls_DogMaul_Jump.Read(ptr_type,ptr_rules)     ObjectTypeClass.ReadByte               ptr_type, ptr_rules, InfantryTypeClass.Offset.DoControls_DogMaul_Jump, str.InfantryTypeClass.DoControls_DogMaul_Jump

%define InfantryTypeClass.Response_Select.Get(ptr_type,reg_output)             ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.Response_Select, reg_output
%define InfantryTypeClass.Response_Select_Data.Get(ptr_type,reg_output)        ObjectTypeClass.GetWord                ptr_type, InfantryTypeClass.Offset.Response_Select_Data, reg_output
%define InfantryTypeClass.Response_Select.Read(ptr_type,ptr_rules,function)    ObjectTypeClass.ReadStringExt          ptr_type, ptr_rules, InfantryTypeClass.Offset.Response_Select, str.InfantryTypeClass.Response_Select, function

%define InfantryTypeClass.Response_Move.Get(ptr_type,reg_output)               ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.Response_Move, reg_output
%define InfantryTypeClass.Response_Move_Data.Get(ptr_type,reg_output)          ObjectTypeClass.GetWord                ptr_type, InfantryTypeClass.Offset.Response_Move_Data, reg_output
%define InfantryTypeClass.Response_Move.Read(ptr_type,ptr_rules,function)      ObjectTypeClass.ReadStringExt          ptr_type, ptr_rules, InfantryTypeClass.Offset.Response_Move, str.InfantryTypeClass.Response_Move, function

%define InfantryTypeClass.Response_Attack.Get(ptr_type,reg_output)             ObjectTypeClass.GetInt                 ptr_type, InfantryTypeClass.Offset.Response_Attack, reg_output
%define InfantryTypeClass.Response_Attack_Data.Get(ptr_type,reg_output)        ObjectTypeClass.GetWord                ptr_type, InfantryTypeClass.Offset.Response_Attack_Data, reg_output
%define InfantryTypeClass.Response_Attack.Read(ptr_type,ptr_rules,function)    ObjectTypeClass.ReadStringExt          ptr_type, ptr_rules, InfantryTypeClass.Offset.Response_Attack, str.InfantryTypeClass.Response_Attack, function



