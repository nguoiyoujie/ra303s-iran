; review this scatter mechanism
;@HOOK 0x004619E7 _BulletClass__Unlimbo_IncreaseScatter_BallisticScatter
;@HOOK 0x00461A50 _BulletClass__Unlimbo_IncreaseScatter_HomingScatter

; modify scatter
_BulletClass__Unlimbo_IncreaseScatter_BallisticScatter:
    mov  edx, eax
    sar  edx, 0x1f
    shl  edx, 0x4   ; was 4
    sbb  eax, edx
    sar  eax, 0x1   ; was 4
    lea  edx, [eax - 0xFF]
    jmp  0x004619F7

; modify scatter
_BulletClass__Unlimbo_IncreaseScatter_HomingScatter:
    mov  edx, eax
    sar  edx, 0x1f
    shl  edx, 0x4   ; was 4
    sbb  eax, edx
    sar  eax, 0x2   ; was 4
    ;sub  eax, 0x40
    xor  edx, edx
    jmp  0x00461A62
