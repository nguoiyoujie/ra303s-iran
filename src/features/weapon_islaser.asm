;----------------------------------------------------------------
; src/features/weapon_islaser.asm
;
; Emulate laser weapons like Obelisk.
; 
; This function is enabled by providing [<WeaponType>] IsLaser=yes. The laser color can be customized with LaserColor=yes, defaulting to RED.
; Note that the weapon also requires Charges=yes. This is an alternative revisualization of the electric zap and several settings for the zap also apply here.
;
; No compatibility issues is expected.
;
;----------------------------------------------------------------

cextern GraphicViewPortClass__GraphicViewPortClass
cextern GraphicBufferClass__Lock
cextern GraphicViewPortClass__Attach
cextern GraphicBufferClass__Unlock
cextern Buffer_Draw_Line
cextern GScreenClass__Flag_To_Redraw

cextern BuffGlbl___LogicPage
cextern Globals___WindowList
cextern Globals___Map

struc GraphicViewPortClass
    .Offset:         RESD 1
    .Width:          RESD 1
    .Height:         RESD 1
    .XAdd:           RESD 1
    .XPos:           RESD 1
    .YPos:           RESD 1
    .Pitch:          RESD 1 
    .GraphicBuf:     RESD 1 ;ptr
    .IsDirectDraw:   RESD 1
    .LockCount:      RESD 1 
endstruc

[section .data]
Temp.IsLaser.LaserColor db 0
Temp.IsLaser.GraphicViewPortClass times 0x28 db 0

@HACK 0x0056564D,0x00565653,_TechnoClass__Fire_At_LaserDraw
    ; eax is the weapon, is the source, is the target
    jz   0x005656F5
    test byte[eax+WeaponTypeClass.Offset.IsLaser],1<<(WeaponTypeClass.Bit.IsLaser-1)
    jz   0x00565653
    push eax
    push edx
    push ecx
    push ebx
    mov  byte al,[eax+WeaponTypeClass.Offset.LaserColor]
    test al,al
    jnz  .UseChosenColor
    mov  al,8 ; RED
.UseChosenColor:
    mov  byte[Temp.IsLaser.LaserColor],al

    mov  eax,2<<5 ; WINDOW_TACTICAL (2) * 8 * 4 bytes
    mov  edx,[eax+Globals___WindowList+0xC]
    push edx
    mov  ebx,[eax+Globals___WindowList+0x8]
    mov  edx,[BuffGlbl___LogicPage]
    push ebx
    mov  ecx,[edx+GraphicViewPortClass.YPos]
    add  ecx,[eax+Globals___WindowList+0x4]
    mov  ebx,[edx+GraphicViewPortClass.XPos]
    mov  eax,[eax+Globals___WindowList]
    mov  edx,[edx+GraphicViewPortClass.GraphicBuf]
    add  ebx,eax
    lea  eax,[Temp.IsLaser.GraphicViewPortClass]
    call GraphicViewPortClass__GraphicViewPortClass
    ; eax is the window
    mov  eax,[Temp.IsLaser.GraphicViewPortClass+GraphicViewPortClass.GraphicBuf]
    call GraphicBufferClass__Lock
    test al,al
    jz   .Skip
.AttachBuffer:
    mov  ecx,[Temp.IsLaser.GraphicViewPortClass+GraphicViewPortClass.Height]
    mov  eax,[Temp.IsLaser.GraphicViewPortClass+GraphicViewPortClass.Width]
    push ecx 
    mov  ebx,[Temp.IsLaser.GraphicViewPortClass+GraphicViewPortClass.XPos]
    mov  edx,[Temp.IsLaser.GraphicViewPortClass+GraphicViewPortClass.GraphicBuf]
    push eax
    mov  ecx,[Temp.IsLaser.GraphicViewPortClass+GraphicViewPortClass.YPos]
    lea  eax,[Temp.IsLaser.GraphicViewPortClass]
    call GraphicViewPortClass__Attach
.DrawLine:
    xor  eax,eax
    mov  al,byte[Temp.IsLaser.LaserColor]
    push eax 
    mov  word ax,[ebp-0x2E]
    sub  word ax,[Globals___Map+0xC4C] ; TacticalCoord:Y
    movsx eax,ax
    imul eax,3
    add  eax,0x10
    sar  eax,5
    push eax ; dy
    mov  word ax,[ebp-0x30]
    sub  word ax,[Globals___Map+0xC4A] ; TacticalCoord
    movsx eax,ax
    imul eax,3
    add  eax,0x10
    sar  eax,5
    push eax ; dx
    mov  word ax,[ebp-0x32]
    sub  word ax,[Globals___Map+0xC4C] ; TacticalCoord:Y
    movsx eax,ax
    imul eax,3
    add  eax,0x10
    sar  eax,5
    push eax ; sy
    mov  word ax,[ebp-0x34]
    sub  word ax,[Globals___Map+0xC4A] ; TacticalCoord
    movsx eax,ax
    imul eax,3
    add  eax,0x10
    sar  eax,5
    push eax ; sx
    lea  eax,[Temp.IsLaser.GraphicViewPortClass]
    push eax
    call Buffer_Draw_Line
.Skip:
    mov  eax,[Temp.IsLaser.GraphicViewPortClass+GraphicViewPortClass.GraphicBuf]
    call GraphicBufferClass__Unlock
    cmp  byte[Rules.General.NoTeslaZapEffectDelay],1
    jz   .SkipDelay
    mov  eax,1
    call Delay
.SkipDelay:
    mov  dword[Temp.IsLaser.GraphicViewPortClass+GraphicViewPortClass.Offset],0
    ;mov  edx,1
    ;mov  eax,Globals___Map
    ;call GScreenClass__Flag_To_Redraw
    pop  ebx
    pop  ecx
    pop  edx
    pop  eax
    jmp  0x005656A2 ; clear Charged and animation stages like zap attacks
    ;jmp  0x005656F5
@ENDHACK
