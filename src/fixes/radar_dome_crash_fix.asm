;----------------------------------------------------------------
; src/fixes/radar_dome_crash_fix.asm
;
; Fix the crash when the radar dome is built
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

@HACK 0x005B4CE4,0x005B4CE9,_Build_Frame_Cause_Crash_If_Trying_To_Draw_Uncompressed_Shape
    mov  dword[0],0
    jmp  0x005B4CE7
@ENDHACK


@HACK 0x005B48D5,0x005B48DA,_Check_Use_Compressed_Shapes_Use_Compressed_Shapes_Always
    xor  eax,eax
    jmp  0x005B48DA
@ENDHACK

; Patch first instruction of the function to jump to the retn instruction at the end of it, to patch out functionality
;@LJMP 0x00530CF4,0x00530E69 ; _RadarClass__Radar_Anim_RETN, Jump to retn instruction at the end of Radar_Anim() function
