include ../rv32emu/mk/toolchain.mk

ARCH = -march=rv32izicsr
LINKER_SCRIPT = linker.ld

EMU ?= ../rv32emu/build/rv32emu
CFLAGS = -g -march=rv32i_zicsr -Ofast
AFLAGS = -g $(ARCH)

LDFLAGS = -T $(LINKER_SCRIPT) -lgcc -nostartfiles
EXEC = test.elf

CC = $(CROSS_COMPILE)gcc
AS = $(CROSS_COMPILE)as
LD = $(CROSS_COMPILE)gcc
OBJDUMP = $(CROSS_COMPILE)objdump

OBJS = start.o perfcounter.o hw1.o sine_approx.o my_main.o

.PHONY: all run dump clean

all: $(EXEC)

$(EXEC): $(OBJS) $(LINKER_SCRIPT)
	$(LD) $(LDFLAGS) -o $@ $(OBJS)

%.o: %.S
	$(AS) $(AFLAGS) $< -o $@

%.o: %.c
	$(CC) $(CFLAGS) $< -o $@ -c

run: $(EXEC)
	@test -f $(EMU) || (echo "Error: $(EMU) not found" && exit 1)
	@grep -q "ENABLE_SYSTEM=1" ../rv32emu/build/.config || (echo "Error: ENABLE_SYSTEM=1 not set" && false)
	@grep -q "ENABLE_ELF_LOADER=1" ../rv32emu/build/.config || (echo "Error: ENABLE_ELF_LOADER=1 not set" && false)
	$(EMU) $<

dump: $(EXEC)
	$(OBJDUMP) -Ds $< | less

clean:
	rm -f $(EXEC) $(OBJS)
