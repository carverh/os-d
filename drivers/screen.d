module drivers.screen;

import drivers.vbe;

struct screen {
    uint w, h;
    uint x, y;
    uint pitch;
    uint* framebuffer;

    this(vbe_mode* mode) {
        this.w = mode.width;
        this.h = mode.height;
        this.pitch = mode.pitch;
        this.framebuffer = cast(uint*)mode.framebuffer;
    }

    void put_pixel(uint x, uint y, uint colour) {
        this.framebuffer[y * w + x] = colour;
    }

    void clear(uint colour) {
        for (uint i = 0; i < (w * h); i++) {
            framebuffer[i] = colour;
        }
    }
}
