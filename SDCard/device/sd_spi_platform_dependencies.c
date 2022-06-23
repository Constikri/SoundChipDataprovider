#include "sd_spi_platform_dependencies.h"
#include "../../SoftSPI.h"
#include "../../millis.h"

void
sd_spi_pin_mode(
	uint8_t pin,
	uint8_t mode
)
{
    pinMode(pin,mode);
}

void
sd_spi_digital_write(
	uint8_t pin,
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
    SoftSPI_begin();
}

void
sd_spi_begin_transaction(
	uint32_t transfer_speed_hz
)
{
    SoftSPI_setClockDivider((uint16_t)baud_to_clock_div(transfer_speed_hz));
}

void
sd_spi_end_transaction(
	void
)
{
    SoftSPI_end();
}

void
sd_spi_send_byte(
	uint8_t b
)
{
    SoftSPI_transfer(b);
}

uint8_t
sd_spi_receive_byte(
	void
)
{
    return SoftSPI_transfer(0xff);
}