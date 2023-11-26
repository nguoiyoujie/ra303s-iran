;----------------------------------------------------------------
; src/features/type_extensions/AnimTypeClass/animtypeclass_new_types.asm
;
; Continuation of Iran's work in enabling the game to use new AnimTypeClass.
; 
; This function is enabled by including the section [AnimTypes] and [DirectionalAnimTypes] in Rules.ini. This section includes an indexed array of names of animations to load.
;   [AnimTypes]
;   0=CHEPALM
;
;   [DirectionalAnimTypes]
;   0=FIREANIM
; 
; No compatibility issues is expected as the original game lack the ability to add new types.
;
;----------------------------------------------------------------

; There are two classes of animations
; One of them is a full animation loaded from a single file
; The other is a set of 8 directional animations loaded from a single file.
; There is special logic in TechnoClass::Fire_At that selects the animation ID based on the animation.

; We emulate this by placing the directional animations at the end of our list, then use the ID of the first animation to determine if an animation is directional
; The animation file is not loaded at this time, so we cannot obtain the frame 

@HOOK 0x0041C5D8 _AnimTypeClass_Init_Heap_Unhardcode_AnimTypes
@HOOK 0x0041C654 _AnimTypeClass__One_Time_UnhardCode_AnimTypes
@HOOK 0x0041C6E3 _AnimTypeClass__Init_UnhardCode_AnimTypes
@HOOK 0x00423EE8 _Anim_From_Name_Unhardcode_AnimTypes
@HOOK 0x004F40E9 _Init_Game_Set_AnimTypes_Heap_Count
@HOOK 0x005655C5 _TechnoClass_FireAt_ApplyDirectionalAnim

Tracker_AnimDir           db    0
FirstDirectionalAnim      db    0xFF
%define        AnimDirStageFrames            18 ; use SAMFIRE (6 for MINIGUN)

temp_AnimID               db    0
temp_AnimStr              dd    0
temp_AnimDirection        dd    0
temp_AnimDirFrameStart    dd    0
temp_AnimDirFrameBiggest  dd    0
temp_animtypeclass_constructor_arg dd 0

; Note: SAMFIRE and MINIGUN read the .shp counter-clockwise, but the numbering is clockwise.


_AnimTypeClass_Init_Heap_Unhardcode_AnimTypes:
    Loop_Over_RULES_INI_Section_Entries str_AnimTypes,Init_AnimTypeClass
    Loop_Over_RULES_INI_Section_Entries str_DirectionalAnimTypes,Init_DirectionalAnimTypeClass
.Ret:
    lea  esp,[ebp-14h]
    pop  edi
    pop  esi
    pop  edx
    jmp  0x0041C5DE


; We preserve this for now, we can tidy this later when we want to customize
Init_AnimTypeClass:
    mov  eax,AnimTypeClass.NEW_SIZE
    call AnimTypeClass__new
    test eax,eax
    jz   .Ret

    push eax
    mov  eax,edx
    ; edx should have the name of the INI section already
    call __strdup
    mov  ecx,eax
    pop  eax

    mov  edx,ebx
    add  edx,AnimTypesHeap.ORIGINAL_MAX ; AnimType
    mov  ebx,ecx ; Name/ID

    ; these settings were derived from ANIM_FBALL1 / FBALL1
    push 0FFFFFFFFh      ; chainto (AnimType)
    push 0FFFFFFFFh      ; soundid (VocType) (was 4Dh)
    push 1               ; loops
    push 0FFFFFFFFh      ; stages
    push 0FFFFFFFFh      ; loopend
    push 0               ; loopstart
    push 0               ; start
    push 1               ; delaytime
    push temp_animtypeclass_constructor_arg               ; damage (fixed) (needs to be a reference)
    push 0               ; isflame
    push 0               ; istrans
    push 0               ; ground
    push 0               ; issticky (Sticks to unit in square?)
    push 1               ; iscrater
    push 0               ; isscorcher
    push 0               ; iswhitetrans
    push 1               ; isnormal
    push 0               ; istheater 
    mov  ecx,43h        ; size (max of width or height,to establish refresh area)
    push 6               ; biggest (in effect,the ground effects like scorch are applied at this frame,so this is typically the biggest stage)
    mov  dword [0x005FDF98],edx ;0x15 ;????
    call AnimTypeClass__AnimTypeClass
.Ret:
    retn


Init_DirectionalAnimTypeClass:
    mov  dword [temp_AnimDirection],0
    mov  dword [temp_AnimDirFrameStart],0
    mov  dword [temp_AnimDirFrameBiggest],4 ; ANIM_SAM_N
    mov  dword [temp_AnimStr],edx
    mov  byte [temp_AnimID],bl
    ; edx should have the name of the INI section already
    jmp  .Create

