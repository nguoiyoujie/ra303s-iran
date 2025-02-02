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
; src/features/expansions.asm
;
; Allows alternative configuration to enable Aftermath and Counterstrike installations via file keys rather than registry keys
; 
; This function is activated by specifying the following options in RedAlert.ini:
;     [Options] > CounterstrikeEnabled=yes
;     [Options] > AftermathEnabled=yes
;
; or with Spawn.ini
;
;     [Settings] > Aftermath
; No compatibility issues is expected. 
;
;----------------------------------------------------------------

cextern str_arg_Spawn

@HACK 0x004AC024,0x004AC029,_Is_Aftermath_Installed
    Save_Registers
    call GetCommandLineA
    mov  edx,str_arg_Spawn
    call _stristr
    test eax,eax
    Restore_Registers
    jz   .Non_Spawner_Check
    xor  eax,eax
    mov  byte al,[Spawn.Settings.Aftermath]
    retn
.Non_Spawner_Check:
    cmp  byte[RedAlert.Options.AftermathEnabled],1
    jz   .Ret_True
.Ret_False:
    xor  eax,eax
    retn
.Ret_True:
    mov  eax,1
    retn
@ENDHACK


@HACK 0x004ABF88,0x004ABF8D,_Is_Counterstrike_Installed
    cmp  byte[RedAlert.Options.CounterstrikeEnabled],1
    jz   .Ret_True
    xor  eax,eax
    retn
.Ret_True:
    mov  eax,1
    retn
@ENDHACK
