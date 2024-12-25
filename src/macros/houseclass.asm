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

; HouseStaticClass Control;
%define HouseClass.Offset.ControlIQ              0x01C    ; INT (there is a duplicate IQ further below)
%define HouseClass.Offset.TechLevel              0x020    ; INT
%define HouseClass.Offset.Allies                 0x024    ; INT (Bitfield)
%define HouseClass.Offset.MaxUnit                0x028    ; INT
%define HouseClass.Offset.MaxBuilding            0x02C    ; INT
%define HouseClass.Offset.MaxInfantry            0x030    ; INT
%define HouseClass.Offset.MaxVessel              0x034    ; INT
%define HouseClass.Offset.MaxAircraft            0x038    ; INT
%define HouseClass.Offset.InitialCredits         0x03C    ; INT
%define HouseClass.Offset.Edge                   0x040    ; byte
; /end HouseStaticClass Control;

%define HouseClass.Offset.ActLike                0x041    ; byte (HousesType)

%define HouseClass.Offset.IsActive               0x042    ; BOOL
%define HouseClass.Bit.IsActive                  1    
%define HouseClass.Offset.IsHuman                0x042    ; BOOL
%define HouseClass.Bit.IsHuman                   2     
%define HouseClass.Offset.IsPlayerControl        0x042    ; BOOL
%define HouseClass.Bit.IsPlayerControl           3    
%define HouseClass.Offset.IsStarted              0x042    ; BOOL (Production)
%define HouseClass.Bit.IsStarted                 4    
%define HouseClass.Offset.IsAlerted              0x042    ; BOOL
%define HouseClass.Bit.IsAlerted                 5    
%define HouseClass.Offset.IsBaseBuilding         0x042    ; BOOL
%define HouseClass.Bit.IsBaseBuilding            6    
%define HouseClass.Offset.IsDiscovered           0x042    ; BOOL
%define HouseClass.Bit.IsDiscovered              7    
%define HouseClass.Offset.IsMaxedOut             0x042    ; BOOL (Silos Needed)
%define HouseClass.Bit.IsMaxedOut                8    

%define HouseClass.Offset.IsDefeated             0x043    ; BOOL (Multiplay)
%define HouseClass.Bit.IsDefeated                1    
%define HouseClass.Offset.IsToDie                0x043    ; BOOL 
%define HouseClass.Bit.IsToDie                   2    
%define HouseClass.Offset.IsToWin                0x043    ; BOOL 
%define HouseClass.Bit.IsToWin                   3    
%define HouseClass.Offset.IsToLose               0x043    ; BOOL 
%define HouseClass.Bit.IsToLose                  4    
%define HouseClass.Offset.IsCivEvacuated         0x043    ; BOOL (One civ leaving the map in heli is enough)
%define HouseClass.Bit.IsCivEvacuated            5    
%define HouseClass.Offset.IsRecalcNeeded         0x043    ; BOOL (Recalc sidebar)
%define HouseClass.Bit.IsRecalcNeeded            6    
%define HouseClass.Offset.IsVisionary            0x043    ; BOOL (Full map revealed)
%define HouseClass.Bit.IsVisionary               7    
%define HouseClass.Offset.IsTiberiumShort        0x043    ; BOOL (Insufficient Funds)
%define HouseClass.Bit.IsTiberiumShort           8    

%define HouseClass.Offset.IsSpied                0x044    ; BOOL 
%define HouseClass.Bit.IsSpied                   1    
%define HouseClass.Offset.IsThieved              0x044    ; BOOL 
%define HouseClass.Bit.IsThieved                 2    
%define HouseClass.Offset.DidRepair              0x044    ; BOOL 
%define HouseClass.Bit.DidRepair                 3    
%define HouseClass.Offset.IsGPSActive            0x044    ; BOOL 
%define HouseClass.Bit.IsGPSActive               4    
%define HouseClass.Offset.IsBuiltSomething       0x044    ; BOOL 
%define HouseClass.Bit.IsBuiltSomething          5    
%define HouseClass.Offset.IsResigner             0x044    ; BOOL 
%define HouseClass.Bit.IsResigner                6    
%define HouseClass.Offset.IsGiverUpper           0x044    ; BOOL 
%define HouseClass.Bit.IsGiverUpper              7   
%define HouseClass.Offset.IsParanoid             0x044    ; BOOL 
%define HouseClass.Bit.IsParanoid                8    

