;
; Copyright (c) 2012, 2013 Toni Spets <toni.spets@iki.fi>
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

%define sendto 0x005E59D0
%define recvfrom 0x005E59D6

@CALL 0x005A8B31, Tunnel_SendTo
@CALL 0x005A89AE, Tunnel_RecvFrom

Tunnel_SendTo:
%push
    push ebp
    mov  ebp,esp
    sub  esp,1024
    push esi
    push edi

%define var_buf     (ebp-1024)

%define addrlen     ebp+28
%define dest_addr   ebp+24
%define flags       ebp+20
%define len         ebp+16
%define buf         ebp+12
%define sockfd      ebp+8

    ; no processing if no tunnel
    cmp  dword[tunnel_port],0
    je   .notunnel

    ; copy packet to our buffer
    mov  esi,[buf]
    lea  edi,[var_buf+4]
    mov  ecx,[len]
    CLD
    REP  MOVSB

    ; pull dest port to header
    lea  eax,[var_buf]

    mov  ecx,[dest_addr]
    lea  ecx,[ecx+sockaddr_in.sin_port]
    mov  edx,[ecx]
    SHL  edx,16
    mov  [eax],edx

    mov  edx,[tunnel_id]
    shr  edx,16
    OR   [eax],edx

    and  edx,0xFFFF
    OR   [eax],edx

    ; set dest_addr to tunnel address
    mov  eax,[dest_addr]
    lea  eax,[eax+sockaddr_in.sin_port]
    mov  edx,[tunnel_port]
    shr  edx,16
    mov  word[eax],DX

    mov  eax,[dest_addr]
    lea  eax,[eax+sockaddr_in.sin_addr]
    mov  edx,[tunnel_ip]
    mov  dword[eax],edx

    mov  eax,[addrlen]
    push eax
    mov  eax,[dest_addr]
    push eax
    mov  eax,[flags]
    push eax
    mov  eax,[len]
    add  eax,4
    push eax
    lea  eax,[var_buf]
    push eax
    mov  eax,[sockfd]
    push eax
    call sendto
    jmp  .exit

.notunnel:
    mov  eax,[addrlen]
    push eax
    mov  eax,[dest_addr]
    push eax
    mov  eax,[flags]
    push eax
    mov  eax,[len]
    push eax
    mov  eax,[buf]
    push eax
    mov  eax,[sockfd]
    push eax
    call sendto

.exit:
    pop  edi
    pop  esi
    mov  esp,ebp
    pop  ebp
    retn 24
%pop

Tunnel_RecvFrom:
%push
    push ebp
    mov  ebp,esp
    sub  esp,1024
    push esi
    push edi

%define var_buf     (ebp-1024)

%define addrlen     ebp+28
%define src_addr    ebp+24
%define flags       ebp+20
%define len         ebp+16
%define buf         ebp+12
%define sockfd      ebp+8

    ; no processing if no tunnel
    cmp  dword[tunnel_port],0
    je   .notunnel

    ; call recvfrom first to get the packet
    mov  eax,[addrlen]
    push eax
    mov  eax,[src_addr]
    push eax
    mov  eax,[flags]
    push eax
    mov  eax,1024        ; len
    push eax
    lea  eax,[var_buf]
    push eax
    mov  eax,[sockfd]
    push eax
    call recvfrom

    ; no processing if returnng error
    cmp  eax,-1
    je   .exit

    ; no processing if less than 5 bytes of data
    cmp  eax,5
    JL   .error

    ; remove header from return length
    sub  eax,4

    ; copy real packet after header to game buf
    lea  esi,[var_buf+4]
    mov  edi,[buf]
    mov  ecx,eax
    CLD
    REP  MOVSB

    ; pull our header
    lea  edx,[var_buf]
    mov  edx,[edx]

    ; FIXME: going to assume packets are meant for me, someone can validate the "to" part later...
    ; leaving just from here
    and  edx,0xFFFF

    ; set from port to header identifier
    mov  ecx,[src_addr]
    lea  ecx,[ecx+sockaddr_in.sin_port]
    mov  word[ecx],DX

    xor  edx,edx
    mov  ecx,[src_addr]
    lea  ecx,[ecx+sockaddr_in.sin_addr]
    mov  dword[ecx],edx

    jmp  .exit

.notunnel:
    ; call recvfrom first to get the packet
    mov  eax,[addrlen]
    push eax
    mov  eax,[src_addr]
    push eax
    mov  eax,[flags]
    push eax
    mov  eax,[len]
    push eax
    mov  eax,[buf]
    push eax
    mov  eax,[sockfd]
    push eax
    call recvfrom
    jmp  .exit

.error:
    mov  eax,-1
.exit:
    pop  edi
    pop  esi
    mov  esp,ebp
    pop  ebp
    retn 24
%pop
