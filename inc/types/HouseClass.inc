;----------------------------------------------------------------
; inc/types/houseclass.asm
;
; Macros to access HouseClass offsets
;
;----------------------------------------------------------------

%ifndef TYPES_HOUSECLASS
%define TYPES_HOUSECLASS

cextern HouseTypeClass__new
cextern HouseClass.Count
cextern HouseClass.Array
cextern INI_Read_Value_Buffer
cextern INI_Read_String_Buffer


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

%define HouseClass.Offset.IsSpectator            0x17AC   ; byte (should be BOOL)
%define HouseClass.Bit.IsSpectator               1  
%define HouseClass.Offset.ConnectionLost         0x17AC   ; byte (should be BOOL)
%define HouseClass.Bit.ConnectionLost            2
%define HouseClass.Offset.Resigned               0x17AC   ; byte (should be BOOL)
%define HouseClass.Bit.Resigned                  3  
%define HouseClass.Offset.InstantCapture         0x17AC   ; byte (should be BOOL)
%define HouseClass.Bit.InstantCapture            4  
%define HouseClass.Offset.NoBuildingCrew         0x17AC   ; byte (should be BOOL)
%define HouseClass.Bit.NoBuildingCrew            5  
%define HouseClass.Offset.AllyTheNeutralHouse    0x17AC    ; BOOL
%define HouseClass.Bit.AllyTheNeutralHouse       6  

; some empty space 0x17AD-0x17AF
%define HouseClass.Offset.HouseTriggers          0x17B0   ; 24 bytes

%define HouseClass.Offset.SpawnLocation          0x17C8   ; word
%define HouseClass.Offset.SecondaryColorScheme   0x17CA   ; byte
%define HouseClass.Offset.HeliUnit               0x17CB   ; byte
%define HouseClass.Offset.MCVUnit                0x17CC   ; byte
; some empty space 0x17CD-0x180F
%define HouseClass.Offset.NewBQuantity           0x1810   ; should be 256 * 4 bytes
%define HouseClass.Offset.NewUQuantity           0x1C10   ; should be 256 * 4 bytes
%define HouseClass.Offset.NewIQuantity           0x2010   ; should be 256 * 4 bytes
%define HouseClass.Offset.NewAQuantity           0x2410   ; should be 256 * 4 bytes
%define HouseClass.Offset.NewVQuantity           0x2810   ; should be 256 * 4 bytes
; 0x2C10
; 0x2C11

; INI String controls
str.HouseClass.RemapColor1                       db"Colour",0                          ;new ini feature
str.HouseClass.RemapColor2                       db"Color",0                           ;new ini feature
str.HouseClass.ActLike                           db"Country",0                         ;new ini feature
str.HouseClass.InstantCapture                    db"BuildingsGetInstantlyCaptured",0   ;new ini feature
str.HouseClass.NoBuildingCrew                    db"NoBuildingCrew",0                  ;new ini feature
str.HouseClass.SecondaryColorScheme              db"SecondaryColorScheme",0            ;new ini feature
str.HouseClass.AllyTheNeutralHouse               db"AllyTheNeutralHouse",0             ;new ini feature
str.HouseClass.HeliUnit                          db"HeliUnit",0                        ;new ini feature
str.HouseClass.MCVUnit                           db"MCVUnit",0                         ;new ini feature



%define HouseClass.FromIndex(d_index,reg_output)                        AbstractTypeClass.FromIndex            d_index, HouseClass.Count, HouseClass.Array, reg_output
;%define HouseClass.FromID(d_index,reg_output)                           AbstractTypeClass.FromID               d_index, HouseClass.Count, HouseClass.Array, reg_output

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

%define HouseClass.RemapColor.Get(ptr_type,reg_output)                             GetByte                                ptr_type, HouseClass.Offset.RemapColor, reg_output
%define HouseClass.RemapColor.Set(ptr_type,value)                                  SetByte                                ptr_type, HouseClass.Offset.RemapColor, value
%define HouseClass.RemapColor.Read1(ptr_type,ptr_rules,str_section,function)       HouseClass.ReadStringToByteExt         ptr_type, ptr_rules, HouseClass.Offset.RemapColor, str_section, str.HouseClass.RemapColor1, function
%define HouseClass.RemapColor.Read2(ptr_type,ptr_rules,str_section,function)       HouseClass.ReadStringToByteExt         ptr_type, ptr_rules, HouseClass.Offset.RemapColor, str_section, str.HouseClass.RemapColor2, function

%define HouseClass.ActLike.Get(ptr_type,reg_output)                                GetByte                                ptr_type, HouseClass.Offset.ActLike, reg_output
%define HouseClass.ActLike.Set(ptr_type,value)                                     SetByte                                ptr_type, HouseClass.Offset.ActLike, value
%define HouseClass.ActLike.Read(ptr_type,ptr_rules,str_section,function)           HouseClass.ReadStringToByteExt         ptr_type, ptr_rules, HouseClass.Offset.ActLike, str_section, str.HouseClass.ActLike, function

