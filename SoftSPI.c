#include "SoftSPI.h"

void SoftSPI_begin(SOFTSPI *spi) {
    *(volatile uint32_t *)(&AD1PCFGSET) = 0xffff;
    pinMode(spi->mosi, OUTPUT);
    pinMode(spi->miso, INPUT);
    pinMode(spi->sck, OUTPUT);
}

void SoftSPI_end(SOFTSPI *spi) {
    pinMode(spi->mosi, INPUT);
    pinMode(spi->miso, INPUT);
    pinMode(spi->sck, INPUT);
}

void SoftSPI_setBitOrder(SOFTSPI *spi, uint8_t order) {
    spi->order = order & 1;
}

void SoftSPI_setDataMode(SOFTSPI *spi, uint8_t mode) {
    switch (mode) {
        case SPI_MODE0:
            spi->ckp = 0;
            spi->cke = 0;
            break;
        case SPI_MODE1:
            spi->ckp = 0;
            spi->cke = 1;
            break;
        case SPI_MODE2:
            spi->ckp = 1;
            spi->cke = 0;
            break;
        case SPI_MODE3:
            spi->ckp = 1;
            spi->cke = 1;
            break;
    }

    digitalWrite(spi->sck, spi->ckp ? HIGH : LOW);
}

void SoftSPI_setClockDivider(SOFTSPI *spi ,uint16_t div) {
    switch (div) {
        case SPI_CLOCK_DIV2:
            spi->delay = 2;
            break;
        case SPI_CLOCK_DIV3:
            spi->delay = 3;
            break;
        case SPI_CLOCK_DIV4:
            spi->delay = 4;
            break;
        case SPI_CLOCK_DIV8:
            spi->delay = 8;
            break;
        case SPI_CLOCK_DIV16:
            spi->delay = 16;
            break;
        case SPI_CLOCK_DIV32:
            spi->delay = 32;
            break;
        case SPI_CLOCK_DIV64:
            spi->delay = 64;
            break;
        case SPI_CLOCK_DIV128:
            spi->delay = 128;
            break;
        case SPI_CLOCK_DIV320:
            spi->delay = 320;
            break;
        default:
            spi->delay = 128;
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

uint8_t SoftSPI_transfer(SOFTSPI *spi, uint8_t val) {
    uint8_t out = 0;
    if (spi->order == MSBFIRST) {
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

    uint16_t del = spi->delay >> 1;

    uint8_t bval = 0;
    /*
     * CPOL := 0, CPHA := 0 => INIT = 0, PRE = Z|0, MID = 1, POST =  0
     * CPOL := 1, CPHA := 0 => INIT = 1, PRE = Z|1, MID = 0, POST =  1
     * CPOL := 0, CPHA := 1 => INIT = 0, PRE =  1 , MID = 0, POST = Z|0
     * CPOL := 1, CPHA := 1 => INIT = 1, PRE =  0 , MID = 1, POST = Z|1
     */

    int sck = (spi->ckp) ? HIGH : LOW;

    for (uint8_t bit = 0u; bit < 8u; bit++)
    {
        if (spi->cke) {
            sck ^= 1;
            digitalWrite(spi->sck, sck);            
            wait(del);
        }

        /* ->->-> Write bit */
        digitalWrite(spi->mosi, ((val & (1<<bit)) ? HIGH : LOW));

        wait(del);

        sck ^= 1u; digitalWrite(spi->sck, sck);

        /* ->->-> Read bit */
        {
            bval = digitalRead(spi->miso);

            if (spi->order == MSBFIRST) {
                out <<= 1;
                out |= bval;
            } else {
                out >>= 1;
                out |= bval << 7;
            }
        }

        wait(del);

        if (!spi->cke) {
            sck ^= 1u;
            digitalWrite(spi->sck, sck);
        }
    }

    return out;
}

uint16_t SoftSPI_transfer16(SOFTSPI *spi, uint16_t data)
{
	union {
		uint16_t val;
		struct {
			uint8_t lsb;
			uint8_t msb;
		};
	} in, out;
  
	in.val = data;

	if ( spi->order == MSBFIRST ) {
		out.msb = SoftSPI_transfer(spi,in.msb);
		out.lsb = SoftSPI_transfer(spi,in.lsb);
	} else {
		out.lsb = SoftSPI_transfer(spi,in.lsb);
		out.msb = SoftSPI_transfer(spi,in.msb);
	}

	return out.val;
}

uint32_t SoftSPI_transfer32(SOFTSPI *spi, uint32_t data)
{
	union {
		uint32_t val;
		struct {
			uint8_t b0; //lsb
            uint8_t b1;
			uint8_t b2;
			uint8_t b3; //msb
		};
	} in, out;
  
	in.val = data;

	if ( spi->order == MSBFIRST ) {
		out.b3 = SoftSPI_transfer(spi,in.b3);
		out.b2 = SoftSPI_transfer(spi,in.b2);
        out.b1 = SoftSPI_transfer(spi,in.b1);
		out.b0 = SoftSPI_transfer(spi,in.b0);
	} else {
		out.b0 = SoftSPI_transfer(spi,in.b0);
		out.b1 = SoftSPI_transfer(spi,in.b1);
        out.b2 = SoftSPI_transfer(spi,in.b2);
		out.b3 = SoftSPI_transfer(spi,in.b3);
	}

	return out.val;
}