%define HouseClass.Offset.IsToLook               0x045    ; BOOL 
%define HouseClass.Bit.IsToLook                  1
 
%define HouseClass.Offset.IQ                     0x046    ; INT
%define HouseClass.Offset.State                  0x04A    ; byte

%define HouseClass.Offset.SuperWeapon1           0x04B    ; 25 bytes
;%define HouseClass.Offset.SuperWeapon1.Control        0x04E    ; CDTimerClass<FrameTimerClass>, 9 bytes
;%define HouseClass.Offset.SuperWeapon1.OldStage       0x058    ; INT
;%define HouseClass.Offset.SuperWeapon1.VoxRecharge    0x05C    ; byte
;%define HouseClass.Offset.SuperWeapon1.VoxCharging    0x05D    ; byte
;%define HouseClass.Offset.SuperWeapon1.VoxImpatient   0x05E    ; byte
;%define HouseClass.Offset.SuperWeapon1.VoxSuspend     0x05F    ; byte
;%define HouseClass.Offset.SuperWeapon1.Recharge       0x060    ; INT
%define HouseClass.Offset.SuperWeapon2           0x064    ; 25 bytes
%define HouseClass.Offset.SuperWeapon3           0x07D    ; 25 bytes
%define HouseClass.Offset.SuperWeapon4           0x096    ; 25 bytes
%define HouseClass.Offset.SuperWeapon5           0x0AF    ; 25 bytes
%define HouseClass.Offset.SuperWeapon6           0x0C8    ; 25 bytes
%define HouseClass.Offset.SuperWeapon7           0x0E1    ; 25 bytes
%define HouseClass.Offset.SuperWeapon8           0x0FA    ; 25 bytes

%define HouseClass.Offset.JustBuiltStructure     0x113    ; byte 
%define HouseClass.Offset.JustBuiltInfantry      0x114    ; byte 
%define HouseClass.Offset.JustBuiltUnit          0x115    ; byte 
%define HouseClass.Offset.JustBuiltAircraft      0x116    ; byte 
%define HouseClass.Offset.JustBuiltVessel        0x117    ; byte 

%define HouseClass.Offset.Blockage               0x118    ; INT
%define HouseClass.Offset.RepairTimer            0x11C    ; CDTimerClass<FrameTimerClass>, 9 bytes
%define HouseClass.Offset.AlertTime              0x125    ; CDTimerClass<FrameTimerClass>, 9 bytes
%define HouseClass.Offset.BorrowedTime           0x12E    ; CDTimerClass<FrameTimerClass>, 9 bytes

%define HouseClass.Offset.BScan                  0x137    ; INT
%define HouseClass.Offset.ActiveBScan            0x13B    ; INT
%define HouseClass.Offset.OldBScan               0x13F    ; INT
%define HouseClass.Offset.UScan                  0x143    ; INT
%define HouseClass.Offset.ActiveUScan            0x147    ; INT
%define HouseClass.Offset.OldUScan               0x14B    ; INT
%define HouseClass.Offset.IScan                  0x14F    ; INT
%define HouseClass.Offset.ActiveIScan            0x153    ; INT
%define HouseClass.Offset.OldIScan               0x157    ; INT
%define HouseClass.Offset.AScan                  0x15B    ; INT
%define HouseClass.Offset.ActiveAScan            0x15F    ; INT
%define HouseClass.Offset.OldAScan               0x163    ; INT
%define HouseClass.Offset.VScan                  0x167    ; INT
%define HouseClass.Offset.ActiveVScan            0x16B    ; INT
%define HouseClass.Offset.OldVScan               0x16F    ; INT

%define HouseClass.Offset.CreditsSpent           0x173    ; INT
%define HouseClass.Offset.HarvestedCredits       0x177    ; INT
%define HouseClass.Offset.StolenBuildingsCredits 0x17B    ; INT