%define HouseClass.InstantCapture.Get(ptr_type,reg_output)                         GetBool                                ptr_type, HouseClass.Offset.InstantCapture, HouseClass.Bit.InstantCapture, reg_output
%define HouseClass.InstantCapture.Set(ptr_type,value)                              SetBool                                ptr_type, HouseClass.Offset.InstantCapture, HouseClass.Bit.InstantCapture, value
%define HouseClass.InstantCapture.Read(ptr_type,ptr_rules,str_section)             HouseClass.ReadBool                    ptr_type, ptr_rules, HouseClass.Offset.InstantCapture, HouseClass.Bit.InstantCapture, str_section, str.HouseClass.InstantCapture

%define HouseClass.NoBuildingCrew.Get(ptr_type,reg_output)                         GetBool                                ptr_type, HouseClass.Offset.NoBuildingCrew, HouseClass.Bit.NoBuildingCrew, reg_output
%define HouseClass.NoBuildingCrew.Set(ptr_type,value)                              SetBool                                ptr_type, HouseClass.Offset.NoBuildingCrew, HouseClass.Bit.NoBuildingCrew, value
%define HouseClass.NoBuildingCrew.Read(ptr_type,ptr_rules,str_section)             HouseClass.ReadBool                    ptr_type, ptr_rules, HouseClass.Offset.NoBuildingCrew, HouseClass.Bit.NoBuildingCrew, str_section, str.HouseClass.NoBuildingCrew

%define HouseClass.SecondaryColorScheme.Get(ptr_type,reg_output)                      GetByte                             ptr_type, HouseClass.Offset.SecondaryColorScheme, reg_output
%define HouseClass.SecondaryColorScheme.Set(ptr_type,value)                           SetByte                             ptr_type, HouseClass.Offset.SecondaryColorScheme, value
%define HouseClass.SecondaryColorScheme.Read(ptr_type,ptr_rules,str_section,function) HouseClass.ReadStringToByteExt      ptr_type, ptr_rules, HouseClass.Offset.SecondaryColorScheme, str_section, str.HouseClass.SecondaryColorScheme, function

%define HouseClass.AllyTheNeutralHouse.Get(ptr_type,reg_output)                    GetBool                                ptr_type, HouseClass.Offset.AllyTheNeutralHouse, HouseClass.Bit.AllyTheNeutralHouse, reg_output
%define HouseClass.AllyTheNeutralHouse.Set(ptr_type,value)                         SetBool                                ptr_type, HouseClass.Offset.AllyTheNeutralHouse, HouseClass.Bit.AllyTheNeutralHouse, value
%define HouseClass.AllyTheNeutralHouse.Read(ptr_type,ptr_rules,str_section)        HouseClass.ReadBool                    ptr_type, ptr_rules, HouseClass.Offset.AllyTheNeutralHouse, HouseClass.Bit.AllyTheNeutralHouse, str_section, str.HouseClass.AllyTheNeutralHouse

%define HouseClass.HeliUnit.Get(ptr_type,reg_output)                               GetByte                                ptr_type, HouseClass.Offset.HeliUnit, reg_output
%define HouseClass.HeliUnit.Set(ptr_type,value)                                    SetByte                                ptr_type, HouseClass.Offset.HeliUnit, value
%define HouseClass.HeliUnit.Read(ptr_type,ptr_rules,str_section,function)          HouseClass.ReadStringToByteExt         ptr_type, ptr_rules, HouseClass.Offset.HeliUnit, str_section, str.HouseClass.HeliUnit, function

%define HouseClass.MCVUnit.Get(ptr_type,reg_output)                                GetByte                                ptr_type, HouseClass.Offset.MCVUnit, reg_output
%define HouseClass.MCVUnit.Set(ptr_type,value)                                     SetByte                                ptr_type, HouseClass.Offset.MCVUnit, value
%define HouseClass.MCVUnit.Read(ptr_type,ptr_rules,str_section,function)           HouseClass.ReadStringToByteExt         ptr_type, ptr_rules, HouseClass.Offset.MCVUnit, str_section, str.HouseClass.MCVUnit, function


; <ptr_type>, <ptr_rules>, <data_offset>, <data_bit>, <section>, <key>
%macro HouseClass.ReadBool    6
    push edx
    push ecx
    GetBit byte[%1+%3],%4
    xor  ecx,ecx
    mov  cl,al
    call_INIClass__Get_Bool %2,%5,%6,ecx
    SetBit[%1+%3],%4,al
    pop  ecx
    pop  edx
%endmacro


; <ptr_type>, <ptr_rules>, <data_offset>, <section>, <key>
%macro HouseClass.ReadByte    5
    push edx
    push ecx
    xor  ecx,ecx
    mov  byte cl,[%1+%3]
    call_INIClass__Get_Int %2,%4,%5,ecx
    mov  byte[%1+%3],al
    pop  ecx
    pop  edx
%endmacro

