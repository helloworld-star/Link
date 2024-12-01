SRCS += $(LINK)/start.S

LDFLAGS += -nostartfiles

LDFLAGS += -T $(LINK)/linker.ld
LDFLAGS += -Wl,--defsym=_pmem_start=0x80000000 -Wl,--defsym=_entry_offset=0x0
LDFLAGS += -Wl,--gc-sections -e _start
#LDFLAGS += -nostdlib