%define HouseClass.Offset.CurUnits               0x17F    ; INT
%define HouseClass.Offset.CurBuildings           0x183    ; INT
%define HouseClass.Offset.CurInfantry            0x187    ; INT
%define HouseClass.Offset.CurVessels             0x18B    ; INT
%define HouseClass.Offset.CurAircraft            0x18F    ; INT

%define HouseClass.Offset.Tiberium               0x193    ; INT
%define HouseClass.Offset.Credits                0x197    ; INT
%define HouseClass.Offset.Capacity               0x19B    ; INT

%define HouseClass.Offset.AircraftTotals         0x19F    ; INT PTR
%define HouseClass.Offset.InfantryTotals         0x1A3    ; INT PTR
%define HouseClass.Offset.UnitTotals             0x1A7    ; INT PTR
%define HouseClass.Offset.BuildingTotals         0x1AB    ; INT PTR
%define HouseClass.Offset.VesselTotals           0x1AF    ; INT PTR
%define HouseClass.Offset.DestroyedAircraft      0x1B3    ; INT PTR
%define HouseClass.Offset.DestroyedInfantry      0x1B7    ; INT PTR
%define HouseClass.Offset.DestroyedUnits         0x1BB    ; INT PTR
%define HouseClass.Offset.DestroyedBuildings     0x1BF    ; INT PTR
%define HouseClass.Offset.DestroyedVessels       0x1C3    ; INT PTR
%define HouseClass.Offset.CapturedBuildings      0x1C7    ; INT PTR
%define HouseClass.Offset.TotalCrates            0x1CB    ; INT PTR

%define HouseClass.Offset.AircraftFactories      0x1CF    ; INT PTR
%define HouseClass.Offset.InfantryFactories      0x1D3    ; INT PTR
%define HouseClass.Offset.UnitFactories          0x1D7    ; INT PTR
%define HouseClass.Offset.VesselFactories        0x1DB    ; INT PTR
%define HouseClass.Offset.BuildingFactories      0x1DF    ; INT PTR

%define HouseClass.Offset.Power                  0x1E3    ; INT PTR
%define HouseClass.Offset.Drain                  0x1E7    ; INT PTR

%define HouseClass.Offset.AircraftFactory        0x1EB    ; INT PTR
%define HouseClass.Offset.InfantryFactory        0x1EF    ; INT PTR
%define HouseClass.Offset.UnitFactory            0x1F3    ; INT PTR
%define HouseClass.Offset.VesselFactory          0x1F7    ; INT PTR
%define HouseClass.Offset.BuildingFactory        0x1FB    ; INT PTR

;%define HouseClass.Offset.Radar                  0x1FF    ; ? ; byte
;%define HouseClass.Offset.FlagLocation           0x200    ; ? ; INT
;%define HouseClass.Offset.FlagHome               0x204    ; ? ; short

%define HouseClass.Offset.UnitsKilled            0x205    ; ? ; INT * 20 houses
%define HouseClass.Offset.UnitsLost              0x255    ; ? ; INT
%define HouseClass.Offset.BuildingsKilled        0x269    ; INT * 20 houses
%define HouseClass.Offset.BuildingsLost          0x2A9    ; INT
%define HouseClass.Offset.WhoLastHurtMe          0x2AD    ; byte (HousesType)

;%define HouseClass.Offset.StartLocationOverride  0x2B2    ; INT ; remastered-only?

%define HouseClass.Offset.Center                 0x2AE    ; INT
%define HouseClass.Offset.Radius                 0x2B2    ; INT

%define HouseClass.Offset.ZoneInfo               0x2B6    ; 5 zones * 12 bytes
%define HouseClass.Offset.LATime                 0x2F2    ; INT
%define HouseClass.Offset.LAType                 0x2F6    ; byte (RTTIType)
%define HouseClass.Offset.LAType                 0x2F7    ; byte (ZoneType)
%define HouseClass.Offset.LAEnemy                0x2F8    ; byte (HousesType)
%define HouseClass.Offset.ToCapture              0x2F9    ; INT

%define HouseClass.Offset.RadarSpied             0x2FD    ; INT
%define HouseClass.Offset.PointTotal             0x301    ; INT
%define HouseClass.Offset.PreferredTarget        0x305    ; byte