; <ptr_type>, <ptr_rules>, <data_offset>, <section>, <key>, <function>
%macro HouseClass.ReadStringToByteExt    6
    push edx
    push ecx
    xor  ecx,ecx
    mov  byte cl,[%1+%3]
    mov  byte[INI_Read_Value_Buffer],cl
    xor  ecx,ecx
    call_INIClass__Get_String %2,%4,%5,ecx,INI_Read_String_Buffer,INI_STRING_BUFFER_LENGTH
    mov  byte al,[INI_Read_String_Buffer] ;just check if the first byte is NULL / 0
    test al,al
    jz   %%null_string
  %%valid_string:
    mov  eax,INI_Read_String_Buffer
    call %6
    mov  byte[%1+%3],al
    jmp  %%done
  %%null_string:
    ;mov  byte al,[INI_Read_Value_Buffer]
    ;mov  byte[%1+%3],al
  %%done:
    mov  dword[INI_Read_Value_Buffer],0
    pop  ecx
    pop  edx
%endmacro


%macro HouseTypeClass.new    2
    mov  eax,HouseTypeClass.NEW_SIZE ; size
    call HouseTypeClass__new
    test eax,eax
    jz   %%skip
    mov  ecx,6
    mov  dl,byte[%1]
    mov  esi,%1+5
    mov  byte[eax],dl
    mov  edx,[%1+1]
    lea  edi,[eax+5]
    mov  dword[eax+1],edx
    add  eax,0x12C
    rep movsd 
    mov  edx,dword[%1+0x1D]
    mov  ecx,0x40
    mov  dword[eax-0x10B],0x005F6468
    mov  esi,%1+HouseTypeClass.Offset.Suffix
    mov  dword[eax-0x10F],edx
    mov  dl,byte[%1+HouseTypeClass.Offset.House]
    lea  edi,[eax-0x106]
    mov  byte[eax-0x107],dl
    mov  edx,[%1+0x126]
    rep movsd 
    mov  dword[eax-6],edx
    mov  dl,byte[%1+HouseTypeClass.Offset.RemapColor]
    mov  byte[eax-2],dl
    mov  dl,byte[%1+HouseTypeClass.Offset.Prefix]
    mov  byte[eax-1],dl
    mov  edx,%1+HouseTypeClass.Offset.FirepowerBias
    call 0x0041CB70 ; fixed::Data::Composite::Composite(fixed::Data::Composite &)
    add  eax,2
    mov  dx,word[%1+HouseTypeClass.Offset.FirepowerBias]
    mov  word[eax-2],dx
    mov  edx,%1+HouseTypeClass.Offset.GroundspeedBias
    call 0x0041CB70 ; fixed::Data::Composite::Composite(fixed::Data::Composite &)
    add  eax,2
    mov  dx,word[%1+HouseTypeClass.Offset.GroundspeedBias]
    mov  word[eax-2],dx
    mov  edx,%1+HouseTypeClass.Offset.AirspeedBias
    call 0x0041CB70 ; fixed::Data::Composite::Composite(fixed::Data::Composite &)
    add  eax,2
    mov  dx,word[%1+HouseTypeClass.Offset.AirspeedBias]
    mov  word[eax-2],dx
    mov  edx,%1+HouseTypeClass.Offset.ArmorBias
    call 0x0041CB70 ; fixed::Data::Composite::Composite(fixed::Data::Composite &)
    add  eax,2
    mov  dx,word[%1+HouseTypeClass.Offset.ArmorBias]
    mov  word[eax-2],dx
    mov  edx,%1+HouseTypeClass.Offset.ROFBias
    call 0x0041CB70 ; fixed::Data::Composite::Composite(fixed::Data::Composite &)
    add  eax,2
    mov  dx,word[%1+HouseTypeClass.Offset.ROFBias]
    mov  word[eax-2],dx
    mov  edx,%1+HouseTypeClass.Offset.CostBias
    call 0x0041CB70 ; fixed::Data::Composite::Composite(fixed::Data::Composite &)
    add  eax,2
    mov  dx,word[%1+HouseTypeClass.Offset.CostBias]
    mov  word[eax-2],dx
    mov  edx,%1+HouseTypeClass.Offset.BuildSpeedBias
    call 0x0041CB70 ; fixed::Data::Composite::Composite(fixed::Data::Composite &)
    sub  eax,0x138
    mov  dx,word[%1+HouseTypeClass.Offset.BuildSpeedBias]
    mov  word[eax+0x138],dx
    mov  dword[eax+0x21],0x005FA8A8
    ;mov  dword[HouseTypeClass.DestructorPtrs-0x14*8+%2*8],0x004CD4F0 ; HouseTypeClass::~HouseTypeClass(void)
    ;mov  dword[HouseTypeClass.DestructorPtrs-0x14*8+4+%2*8],%1
    ;mov  dword[eax+0x21],HouseTypeClass.DestructorPtrs;+0xC*8 ;0x005FA8A8
%%skip:
%endmacro

%endif