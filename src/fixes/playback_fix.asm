;----------------------------------------------------------------
; src/fixes/playback_fix.asm
;
; Fixes Record and Playback functions by removing a redundant function that makes RNG calls. (Thank you, Iran, for providing the address and location of the function call)
; Additionally, remove object selection actions from the recording. (used to be 'attract.asm')
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

@LJMP 0x0052BE87, _Queue_AI_Multiplayer__Remove_Compute_Game_CRC
@LJMP 0x004AB16C, _Do_Record_Playback_Dont_Record_Objects_Selected_And_Other_Stuff
@LJMP 0x004AB321, _Do_Record_Playback_Dont_Playback_Objects_Selected_And_Other_Stuff
@LJMP 0x0052BECB, _Queue_Playback_Remove_Single_Player_Only_Playback_Check

_Queue_AI_Multiplayer__Remove_Compute_Game_CRC:
    jmp  0x0052BEAC

_Queue_Playback_Remove_Single_Player_Only_Playback_Check:
    jmp  0x0052BED8

_Do_Record_Playback_Dont_Playback_Objects_Selected_And_Other_Stuff:
    jmp  0x004AB4D5

_Do_Record_Playback_Dont_Record_Objects_Selected_And_Other_Stuff:
    jmp  0x004AB2E6
