;----------------------------------------------------------------
; src/features/type_extensions/soundeffectslist_unhardcode.asm
;
; Continuation of Iran's work in enabling the game to use new sounds.
;
; Fixes a bug in Iran's previous version, where the list contained only the names. The game effectively read garbage values when seeking Priority and ContextType.
; It led to the new sounds sometimes overwriting the in-game music, and could be a cause of crash as well.
; 
; This function is enabled by including the section [SoundEffects] in Rules.ini. This section includes an indexed array of names of sounds to load.
;   [SoundEffects]
;   0=BAZOOK1
;   1=GUN13
;
; New sounds will be loaded with priority 10, and context type IN_NOVAR parameters. This matches most sounds.
; 
; No compatibility issues is expected as the original game lack the ability to add new types.
;
;----------------------------------------------------------------

@HOOK 0x00425CB9 _Voc_From_Name_Add_Unhardcoded_Sound_Effects
@HOOK 0x00425D0E _Voc_Name_Add_Unhardcoded_Sound_Effects
@HOOK 0x00425FDF _Sound_Effect_Call_Where
@HOOK 0x004260AB _Sound_Effect_Call_Voc_Name
@HOOK 0x004260F5 _Sound_Effect_Call_Priority

_Sound_Effect_Call_Where:
; eax is the voc id
    cmp  ax,OriginalSoundEffectsCount
    jge  .Check_Unhardcoded_Sound_Effects

.Normal_Code:
    shl  eax,0x3
    add  eax,ecx
    mov  cl,byte [eax + Audio___SoundEffectName + 8]
    jmp  0x00425FEA

.Check_Unhardcoded_Sound_Effects:
    sub  ax,OriginalSoundEffectsCount
    cmp  word ax,[SoundEffectsCount]
    jge  .Return_False

    push edx
    lea  edx,[SoundEffectsList+eax*9]
    add  edx,8
    mov  cl,byte [edx]
    pop  edx
    jmp  0x00425FEA

.Return_False:
    mov  cl,0
    jmp  0x00425FEA


_Sound_Effect_Call_Priority:
; edx is the voc id
    cmp  dx,OriginalSoundEffectsCount
    jge  .Check_Unhardcoded_Sound_Effects

.Normal_Code:
    mov  edx,dword [esi + edx*0x8 + Audio___SoundEffectName + 4]
    jmp  0x004260FC

.Check_Unhardcoded_Sound_Effects:
    sub  dx,OriginalSoundEffectsCount
    cmp  word dx,[SoundEffectsCount]
    jge  .Return_False

    lea  edx,[SoundEffectsList+edx*9]
    add  edx,4
    mov  edx,dword [edx]
    jmp  0x004260FC

.Return_False:
    mov  dl,1
    jmp  0x004260FC


_Sound_Effect_Call_Voc_Name:
    call 0x00425CF8  ;    char * Voc_Name(VocType)
    mov  ecx,eax
    xor  edx,edx
    jmp  0x004260B4

_Voc_Name_Add_Unhardcoded_Sound_Effects:
    cmp  ax,OriginalSoundEffectsCount
    jge  .Check_Unhardcoded_Sound_Effects

.Normal_Code:
    lea  edx,[eax*9]
    mov  eax,[Audio___SoundEffectName+edx] ; ds:SoundEffectName SoundEffectName[][edx+eax*8]
    jmp  0x00425D15

.Check_Unhardcoded_Sound_Effects:
    sub  ax,OriginalSoundEffectsCount
    cmp  word ax,[SoundEffectsCount]
    jge  .Return_False

    xor  edx,edx
    mov  dx,ax
    lea  edx,[SoundEffectsList+edx*9]
    mov  eax,[edx]
    jmp  0x00425D15

.Return_False:
    mov  eax,0x005E82D4 ; "none"
    jmp  0x00425D15

_Voc_From_Name_Add_Unhardcoded_Sound_Effects:
    cmp  cx,OriginalSoundEffectsCount
    jl   0x00425CC8

.Check_Unharded_Sound_Effects:
    mov  word [ebp-0x10],0
    mov  ecx,0

    cmp  word [SoundEffectsCount],0
    jz   .Ret_False

    jmp  .Loop

.Next_Loop_Iteration:

    inc  cx

.Loop:
    xor  edx,edx
    mov  dx,word [SoundEffectsCount]
;    sub        dx,1
    cmp  dx,cx
    je   .Ret_False

    lea  edx,[SoundEffectsList+ecx*9]
    mov  edx,[edx]
    mov  eax,ebx
    call _strcmpi
    test eax,eax
    jnz  .Next_Loop_Iteration
    jmp  .Return_VocType

.Ret_False:
    jmp  0x00425CE7

.Return_VocType:
    xor  eax,eax
    mov  ax,cx
    add  ax,OriginalSoundEffectsCount
    jmp  0x00425CED

Init_SoundEffect:
    ; edx should have the name of the INI section already
    mov  eax,edx
    call __strdup

    ; follow SoundEffectNameStruct 9-byte structure, using a 4-byte structure could be a cause of the audio-bug and crash
    lea  ebx,[ebx*9]
    lea  ebx,[SoundEffectsList + ebx]
    mov  [ebx],eax  ; name
	mov  dword [ebx+4],10 ; priority, fixed to 10 as are most sounds
	mov  byte [ebx+9],0 ; ContextType, fixed to IN_NOVAR (0) 
.Ret:
    retn

; called from src/features/type_extensions/early_rules._ini_load.asm
Rules_INI_Load_Sound_Effects_List:

    Get_RULES_INI_Section_Entry_Count str_SoundEffects
    mov  word [SoundEffectsCount],ax

    Loop_Over_RULES_INI_Section_Entries str_SoundEffects,Init_SoundEffect
    retn
