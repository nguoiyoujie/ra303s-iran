;----------------------------------------------------------------
; src/macros/houseclass.asm
;
; Macros to access HouseClass offsets
;
;----------------------------------------------------------------

; define house class field definitions
%define HouseClass.Offset.RTTI                   0x000    ; byte (0B)
%define HouseClass.Offset.ID                     0x001    ; INT
%define HouseClass.Offset.Class                  0x005    ; INT (CCPtr, usually just follows ID for HouseTypeClass)
%define HouseClass.Offset.Difficulty             0x009    ; byte

%define HouseClass.Offset.FirepowerBias          0x00A    ; word (Fixed)
%define HouseClass.Offset.GroundspeedBias        0x00C    ; word (Fixed)
%define HouseClass.Offset.AirspeedBias           0x00E    ; word (Fixed)
%define HouseClass.Offset.ArmorBias              0x010    ; word (Fixed)
%define HouseClass.Offset.ROFBias                0x012    ; word (Fixed)
%define HouseClass.Offset.CostBias               0x014    ; word (Fixed)
%define HouseClass.Offset.BuildSpeedBias         0x016    ; word (Fixed)
%define HouseClass.Offset.RepairDelay            0x018    ; word (Fixed)
%define HouseClass.Offset.BuildDelay             0x01A    ; word (Fixed)

; HouseStaticClass
%define HouseStaticClass.Offset.IQ                     0x01C    ; INT
%define HouseStaticClass.Offset.TechLevel              0x020    ; INT
%define HouseStaticClass.Offset.Allies                 0x024    ; INT (Bitfield)
%define HouseStaticClass.Offset.MaxUnit                0x028    ; INT
%define HouseStaticClass.Offset.MaxBuilding            0x02C    ; INT
%define HouseStaticClass.Offset.MaxInfantry            0x030    ; INT
%define HouseStaticClass.Offset.MaxVessel              0x034    ; INT
%define HouseStaticClass.Offset.MaxAircraft            0x038    ; INT
%define HouseStaticClass.Offset.InitialCredits         0x03C    ; INT
%define HouseStaticClass.Offset.Edge                   0x040    ; byte

%define HouseClass.Offset.ActLike                0x041    ; byte (HousesType)

%define HouseClass.Offset.IsActive               0x042    ; BOOL
%define HouseClass.Bit.IsActive                  1    
%define HouseClass.Offset.IsHuman                0x042    ; BOOL
%define HouseClass.Bit.IsHuman                   2    
%define HouseClass.Offset.WasHuman               0x042    ; BOOL
%define HouseClass.Bit.WasHuman                  3    
%define HouseClass.Offset.IsPlayerControl        0x042    ; BOOL
%define HouseClass.Bit.IsPlayerControl           4    
%define HouseClass.Offset.IsStarted              0x042    ; BOOL (Production)
%define HouseClass.Bit.IsStarted                 5    
%define HouseClass.Offset.IsAlerted              0x042    ; BOOL
%define HouseClass.Bit.IsAlerted                 6    
%define HouseClass.Offset.IsBaseBuilding         0x042    ; BOOL
%define HouseClass.Bit.IsBaseBuilding            7    
%define HouseClass.Offset.IsDiscovered           0x042    ; BOOL
%define HouseClass.Bit.IsDiscovered              8    

%define HouseClass.Offset.IsMaxedOut             0x043    ; BOOL (Silos Needed)
%define HouseClass.Bit.IsMaxedOut                1    
%define HouseClass.Offset.IsDefeated             0x043    ; BOOL (Multiplay)
%define HouseClass.Bit.IsDefeated                2    
%define HouseClass.Offset.IsToDie                0x043    ; BOOL 
%define HouseClass.Bit.IsToDie                   3    
%define HouseClass.Offset.IsToWin                0x043    ; BOOL 
%define HouseClass.Bit.IsToWin                   4    
%define HouseClass.Offset.IsToLose               0x043    ; BOOL 
%define HouseClass.Bit.IsToLose                  5    
%define HouseClass.Offset.IsCivEvacuated         0x043    ; BOOL (One civ leaving the map in heli is enough)
%define HouseClass.Bit.IsCivEvacuated            6    
%define HouseClass.Offset.IsRecalcNeeded         0x043    ; BOOL (Recalc sidebar)
%define HouseClass.Bit.IsRecalcNeeded            7    
%define HouseClass.Offset.IsVisionary            0x043    ; BOOL (Full map revealed)
%define HouseClass.Bit.IsVisionary               8    

