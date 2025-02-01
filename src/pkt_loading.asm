;----------------------------------------------------------------
; src/features/pkt_loading.asm
;
; Allows conditional loading of expansion-pack map packages - CSTRIKE.PKT and AFTMATH.PKT
; 
; This function is activated by specifying the following options in RedAlert.ini:
;     [Options] > DisplayCounterstrikeMultiplayerMaps=yes (for counterstrike-specifc maps in CSTRIKE.PKT)
;     [Options] > DisplayAftermathMultiplayerMaps=yes (for aftermath-specifc maps in AFTMATH.PKT)
; No compatibility issues is expected. 
;
;----------------------------------------------------------------
@SJMP 0x0054BD30,0x0054BD3D ; _Patch_Out_Counterstrike_Installed_Check in favor of RedAlert.Options
@SJMP 0x0054BE9E,0x0054BEAB ; _Patch_Out_Aftermath_Installed_Check in favor of RedAlert.Options

[section .rdata]
str_blankpkt db"BLANK.PKT",0

%define missionspkt_str   0x005F06FD ; "MISSIONS.PKT"
%define cstrikepkt_str    0x005F0748 ; "CSTRIKE.PKT"
%define aftmathpkt_str    0x005F0770 ; "AFTMATH.PKT"

@HACK 0x0054BA32,0x0054BA37,_Conditionally_Load_Missions_PKT
    cmp  byte[RedAlert.Options.DisplayOriginalMultiplayerMaps],1
    jnz  .No_Load
    mov  edx,missionspkt_str
    jmp  0x0054BA37
.No_Load:
    mov  edx,str_blankpkt
    jmp  0x0054BA37
@ENDHACK


@HACK 0x0054BD3D,0x0054BD42,_Conditionally_Load_Cstrike_PKT
    cmp  byte[RedAlert.Options.DisplayCounterstrikeMultiplayerMaps],1
    jnz  .No_Load
    mov  edx,cstrikepkt_str
    jmp  0x0054BD42
.No_Load:
    mov  edx,str_blankpkt
    jmp  0x0054BD42
@ENDHACK


@HACK 0x0054BEAB,0x0054BEB0,_Conditionally_Load_Aftmath_PKT
    cmp  byte[RedAlert.Options.DisplayAftermathMultiplayerMaps],1
    jnz  .No_Load
    mov  edx,aftmathpkt_str
    jmp  0x0054BEB0
.No_Load:
    mov  edx,str_blankpkt
    jmp  0x0054BEB0
@ENDHACK