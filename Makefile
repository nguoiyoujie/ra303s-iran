#-include config.mk

INPUT       = ra95.dat
OUTPUT      = ra95_build.exe
LDS         = patch.lds

LDFLAGS     = --subsystem windows 
#LDFLAGS    += --major-os-version 1 
#LDFLAGS    += --minor-os-version 11 
LDFLAGS    += --disable-reloc-section 
LDFLAGS    += --file-alignment=0x200 
LDFLAGS    += --section-alignment=0x1000 
LDFLAGS    += --enable-stdcall-fixup 
#LDFLAGS    += --verbose
LDFLAGS    += -nostdlib

NFLAGS      = -Iinc/ -f elf
#CFLAGS      = -std=c99 -Iinc/

OBJS        = res/res.o
OBJS       += sym.o
OBJS       += strings.o
OBJS       += data.o
OBJS       += src/features/hires/_hires.o
OBJS       += src/features/prerequisitesystem/_prerequisite_system.o
OBJS       += src/features/specialweapons/_specialweapons.o
OBJS       += src/features/newtypes/_new_types.o
OBJS       += src/main.o

PETOOL      = petool
NASM        = nasm
STRIP       = strip
WINDRES     = windres

all: $(OUTPUT)

rsrc.o: $(INPUT)
	$(PETOOL) re2obj $(INPUT) $@

%.o: %.asm
	$(NASM) $(NFLAGS) -o $@ $<

%.o: %.rc
	$(WINDRES) $(WFLAGS) $< $@

$(OUTPUT): $(LDS) $(INPUT) $(OBJS)
	$(LD) $(LDFLAGS) -T $(LDS) -o $@ $(OBJS)
	$(PETOOL) setsc $@ .text 0xE0000020 || ($(RM) $@ && exit 1)
	$(PETOOL) patch $@ || ($(RM) $@ && exit 1)
	sleep 1
	$(STRIP) -R .patch $@ || ($(RM) $@ && exit 1)
	sleep 1
	$(PETOOL) setsc $@ .p_text 0xE0000020 || ($(RM) $@ && exit 1)
	$(PETOOL) setsc $@ .p_rdata 0xE0000020 || ($(RM) $@ && exit 1)
	$(PETOOL) dump $@
	$(RM) $(OBJS)

clean:
	$(RM) $(OUTPUT) $(OBJS)
