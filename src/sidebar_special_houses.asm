;----------------------------------------------------------------
; src/features/sidebar_special_houses.asm
;
; When playing as a House beyond the 8 conventional countries, sidebar frames and radar logo will use the Allies' version
; 
; This function is not configurable at the moment
; No compatibility issues is expected. 
;
;----------------------------------------------------------------
; Fix 20240527 - It is possible cmp is evaluated against a number FFF.....
; Change jng to jbe

@HACK 0x0052DB02,0x0052DB08,_RadarClass__Draw_It_Radarframes_Special_Houses
    mov  eax,[eax+0x3E]  ; hooked by patch
    sar  eax,0x18
    cmp  eax,9
    jbe  .Dont_Change_Radarframes_House
    xor  eax,eax ; set sidebar to grab to Allies
.Dont_Change_Radarframes_House:
    jmp  0x0052DB08
@ENDHACK


@HACK 0x0052DA5C,0x0052DA62,_RadarClass__Draw_It_Radarshape_Special_Houses
    mov  eax,[eax+0x3E]  ; hooked by patch
    sar  eax,0x18
    cmp  eax,9
    jbe  .Dont_Change_Radarshape_House
    xor  eax,eax ; set sidebar to grab to Allies
.Dont_Change_Radarshape_House:
    jmp  0x0052DA62
@ENDHACK


@HACK 0x0054E0A4,0x0054E0AA,_SidebarClass__Reload_Logoshape_Special_Houses
    mov  eax,[edx+0x3E]  ; hooked by patch
    sar  eax,0x18
    cmp  eax,9
    jbe  .Dont_Change_Logoshape_House
    xor  eax,eax ; set sidebar to grab to Allies
.Dont_Change_Logoshape_House:
    jmp  0x0054E0AA
@ENDHACK


@HACK 0x0054D359,0x0054D360,_SidebarClass__Reload_Sidebar_Special_Houses
    cmp  eax,9
    jbe  .Dont_Change_Sidebar_House
    xor  eax,eax ; set sidebar to grab to Allies
.Dont_Change_Sidebar_House:
    mov  dword edx,[0x604D6C+eax*4]
    jmp  0x0054D360
@ENDHACK
