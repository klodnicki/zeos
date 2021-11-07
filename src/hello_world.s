.code16

.global entrypoint
entrypoint:
  mov $helloworldascii, %si
  mov $0xe, %ah
print_char:
  lodsb
  cmp $0, %al
  je done 
  int $0x10
  jmp print_char
done:
  hlt


#  mov $0x0e, %ah
#  mov $helloworldascii, %bx
#  mov (%bx), %al
#  int $0x10
#  hlt

helloworldascii: .asciz "Hello, World!\r\n"

.fill 510-(.-entrypoint), 1, 0 # Pad out to byte 510 with 0s
.word 0xaa55 # Magic packet to tell BIOS this is bootable