%define HouseClass.Offset.BQuantity              0x306    ; 84 original count * INT
%define HouseClass.Offset.UQuantity              0x456    ; 14 original count * INT
%define HouseClass.Offset.IQuantity              0x48E    ; 24 original count * INT
%define HouseClass.Offset.AQuantity              0x4EE    ; 7 original count * INT
%define HouseClass.Offset.VQuantity              0x50A    ; 5 original count * INT

%define HouseClass.Offset.Attack                 0x51E    ; CDTimerClass<FrameTimerClass>, 9 bytes
%define HouseClass.Offset.Enemy                  0x527    ; byte (HousesType)
%define HouseClass.Offset.AITimer                0x528    ; CDTimerClass<FrameTimerClass>, 9 bytes
%define HouseClass.Offset.UnitToTeleport         0x531    ; INT

%define HouseClass.Offset.BuildStructure         0x535    ; byte
%define HouseClass.Offset.BuildUnit              0x536    ; byte
%define HouseClass.Offset.BuildInfantry          0x537    ; byte
%define HouseClass.Offset.BuildAircraft          0x538    ; byte
%define HouseClass.Offset.BuildVessel            0x539    ; byte
;0x53A
%define HouseClass.Offset.Regions                0x53A    ; 4 bytes * 34 (w) * 34 (h)
%define HouseClass.Offset.NukeDest               0x174A   ; word
%define HouseClass.Offset.Allies                 0x174C   ; 4-byte bitfield
%define HouseClass.Offset.DamageTime             0x1750   ; CDTimerClass<FrameTimerClass>, 9 bytes (looks like it is added into remaster)
%define HouseClass.Offset.TeamTime               0x1759   ; CDTimerClass<FrameTimerClass>, 9 bytes (looks like it is added into remaster)
%define HouseClass.Offset.TriggerTime            0x1762   ; CDTimerClass<FrameTimerClass>, 9 bytes (looks like it is added into remaster)
%define HouseClass.Offset.SpeakAttackDelay       0x176B   ; CDTimerClass<FrameTimerClass>, 9 bytes (looks like it is added into remaster)
%define HouseClass.Offset.SpeakPowerDelay        0x1774   ; CDTimerClass<FrameTimerClass>, 9 bytes (looks like it is added into remaster)
%define HouseClass.Offset.SpeakMoneyDelay        0x177D   ; CDTimerClass<FrameTimerClass>, 9 bytes (looks like it is added into remaster)
%define HouseClass.Offset.SpeakMaxedDelay        0x1786   ; CDTimerClass<FrameTimerClass>, 9 bytes (looks like it is added into remaster)

%define HouseClass.Offset.RemapColor             0x178F   ; byte (PlayerColorType)
%define HouseClass.Offset.IniName                0x1790   ; 12 bytes

%define HouseClass.Offset.SaveLoadPadding        0x179C   ; Remastered: 256 bytes, this seems to be just 12 bytes
; 0x17A8

; Extended
%define HouseClass.Offset.BPreGroupScan          0x17A8   ; INT (32 bit-field)
; some empty space 0x17AC-0x17AF
%define HouseClass.Offset.IsSpectator            0x17B0   ; byte (should be BOOL)
%define HouseClass.Offset.SpawnLocation          0x17B4   ; word
%define HouseClass.Offset.ConnectionLost         0x17B8   ; byte (should be BOOL)
%define HouseClass.Offset.Resigned               0x17BC   ; byte (should be BOOL)
%define HouseClass.Offset.InstantCapture         0x1800   ; byte (should be BOOL)
%define HouseClass.Offset.NoBuildingCrew         0x1801   ; byte (should be BOOL)
%define HouseClass.Offset.SecondaryColorScheme   0x1802   ; byte
; some empty space 0x1803-0x180F
%define HouseClass.Offset.NewBQuantity           0x1810   ; should be 256 * 4 bytes
%define HouseClass.Offset.NewUQuantity           0x1C10   ; should be 256 * 4 bytes
%define HouseClass.Offset.NewIQuantity           0x2010   ; should be 256 * 4 bytes
%define HouseClass.Offset.NewAQuantity           0x2410   ; should be 256 * 4 bytes
%define HouseClass.Offset.NewVQuantity           0x2810   ; should be 256 * 4 bytes


; building in progress
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