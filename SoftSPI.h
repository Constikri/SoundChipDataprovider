/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef _EXAMPLE_FILE_NAME_H    /* Guard against multiple inclusion */
#define _EXAMPLE_FILE_NAME_H

#include <xc.h>
#include <stdbool.h> 

/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

/*
 0011|1100|0000|0000
 */
typedef enum{
    PIN_RB10 = 0x04,
    PIN_RB11 = 0x08,
    PIN_RB12 = 0x10,
    PIN_RB13 = 0x20
}SPI_PIN;

typedef enum{
    SPI_CLOCK_DIV2 = 2,
    SPI_CLOCK_DIV3 = 3,
    SPI_CLOCK_DIV4 = 4,
    SPI_CLOCK_DIV8 = 8,
    SPI_CLOCK_DIV16 = 16,
    SPI_CLOCK_DIV32 = 32,
    SPI_CLOCK_DIV64 = 64,
    SPI_CLOCK_DIV128 = 128,
    SPI_CLOCK_DIV320 = 320,
}SPI_CLOCK_DIV;

typedef enum{
    SPI_MODE0,
    SPI_MODE1,
    SPI_MODE2,
    SPI_MODE3
}SPI_MODE;
    
#define MSBFIRST 1
#define LSBFIRST 0
#define PINMOSI PIN_RB11
#define PINMISO PIN_RB10
#define PINSCK PIN_RB12
#define PINCS PIN_RB13

#if !defined(INPUT)
#define INPUT	1
#endif

#if !defined(OUTPUT)	
#define OUTPUT 	0
#endif

#if !defined(LOW)
#define LOW 	0
#endif

#if !defined(HIGH)
#define HIGH 	1
#endif

struct SoftSPI{
    uint8_t cke;
    uint8_t ckp;
    uint16_t delay;
    uint8_t miso;
    uint8_t mosi;
    uint8_t sck;
    uint8_t order;
};

static inline void pinMode(SPI_PIN pin, bool mode)
{
    switch(mode)
    {
        case INPUT:
            *(volatile uint32_t *)(&TRISBSET) = pin << 8;
            break;
        case OUTPUT:
            *(volatile uint32_t *)(&TRISBCLR) = pin << 8;
            break;
    }
}

static inline void digitalWrite(SPI_PIN pin, bool value)
{
    switch(value)
    {
        case HIGH:
            *(volatile uint32_t *)(&LATBSET) = pin << 8;
            break;
        case LOW:
            *(volatile uint32_t *)(&LATBCLR) = pin << 8;
            break;
    }
}
static inline bool digitalRead(SPI_PIN pin)
{
    pin = pin << 8;
    return (bool)((*(volatile uint32_t *)(&PORTB) & (uint32_t)pin) >> pin);
}

void SoftSPI_begin();
void SoftSPI_end();
void SoftSPI_setBitOrder(uint8_t);
void SoftSPI_setDataMode(uint8_t);
void SoftSPI_setClockDivider(uint16_t);
void wait(uint_fast16_t del);
uint_fast16_t baud_to_clock_div(int baudrate);
uint8_t SoftSPI_transfer(uint8_t);
uint16_t SoftSPI_transfer16(uint16_t data);


    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _EXAMPLE_FILE_NAME_H */

/* *****************************************************************************
 End of File
 */
