;----------------------------------------------------------------
; src/fixes/playback_fix.asm
;
; Fixes Record and Playback functions by removing a redundant function that makes RNG calls. (Thank you, Iran, for providing the address and location of the function call)
; Additionally, remove object selection actions from the recording. (used to be 'attract.asm')
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

@SJMP 0x0052BE87,0x0052BEAC ; _Queue_AI_Multiplayer__Remove_Compute_Game_CRC
@LJMP 0x004AB16C,0x004AB2E6 ; _Do_Record_Playback_Dont_Record_Objects_Selected_And_Other_Stuff
@LJMP 0x004AB321,0x004AB4D5 ; _Do_Record_Playback_Dont_Playback_Objects_Selected_And_Other_Stuff
@SJMP 0x0052BECB,0x0052BED8 ; _Queue_Playback_Remove_Single_Player_Only_Playback_Check

