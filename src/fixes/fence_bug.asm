;
; Copyright (c) 2012 Toni Spets <toni.spets@iki.fi>
;
; Permission to use, copy, modify, and distribute this software for any
; purpose with or without fee is hereby granted, provided that the above
; copyright notice and this permission notice appear in all copies.
;
; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
;

;----------------------------------------------------------------
; src/fixes/fence_bug.asm
;
; Northern edge fence bug fix.
; Destroying a fence along the northern edge of the map lead to a crash. This fixes the crash
;
; Inherited acknowledgment from Iran: This fix was originally in AlexB's Arda project, thank you for sharing
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as the original game crashes in this scenario otherwise.
;
;----------------------------------------------------------------

@LJMP 0x004A0219,_fence_bug

%define fence_bug_bad 0x004A0227
%define fence_bug_good 0x004A0229

_fence_bug:
    push eax
    push ebx

    sub  eax,dword[Globals___Map_Array]
    xor  edx,edx
    mov  ebx,0x3A
    idiv ebx
    mov  edx,eax

    pop  ebx
    pop  eax

    cmp  edx,0
    jl   fence_bug_bad
    cmp  edx,0x4000
    jb   fence_bug_good
    jmp  fence_bug_bad
