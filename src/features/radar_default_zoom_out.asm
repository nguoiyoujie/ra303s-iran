;----------------------------------------------------------------
; src/features/radar_default_zoom_out.asm
;
; When you buy a radar the top of the sidebar changes to show the map, but this shows the map zoomed in which isn't so useful, this patch will make it show zoomed out instead.
; Iran: Thanks to Nyerguds for showing me how he did it for his C&C95 patch.
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected. However, mod maps that use GNRL and have Ukraine as the player, beware.
;
;----------------------------------------------------------------

extern Globals___Map_IsZoomed_Address
extern Globals___Map_IsZoomed_Bitmask


@HACK 0x0052D751,0x0052D759,_RadarClass__Init_Clear_Zoom_Out_Radar_By_Default
    or   dl,Globals___Map_IsZoomed_Bitmask
    mov  eax,dword[Globals___Map_IsZoomed_Address]
    jmp  0x0052D759
@ENDHACK

