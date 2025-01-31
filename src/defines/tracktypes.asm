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

%assign TrackTypes.OriginalCount                  13
%assign TurnTrackTypes.OriginalCount              67

;DriveClass::TrackControl[67]                     0x006010CC - 0x006011D7
;DriveClass::RawTracks[13]                        0x00600FFC - 0x006010CB
;%assign TrackType.Track01                       0x00600750
;%assign TrackType.Track02                       0x006007C8
;%assign TrackType.Track03                       0x00600868
;%assign TrackType.Track04                       0x0060097C
;%assign TrackType.Track05                       0x00600A40
;%assign TrackType.Track06                       0x00600B78
;%assign TrackType.Track07                       0x00600C98
;%assign TrackType.Track08                       0x00600D24
;%assign TrackType.Track09                       0x00600D94
;%assign TrackType.Track00                       0x00600E30
;%assign TrackType.Track11                       0x00600EBC
;%assign TrackType.Track12                       0x00600F04
;%assign TrackType.Track13                       0x00600F48

[section .rdata] 
TrackType.NewTurnTracks   db 14,14,0xA0,0


TrackType.NewRawTracks    dd d.TrackType.Track14,-1,0,-1


; DIR_SW-10 = 0x96
d.TrackType.Track14   db 0x68,0x00,0x21,0xFF,0x96, \
                         0x68,0x00,0x21,0xFF,0x96, \
                         0x68,0x00,0x2C,0xFF,0x96, \
                         0x68,0x00,0x2C,0xFF,0x96, \
                         0x60,0x00,0x41,0xFF,0x96, \
                         0x60,0x00,0x41,0xFF,0x96, \
                         0x60,0x00,0x4C,0xFF,0x96, \
                         0x55,0x00,0x56,0xFF,0x96, \
                         0x55,0x00,0x61,0xFF,0x96, \
                         0x4B,0x00,0x6C,0xFF,0x96, \
                         0x4B,0x00,0x76,0xFF,0x96, \
                         0x40,0x00,0x81,0xFF,0x96, \
                         0x40,0x00,0x8C,0xFF,0x96, \
                         0x35,0x00,0x96,0xFF,0x96, \
                         0x35,0x00,0xA1,0xFF,0x96, \
                         0x2B,0x00,0xAC,0xFF,0x96, \
                         0x2B,0x00,0xB6,0xFF,0x96, \
                         0x20,0x00,0xC1,0xFF,0x96, \
                         0x20,0x00,0xCC,0xFF,0x97, \
                         0x15,0x00,0xD6,0xFF,0x99, \
                         0x15,0x00,0xE1,0xFF,0x9B, \
                         0x0B,0x00,0xEC,0xFF,0x9D, \
                         0x0B,0x00,0xF6,0xFF,0x9F, \
                         0x00,0x00,0x00,0x00,0xA0

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

[section .text] 





