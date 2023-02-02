#ifndef _SOFT_SPI_H    /* Guard against multiple inclusion */
#define _SOFT_SPI_H

#include <xc.h>
#include <stdbool.h> 

/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

/*
 0011|1100|0011|1100
 */
typedef enum{
    PIN_RB2 = 0x0004,
    PIN_RB3 = 0x0008,
    PIN_RB4 = 0x0010,
    PIN_RB5 = 0x0020,
    PIN_RB10 = 0x0400,
    PIN_RB11 = 0x0800,
    PIN_RB12 = 0x1000,
    PIN_RB13 = 0x2000
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
#define PINMOSI_FPGA PIN_RB2
#define PINMISO_FPGA PIN_RB3
#define PINSCK_FPGA PIN_RB4
#define PINCS_FPGA PIN_RB5
#define PINMOSI_SD PIN_RB11
#define PINMISO_SD PIN_RB10
#define PINSCK_SD PIN_RB12
#define PINCS_SD PIN_RB13

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
    uint16_t miso;
    uint16_t mosi;
    uint16_t sck;
    uint8_t order;
};

typedef struct SoftSPI SOFTSPI;

static inline void pinMode(SPI_PIN pin, bool mode)
{
    switch(mode)
    {
        case INPUT:
            *(volatile uint32_t *)(&TRISBSET) = pin;
            break;
        case OUTPUT:
            *(volatile uint32_t *)(&TRISBCLR) = pin;
            break;
    }
}

static inline void digitalWrite(SPI_PIN pin, bool value)
{
    switch(value)
    {
        case HIGH:
            *(volatile uint32_t *)(&LATBSET) = pin;
            break;
        case LOW:
            *(volatile uint32_t *)(&LATBCLR) = pin;
            break;
    }
}
static inline bool digitalRead(SPI_PIN pin)
{
    return (bool)((*(volatile uint32_t *)(&PORTB) & (uint32_t)pin) >> pin);
}

void SoftSPI_begin(SOFTSPI *spi);
void SoftSPI_end(SOFTSPI *spi);
void SoftSPI_setBitOrder(SOFTSPI *spi, uint8_t);
void SoftSPI_setDataMode(SOFTSPI *spi, uint8_t);
void SoftSPI_setClockDivider(SOFTSPI *spi, uint16_t);
void wait(uint_fast16_t del);
uint_fast16_t baud_to_clock_div(int baudrate);
uint8_t SoftSPI_transfer(SOFTSPI *spi, uint8_t);
uint16_t SoftSPI_transfer16(SOFTSPI *spi, uint16_t data);
uint32_t SoftSPI_transfer32(SOFTSPI *spi, uint32_t data);


    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _SOFT_SPI_H */


