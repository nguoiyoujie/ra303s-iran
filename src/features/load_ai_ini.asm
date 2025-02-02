;----------------------------------------------------------------
; src/features/load_ai_ini.asm
;
; Load an AI.ini containing AI settings after loading aftermath.ini before loading a scenario's rules changes
;
;----------------------------------------------------------------

cextern CCFileClass__CCFileClass
cextern CCINIClass__Load
cextern RulesClass__AI
cextern Globals___Rule

cextern str_ini_AI


@HACK 0x0053D645,0x0053D64A,_Read_Scenario_INI_Load_AI_INI
    call 0x00537564
    mov  edx,str_ini_AI
    mov  eax,CCFileClass_AI
    call CCFileClass__CCFileClass
    mov  eax,CCINIClass_AI
    call CCINIClass__CCINIClass
    xor  ebx,ebx
    mov  edx,CCFileClass_AI
    mov  eax,CCINIClass_AI
    call CCINIClass__Load
    mov  edx,CCINIClass_AI
    mov  eax,Globals___Rule
    call RulesClass__AI
    jmp  0x0053D64A
@ENDHACK
