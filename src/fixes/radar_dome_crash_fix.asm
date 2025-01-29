;----------------------------------------------------------------
; src/fixes/radar_dome_crash_fix.asm
;
; Fix the crash when the radar dome is built
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------
;@LJMP 0x004A958A, _Get_Radar_Icon_Build_Frame_Call_Patch_Out
;@LJMP 0x005B4808, _Reallocate_Big_Shape_Buffer_RETN_Patch

;@LJMP 0x00530CF4, _RadarClass__Radar_Anim_RETN

@LJMP 0x005B48D5, _Check_Use_Compressed_Shapes_Use_Compressed_Shapes_Always
@LJMP 0x005B4CE4, _Build_Frame_Cause_Crash_If_Trying_To_Draw_Uncompressed_Shape

_Build_Frame_Cause_Crash_If_Trying_To_Draw_Uncompressed_Shape:
    mov  dword [0], 0
    jmp  0x005B4CE7

_Check_Use_Compressed_Shapes_Use_Compressed_Shapes_Always:
    mov  eax, 0
    jmp  0x005B48DA

; Patch first instruction of the function to jump to the RETN instruction at the end of it, to patch out functionality
_RadarClass__Radar_Anim_RETN:
    jmp  0x00530E69 ; Jump to RETN instruction at the end of Radar_Anim() function
