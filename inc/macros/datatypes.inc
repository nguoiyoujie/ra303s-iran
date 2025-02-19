;; LICENSE = BSD0 - https://github.com/FunkyFr3sh/petool

%include "macros/extern.inc"

%assign true 1
%assign false 0

;; global generic data -> arg1 = name, arg2 = definition. Supply dd/dw/db yourself
%macro gvar 2
    cglobal %1
    [section .data] 
    %1 %2
    __SECT__
%endmacro

;; global buffer data -> arg1 = name, arg2 = length. "times X db 0"
%macro gbuf 2
    cglobal %1
    [section .data] 
    %1 times %2 db 0
    __SECT__
%endmacro

;; global const string -> arg1 = name, arg2 = value
%macro gstring 2
    cglobal %1
    sstring %1, %2
%endmacro

;; static (local) const string -> arg1 = name, arg2 = value
%macro sstring 2
    [section .rdata]
    %1 db %2,0
    __SECT__
%endmacro

;; global string -> arg1 = name, arg2 = value, arg3 = length
%macro gstring 3
    cglobal %1
    sstring %1, %2, %3
%endmacro

;; static (local) string -> arg1 = name, arg2 = value, arg3 = length
%macro sstring 3
    %strlen ___StringLength %2

    %if ___StringLength > 0
        [section .data]
        %1 db %2
        times ((%3) - (___StringLength)) db 0
        __SECT__
    %else
        [section .bss]
        %1 resb %3
        __SECT__
    %endif
%endmacro

;; global int -> arg1 = name
%macro gint 1
    gint %1, {0}
%endmacro

;; global int -> arg1 = name, arg2 = value
%macro gint 2
    cglobal %1
    sint %1, {%2}
%endmacro

;; static (local) int -> arg1 = name, arg2 = value
%macro sint 2
    %ifidni %2,0
        [section .bss]
        %1 resd 1
        __SECT__
    %else
        [section .data]
        %1 dd %2
        __SECT__
    %endif
%endmacro

;; global int array -> arg1 = name, arg2 = value, arg3 = length
%macro gint 3
    cglobal %1
    sint %1, {%2}, %3
%endmacro

;; global int fixed array -> arg1 = name, arg2-argX = values
%macro gintarr 2+
    cglobal %1
    [section .data]
    %1 dd %2
    __SECT__
%endmacro

;; static (local) int array -> arg1 = name, arg2 = value, arg3 = length
%macro sint 3
    %ifidni %2,0
        [section .bss]
        %1 resd %3
        __SECT__
    %else
        [section .data]
        %1 times %3 dd %2
        __SECT__
    %endif
%endmacro

;; global short -> arg1 = name
%macro gshort 1
    gshort %1, {0}
%endmacro

;; global short -> arg1 = name, arg2 = value
%macro gshort 2
    cglobal %1
    sshort %1, {%2}
%endmacro

;; static (local) short -> arg1 = name, arg2 = value
%macro sshort 2
    %ifidni %2,0
        [section .bss]
        %1 resw 1
        __SECT__
    %else
        [section .data]
        %1 dw %2
        __SECT__
    %endif
%endmacro

;; global short array -> arg1 = name, arg2 = value, arg3 = length
%macro gshort 3
    cglobal %1
    sshort %1, {%2}, %3
%endmacro

;; static (local) short array -> arg1 = name, arg2 = value, arg3 = length
%macro sshort 3
    %ifidni %2,0
        [section .bss]
        %1 resw %3
        __SECT__
    %else
        [section .data]
        %1 times %3 dw %2
        __SECT__
    %endif
%endmacro

;; global short fixed array -> arg1 = name, arg2-argX = values
%macro gshortarr 2+
    cglobal %1
    [section .data]
    %1 dw %2
    __SECT__
%endmacro

;; global bool -> arg1 = name
%macro gbool 1
    gbyte %1, {0}
%endmacro

;; global bool -> arg1 = name, arg2 = value
%macro gbool 2
    cglobal %1
    sbyte %1, {%2}
%endmacro

;; static (local) bool -> arg1 = name, arg2 = value
%macro sbool 2
    sbyte %1, {%2}
%endmacro

;; global bool array -> arg1 = name, arg2 = value, arg3 = length
%macro gbool 3
    cglobal %1
    sbyte %1, {%2}, %3
%endmacro

;; static (local) bool array -> arg1 = name, arg2 = value, arg3 = length
%macro sbool 3
    sbyte %1, {%2}, %3
%endmacro

;; global byte -> arg1 = name
%macro gbyte 1
    gbyte %1, {0}
%endmacro

;; global byte -> arg1 = name, arg2 = value
%macro gbyte 2
    cglobal %1
    sbyte %1, {%2}
%endmacro

;; static (local) byte -> arg1 = name, arg2 = value
%macro sbyte 2
    %ifidni %2,0
        [section .bss]
        %1 resb 1
        __SECT__
    %else
        [section .data]
        %1 db %2
        __SECT__
    %endif
%endmacro

;; global byte array -> arg1 = name, arg2 = value, arg3 = length
%macro gbyte 3
    cglobal %1
    sbyte %1, {%2}, %3
%endmacro

;; global byte fixed array -> arg1 = name, arg2-argX = values
%macro gbytearr 2+
    cglobal %1
    [section .data]
    %1 db %2
    __SECT__
%endmacro

;; static (local) byte array -> arg1 = name, arg2 = value, arg3 = length
%macro sbyte 3
    %ifidni %2,0
        [section .bss]
        %1 resb %3
        __SECT__
    %else
        [section .data]
        %1 times %3 db %2
        __SECT__
    %endif
%endmacro

;; global function -> arg1 = name
%macro gfunction 1
    cglobal %1
    sfunction %1
%endmacro

;; static (local) function -> arg1 = name
%macro sfunction 1
    [section .text]
    align 16, db 0xCC
    %1:
%endmacro

;; global file (const byte array) -> arg1 = name, arg2 = filePath
%macro gfile 2
    cglobal %1
    cglobal %1Length
    sfile %1, %2
%endmacro

;; static (local) file (const byte array) -> arg1 = name, arg2 = filePath
%macro sfile 2
    [section .rdata]
    %1 incbin %2
    %1Length dd $-%1
    __SECT__
%endmacro

;; global enum -> arg1 = enum type, arg2 = enum name, arg3 = (byte) value
;; generates the following:
;;    enum values (starting from 0) - accessed via %name%.$enum%
;;    enum strings - accessed via str.%name%.$enum%
%macro gbyteenum 3
    %defstr __STRNAME__ %2
    cglobal %1.%2
    %1.%2 db %3
    gstring str.%1.%2,__STRNAME__
%endmacro