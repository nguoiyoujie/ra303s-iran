;----------------------------------------------------------------
; src/experimental/experiment_pips_text.asm
;
; Prints numeric text on selected units. Use for debug purposes
;
;----------------------------------------------------------------

cextern MFCD__Retrieve
cextern Conquer___CC_Draw_Shape

[section .data]
Pips.Ammo       dd 0
;PipOffset.Ammo  dd 0
Pips.HP         dd 0
;PipOffset.HP    dd 0

[section .rdata]
str_AmmoPips    db "AMMOPIPS.SHP",0
str_HPPips      db "HPPIPS.SHP",0

@HACK 0x0051E97C,0x0051E981,_ObjectTypeClass__One_Time_Load_New_Pips
    mov  [0x006857AC],eax
    mov  eax,str_AmmoPips
    call MFCD__Retrieve
    mov  [Pips.Ammo],eax
    mov  eax,str_HPPips
    call MFCD__Retrieve
    mov  [Pips.HP],eax
    jmp  0x0051E981
@ENDHACK


@HACK 0x00568DA0,0x00568DA6,_TechnoClass__Draw_Pips__Draw_Debug_Ammo
;    mov  byte al,[esi+FootClass.Offset.PathAbandon]
;    movzx eax,al
;    cmp  eax,0
;    jle  .Ammo
;    push 8
;    push dword[0x006857AC]
;    mov  edx,[ebp-0x30] ; x
;    mov  ebx,[ebp-0x50] ; y
;    sub  ebx,2
;    mov  byte cl,[ebp-0x10] ; window
;    call PrintNumberOnSelectedUnit
;
;
;.Ammo:
    mov  eax,[esi+TechnoClass.Offset.Ammo]
    cmp  eax,0
    jle  .Ret
    mov  ebx,[Pips.Ammo]
    test ebx,ebx
    jz   .Ret
    push 0
    push ebx
    mov  edx,[ebp-0x30] ; x
    mov  ebx,[ebp-0x50] ; y
    sub  ebx,0x8
    mov  byte cl,[ebp-0x10] ; window
    call PrintAmmoOnSelectedUnit
.Ret:
    mov  byte al,[esi]
    cmp  al,RTTIType.Building
    jnz  0x0056900B
    jmp  0x00568DA6
@ENDHACK


@HACK 0x005625DF,0x005625E5,_TechnoClass__Draw_It__Draw_Debug_Strength
    mov  word ax,[esi+ObjectClass.Offset.Strength]
    movzx eax,ax
    test ax,ax
    jz   .Ret
    mov  ebx,[Pips.HP]
    test ebx,ebx
    jz   .Ret
    mov  byte cl,[ebp-0x30] ; color for strength
    cmp  cl,8
    je   .RedOffset
    cmp  cl,5
    je   .YellowOffset
    jmp  .GreenOffset
.RedOffset:
    push 20
    jmp  .Continue
.YellowOffset:
    push 10
    jmp  .Continue
.GreenOffset:
    push 0
.Continue:
    push ebx
    mov  edx,[ebp-0x38] ; x
    mov  ecx,[ebp-0x3C] ; lx
    sub  edx,ecx
    add  edx,5
    mov  ebx,edi ; y
    mov  ecx,[ebp-0x40] ; ly
    sub  ebx,ecx
;    sub  ebx,3
    mov  ecx,[ebp-0x1F] ; window
    sar  ecx,0x18
    call PrintNumberOnSelectedUnit
.Ret:
    mov  ecx,[ebp-0x1F]
    mov  ebx,[ebp-0x40]
    jmp  0x005625E5
@ENDHACK


;@HACK 0x0057EA07,0x0057EA0C,_UnitTypeClass__Dimensions_Increase_Height
;    sub  dword[eax+0x4],0x10
;    add  dword[eax+0xC],0x10
;    ;add  eax,6 ; to allow text to be drawing above the health bar and refresh correctly
;    ;mov  [ebx],eax
;    call 0x005BCBDC ; Union()
;    jmp  0x0057EA0C
;@ENDHACK


[section .text]
PrintNumberOnSelectedUnit:
    ; eax = number
    ; edx = x
    ; ebx = y
    ; cl = window
    ; push 1 = shp 
    ; push 2 = shp offset
    push ebp
    mov  ebp,esp
    push edi
    push esi
    sub  esp,0x20
    mov  [ebp-0x10],edx
    mov  [ebp-0x14],ebx
    mov  byte[ebp-0x18],cl
    mov  edx,0xA ; 10
    mov  esi,eax
    mov  eax,1
.RepeatMult:
    cmp  esi,edx
    jl  .Continue
.Mult10:
    imul edx,edx,0xA
    inc  eax
    cmp  eax,9
    jl   .RepeatMult
.Continue:
    mov  edx,eax
    shl  eax,0x2 ; x4
    sub  eax,edx ; x3
    mov  ecx,[ebp-0x10] ; x
    add  eax,eax ; x6
    add  eax,ecx
    lea  edi,[eax-3]
    test esi,esi
    jz   .Ret
.RepeatPrint:
    mov  ecx,0xA
    mov  edx,esi
    mov  eax,esi
    sar  edx,0x1F
    idiv ecx
    mov  ebx,edx
    push 0x100
    push 0
    push 0
    push 0
    push 0x30
    mov  ecx,[ebp-0x14] ; y
    mov  esi,eax
    mov  byte al,[ebp-0x18]
    mov  edx,[ebp+0xC] ; pip shp offset (original 8)
    add  edx,ebx
    movzx eax,al
    mov  ebx,edi
    push eax
    mov  eax,[ebp+0x8] ; pip shp (original 0x006857AC)
    sub  edi,0x6
    call Conquer___CC_Draw_Shape
    test esi,esi
    jnz  .RepeatPrint
.Ret:
    lea esp,[ebp-0x8]
    pop esi
    pop edi
    pop ebp
    ret


PrintAmmoOnSelectedUnit:
    ; eax = number
    ; edx = x
    ; ebx = y
    ; cl = window
    ; push 1 = shp 
    ; push 2 = shp offset
    push ebp
    mov  ebp,esp
    push edi
    push esi
    sub  esp,0x20
    mov  [ebp-0x10],edx
    mov  [ebp-0x14],ebx
    mov  byte[ebp-0x18],cl
    mov  edi,edx
    add  edi,3
    mov  esi,eax
    cmp  esi,50 ; max ammo shown
    jle  .RepeatPrint
    mov  esi,50
.RepeatPrint:
    cmp  esi,0
    jle  .Ret
    cmp  esi,0xA
    jl   .Last
    mov  dword ebx,0xA
    jmp  .ContinuePrint
.Last:
    mov  ebx,esi
.ContinuePrint:
    push 0x100
    push 0
    push 0
    push 0
    push 0x30
    mov  ecx,[ebp-0x14] ; y
    mov  byte al,[ebp-0x18]
    mov  edx,[ebp+0xC] ; pip shp offset (original 8)
    add  edx,ebx
    movzx eax,al
    mov  ebx,edi
    push eax
    mov  eax,[ebp+0x8] ; pip shp (original 0x006857AC)
    add  edi,0xA
    call Conquer___CC_Draw_Shape
    sub  esi,0xA
    jnz  .RepeatPrint
.Ret:
    lea esp,[ebp-0x8]
    pop esi
    pop edi
    pop ebp
    ret