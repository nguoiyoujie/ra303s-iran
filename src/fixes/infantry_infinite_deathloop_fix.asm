;----------------------------------------------------------------
; src/fixes/infantry_infinite_deathloop_fix.asm
;
; Dying infantry can take damage to 'die' again - result in repeated voices and announces. 
; Moreover, if the 2nd killing blow has a different InfDeath parameter, the death animation is reset and replaced by a new one, allowing the possiblity of a death loop.
; This fix checks if the infantry is already in a dying animation. If so, he will no longer process any more damage
; 
; This function is enabled by default and not controllable
; No compatibility issues is expected as this was not an adjustable parameter. However, lookout for the possibility of missions taking 'advantage' of this bug using Unit Destroyed on repeating triggers.
; 
;----------------------------------------------------------------
@HACK 0x004EBD50,0x004EBD55,_InfantryClass__Take_Damage_CheckDoing
    ; eax is the damaged infantry, let's check if he is already running a dying animation
    mov  esi,eax
    push eax
    mov  al,byte[eax+0x145] ; ID
    cmp  al,0xB ;(0xB - 0xF) DO_GUN_DEATH, DO_EXPLOSION_DEATH, DO_EXPLOSION2_DEATH, DO_GRENADE_DEATH, DO_FIRE_DEATH
    jl   .Continue
    cmp  al,0xF 
    jg   .Continue
.Exit:
    pop  eax
    xor  eax,eax ; RESULT_NONE
    jmp  0x004EC21B
.Continue:
    pop  eax
    mov  byte[ebp-0x10],cl
    jmp  0x004EBD55
@ENDHACK