.Next:
    push eax
    mov  eax,dword [temp_AnimDirection]
    cmp  eax,0
    jnz  .Next2
    add  dword [temp_AnimDirFrameStart],AnimDirStageFrames * 8
    add  dword [temp_AnimDirFrameBiggest],AnimDirStageFrames * 8

.Next2:
    inc  eax
    cmp  eax,0x8
    jge  .RetPop
    mov  dword [temp_AnimDirection],eax
    mov  eax,dword [temp_AnimDirFrameStart]
    sub  eax,AnimDirStageFrames
    mov  dword [temp_AnimDirFrameStart],eax
    mov  eax,dword [temp_AnimDirFrameBiggest]
    sub  eax,AnimDirStageFrames
    mov  dword [temp_AnimDirFrameBiggest],eax
    pop  eax

.Create:
    mov  eax,AnimTypeClass.NEW_SIZE
    call AnimTypeClass__new
    test eax,eax
    jz   .Ret

    push eax
    mov  eax,dword [temp_AnimStr]
    call __strdup
    mov  ecx,eax
    pop  eax

    xor  edx,edx
    mov  dl,byte [temp_AnimID]
    shl  dl,3 ; multiply by 8
    add  dl,byte [FirstDirectionalAnim] ; AnimType
    add  edx,dword [temp_AnimDirection]
    mov  ebx,ecx ; Name/ID

    ; these settings were derived from ANIM_SAM_N / SAMFIRE
    push 0FFFFFFFFh      ; chainto (AnimType)
    push 0FFFFFFFFh      ; soundid (VocType)
    push 0               ; loops
    push AnimDirStageFrames      ; stages
    push 0               ; loopend
    push 0               ; loopstart
    push dword [temp_AnimDirFrameStart]               ; start
    push 1               ; delaytime
    push temp_animtypeclass_constructor_arg               ; damage (fixed) (needs to be a reference)
    push 0               ; isflame
    push 0               ; istrans
    push 0               ; ground
    push 0               ; issticky (Sticks to unit in square?)
    push 0               ; iscrater
    push 0               ; isscorcher
    push 0               ; iswhitetrans
    push 0               ; isnormal
    push 0               ; istheater 
    mov  ecx,55         ; size (max of width or height,to establish refresh area)
    push dword [temp_AnimDirFrameBiggest]               ; biggest (in effect,the ground effects like scorch are applied at this frame,so this is typically the biggest stage)
    call AnimTypeClass__AnimTypeClass
    jmp .Next

.RetPop:
    pop  eax

.Ret:
    retn


_AnimTypeClass__One_Time_UnhardCode_AnimTypes:
    mov  al,[NewAnimTypeHeapCount]
    cmp  dh,al
    jl   0x0041C5F8
    jmp  0x0041C659


_AnimTypeClass__Init_UnhardCode_AnimTypes:
    mov  al,[NewAnimTypeHeapCount]
    cmp  bl,al
    jl   0x0041C68E
    jmp  0x0041C6E8
    
    
_Anim_From_Name_Unhardcode_AnimTypes:
    mov  al,[NewAnimTypeHeapCount]
    cmp  dl,al
    jl   0x00423EF4
    jmp  0x00423EED


_Init_Game_Set_AnimTypes_Heap_Count:
    Get_RULES_INI_Section_Entry_Count str_AnimTypes
    mov  byte [AnimTypesTypesExtCount],al
    mov  edx,eax
    add  edx,AnimTypesHeap.ORIGINAL_MAX
    mov  byte [FirstDirectionalAnim],dl

    Get_RULES_INI_Section_Entry_Count str_DirectionalAnimTypes
    shl  al,3 ;x8
    add  byte [AnimTypesTypesExtCount],al
    add  edx,eax
    mov  byte [NewAnimTypeHeapCount],dl
    jmp  0x004F40EE


_TechnoClass_FireAt_ApplyDirectionalAnim:
    cmp  al,byte [FirstDirectionalAnim]
    jge  .DirectionalAnim
    cmp  al,0x19
    jc   0x005655D7
    jbe  0x005657D8
    jmp  0x005655CF

.DirectionalAnim:
    push edx
    mov  edx,eax
    mov  eax,dword [ebp-0x18]
    add  eax,0xba
    mov  al,byte [eax]
    add  al,0x10
    and  eax,0xff
    sar  eax,0x5
    add  al,dl 
    pop  edx
    mov  byte [ebp-0x10],al
    jmp  0x005655D7