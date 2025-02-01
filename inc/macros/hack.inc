;; requires that "macros/patch.inc" also be included, for @LJMP support

;; aligns a patch, and adds the long jump needed to get there
;; also adds a context for hack-local labels
;;
;; 2 argument variant:
;; arg1 : address where the long jump will take place
;; arg2 : name of patch (for ease of debugging)
;;
;; 3 argument variant:
;; arg1 : address where the long jump will take place
;; arg2 : address to clear to (exclusive). Typically this is the start of the first instruction you do not want to override.
;; arg3 : name of patch (for ease of debugging)
;;
%define __hack_label "NULL"

%macro @HACK 2
    %ifctx __hack2
        %error "nesting `@HACK(2)' is not allowed" (%2) (existing=__hack_label)
    %else
        %push __hack2
        %define __hack_label %2

        %$begin equ %1

        @LJMP {(%1)}, {(%2)}
        [section .text]
        align 16, db 0xCC
        %2:
    %endif
%endmacro

%macro @HACK 3
    %ifctx __hack3
        %error "nesting `@HACK(3)' is not allowed" (%3) (existing=__hack_label)
    %elifctx __hack2
        %error "nesting `@HACK(3)' in `@HACK(2)' is not allowed" (%3) (existing=__hack_label)
    %else
        %push __hack3
        %define __hack_label %3

        %if %2 - ((%1) + 5) < 0
            %error "end must be at least 5 bytes after start" (%3)
        %endif

        %if %2 - ((%1) + 5)> 0
            @CLEAR {(%1) + 5}, 0xCC, {(%2)}
        %endif
        @HACK {(%1)}, {%3}

        %$end equ %2
    %endif
%endmacro

%macro @ENDHACK 0
    %ifctx __hack2
        align 16, db 0xCC
        __SECT__
        %pop
        %ifctx __hack3
            %pop
        %endif
    %else
        %error "no corrosponding `@HACK'"
    %endif
    %define __hack_label "NULL"
%endmacro