%define HouseClass.Offset.IsTiberiumShort        0x044    ; BOOL (Insufficient Funds)
%define HouseClass.Bit.IsTiberiumShort           1    
%define HouseClass.Offset.IsSpied                0x044    ; BOOL 
%define HouseClass.Bit.IsSpied                   2    
%define HouseClass.Offset.IsThieved              0x044    ; BOOL 
%define HouseClass.Bit.IsThieved                 3    
%define HouseClass.Offset.DidRepair              0x044    ; BOOL 
%define HouseClass.Bit.DidRepair                 4    
%define HouseClass.Offset.IsGPSActive            0x044    ; BOOL 
%define HouseClass.Bit.IsGPSActive               5    
%define HouseClass.Offset.IsBuiltSomething       0x044    ; BOOL 
%define HouseClass.Bit.IsBuiltSomething          6    
%define HouseClass.Offset.IsResigner             0x044    ; BOOL 
%define HouseClass.Bit.IsResigner                7    
%define HouseClass.Offset.IsGiverUpper           0x044    ; BOOL 
%define HouseClass.Bit.IsGiverUpper              8   
 
%define HouseClass.Offset.IsParanoid             0x045    ; BOOL 
%define HouseClass.Bit.IsParanoid                1    
%define HouseClass.Offset.IsToLook               0x045    ; BOOL 
%define HouseClass.Bit.IsToLook                  2
 
%define HouseClass.Offset.IQ                     0x046    ; INT
%define HouseClass.Offset.State                  0x04A    ; INT
; building in progress


;

; INI String controls
;str.TechnoTypeClass.IsDoubleOwned             db"DoubleOwned",0                 ;existing feature
;str.TechnoTypeClass.IsInvisible               db"Invisible",0                   ;existing feature
;str.TechnoTypeClass.IsLeader                  db"Leader",0                      ;internal feature
;str.TechnoTypeClass.IsScanner                 db"Sensors",0                     ;existing feature
;str.TechnoTypeClass.IsNominal                 db"Nominal",0                     ;new ini feature
;str.TechnoTypeClass.IsTheater                 db"IsTheater",0                   ;new ini feature
;str.TechnoTypeClass.HasTurret                 db"HasTurret",0                   ;new ini feature
;str.TechnoTypeClass.IsRepairable              db"Repairable",0                  ;new ini feature
;str.TechnoTypeClass.IsCrew                    db"Crewed",0                      ;existing feature
;str.TechnoTypeClass.IsRemappable              db"IsRemappable",0                ;internal feature
;str.TechnoTypeClass.IsCloakable               db"Cloakable",0                   ;existing feature
;str.TechnoTypeClass.IsSelfHealing             db"SelfHealing",0                 ;existing feature
;str.TechnoTypeClass.IsExploding               db"Explodes",0                    ;existing feature
;
;str.TechnoTypeClass.PrereqType                db"PrerequisiteType",0                  ;new feature
;
;str.TechnoTypeClass.MZone                     db"MovementZone",0                ;internal feature
;str.TechnoTypeClass.ThreatRange               db"GuardRange",0                  ;existing feature
;str.TechnoTypeClass.MaxPassengers             db"Passengers",0                  ;existing feature
;str.TechnoTypeClass.SightRange                db"Sight",0                       ;existing feature
;str.TechnoTypeClass.Cost                      db"Cost",0                        ;existing feature
;str.TechnoTypeClass.Level                     db"TechLevel",0                   ;existing feature
;str.TechnoTypeClass.Prerequisite              db"Prerequisite",0                ;existing feature
;str.TechnoTypeClass.Risk                      db"Points",0                      ;existing feature
;str.TechnoTypeClass.Reward                    db"Points",0                      ;existing feature
;str.TechnoTypeClass.MaxSpeed                  db"Speed",0                       ;existing feature
;str.TechnoTypeClass.Speed                     db"Speed",0                       ;existing feature
;str.TechnoTypeClass.MaxAmmo                   db"Ammo",0                        ;existing feature
;str.TechnoTypeClass.Ownable                   db"Owner",0                       ;existing feature
;
;str.TechnoTypeClass.Facings                   db"Facings",0                     ;new ini feature
;str.TechnoTypeClass.ROT                       db"ROT",0                         ;existing feature
;str.TechnoTypeClass.PrimaryWeapon             db"Primary",0                     ;existing feature
;str.TechnoTypeClass.SecondaryWeapon           db"Secondary",0                   ;existing feature
;str.TechnoTypeClass.VerticalOffset            db"VerticalOffset",0              ;new ini feature
;str.TechnoTypeClass.PrimaryOffset             db"PrimaryOffset",0               ;new ini feature
;str.TechnoTypeClass.PrimaryLateral            db"PrimaryLateral",0              ;new ini feature
;str.TechnoTypeClass.SecondaryOffset           db"SecondaryOffset",0             ;new ini feature
;str.TechnoTypeClass.SecondaryLateral          db"SecondaryLateral",0            ;new ini feature
;str.TechnoTypeClass.Points                    db"Points",0                      ;existing feature
;
;str.TechnoTypeClass.DeathWeapon               db"DeathWeapon",0                     ;existing feature

