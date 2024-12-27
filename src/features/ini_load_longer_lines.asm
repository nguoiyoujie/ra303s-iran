;----------------------------------------------------------------
; src/features/ini_load_longer_lines.asm
;
; INI entries were limited to 128 characters per line (including keys and white spaces)
; Increase that to 1024
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;
;----------------------------------------------------------------

; INIClass::Load()
@SETD 0x004F2909 0x444 ; sub esp 0xC4 (0x44 + buffer (0x80))
@SETD 0x004F291E 0x400 ; mov ebx, buffer (0x80))
@SETD 0x004F2924 -1108 ; convert 0xFFFFFF2C to 0xFFFFFBAC ; using 0xFFFFFBAC directly didn't work
@SETD 0x004F293E -1108
@SETD 0x004F2949 -1108
@SETD 0x004F298E -1108
@SETD 0x004F2994 -1108
@SETD 0x004F29BB -1108
@SETD 0x004F29DA -1108
@SETD 0x004F2A98 0x400 ; mov ebx, buffer (0x80))
@SETD 0x004F2A9E -1108
@SETD 0x004F2AAC -1108
@SETD 0x004F2ABB -1108
@SETD 0x004F2AE1 -1108
@SETD 0x004F2AF0 -1108
@SETD 0x004F2B02 -1108
@SETD 0x004F2B28 -1108
@SETD 0x004F2B2E -1108
@SETD 0x004F2B85 -1108


