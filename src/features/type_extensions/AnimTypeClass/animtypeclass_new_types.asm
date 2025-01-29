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

@LJMP 0x0041C5D8, _AnimTypeClass_Init_Heap_Unhardcode_AnimTypes
@LJMP 0x0041C654, _AnimTypeClass__One_Time_UnhardCode_AnimTypes
@LJMP 0x0041C6E3, _AnimTypeClass__Init_UnhardCode_AnimTypes
@LJMP 0x00423EE8, _Anim_From_Name_Unhardcode_AnimTypes
@LJMP 0x004F40E9, _Init_Game_Set_AnimTypes_Heap_Count
@LJMP 0x005655C5, _TechnoClass_FireAt_ApplyDirectionalAnim

%define        AnimDirStageFrames            18 ; use SAMFIRE (6 for MINIGUN)

[section .data] 
Tracker_AnimDir           db    0
FirstDirectionalAnim      db    0xFF
Temp.Anim.ID               db    0
Temp.Anim.Str              dd    0
Temp.Anim.Direction        dd    0
Temp.Anim.DirFrameStart    dd    0
Temp.Anim.DirFrameBiggest  dd    0
Temp.Anim.typeclass_constructor_arg dd 0

; Note: SAMFIRE and MINIGUN read the .shp counter-clockwise, but the numbering is clockwise.

[section .text] 
_AnimTypeClass_Init_Heap_Unhardcode_AnimTypes:
    Loop_Over_RULES_INI_Section_Entries str_AnimTypes,Init_AnimTypeClass
    Loop_Over_RULES_INI_Section_Entries str_DirectionalAnimTypes,Init_DirectionalAnimTypeClass
    ;mov  edx,[AnimTypeClass.Count]
    ;dec  edx
    ;mov  [0x005FDF98],edx ; used by deconstructor
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
    call _strdup
    mov  ecx,eax
    pop  eax

    mov  edx,ebx
    add  edx,AnimTypesHeap.ORIGINAL_COUNT ; AnimType
    mov  ebx,ecx ; Name/ID

    ; mimic AnimType ANIM_FBALL1 / FBALL1, but muted
    push -1             ; AnimType chainto
    push -1           ; VocType soundid
    push 1               ; int loops
    push -1       ; int stages
    push -1       ; int loopend
    push 0               ; int loopstart
    push 0               ; int start
    push 1               ; int delaytime
    push Temp.Anim.typeclass_constructor_arg ; fixed damage (needs to be a reference)
    push 0               ; bool isflame
    push 0               ; bool istrans
    push 0               ; bool ground
    push 0               ; bool issticky (Sticks to unit in square?)
    push 1               ; bool iscrater
    push 0               ; bool isscorcher
    push 0               ; bool iswhitetrans
    push 1               ; bool isnormal
    push 0               ; bool istheater 
    push 6               ; int biggest (in effect,the ground effects like scorch are applied at this frame,so this is typically the biggest stage)
    mov  ecx,43h         ; size (max of width or height,to establish refresh area)
    ; ecx: size
    ; ebx: int name
    ; edx: BuildingType type
    ; eax: BuildingTypeClass object
    call AnimTypeClass__AnimTypeClass
.Ret:
    retn


; for 8 direction animations
Init_DirectionalAnimTypeClass:
    mov  dword [Temp.Anim.Direction],0
    mov  dword [Temp.Anim.DirFrameStart],0
    mov  dword [Temp.Anim.DirFrameBiggest],4 ; ANIM_SAM_N
    mov  dword [Temp.Anim.Str],edx
    mov  byte [Temp.Anim.ID],bl
    ; edx should have the name of the INI section already
    jmp  .Create

.Next:
    push eax
    mov  eax,dword [Temp.Anim.Direction]
    test eax,eax
    jnz  .Next2
    add  dword [Temp.Anim.DirFrameStart],AnimDirStageFrames * 8
    add  dword [Temp.Anim.DirFrameBiggest],AnimDirStageFrames * 8

.Next2:
    inc  eax
    cmp  eax,0x8
    jge  .RetPop
    mov  dword [Temp.Anim.Direction],eax
    mov  eax,dword [Temp.Anim.DirFrameStart]
    sub  eax,AnimDirStageFrames
    mov  dword [Temp.Anim.DirFrameStart],eax
    mov  eax,dword [Temp.Anim.DirFrameBiggest]
    sub  eax,AnimDirStageFrames
    mov  dword [Temp.Anim.DirFrameBiggest],eax
    pop  eax

.Create:
    mov  eax,AnimTypeClass.NEW_SIZE
    call AnimTypeClass__new
    test eax,eax
    jz   .Ret

    push eax
    mov  eax,dword [Temp.Anim.Str]
    call _strdup
    mov  ecx,eax
    pop  eax

    xor  edx,edx
    mov  dl,byte [Temp.Anim.ID]
    shl  dl,3 ; multiply by 8
    add  dl,byte [FirstDirectionalAnim] ; AnimType
    add  edx,dword [Temp.Anim.Direction]
    mov  ebx,ecx ; Name/ID

    ; mimic AnimType ANIM_SAM_N / SAMFIRE, but muted
    push -1             ; AnimType chainto
    push -1           ; VocType soundid
    push 0               ; int loops
    push AnimDirStageFrames ; int stages
    push 0               ; int loopend
    push 0               ; int loopstart
    push dword [Temp.Anim.DirFrameStart] ; int start
    push 1               ; int delaytime
    push Temp.Anim.typeclass_constructor_arg ; fixed damage (needs to be a reference)
    push 0               ; bool isflame
    push 0               ; bool istrans
    push 0               ; bool ground
    push 0               ; bool issticky (Sticks to unit in square?)
    push 0               ; bool iscrater
    push 0               ; bool isscorcher
    push 0               ; bool iswhitetrans
    push 0               ; bool isnormal
    push 0               ; bool istheater 
    push dword [Temp.Anim.DirFrameBiggest] ; biggest (in effect,the ground effects like scorch are applied at this frame,so this is typically the biggest stage)
    mov  ecx,55          ; size (max of width or height,to establish refresh area)
    ; ecx: size
    ; ebx: int name
    ; edx: BuildingType type
    ; eax: BuildingTypeClass object
    call AnimTypeClass__AnimTypeClass
    jmp .Next

.RetPop:
    pop  eax
.Ret:
    retn


_AnimTypeClass__One_Time_UnhardCode_AnimTypes:
    mov  al,byte[AnimTypeClass.Count]
    cmp  dh,al
    jl   0x0041C5F8
    jmp  0x0041C659


_AnimTypeClass__Init_UnhardCode_AnimTypes:
    mov  al,byte[AnimTypeClass.Count]
    cmp  bl,al
    jl   0x0041C68E
    jmp  0x0041C6E8
    
    
_Anim_From_Name_Unhardcode_AnimTypes:
    mov  al,byte[AnimTypeClass.Count]
    cmp  dl,al
    jl   0x00423EF4
    jmp  0x00423EED


_Init_Game_Set_AnimTypes_Heap_Count:
    Get_RULES_INI_Section_Entry_Count str_AnimTypes
    mov  edx,eax
    add  edx,AnimTypesHeap.ORIGINAL_COUNT
    mov  byte [FirstDirectionalAnim],dl

    Get_RULES_INI_Section_Entry_Count str_DirectionalAnimTypes
    shl  al,3 ;x8
    add  edx,eax
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