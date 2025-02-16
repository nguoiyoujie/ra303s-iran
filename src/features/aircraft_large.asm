;----------------------------------------------------------------
; src/features/type_extensions/AircraftTypeClass/aircraft_large.asm
;
; Allow aircraft to define themselves as 'large'. This tells the game to:
; 1. Draw a larger health box around the aircraft, and
; 2. Refresh the surrounding tiles at radius 2 around the aircraft when it moves, like the Badger Plane. This avoids bleeding graphics that can be caused by large aircraft with small refresh footprint
; 
; This function is enabled by setting [<AircraftType>] Large=true.
; No compatibility issues is expected.
;
;----------------------------------------------------------------

@HACK 0x004040BF,0x004040CD,_AircraftTypeClass__Dimensions_CheckIsGigundo
    test byte[eax+AircraftTypeClass.Offset.IsGigundo],1<<(AircraftTypeClass.Bit.IsGigundo-1) 
    jnz  0x004040CD
    jmp  0x004040DD
@ENDHACK


@LJMP 0x0041E245,0x0041E4DC; AircraftClass__Overlap_List_Skip ; skipped in Remastered
@SET 0x004040CD,{mov dword[edx],0x30} ; 48, was 56 (0x38)
@SET 0x004040D3,{mov dword[ebx],0x30} ; 48, was 56 (0x38)

@HACK 0x0041E504,0x0041E512,AircraftClass__Overlap_List_ReimplementOverlap
    test byte[eax+AircraftTypeClass.Offset.IsGigundo],1<<(AircraftTypeClass.Bit.IsGigundo-1) 
    jnz  0x0041E512
    jmp  0x0041E520
@ENDHACK
