#include "sd_spi_platform_dependencies.h"
#include "../../SoftSPI.h"
#include "../../millis.h"

SOFTSPI sdspi = {
    .mosi = PINMOSI_SD,
    .miso = PINMISO_SD,
    .sck = PINSCK_SD,
    .delay = 2,
    .cke = 0,
    .ckp = 0,
    .order = MSBFIRST,
};

void
sd_spi_pin_mode(
	uint16_t pin,
	uint8_t mode
)
{
    pinMode(pin,mode);
}

void
sd_spi_digital_write(
	uint16_t pin,
	uint8_t state
)
{
    digitalWrite(pin,state);
}

uint32_t
sd_spi_millis(
	void
)
{
    return millis();
}

void
sd_spi_begin(
	void
)
{
    SoftSPI_begin(&sdspi);
}

void
sd_spi_begin_transaction(
	uint32_t transfer_speed_hz
)
{
    SoftSPI_setClockDivider(&sdspi, (uint16_t)baud_to_clock_div(transfer_speed_hz));
}

void
sd_spi_end_transaction(
	void
)
{
    //SoftSPI_end();
}

void
sd_spi_send_byte(
	uint8_t b
)
{
    SoftSPI_transfer(&sdspi, b);
}

uint8_t
sd_spi_receive_byte(
	void
)
{
    return SoftSPI_transfer(&sdspi, 0xff);
}