%macro HouseTypeClass.new    2
    mov  eax,0x13a ; size
    call HouseTypeClass__new
    test eax,eax
    jz   %%skip
    mov  ecx,6
    mov  dl,byte [%1]
    mov  esi,%1 + 5
    mov  byte [eax],dl
    mov  edx, [%1 + 1]
    lea  edi,[eax+5]
    mov  dword [eax+1],edx
    add  eax,0x12c
    rep movsd 
    mov  edx,dword [%1 + 0x1d]
    mov  ecx,0x40
    mov  dword [eax-0x10b],0x005F6468
    mov  esi,%1 + 0x26
    mov  dword [eax-0x10f],edx
    mov  dl,byte [%1 + 0x25]
    lea  edi,[eax-0x106]
    mov  byte [eax-0x107],dl
    mov  edx,[%1 + 0x126]
    rep movsd 
    mov  dword [eax-6],edx
    mov  dl,byte [%1 + 0x12A]
    mov  byte [eax-2],dl
    mov  dl,byte [%1 + 0x12B]
    mov  byte [eax-1],dl
    mov  edx,%1 + 0x12C
    call 0x0041CB70 ; fixed::Data::Composite::Composite(fixed::Data::Composite &)
    add  eax,2
    mov  dx,word [%1 + 0x12C]
    mov  word [eax-2],dx
    mov  edx,%1 + 0x12E
    call 0x0041CB70 ; fixed::Data::Composite::Composite(fixed::Data::Composite &)
    add  eax,2
    mov  dx,word [%1 + 0x12E]
    mov  word [eax-2],dx
    mov  edx,%1 + 0x130
    call 0x0041CB70 ; fixed::Data::Composite::Composite(fixed::Data::Composite &)
    add  eax,2
    mov  dx,word [%1 + 0x130]
    mov  word [eax-2],dx
    mov  edx,%1 + 0x132
    call 0x0041CB70 ; fixed::Data::Composite::Composite(fixed::Data::Composite &)
    add  eax,2
    mov  dx,word [%1 + 0x132]
    mov  word [eax-2],dx
    mov  edx,%1 + 0x134
    call 0x0041CB70 ; fixed::Data::Composite::Composite(fixed::Data::Composite &)
    add  eax,2
    mov  dx,word [%1 + 0x134]
    mov  word [eax-2],dx
    mov  edx,%1 + 0x136
    call 0x0041CB70 ; fixed::Data::Composite::Composite(fixed::Data::Composite &)
    add  eax,2
    mov  dx,word [%1 + 0x136]
    mov  word [eax-2],dx
    mov  edx,%1 + 0x138
    call 0x0041CB70 ; fixed::Data::Composite::Composite(fixed::Data::Composite &)
    sub  eax,0x138
    mov  dx,word [%1 + 0x138]
    mov  word [eax+0x138],dx
    mov  dword [eax+0x21],0x005FA8A8
    ;mov  dword [HouseTypeClass.DestructorPtrs-0x14*8+%2*8],0x004CD4F0 ; HouseTypeClass::~HouseTypeClass(void)
    ;mov  dword [HouseTypeClass.DestructorPtrs-0x14*8+4+%2*8],%1
    ;mov  dword [eax+0x21],HouseTypeClass.DestructorPtrs;+0xC*8 ;0x005FA8A8
%%skip:
%endmacro