; review this scatter mechanism
;@HOOK 0x004619E7 _BulletClass__Unlimbo_IncreaseScatter_BallisticScatter
;@HOOK 0x00461A50 _BulletClass__Unlimbo_IncreaseScatter_HomingScatter

@HOOK 0x00461C3F _BulletClass__Unlimbo_Recalc_BallisticScatter

_BulletClass__Unlimbo_Recalc_BallisticScatter:
    ;eax is the distance
    ;[EBP-0x1c] is speed
    ;We seek to calculate the Riser stat that determines the initial vertical speed.
    ;This speed decreases by Rule.Gravity every frame.
    ; The desired formula is R0 = g*(D-s)/2s
    ;  from:
    ;   H=(sum T=0 to t)(R0-T*g)                height at time t
    ;   D=s*t                                   ground distance at time t
    ;   H=0                                     for impact
    ; reduce that result by g as Height starts out positve
    ; speed is guaranteed to be more than 0 due to a lower limit of 25 imposed by the game
    mov  ebx,dword [EBP-1ch] ;s
    sub  eax,ebx ; D-s
    add  ebx,ebx ;2s
    mov  edx,eax
    sar  edx,1fh
    idiv ebx
    dec  eax 
    jmp  0x00461C53 ; multiply by G after jump


; modify scatter
_BulletClass__Unlimbo_IncreaseScatter_BallisticScatter:
    mov  edx,eax
    sar  edx,0x1f
    shl  edx,0x4   ; was 4
    sbb  eax,edx
    sar  eax,0x1   ; was 4
    lea  edx,[eax - 0xFF]
    jmp  0x004619F7

; modify scatter
_BulletClass__Unlimbo_IncreaseScatter_HomingScatter:
    mov  edx,eax
    sar  edx,0x1f
    shl  edx,0x4   ; was 4
    sbb  eax,edx
    sar  eax,0x2   ; was 4
    ;sub  eax,0x40
    xor  edx,edx
    jmp  0x00461A62
