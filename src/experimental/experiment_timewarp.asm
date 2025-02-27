;----------------------------------------------------------------
; src/experimental/experiment_timewarp.asm
;
; Experimental time wrap, rendering the chronosphere a powerful weapon (relatively)
;
;----------------------------------------------------------------

cextern PaletteClass__Set
cextern Globals___Session_Type
cextern Globals___PlayerPtr
cextern Rules.General.TimeWarpDuration

;%assign TemporalFramesInit 60*15 ; 60 seconds
%assign TemporalFramesGreyThreshold 75 ; 5 seconds
;%assign TemporalSavedLocationCapacity 4096

[section .data] 
Temporal.FramesRemaining dd 0
Temporal.House db 0
;Temporal.FadeShimmer dd -1,0,2,4,0,-2,1,-4
;Temporal.SaveLocation db 0
;Temporal.UnitSavedLocations times TemporalSavedLocationCapacity dd 0
;Temporal.VesselSavedLocations times TemporalSavedLocationCapacity dd 0

@HACK 0x004FE0EE,0x004FE0F3,_LogicClass__AI_TemporalHouseCheck
    cmp  dword[Temporal.FramesRemaining],0
    je   .Ret
    AbstractClass.RTTI.Get(esi,al)
    cmp  al,RTTIType.Infantry
    je   .Infantry  
    cmp  al,RTTIType.Unit
    je   .Unit
    cmp  al,RTTIType.Vessel
    je   .Vessel  
    cmp  al,RTTIType.Aircraft
    je   .Aircraft  
    cmp  al,RTTIType.Building
    je   .Building      
    jmp  .Ret

.Infantry:
    mov  byte al,[Temporal.House]
    cmp  byte[esi+TechnoClass.Offset.House],al
    je   .Ret
    InfantryClass.Class.Get(esi,edx)
    InfantryTypeClass.FromIndex(edx,eax)
    test byte[eax+InfantryTypeClass.Offset.IsImmuneToTimeWarp],1<<(InfantryTypeClass.Bit.IsImmuneToTimeWarp-1)
    jz   0x004FE0F6 ; .SkipAI
    jmp  .Ret

.Unit:
    mov  byte al,[Temporal.House]
    cmp  byte[esi+TechnoClass.Offset.House],al
    je   .Ret
    UnitClass.Class.Get(esi,edx)
    UnitTypeClass.FromIndex(edx,eax)
    test byte[eax+UnitTypeClass.Offset.IsImmuneToTimeWarp],1<<(UnitTypeClass.Bit.IsImmuneToTimeWarp-1)
    jz   0x004FE0F6 ; .SkipAI
    jmp  .Ret

.Vessel:
    mov  byte al,[Temporal.House]
    cmp  byte[esi+TechnoClass.Offset.House],al
    je   .Ret
    VesselClass.Class.Get(esi,edx)
    VesselTypeClass.FromIndex(edx,eax)
    test byte[eax+VesselTypeClass.Offset.IsImmuneToTimeWarp],1<<(VesselTypeClass.Bit.IsImmuneToTimeWarp-1)
    jz   0x004FE0F6 ; .SkipAI
    jmp  .Ret

.Aircraft:
    mov  byte al,[Temporal.House]
    cmp  byte[esi+TechnoClass.Offset.House],al
    je   .Ret
    AircraftClass.Class.Get(esi,edx)
    AircraftTypeClass.FromIndex(edx,eax)
    test byte[eax+AircraftTypeClass.Offset.IsImmuneToTimeWarp],1<<(AircraftTypeClass.Bit.IsImmuneToTimeWarp-1)
    jz   0x004FE0F6 ; .SkipAI
    jmp  .Ret

.Building:
    mov  byte al,[Temporal.House]
    cmp  byte[esi+TechnoClass.Offset.House],al
    je   .Ret
    BuildingClass.Class.Get(esi,edx)
    BuildingTypeClass.FromIndex(edx,eax)
    test byte[eax+BuildingTypeClass.Offset.IsImmuneToTimeWarp],1<<(BuildingTypeClass.Bit.IsImmuneToTimeWarp-1)
    jz   0x004FE0F6 ; .SkipAI
    jmp  .Ret

;.IsUnitTechno:
;    mov  byte al,[Temporal.House]
;    cmp  byte[esi+TechnoClass.Offset.House],al
;    jne  0x004FE0F6 ; .SkipAI
;    cmp  dword[Temporal.FramesRemaining],1
;    je   .Ret
.IsTechno:
    mov  byte al,[Temporal.House]
    cmp  byte[esi+TechnoClass.Offset.House],al
    jne  0x004FE0F6 ; .SkipAI
.Ret:
    mov  edx,[esi+0x11]
    mov  eax,esi
    jmp  0x004FE0F3
@ENDHACK


@HACK 0x00539C4D,0x00539C54,_ScenarioClass__Do_Fade_AI_MaintainGrey
    cmp  dword[Temporal.FramesRemaining],0
    je   .Ret
    dec  dword[Temporal.FramesRemaining]
    jz   .Ret
.GreyOut:
    mov  ebx,dword[Temporal.FramesRemaining]
    cmp  ebx,TemporalFramesGreyThreshold
    jl   .Continue
    mov  ebx,TemporalFramesGreyThreshold
.Continue:
    mov  edx,TemporalFramesGreyThreshold
    sub  edx,ebx
    mov  ebx,TemporalFramesGreyThreshold
;    mov  eax,ebx
;    and  eax,7
;    add  edx,[Temporal.FadeShimmer+eax*4]
    jmp  0x00539DF1
.Ret:
    test byte[eax+0x7B9],0x40
    jmp  0x00539C54
@ENDHACK


@HACK 0x00539EB1,0x00539EB6,_ScenarioClass__Do_Fade_AI_MaintainGrey2
    call PaletteClass__Set
    cmp  dword[Temporal.FramesRemaining],0
    je   0x00539EB6
    jmp  0x00539EE8
@ENDHACK


;@HACK 0x004A7DD5,0x004A7DDC,_Main_Loop__ManipulateFrameTimer
;    cmp  dword[Temporal.FramesRemaining],0
;    je   .Ret
;    cmp  byte[Globals___Session_Type],GameType.GAME_NORMAL
;    je   .CheckTimewarpAgainstYou
;    cmp  byte[Globals___Session_Type],GameType.GAME_SKIRMISH
;    je   .CheckTimewarpAgainstYou
;    jmp  .Ret
;.CheckTimewarpAgainstYou:
;    mov  eax,[Globals___PlayerPtr]
;    test eax,eax
;    jz   .Ret
;    mov  byte al,[eax+HouseClass.Offset.ID]
;    cmp  byte al,[Temporal.House]
;    je   .Ret
;.FrameTimer0:
;    jmp  0x004A7E2F
;.Ret:
;    cmp  dword[0x00668188],0
;    jmp  0x004A7DDC
;@ENDHACK


@HACK 0x004D74FA,0x004D74FF,_HouseClass__Place_Special_Blast_Trigger_By_Chronosphere
    call 0x00553110 ; SuperClass__Discharged
    mov  eax,[ebp-0x28]
    mov  byte al,[eax+HouseClass.Offset.ID]
    mov  byte[Temporal.House],al 
    mov  dword eax,[Rules.General.TimeWarpDuration]
    cmp  eax,0
    jge  .Continue
    xor  eax,eax
.Continue:
    mov  dword[Temporal.FramesRemaining],eax
    jmp  0x004D74FF
@ENDHACK

