/* GNU ld linker script for ra95.dat */

_start = 0x5D6148; /* entry */

OUTPUT_FORMAT(pei-i386)
ENTRY(_start);
SECTIONS
{
    .text             0x401000 : { ra95.dat(AUTO) }
    .idata            0x5E6000 : { ra95.dat(.idata) }
    .data             0x5E8000 : { ra95.dat(DGROUP) }
    .bss              0x623000 : { ra95.dat(.bss) }
    /DISCARD/                  : { ra95.dat(.edata) }
    /DISCARD/                  : { ra95.dat(.reloc) }
    /DISCARD/                  : { *(.drectve) }
    /DISCARD/                  : { *(.rdata$zzz) }
    .p_text      ALIGN(0x1000) : { *(.text) }
    .p_rdata     ALIGN(0x1000) : { *(.rdata) }
    .p_data      ALIGN(0x1000) : { *(.data) }
    .p_bss       ALIGN(0x1000) : { *(.bss) *(COMMON) }
    .rsrc        ALIGN(0x1000) : { *(.rsrc) }
    .patch       ALIGN(0x1000) : { *(.patch) }
}

