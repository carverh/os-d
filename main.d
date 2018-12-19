module main;

import drivers.vbe;
import drivers.mboot;
import drivers.screen;

extern(C) void kmain(mboot_info* mbinfo) {
    auto scr = screen(cast(vbe_mode*)mbinfo.vbe_mode_info);
    scr.clear(0xffffffff);
    scr.draw_char('a', 0, 0, 0xffffffff, 0x00000000);
}
