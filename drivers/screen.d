module drivers.screen;

import drivers.vbe;

struct Screen {
    uint w, h;
    uint x, y;
    uint pitch;
    uint* framebuffer;

    this(VbeMode* mode) {
        this.w = mode.width;
        this.h = mode.height;
        this.pitch = mode.pitch;
        this.framebuffer = cast(uint*)mode.framebuffer;
    }

    void putPixel(uint x, uint y, uint colour) {
        this.framebuffer[y * w + x] = colour;
    }

    void drawChar(char c, int x, int y, int fg, int bg) {
        extern(C) extern __gshared ushort* cp437;
        int orig_x = x;

        for (int i = 0; i < 16; i++) {
            for (int j = 0; j < 8; j++) {
                if((cp437[c * 16 + i] >> (7 - j)) & 1) {
                    this.putPixel(x++, y, fg);
                } else {
                    this.putPixel(x++, y, bg);
                }
            }
            y++;
            x = orig_x;
        }
    }

    void clear(uint colour) {
        for (uint i = 0; i < (w * h); i++) {
            framebuffer[i] = colour;
        }
    }
}

