include $(LINK)/link.mk

SRCS += $(wildcard $(abspath ./src/*.c))

OUTPUT_DIR = build

CFLAGS += -ffunction-sections -fdata-sections -march=rv64g -mabi=lp64d -g
CFLAGS += -mcmodel=medany

all: $(OUTPUT_DIR)/program.elf

$(OUTPUT_DIR)/program.elf:
	mkdir -p $(OUTPUT_DIR)
	riscv64-unknown-elf-gcc -static $(CFLAGS) $(SRCS) $(LDFLAGS) $(CFLAGS) -o $@

test:
	qemu-system-riscv64 -machine virt -nographic -serial mon:stdio -kernel $(OUTPUT_DIR)/program.elf \
	-gdb tcp::1234 -bios none -S

run:
	qemu-system-riscv64 -machine virt -nographic -serial mon:stdio -kernel $(OUTPUT_DIR)/program.elf \
	-gdb tcp::1234 -bios none -S

gdb:
	riscv64-unknown-elf-gdb -x .gdbinit $(OUTPUT_DIR)/program.elf

obj:
	riscv64-unknown-elf-objdump -d program.elf > $(OUTPUT_DIR)/program.txt   

clean:
	rm -f $(OUTPUT_DIR)/*.txt $(OUTPUT_DIR)/*.o $(OUTPUT_DIR)/*.elf