;----------------------------------------------------------------
; src/version.asm
;
; Writes the version number to the game main menu
;
;----------------------------------------------------------------
%ifndef __GIT_REVISION__
%define __GIT_REVISION__ "????"
%endif

%ifndef __GIT_COMMIT__
%define __GIT_COMMIT__ "unknown"
%endif

str_version db"3.03s r",__GIT_REVISION__,0x0D,"git~",__GIT_COMMIT__,0

@HACK 0x00589960,0x00589AE0,_Version_Name
    mov  eax,str_version
    retn
@ENDHACK
