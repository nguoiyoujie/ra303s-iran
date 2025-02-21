;----------------------------------------------------------------
; src/features/chain_timequakes.asm
;
; If multiple MAD Tanks or Chrono Tanks use their abilities at the same time, only one time quake is registered.
; This is because the game only acts upon one Time/MAD Quake at one time.
;
; Instead, allow chaining of this madness by holding a counter. One quake is then processed per frame until all are accounted for.
; There can be no good ending out of this. >:-D
;
;----------------------------------------------------------------

[section .data]
%define MadQuake           0x00665DF0 ; byte
%define TimeQuake          0x00665DEC ; byte
;TimeQuake.Remaining      dd 0
;MadQuake.Remaining       dd 0

@HACK 0x0057E1A2,0x0057E1A7,_UnitClass__Mission_Unload_Increment_MadQuake
    inc  dword[MadQuake]
    jmp  0x0057E1A7
@ENDHACK


@HACK 0x004A7EF8,0x004A7F03,_Main_Loop__MadQuake_KeepCenter
    mov  edx,dword[MadQuake]
    cmp  dword[TimeQuake],0
    je   0x004A7F03
    dec  dword[TimeQuake]    
    jmp  0x004A7F03
@ENDHACK


@HACK 0x004A5427,0x004A5438,_Main_Loop__MadQuake_Decrement
    cmp  dword[MadQuake],0
    je   0x004A5438
.DecMadQuake:
    dec  dword[MadQuake]
    inc  dword[TimeQuake]
    jmp  0x004A5438
@ENDHACK


@HACK 0x004A0BD8,0x004A0BE2,_CellClass__GoodieCheck_Increment_TimeQuake
    inc  dword[TimeQuake]
    jmp  0x004A5438
@ENDHACK


@HACK 0x004D7508,0x004D7515,_HouseClass__Place_Special_Blast_Ignore_TimeQuake_Limit
    mov  byte[eax+0x43],dh
    jmp  0x004D7515
@ENDHACK


@HACK 0x004D754B,0x004D7558,_HouseClass__Place_Special_Blast_Increment_TimeQuake
    jge  0x004D7558
    inc  dword[TimeQuake]
    jmp  0x004D7558
@ENDHACK

