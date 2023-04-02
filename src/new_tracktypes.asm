; New track types
; RA defines up to 13 TrackTypes and 67 TurnTrackTypes. To truly implement C&C Weapons Factory, a new set should be defined as it is distinct from any other
; definitions moved to defines_tracktypes

; fortunately, most internal code have fixed indices and checks for custom tracks can be avoided. The real check occurs for the refinery and warfactory exits

@HOOK 0x004B6A76 _DriveClass_TrackControl_Route
@HOOK 0x004B6AA4 _DriveClass_RawTracks_Route

_DriveClass_TrackControl_Route: 
; eax is the TrackNumber. Reroute if larger or equal to the original count 67
    cmp  eax,TurnTrackTypes.OriginalCount
    jge  .NewTrack
    mov  edx, 0x006010CC ;DriveClass::TrackControl[x]
    jmp  0x004B6A7B

; reroute
.NewTrack:
    sub  eax,TurnTrackTypes.OriginalCount ; remove 67
    mov  edx, TrackType.NewTurnTracks
    jmp  0x004B6A7B


_DriveClass_RawTracks_Route:
; eax is tracknum (note 'tracknum - 1' is implemented by offsetting with 0x00600fec instead of 0x00600ffc. Reroute if larger than to the original count 13
    cmp  eax,TrackTypes.OriginalCount
    jg  .NewTrack
    shl  eax, 0x4
    mov  eax, DWORD [0x00600FEC + eax] ;DriveClass::RawTracks[x-1]
    jmp  0x004B6AAD

; reroute
.NewTrack:
    sub  eax,TrackTypes.OriginalCount ; remove 13
    shl  eax, 0x4
    mov  eax, DWORD [TrackType.NewRawTracks - 0x10 + eax]
    jmp  0x004B6AAD


