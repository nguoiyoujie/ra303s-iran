;----------------------------------------------------------------
; src/features/ai_difficulty_customizations.asm
;
; Introduces INI controls for adjusting AI settings across difficulty modes. 
; 
; This function is enabled by by filling in one or more of the following INI keys:
;   Rules.ini/Map > [AI] > EasyAIGemValue
;   Rules.ini/Map > [AI] > EasyAIGoldValue
;   Rules.ini/Map > [AI] > NormalAIGemValue
;   Rules.ini/Map > [AI] > NormalAIGoldValue
;   Rules.ini/Map > [AI] > HardAIGemValue
;   Rules.ini/Map > [AI] > HardAIGoldValue
; 
; No compatibility issues is expected as these AI customizations was not a feature of the unmodified game.
;
;----------------------------------------------------------------

@HOOK 0x0058144B _UnitClass__Load_Credits_Credit_Values_For_AI_Difficulties


Check_AI_Difficulty_Gem_And_Gold_Values:
    cmp  ebx,-1 ; ebx = gold value
    jnz  .Dont_Change_Gold_Value

    mov  ebx,[Globals___Rule_GoldValue]

.Dont_Change_Gold_Value:
    cmp  ecx,-1 ; ebx = gold value
    jnz  .Dont_Gem_Gold_Value
    mov  ecx,[Globals___Rule_GemValue]

.Dont_Gem_Gold_Value:
    retn


_UnitClass__Load_Credits_Credit_Values_For_AI_Difficulties:
    push eax
    mov  dword eax,[eax+0x93]
    call HouseClass__As_Pointer

    test byte [eax+42h],2
    jnz  .Not_AI

    cmp  byte [eax+9],0
    jz   .AI_Easy_Dfficulty

    cmp  byte [eax+9],1
    jz   .AI_Normal_Dfficulty

    cmp  byte [eax+9],2
    jz   .AI_Hard_Dfficulty

    jmp  .Not_AI ; Shouldn't be reached ever

.Ret:
    pop  eax
    jmp  0x00581451

.Not_AI:
    mov  ecx,[Globals___Rule_GemValue]
    mov  ebx,[Globals___Rule_GoldValue]
    jmp  .Ret

.AI_Easy_Dfficulty:
    mov  ecx,[Integer_Feature_EasyAIGemValue]
    mov  ebx,[Integer_Feature_EasyAIGoldValue]
    call Check_AI_Difficulty_Gem_And_Gold_Values
    jmp  .Ret

.AI_Normal_Dfficulty:
    mov  ecx,[Integer_Feature_NormalAIGemValue]
    mov  ebx,[Integer_Feature_NormalAIGoldValue]
    call Check_AI_Difficulty_Gem_And_Gold_Values
    jmp  .Ret

.AI_Hard_Dfficulty:
    mov  ecx,[Integer_Feature_HardAIGemValue]
    mov  ebx,[Integer_Feature_HardAIGoldValue]
    call Check_AI_Difficulty_Gem_And_Gold_Values
    jmp  .Ret

