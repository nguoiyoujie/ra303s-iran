;
; Copyright (c) 2013 Toni Spets <toni.spets@iki.fi>
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
; src/features/internet_cncnet.asm
;
; When the Internet button is clicked, the game opens CnCNet's webpage instead. 
; BE WARNED THAT MODIFIED COPIES OF RA95 MAY NOT BE COMPATIBLE WITH COPIES USED BY CNCNET!
; 
; This function is activated by specifying the following options in RedAlert.ini:
;     [Options] > EnableWOL=yes
; No compatibility issues is expected. 
;
;----------------------------------------------------------------
; Internet button in the main menu goes to cncnet.org instead of WOL

extern Globals___Session_Type


%define ShellExecuteA           0x005E653C
%define ShowWindow              0x005E6884
%define pHWnd                   0x006B1498
%define SW_MINIMIZE             6

str_cncnet_org db"http://cncnet.org/", 0
str_dot db".", 0

@HACK 0x004F4D7E,0x004F4D83,_Internet_Action
    cmp  byte[RedAlert.Options.EnableWOL],1
    jz   .Normal_Code
    push SW_MINIMIZE
    mov  eax,[pHWnd]
    push eax
    call dword[ShowWindow]
    push 5
    push str_dot
    push 0
    push str_cncnet_org
    push 0
    push 0
    call dword[ShellExecuteA]
    mov  byte[Globals___Session_Type],GameType.GAME_NORMAL
    jmp  0x004F467B
.Normal_Code:
    mov  eax,[0x0069172C]
    jmp  0x004F4D83
@ENDHACK

