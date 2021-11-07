.PHONY: boot
boot: bin/zeos.bin
	qemu-system-x86_64 bin/zeos.bin -nographic

.PHONY: build
build: bin/zeos.bin

.PHONY: clean
clean:
	rm -rf bin
	mkdir bin
	touch bin/.gitkeep

bin/zeos.o: src/hello_world.s
	as -o bin/zeos.o src/hello_world.s

bin/zeos.bin: bin/zeos.o
	ld -o bin/zeos.bin --oformat binary -e entrypoint -Ttext 0x7c00 bin/zeos.o