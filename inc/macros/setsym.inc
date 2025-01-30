; for C
%macro setcglob 2
    global %2
    %2 equ %1
%endmacro

; for c++
%macro setxglob 2
    global %2
    %2 equ %1
%endmacro