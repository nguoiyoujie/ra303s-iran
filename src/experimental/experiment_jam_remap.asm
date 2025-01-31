;----------------------------------------------------------------
; src/experimental/experiment_jam_remap.asm
;
; Apply a different palette to jammed buildings 
;
; This function is enabled by using the key:
;   Rules.ini > [General] > RemapJammedBuildings=yes
;
; This is a working prototype. Enable at your own risk.
;
;----------------------------------------------------------------

%define FadingJammed 0x006561E0 ; FadingShade
; FadingBrighten  0x006560E0
; FadingShade     0x006561E0
; FadingWayDark   0x006562E0
; FadingLight     0x006563E0
; FadingGreen     0x006564E0
; FadingYellow    0x006565E0
; FadingRed       0x006566E0

; find a way to always refresh
@HACK 0x0056718C,0x00567194,_TechnoClass__TechnoDrawObject_RemapJammedAsShade
    cmp  al,RTTIType.Infantry
    jz   0x00567194
    cmp  al,RTTIType.Building
    jnz  0x00567242
    mov  al,byte[Rules.General.RemapJammedBuildings]
    cmp  al,0
    jz   0x00567242
    mov  eax,dword[ebp - 0x10]
    ;mov  al,byte[eax+0x196]
    ;movzx eax,al
    test byte[eax+0xD7],0x10 ;Jammed
    jz   0x00567242
    mov dword[ebp - 0x24],FadingJammed
    jmp  0x00567242
@ENDHACK


; the current method in this hook prevents selling/deconstruction. Weird things could also happen if building has special animations like a war factory
;@HACK 0x0046033B,_BuildingClass__Animation_AI_FreezeJammed
;    test byte[ebx+0xD7],0x10
;    jnz  0x004605FE
;    cmp  eax,ecx
;    jnc  0x00460343
;    sub  ecx,eax
;    jmp  0x00460347
;@ENDHACK


@HACK 0x004603B2,0x004603B7,_BuildingClass__Animation_AI_AlwaysUpdateJammable
    ; eax is the building type ID
    push ebx
    push ecx
    movzx eax,al
    BuildingTypeClass.FromIndex(eax,ebx)
    BuildingTypeClass.IsJammable.Get(ebx,cl)
    test cl,cl
    pop  ecx
    pop  ebx
    jnz  0x004603BB
    ; existing SAM-SITE check
    cmp  eax,0xF
    jnz  0x004603CB
    jmp  0x004603B7
@ENDHACK
