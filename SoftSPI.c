/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.c

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */


#include "SoftSPI.h"

//TODO: check cke,ckp,order if compatible
struct SoftSPI Sspi = {
    .mosi = PINMOSI,
    .miso = PINMISO,
    .sck = PINSCK,
    .delay = 2,
    .cke = 0,
    .ckp = 0,
    .order = MSBFIRST,
};

void SoftSPI_begin() {
    *(volatile uint32_t *)(&AD1PCFGSET) = 0x3C00;
    pinMode(Sspi.mosi, OUTPUT);
    pinMode(Sspi.miso, INPUT);
    pinMode(Sspi.sck, OUTPUT);
}

void SoftSPI_end() {
    pinMode(Sspi.mosi, INPUT);
    pinMode(Sspi.miso, INPUT);
    pinMode(Sspi.sck, INPUT);
}

void SoftSPI_setBitOrder(uint8_t order) {
    Sspi.order = order & 1;
}

void SoftSPI_setDataMode(uint8_t mode) {
    switch (mode) {
        case SPI_MODE0:
            Sspi.ckp = 0;
            Sspi.cke = 0;
            break;
        case SPI_MODE1:
            Sspi.ckp = 0;
            Sspi.cke = 1;
            break;
        case SPI_MODE2:
            Sspi.ckp = 1;
            Sspi.cke = 0;
            break;
        case SPI_MODE3:
            Sspi.ckp = 1;
            Sspi.cke = 1;
            break;
    }

    digitalWrite(Sspi.sck, Sspi.ckp ? HIGH : LOW);
}

void SoftSPI_setClockDivider(uint16_t div) {
    switch (div) {
        case SPI_CLOCK_DIV2:
            Sspi.delay = 2;
            break;
        case SPI_CLOCK_DIV3:
            Sspi.delay = 3;
            break;
        case SPI_CLOCK_DIV4:
            Sspi.delay = 4;
            break;
        case SPI_CLOCK_DIV8:
            Sspi.delay = 8;
            break;
        case SPI_CLOCK_DIV16:
            Sspi.delay = 16;
            break;
        case SPI_CLOCK_DIV32:
            Sspi.delay = 32;
            break;
        case SPI_CLOCK_DIV64:
            Sspi.delay = 64;
            break;
        case SPI_CLOCK_DIV128:
            Sspi.delay = 128;
            break;
        case SPI_CLOCK_DIV320:
            Sspi.delay = 320;
            break;
        default:
            Sspi.delay = 128;
            break;
    }
}

uint_fast16_t baud_to_clock_div(int baudrate){
    return (uint_fast16_t)(80000000u/baudrate);
}

void wait(uint_fast16_t del) {
    for (uint_fast16_t i = 0; i < del; i++) {
        asm volatile("nop");
    }
}

uint8_t SoftSPI_transfer(uint8_t val) {
    uint8_t out = 0;
    if (Sspi.order == MSBFIRST) {
        uint8_t v2 = 
            ((val & 0x01) << 7) |
            ((val & 0x02) << 5) |
            ((val & 0x04) << 3) |
            ((val & 0x08) << 1) |
            ((val & 0x10) >> 1) |
            ((val & 0x20) >> 3) |
            ((val & 0x40) >> 5) |
            ((val & 0x80) >> 7);
        val = v2;
    }

    uint16_t del = Sspi.delay >> 1;

    uint8_t bval = 0;
    /*
     * CPOL := 0, CPHA := 0 => INIT = 0, PRE = Z|0, MID = 1, POST =  0
     * CPOL := 1, CPHA := 0 => INIT = 1, PRE = Z|1, MID = 0, POST =  1
     * CPOL := 0, CPHA := 1 => INIT = 0, PRE =  1 , MID = 0, POST = Z|0
     * CPOL := 1, CPHA := 1 => INIT = 1, PRE =  0 , MID = 1, POST = Z|1
     */

    int sck = (Sspi.ckp) ? HIGH : LOW;

    for (uint8_t bit = 0u; bit < 8u; bit++)
    {
        if (Sspi.cke) {
            sck ^= 1;
            digitalWrite(Sspi.sck, sck);            
            wait(del);
        }

        /* ... Write bit */
        digitalWrite(Sspi.mosi, ((val & (1<<bit)) ? HIGH : LOW));

        wait(del);

        sck ^= 1u; digitalWrite(Sspi.sck, sck);

        /* ... Read bit */
        {
            bval = digitalRead(Sspi.miso);

            if (Sspi.order == MSBFIRST) {
                out <<= 1;
                out |= bval;
            } else {
                out >>= 1;
                out |= bval << 7;
            }
        }

        wait(del);

        if (!Sspi.cke) {
            sck ^= 1u;
            digitalWrite(Sspi.sck, sck);
        }
    }

    return out;
}

uint16_t SoftSPI_transfer16(uint16_t data)
{
	union {
		uint16_t val;
		struct {
			uint8_t lsb;
			uint8_t msb;
		};
	} in, out;
  
	in.val = data;

	if ( Sspi.order == MSBFIRST ) {
		out.msb = SoftSPI_transfer(in.msb);
		out.lsb = SoftSPI_transfer(in.lsb);
	} else {
		out.lsb = SoftSPI_transfer(in.lsb);
		out.msb = SoftSPI_transfer(in.msb);
	}

	return out.val;
}
