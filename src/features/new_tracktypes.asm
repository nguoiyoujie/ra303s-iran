;----------------------------------------------------------------
; src/features/new_tracktypes.asm
;
; RA defines up to 13 TrackTypes and 67 TurnTrackTypes. To truly implement C&C Weapons Factory, a new set is defined as it is distinct from any other.
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

; New track types
; definitions moved to defines_tracktypes
; fortunately, most internal code have fixed indices and checks for custom tracks can be avoided. The real check occurs for the refinery and warfactory exits
@LJMP 0x004B6A76,_DriveClass_TrackControl_Route
@LJMP 0x004B6AA4,_DriveClass_RawTracks_Route
@LJMP 0x004B82E5,_DriveClass_Mark_Track_TrackControl_Route
@LJMP 0x004B82F7,_DriveClass_Mark_Track_RawTracks_Route


_DriveClass_TrackControl_Route: 
; eax is the TrackNumber. Reroute if larger or equal to the original count 67
    cmp  eax,TurnTrackTypes.OriginalCount
    jge  .NewTrack
    mov  edx,0x006010CC ;DriveClass::TrackControl[x]
    jmp  0x004B6A7B

; reroute
.NewTrack:
    sub  eax,TurnTrackTypes.OriginalCount ; remove 67
    mov  edx,TrackType.NewTurnTracks
    jmp  0x004B6A7B


_DriveClass_RawTracks_Route:
; eax is tracknum (note 'tracknum-1' is implemented by offsetting with 0x00600fec instead of 0x00600ffc. Reroute if larger than to the original count 13
    cmp  eax,TrackTypes.OriginalCount
    jg  .NewTrack
    shl  eax,0x4
    mov  eax,dword[0x00600FEC+eax] ;DriveClass::RawTracks[x-1]
    jmp  0x004B6AAD

; reroute
.NewTrack:
    sub  eax,TrackTypes.OriginalCount ; remove 13
    shl  eax,0x4
    mov  eax,dword[TrackType.NewRawTracks-0x10+eax]
    jmp  0x004B6AAD


_DriveClass_Mark_Track_TrackControl_Route: 
; dl is the TrackNumber. Reroute if larger or equal to the original count 67
    cmp  edx,TurnTrackTypes.OriginalCount
    jge  .NewTrack
    mov  edx,dword[edx*4+0x006010C9] ;DriveClass::TrackControl[x].Track
    jmp  0x004B82EC

; reroute
.NewTrack:
    sub  edx,TurnTrackTypes.OriginalCount ; remove 67
    mov  edx,dword[edx*4+TrackType.NewRawTracks-4]
    jmp  0x004B82EC


_DriveClass_Mark_Track_RawTracks_Route:
; eax is tracknum (note 'tracknum-1' is implemented by offsetting with 0x00600fec instead of 0x00600ffc. Reroute if larger than to the original count 13
    cmp  edx,TrackTypes.OriginalCount
    jg  .NewTrack
    shl  edx,0x4
    mov  eax,dword[0x00600FEC+edx] ;DriveClass::RawTracks[x-1]
    jmp  0x004B8300

; reroute
.NewTrack:
    sub  edx,TrackTypes.OriginalCount ; remove 13
    shl  edx,0x4
    mov  eax,dword[TrackType.NewRawTracks-0x10+edx]
    jmp  0x004B8300

