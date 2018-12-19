module drivers.vbe;

struct VbeMode {
  align(1):
    ushort attributes;
    ubyte window_a;
    ubyte window_b;
    ushort granularity;
    ushort window_size;
    ushort segment_a;
    ushort segment_b;
    uint win_func_ptr;

    ushort pitch;
    ushort width;
    ushort height;

    ubyte w_char;
    ubyte y_char;
    ubyte planes;
    ubyte bpp;
    ubyte banks;

    ubyte memory_model;
    ubyte bank_size;
    ubyte image_pages;
    ubyte reserved0;

    ushort red;
    ushort green;
    ushort blue;
    ushort reserved_mask;
    ubyte direct_color;

    uint framebuffer;
    uint off_screen_mem;
    uint off_screen_mem_size;

    ubyte[206] reserved;
}
