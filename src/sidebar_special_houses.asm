; Fix 20240527 - It is possible cmp is evaluated against a number FFF.....
; Change jng to jbe

@LJMP 0x0054D359, _SidebarClass__Reload_Sidebar_Special_Houses
@LJMP 0x0054E0A4, _SidebarClass__Reload_Logoshape_Special_Houses
@LJMP 0x0052DA5C, _RadarClass__Draw_It_Radarshape_Special_Houses
@CLEAR 0x0052DA61,0x90,0x0052DA62 ; nop over debris after jmp

@LJMP 0x0052DB02, _RadarClass__Draw_It_Radarframes_Special_Houses


_RadarClass__Draw_It_Radarframes_Special_Houses:
    mov  eax,[eax+0x3E]  ; hooked by patch
    sar  eax,0x18

    cmp  eax,9
    jbe  .Dont_Change_Radarframes_House

    mov  eax,0 ; set sidebar to grab to Allies

.Dont_Change_Radarframes_House:
    jmp  0x0052DB08

_RadarClass__Draw_It_Radarshape_Special_Houses:
    mov  eax,[eax+0x3E]  ; hooked by patch
    sar  eax,0x18

    cmp  eax,9
    jbe  .Dont_Change_Radarshape_House

    mov  eax,0 ; set sidebar to grab to Allies

.Dont_Change_Radarshape_House:
    jmp  0x0052DA62

_SidebarClass__Reload_Logoshape_Special_Houses:
    mov  eax,[edx+0x3E]  ; hooked by patch
    sar  eax,0x18

    cmp  eax,9
    jbe  .Dont_Change_Logoshape_House

    mov  eax,0 ; set sidebar to grab to Allies

.Dont_Change_Logoshape_House:
    jmp  0x0054E0AA

_SidebarClass__Reload_Sidebar_Special_Houses:

    cmp  eax,9
    jbe  .Dont_Change_Sidebar_House

    mov  eax,0 ; set sidebar to grab to Allies

.Dont_Change_Sidebar_House:

    mov  dword edx,[0x604D6C+eax*4]
    jmp  0x0054D360
 ;   0054D359   > 8B1485 6C4D600>mov edx,dword PTR DS:[eax*4+604D6C]
