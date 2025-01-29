;----------------------------------------------------------------
; src/features/unit_vessel_response.asm
;
; Allows unit and vessel voices to be customized by INI.
;
; This function is enabled by defining ResponseSelect=, ResponseMove=, or ResponseAttack= in the type definitions
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

; This code assumes that UnitTypeClass.Offset.Response_Select and VesselTypeClass.Offset.Response_Select are the same.
; This is because we use their common type class DriveClass to run the logic for both.
; Ensure that this assumption is upheld

@LJMP 0x004B6207, _DriveClass__Response_Select_CustomVoice
@LJMP 0x004B625F, _DriveClass__Response_Move_CustomVoice
@LJMP 0x004B62B7, _DriveClass__Response_Attack_CustomVoice

; ecx is the unit/vessel class
_DriveClass__Response_Select_CustomVoice:
    mov  al,byte[ecx] ; RTTI
    cmp  al,RTTIType.Unit
    je   .Unit
    cmp  al,RTTIType.Vessel
    je   .Vessel
    jmp  .Retn
.Unit:
    mov  al,byte[ecx+0x15C] ; ID
    movzx eax,al
    UnitTypeClass.FromIndex(eax,edx) 
    UnitTypeClass.Response_Select.Get(edx,eax)
    test eax,eax
    jz   .Retn
    lea  ecx,[edx+UnitTypeClass.Offset.Response_Select_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  dx,word[ecx+eax*2]
    mov  ebx,dword[0x006016C0]
    jmp  0x004B6226
.Vessel:
    mov  al,byte[ecx+0x15C] ; ID
    movzx eax,al
    VesselTypeClass.FromIndex(eax,edx) 
    VesselTypeClass.Response_Select.Get(edx,eax)
    test eax,eax
    jz   .Retn
    lea  ecx,[edx+VesselTypeClass.Offset.Response_Select_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  dx,word[ecx+eax*2]
    mov  ebx,dword[0x006016C0]
    jmp  0x004B6226
.Retn:
    mov  ebx,5
    jmp  0x004B620C


_DriveClass__Response_Move_CustomVoice:
    mov  al,byte[ecx] ; RTTI
    cmp  al,RTTIType.Unit
    je   .Unit
    cmp  al,RTTIType.Vessel
    je   .Vessel
    jmp  .Retn
.Unit:
    mov  al,byte[ecx+0x15C] ; ID
    movzx eax,al
    UnitTypeClass.FromIndex(eax,edx) 
    cmp  byte[Temp.ResponseMission],MissionType.MISSION_ENTER
    je   .Unit.UseEnter
    cmp  byte[Temp.ResponseMission],MissionType.MISSION_UNLOAD
    je   .Unit.UseDeploy
    cmp  byte[Temp.ResponseMission],MissionType.MISSION_HARVEST
    jne  .Unit.UseMove
.Unit.UseHarvest:
    UnitTypeClass.Response_Harvest.Get(edx,eax)
    test eax,eax
    jz   .Unit.UseMove
    lea  ecx,[edx+UnitTypeClass.Offset.Response_Harvest_Data]
    jmp  .Unit.Rand
.Unit.UseEnter:
    UnitTypeClass.Response_Enter.Get(edx,eax)
    test eax,eax
    jz   .Unit.UseMove
    lea  ecx,[edx+UnitTypeClass.Offset.Response_Enter_Data]
    jmp  .Unit.Rand
.Unit.UseDeploy:
    UnitTypeClass.Response_Deploy.Get(edx,eax)
    test eax,eax
    jz   .Unit.UseMove
    lea  ecx,[edx+UnitTypeClass.Offset.Response_Deploy_Data]
    jmp  .Unit.Rand
.Unit.UseMove:
    UnitTypeClass.Response_Move.Get(edx,eax)
    test eax,eax
    jz   .Retn
    lea  ecx,[edx+UnitTypeClass.Offset.Response_Move_Data]
.Unit.Rand:
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  dx,word[ecx+eax*2]
    mov  ebx,dword[0x006016C0]
    jmp  0x004B627E
.Vessel:
    mov  al,byte[ecx+0x15C] ; ID
    movzx eax,al
    VesselTypeClass.FromIndex(eax,edx) 
    cmp  byte[Temp.ResponseMission],MissionType.MISSION_ENTER
    je   .Unit.UseEnter
    cmp  byte[Temp.ResponseMission],MissionType.MISSION_UNLOAD
    je   .Unit.UseDeploy
    cmp  byte[Temp.ResponseMission],MissionType.MISSION_HARVEST
    jne  .Unit.UseMove
.Vessel.UseHarvest:
; normally Vessels cannot harvest, but the code will be ready if they do
    VesselTypeClass.Response_Harvest.Get(edx,eax)
    test eax,eax
    jz   .Vessel.UseMove
    lea  ecx,[edx+VesselTypeClass.Offset.Response_Harvest_Data]
    jmp  .Vessel.Rand
.Vessel.UseEnter:
    VesselTypeClass.Response_Enter.Get(edx,eax)
    test eax,eax
    jz   .Vessel.UseMove
    lea  ecx,[edx+VesselTypeClass.Offset.Response_Enter_Data]
    jmp  .Vessel.Rand
.Vessel.UseDeploy:
    VesselTypeClass.Response_Deploy.Get(edx,eax)
    test eax,eax
    jz   .Vessel.UseMove
    lea  ecx,[edx+VesselTypeClass.Offset.Response_Deploy_Data]
    jmp  .Vessel.Rand
.Vessel.UseMove:
    VesselTypeClass.Response_Move.Get(edx,eax)
    test eax,eax
    jz   .Retn
    lea  ecx,[edx+VesselTypeClass.Offset.Response_Move_Data]
.Vessel.Rand:
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  dx,word[ecx+eax*2]
    mov  ebx,dword[0x006016C0]
    jmp  0x004B627E
.Retn:
    mov  ebx,1
    jmp  0x004B6264


_DriveClass__Response_Attack_CustomVoice:
    mov  al,byte[ecx] ; RTTI
    cmp  al,RTTIType.Unit
    je   .Unit
    cmp  al,RTTIType.Vessel
    je   .Vessel
    jmp  .Retn
.Unit:
    mov  al,byte[ecx+0x15C] ; ID
    movzx eax,al
    UnitTypeClass.FromIndex(eax,edx) 
    UnitTypeClass.Response_Select.Get(edx,eax)
    test eax,eax
    jz   .Retn
    lea  ecx,[edx+UnitTypeClass.Offset.Response_Attack_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  dx,word[ecx+eax*2]
    mov  ebx,dword[0x006016C0]
    jmp  0x004B62D6
.Vessel:
    mov  al,byte[ecx+0x15C] ; ID
    movzx eax,al
    VesselTypeClass.FromIndex(eax,edx) 
    VesselTypeClass.Response_Attack.Get(edx,eax)
    test eax,eax
    jz   .Retn
    lea  ecx,[edx+VesselTypeClass.Offset.Response_Attack_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  dx,word[ecx+eax*2]
    mov  ebx,dword[0x006016C0]
    jmp  0x004B62D6
.Retn:
    mov  ebx,1
    jmp  0x004B62BC