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

cextern str_MissionPkt
cextern str_CStrikePkt
cextern str_AftmathPkt
cextern str_BlankPkt


@HACK 0x0054BA32,0x0054BA37,_Conditionally_Load_Missions_PKT
    cmp  byte[RedAlert.Options.DisplayOriginalMultiplayerMaps],1
    jnz  .No_Load
    mov  edx,str_MissionPkt
    jmp  0x0054BA37
.No_Load:
    mov  edx,str_BlankPkt
    jmp  0x0054BA37
@ENDHACK


@HACK 0x0054BD3D,0x0054BD42,_Conditionally_Load_Cstrike_PKT
    cmp  byte[RedAlert.Options.DisplayCounterstrikeMultiplayerMaps],1
    jnz  .No_Load
    mov  edx,str_CStrikePkt
    jmp  0x0054BD42
.No_Load:
    mov  edx,str_BlankPkt
    jmp  0x0054BD42
@ENDHACK


@HACK 0x0054BEAB,0x0054BEB0,_Conditionally_Load_Aftmath_PKT
    cmp  byte[RedAlert.Options.DisplayAftermathMultiplayerMaps],1
    jnz  .No_Load
    mov  edx,str_AftmathPkt
    jmp  0x0054BEB0
.No_Load:
    mov  edx,str_BlankPkt
    jmp  0x0054BEB0
@ENDHACK