module drivers.mboot;

struct mboot_aout_symbol_table
{
  align(1):
    uint tabsize;
    uint strsize;
    uint addr;
    uint reserved;
}

struct mboot_elf_section_header_table
{
  align(1):
     uint num;
     uint size;
     uint addr;
     uint shndx;
}

struct mboot_info {
  align(1):
    uint flags;
    uint mem_lower;
    uint mem_upper;
    uint boot_device;
    uint cmdline;
    uint mods_count;
    uint mod_addr;
    union {
        mboot_aout_symbol_table aout_sym;
        mboot_elf_section_header_table elf_spec;
    }
    uint mmap_len;
    uint mmap_addr;

    uint drives_length;
    uint drives_addr;

    uint config_table;
    uint boot_loader_name;
    uint apm_table;
    
    uint vbe_control_info;
    uint vbe_mode_info;
    uint vbe_mode;
    uint vbe_interface_seg;
    uint vbe_interface_off;
    uint vbe_interface_len;
}
