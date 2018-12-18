target ?= kernel.bin

asm_sources := $(shell find . -name '*.asm')
d_sources := $(shell find . -name '*.d')

asm_objects := $(patsubst %.asm, %.o, $(asm_sources))
d_objects := $(patsubst %.d, %.o, $(d_sources))

all: $(target) clean

clean:
	@rm -rf $(asm_objects) $(d_objects)

$(target): $(d_objects) $(asm_objects)
	@i386-elf-ld -nostdlib -nostartfiles -Tlinker.ld -n $(d_objects) $(asm_objects) -o $(target)

%.o: %.d
	@ldc2 -c $< -mtriple=i386-elf -relocation-model=static -code-model=kernel -mattr=sse,sse2 -betterC -op

%.o: %.asm
	@nasm -felf $< -o $@
