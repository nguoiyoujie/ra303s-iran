;----------------------------------------------------------------
; src/defines/tracktypes.asm
;
; TrackType Definitions
;   Unit Movement between Cells work on fixed locomotion; units stay on the fixed path until traversed.
;   This includes movement along the 8 directions, rotation, and some special movement such as Tib Refinery docking/undocking, and War Factory eject
;
;----------------------------------------------------------------

; New track types
; RA defines up to 13 TrackTypes and 67 TurnTrackTypes. To truly implement C&C Weapons Factory, a new set should be defined as it is distinct from any other

%define TrackTypes.OriginalCount                  13
%define TurnTrackTypes.OriginalCount              67

;DriveClass::TrackControl[67]                     0x006010cc - 0x006011d7
;DriveClass::RawTracks[13]                        0x00600ffc - 0x006010cb
;%define TrackType.Track01                       0x00600750
;%define TrackType.Track02                       0x006007c8
;%define TrackType.Track03                       0x00600868
;%define TrackType.Track04                       0x0060097c
;%define TrackType.Track05                       0x00600a40
;%define TrackType.Track06                       0x00600b78
;%define TrackType.Track07                       0x00600c98
;%define TrackType.Track08                       0x00600d24
;%define TrackType.Track09                       0x00600d94
;%define TrackType.Track00                       0x00600e30
;%define TrackType.Track11                       0x00600ebc
;%define TrackType.Track12                       0x00600f04
;%define TrackType.Track13                       0x00600f48

TrackType.NewTurnTracks   db \
                         14, 14, 0xa0, 0


TrackType.NewRawTracks    dd \
                         d.TrackType.Track14, -1, 0, -1


; DIR_SW-10 = 96h
d.TrackType.Track14   db 0x68, 0x00, 0x21, 0xff, 0x96, \
                         0x68, 0x00, 0x21, 0xff, 0x96, \
                         0x68, 0x00, 0x2c, 0xff, 0x96, \
                         0x68, 0x00, 0x2c, 0xff, 0x96, \
                         0x60, 0x00, 0x41, 0xff, 0x96, \
                         0x60, 0x00, 0x41, 0xff, 0x96, \
                         0x60, 0x00, 0x4c, 0xff, 0x96, \
                         0x55, 0x00, 0x56, 0xff, 0x96, \
                         0x55, 0x00, 0x61, 0xff, 0x96, \
                         0x4b, 0x00, 0x6c, 0xff, 0x96, \
                         0x4b, 0x00, 0x76, 0xff, 0x96, \
                         0x40, 0x00, 0x81, 0xff, 0x96, \
                         0x40, 0x00, 0x8c, 0xff, 0x96, \
                         0x35, 0x00, 0x96, 0xff, 0x96, \
                         0x35, 0x00, 0xa1, 0xff, 0x96, \
                         0x2b, 0x00, 0xac, 0xff, 0x96, \
                         0x2b, 0x00, 0xb6, 0xff, 0x96, \
                         0x20, 0x00, 0xc1, 0xff, 0x96, \
                         0x20, 0x00, 0xcc, 0xff, 0x97, \
                         0x15, 0x00, 0xd6, 0xff, 0x99, \
                         0x15, 0x00, 0xe1, 0xff, 0x9b, \
                         0x0b, 0x00, 0xec, 0xff, 0x9d, \
                         0x0b, 0x00, 0xf6, 0xff, 0x9f, \
                         0x00, 0x00, 0x00, 0x00, 0xa0

;; C&C Weapons Factory
;DriveClass::TrackType const DriveClass::Track13[] = {
;	{XYP_COORD(10,-21),(DirType)(DIR_SW-10)},
;	{XYP_COORD(10,-21),(DirType)(DIR_SW-10)},
;	{XYP_COORD(10,-20),(DirType)(DIR_SW-10)},
;	{XYP_COORD(10,-20),(DirType)(DIR_SW-10)},
;	{XYP_COORD(9,-18),(DirType)(DIR_SW-10)},
;	{XYP_COORD(9,-18),(DirType)(DIR_SW-10)},
;	{XYP_COORD(9,-17),(DirType)(DIR_SW-10)},
;	{XYP_COORD(8,-16),(DirType)(DIR_SW-10)},
;	{XYP_COORD(8,-15),(DirType)(DIR_SW-10)},
;	{XYP_COORD(7,-14),(DirType)(DIR_SW-10)},
;	{XYP_COORD(7,-13),(DirType)(DIR_SW-10)},
;	{XYP_COORD(6,-12),(DirType)(DIR_SW-10)},
;	{XYP_COORD(6,-11),(DirType)(DIR_SW-10)},
;	{XYP_COORD(5,-10),(DirType)(DIR_SW-10)},
;	{XYP_COORD(5,-9),(DirType)(DIR_SW-10)},
;	{XYP_COORD(4,-8),(DirType)(DIR_SW-10)},
;	{XYP_COORD(4,-7),(DirType)(DIR_SW-10)},
;	{XYP_COORD(3,-6),(DirType)(DIR_SW-10)},
;	{XYP_COORD(3,-5),(DirType)(DIR_SW-9)},
;	{XYP_COORD(2,-4),(DirType)(DIR_SW-7)},
;	{XYP_COORD(2,-3),(DirType)(DIR_SW-5)},
;	{XYP_COORD(1,-2),(DirType)(DIR_SW-3)},
;	{XYP_COORD(1,-1),(DirType)(DIR_SW-1)},
;
;	{0x00000000L,DIR_SW}
;};






