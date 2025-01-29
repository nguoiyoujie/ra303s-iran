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
@SET 0x004F2907, {sub esp,0x444} ; sub esp 0xC4 (0x44 + buffer, (0x80))
@SET 0x004F291D, {mov ebx,0x400} ; mov ebx, buffer, (0x80))
@SET 0x004F2922, {lea edx,[ebp-0x454]} ; convert 0xFFFFFF2C to 0xFFFFFBAC ; using 0xFFFFFBAC directly didn't, work
@SET 0x004F293C, {cmp byte[ebp-0x454],0x5b}
@SET 0x004F2947, {lea esi,[ebp-0x454]}
@SET 0x004F298C, {lea esi,[ebp-0x454]}
@SET 0x004F2992, {mov byte[ebp-0x454],dl}
@SET 0x004F29B9, {lea eax,[ebp-0x454]}
@SET 0x004F29D8, {lea eax,[ebp-0x454]}
@SET 0x004F2A97, {mov ebx,0x400} ; mov ebx, buffer, (0x80))
@SET 0x004F2A9C, {lea edx,[ebp-0x454]}
@SET 0x004F2AAA, {mov dh,byte[ebp-0x454]}
@SET 0x004F2AB9, {lea esi,[ebp-0x454]}
@SET 0x004F2ADF, {lea eax,[ebp-0x454]}
@SET 0x004F2AEE, {mov bl,byte[ebp-0x454]}
@SET 0x004F2B00, {lea esi,[ebp-0x454]}
@SET 0x004F2B26, {lea eax,[ebp-0x454]}
@SET 0x004F2B2C, {lea edi,[ebp-0x454]}
@SET 0x004F2B83, {lea eax,[ebp-0x454]}


