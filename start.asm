extern kmain
global start

MB_MAGIC equ 0x1BADB002
MB_FLAGS equ (1<<0) | (1<<1) | (1<<2)
MB_CHECK equ -(MB_MAGIC + MB_FLAGS)
MB_HADDR equ 0
MB_LADDR equ 0
MB_LEADR equ 0
MB_BEADR equ 0
MB_ENTRY equ 0
MB_MTYPE equ 0
MB_RESLX equ 640
MB_RESLY equ 480
MB_DEPTH equ 32

section .multiboot
  dd MB_MAGIC
  dd MB_FLAGS
  dd MB_CHECK
  dd MB_HADDR
  dd MB_LADDR
  dd MB_LEADR
  dd MB_BEADR
  dd MB_ENTRY
  dd MB_MTYPE
  dd MB_RESLX
  dd MB_RESLY
  dd MB_DEPTH

section .bss
stack_bottom:
    resb 16384
stack_top:

section .text
start:
    mov esp, stack_top
    
    push ebx
    call kmain

    cli
    hlt

