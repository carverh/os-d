module main;

import drivers.vbe;
import drivers.mboot;
import drivers.screen;

extern(C) void kmain(mboot_info* mbinfo) {
    auto scr = screen(cast(vbe_mode*)mbinfo.vbe_mode_info);
    scr.clear(0xffffffff);
    for (int i = 0; i < 500; i++) {
        scr.put_pixel(i, 0, 0x00000000);
    }
}
