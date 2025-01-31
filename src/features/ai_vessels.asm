;----------------------------------------------------------------
; src/features/ai_vessels.asm
;
; Extends House AI with the following features
;  - Override Can_Build()
;  - Enable AI to build vessels in Multiplayer
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------
; Future work
; - Unit production obey Can_Build() checks
; - AI will consider training new units beyond the original set when Auto Production is enabled
; - AI will consider training new units listed in Teams

@SJMP 0x004DBD3D,0x004DBD43 ; _HouseClass__AI_Vessel_Remove_Multiplayer_AI_Disable_Jump

[section .data] 
VesselAIHouseClassPointer dd 0


@HACK 0x004DBD95,0x004DBD9A,_HouseClass__AI_Vessel_Can_Build_Force_True
    mov  eax,1
    jmp  0x004DBD9A
@ENDHACK


@HACK 0x004DC11E,0x004DC125,_HouseClass__AI_Vessel_Fix_Crash
    mov  dword eax,[VesselAIHouseClassPointer]
    test byte[eax+0x42],0x20
    jmp  0x004DC125
@ENDHACK


@HACK 0x004DBD10,0x004DBD16,_HouseClass__AI_Vessel_Fix_Crash2
    sub  esp,0x44
    mov  [ebp-0x20],eax
    mov  dword[VesselAIHouseClassPointer],eax
    jmp  0x004DBD16
@ENDHACK
