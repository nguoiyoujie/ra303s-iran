;----------------------------------------------------------------
; src/features/power_autoscale.asm
;
; Have the power bar autoscale with increased power generation
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

@HOOK 0x00527C9A _PowerClass__AI_Record_Power_Drain
@HOOK 0x00527D11 _PowerClass__AI_Record_Power_Drain2
@HOOK 0x00527EEB _PowerClass__Power_Height_Scale_Height_Relative

Temp.PowerClassAI.Power  dd 0
Temp.PowerClassAI.Drain  dd 0

_PowerClass__AI_Record_Power_Drain:
    push ebx
    xor  ebx,ebx
    mov  eax,[edx+HouseClass.Offset.Power]
    mov  [Temp.PowerClassAI.Power],eax
    mov  ecx,[esi+0x101E]; RecordedPower
    cmp  eax,ecx
    setne bl
    push ecx
    push eax
    mov  eax,[edx+HouseClass.Offset.Drain]
    mov  [Temp.PowerClassAI.Drain],eax
    mov  ecx,[esi+0x101A]; RecordedDrain
    cmp  eax,ecx
    setne al
    or   bl,al
    test bl,bl
    pop  eax
    pop  ecx
    pop  ebx
    jz   .NotChanged
.Changed:
    jmp  0x00527CA4
.NotChanged:
    jmp  0x00527D6F


_PowerClass__AI_Record_Power_Drain2:
    mov  eax,esi
    jmp  0x00527D17


_PowerClass__Power_Height_Scale_Height_Relative:
    sub  esp,4
    ; edx is our value to manipulate
    ; the height fills out around 1600 power
    ; Aim to use max(Drain + X,Power + X) to match this level
    ; Try X = 700, then 1500, then 3100 etc...
    push ecx
    push ebx
    push eax
    mov  al,byte[Rules.General.ScalePowerBar]
    test al,al
    jz   .Done
    mov  eax,edx
    mov  ebx,[Temp.PowerClassAI.Power]
    mov  edx,[Temp.PowerClassAI.Drain]
    cmp  ebx,edx
    jg   .PowerMax
.DrainMax:
    mov  ebx,edx
.PowerMax:
    mov  edx,400
.Scale:
    cmp  ebx,edx
    jle  .Next
    shl  edx,2
    jmp  .Scale
.Next:
    ;sub  edx,100
    add  ebx,edx
    xor  edx,edx
    ; ebx is our max level to scale to ~1600
    ; eax is our current level
    ; final value is eax*1600/ebx
    imul eax,1600
    cdq
    idiv ebx
    mov  edx,eax ; final value
.Done:
    pop  eax
    pop  ebx
    pop  ecx
    mov  esi,edx
    jmp  0x00527EF0
