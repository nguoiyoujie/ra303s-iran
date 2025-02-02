;----------------------------------------------------------------
; src/features/hires/video_enhancements.asm
;
; Apply hi-res enhancements to video/movie playback
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------


@HACK 0x004A9EA9,0x004A9EB1,_hires_Center_VQA640_Videos
    mov  eax,[Hires.DeltaTop]
    push eax
    mov  eax,[Hires.DeltaLeft]
    push eax
    push 0
    push 0
    jmp  0x004A9EB1
@ENDHACK


@HACK 0x005B3CD8,0x005B3CDE,_hires_ScoreScreenBackground
    cmp  eax,0x005F01EB
    je   .Is_Score_Screen
    cmp  eax,0x005F01F8
    je   .Is_Score_Screen
    jmp  .Ret
.Is_Score_Screen:
    mov  byte[Hires.ScoreBackground],1
.Ret:
    push ebp
    mov  ebp,esp
    push ecx
    push esi
    push edi
    jmp  0x005B3CDE
@ENDHACK


@HACK 0x005E548D,0x005E5493,_hires_Deinterlace_Videos_Fix_Bottom_Line
    jmp  0x005E5498
@ENDHACK


@HACK 0x005B30D0,0x005B30D5,_hires_Deinterlace_Videos
    mov  eax,[RedAlert.Options.VideoInterlaceMode]
    jmp  0x005B30D5
@ENDHACK


;@HACK 0x005B3023,_hires_Deinterlace_Videos2
;    jmp     0x005B304A
;@ENDHACK


;@HACK 0x004A8C6A,0x004A8C77,_hires_Videos
;    mov  ecx,0x100
;    mov  ebx,0x100
;    jmp  0x004A8C77
;@ENDHACK


;@HACK 0x004A8AC6,0x004A8AD0,_hires_Videos2
;    mov  eax,0xC8
;    mov  edi,0x140
;    jmp  0x004A8AD0
;@ENDHACK


;@HACK 0x005B2FE6,_hires_Deinterlace_Videos_Always_Deinterlace
;    mov  eax,ebx
;    call 0x005B2CE0 ; Read_Interpolation_Palette(char *)
;    cmp  dword[0x00691730],0
;    jz   .Jump_Over_Create_Table
;    call 0x005B2DD0 ; Create_Palette_Interpolation_Table(void)
;.Jump_Over_Create_Table:
;    mov  eax,ebx
;    call 0x005B3009 ; Write_Interpolation_Palette(char *)
;    jmp  0x005B300E
;@ENDHACK



