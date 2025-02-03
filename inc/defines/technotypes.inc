;----------------------------------------------------------------
; inc/defines/technotypes.inc
;
; TechnoType Definitions
;   Includes BuildingType, UnitType, InfantryType, VesselType and AircraftType definitions supported by the game
;
;----------------------------------------------------------------

%ifndef DEFINE_TECHNOTYPES
%define DEFINE_TECHNOTYPES 

; BuildingType
%assign        BuildingType.ATEK    0
%assign        BuildingType.IRON    1
%assign        BuildingType.WEAP    2
%assign        BuildingType.PDOX    3
%assign        BuildingType.PBOX    4
%assign        BuildingType.HBOX    5
%assign        BuildingType.DOME    6
%assign        BuildingType.GAP     7
%assign        BuildingType.GUN     8
%assign        BuildingType.AGUN    9
%assign        BuildingType.FTUR    10
%assign        BuildingType.FACT    11
%assign        BuildingType.PROC    12
%assign        BuildingType.SILO    13
%assign        BuildingType.HPAD    14
%assign        BuildingType.SAM     15
%assign        BuildingType.AFLD    16
%assign        BuildingType.POWR    17
%assign        BuildingType.APWR    18
%assign        BuildingType.STEK    19
%assign        BuildingType.HOSP    20
%assign        BuildingType.BARR    21
%assign        BuildingType.TENT    22
%assign        BuildingType.KENN    23
%assign        BuildingType.FIX     24
%assign        BuildingType.BIO     25
%assign        BuildingType.MISS    26
%assign        BuildingType.SYRD    27
%assign        BuildingType.SPEN    28
%assign        BuildingType.MSLO    29
%assign        BuildingType.FCOM    30
%assign        BuildingType.TSLA    31
%assign        BuildingType.WEAF    32
%assign        BuildingType.FACF    33
%assign        BuildingType.SYRF    34
%assign        BuildingType.SPEF    35
%assign        BuildingType.DOMF    36
; civilian buildings
%assign        BuildingType.MINV    43
%assign        BuildingType.MINP    44
%assign        BuildingType.V01     45
%assign        BuildingType.V02     46
%assign        BuildingType.V03     47
%assign        BuildingType.V04     48
%assign        BuildingType.V05     49
%assign        BuildingType.V06     40
%assign        BuildingType.V07     51
%assign        BuildingType.V08     52
%assign        BuildingType.V09     53
%assign        BuildingType.V10     54
%assign        BuildingType.V11     55
%assign        BuildingType.V12     56
%assign        BuildingType.V13     57
%assign        BuildingType.V14     58
%assign        BuildingType.V15     59
%assign        BuildingType.V16     60
%assign        BuildingType.V17     61
%assign        BuildingType.V18     62
%assign        BuildingType.V19     63
%assign        BuildingType.V20     64
%assign        BuildingType.V21     65
%assign        BuildingType.V22     66
%assign        BuildingType.V23     67
%assign        BuildingType.V24     68
%assign        BuildingType.V25     69
%assign        BuildingType.V26     70
%assign        BuildingType.V27     71
%assign        BuildingType.V28     72
%assign        BuildingType.V29     73
%assign        BuildingType.V30     74
%assign        BuildingType.V31     75
%assign        BuildingType.V32     76
%assign        BuildingType.V33     77
%assign        BuildingType.V34     78
%assign        BuildingType.V35     79
%assign        BuildingType.V36     80
%assign        BuildingType.V37     81
%assign        BuildingType.BARL    82
%assign        BuildingType.BRL3    83



; UnitType
%assign        UnitType.4TNK    0
%assign        UnitType.3TNK    1
%assign        UnitType.2TNK    2
%assign        UnitType.1TNK    3
%assign        UnitType.APC     4
%assign        UnitType.MNLY    5
%assign        UnitType.JEEP    6
%assign        UnitType.HARV    7
%assign        UnitType.ARTY    8
%assign        UnitType.MRJ     9
%assign        UnitType.MGG     10
%assign        UnitType.MCV     11
%assign        UnitType.V2RL    12
%assign        UnitType.TRUK    13
%assign        UnitType.ANT1    14 ; Aftermath
%assign        UnitType.ANT2    15
%assign        UnitType.ANT3    16
%assign        UnitType.CTNK    17
%assign        UnitType.TTNK    18
%assign        UnitType.QTNK    19
%assign        UnitType.DTRK    20
%assign        UnitType.STNK    21


; VesselType
%assign        VesselType.SS       0
%assign        VesselType.DD       1
%assign        VesselType.CA       2
%assign        VesselType.LST      3
%assign        VesselType.PT       4
%assign        VesselType.MSUB     5 ; Aftermath
%assign        VesselType.CARR     6


; InfantryType
%assign        InfantryType.E1         0
%assign        InfantryType.E2         1
%assign        InfantryType.E3         2
%assign        InfantryType.E4         3
%assign        InfantryType.E6         4
%assign        InfantryType.E7         5
%assign        InfantryType.SPY        6
%assign        InfantryType.THF        7
%assign        InfantryType.MEDI       8
%assign        InfantryType.GNRL       9
%assign        InfantryType.DOG        10
%assign        InfantryType.C1         11
%assign        InfantryType.C2         12
%assign        InfantryType.C3         13
%assign        InfantryType.C4         14
%assign        InfantryType.C5         15
%assign        InfantryType.C6         16
%assign        InfantryType.C7         17
%assign        InfantryType.C8         18
%assign        InfantryType.C9         19
%assign        InfantryType.C10        20
%assign        InfantryType.EINSTEIN   21
%assign        InfantryType.DELPHI     22
%assign        InfantryType.CHAN       23
%assign        InfantryType.SHOK       24 ; Aftermath
%assign        InfantryType.MECH       25


; AircraftType
%assign        AircraftType.TRAN       0
%assign        AircraftType.BADR       1
%assign        AircraftType.U2         2
%assign        AircraftType.MIG        3
%assign        AircraftType.YAK        4
%assign        AircraftType.HELI       5
%assign        AircraftType.HIND       6

%endif
