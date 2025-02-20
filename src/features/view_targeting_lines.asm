    ; BasicPath had a distance check against StrayDistance or CloseEnoughDistance. 
    ; This may prevent a move from being initiated if the destination is too close. 
    ; Remove it, and rely on the game to check only when the unit is blocked

cextern RedAlert.Options.ViewTargetingLines

cextern Target___As_Coord


@HACK 0x00562536,0x0056253B,_TechnoClass__DrawIt_ShowHeadTo
    call Buffer_Draw_Line
	mov  byte al,[RedAlert.Options.ViewTargetingLines]
    test al, al
	jz   .Skip
	push edx
	xor  edx,edx
    lea  eax,[esi]
    mov  eax,[eax+FootClass.Offset.NavCom]
    test eax,eax
    jz   .TarCom
    call Target___As_Coord
    test eax,eax
    jz   .TarCom
    cmp  eax,-1
    je   .TarCom
    mov  ebx,eax
    add  esp,0x18
    xor  eax,eax
    mov  al,126 ; GREEN, was 4
    push eax 
    mov  eax,ebx
    sar  eax,0x10
    sub  word ax,[Globals___Map+0xC4C] ; TacticalCoord:Y
    movsx eax,ax
    imul eax,3
    add  eax,0x10
    sar  eax,5
    push eax ; dy
    mov  eax,ebx
    and  eax,0xFFFF
    sub  word ax,[Globals___Map+0xC4A] ; TacticalCoord
    movsx eax,ax
    imul eax,3
    add  eax,0x10
    sar  eax,5
    push eax ; dx
    lea  eax,[esi]
    mov  word ax,[eax+AbstractClass.Offset.Coord+2]
    sub  word ax,[Globals___Map+0xC4C] ; TacticalCoord:Y
    movsx eax,ax
    imul eax,3
    add  eax,0x10
    sar  eax,5
    push eax ; sy
    lea  eax,[esi]
    mov  word ax,[eax+AbstractClass.Offset.Coord]
    sub  word ax,[Globals___Map+0xC4A] ; TacticalCoord
    movsx eax,ax
    imul eax,3
    add  eax,0x10
    sar  eax,5
    push eax ; sx
    lea  eax,[ebp-0x148]
    push eax
    call Buffer_Draw_Line
	mov  dword edx,1
.TarCom:
    lea  eax,[esi]
    mov  eax,[eax+TechnoClass.Offset.TarCom]
    test eax,eax
    jz   .Ret
    call Target___As_Coord
    test eax,eax
    jz   .Ret
    cmp  eax,-1
    je   .Ret
    mov  ebx,eax
    add  esp,0x18
    xor  eax,eax
    mov  al,238 ; RED, was 8
    push eax 
    mov  eax,ebx
    sar  eax,0x10
    sub  word ax,[Globals___Map+0xC4C] ; TacticalCoord:Y
    movsx eax,ax
    imul eax,3
    add  eax,0x10
    sar  eax,5
    push eax ; dy
    mov  eax,ebx
    and  eax,0xFFFF
    sub  word ax,[Globals___Map+0xC4A] ; TacticalCoord
    movsx eax,ax
    imul eax,3
    add  eax,0x10
    sar  eax,5
    push eax ; dx
    lea  eax,[esi]
    mov  word ax,[eax+AbstractClass.Offset.Coord+2]
    sub  word ax,[Globals___Map+0xC4C] ; TacticalCoord:Y
    movsx eax,ax
    imul eax,3
    add  eax,0x10
    sar  eax,5
    push eax ; sy
    lea  eax,[esi]
    mov  word ax,[eax+AbstractClass.Offset.Coord]
    sub  word ax,[Globals___Map+0xC4A] ; TacticalCoord
    movsx eax,ax
    imul eax,3
    add  eax,0x10
    sar  eax,5
    push eax ; sx
    lea  eax,[ebp-0x148]
    push eax
    call Buffer_Draw_Line
	mov  dword edx,1

.Ret:
	test edx,edx
	jz   .NoRefresh
    mov  edx,1
    mov  eax,Globals___Map
    call GScreenClass__Flag_To_Redraw
.NoRefresh:
	pop  edx
.Skip:
    jmp  0x0056253B
@ENDHACK
