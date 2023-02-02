/* ************************************************************************** */
/**
  @File Name
    main.c

  @Summary
    Main routine of the programm

  @Description
    This file initialises all component and runs the main loop of the program, which reads data from a SD card and send it off to a SoftSPI connection
 */
/* ************************************************************************** */

// DEVCFG3
// USERID = No Setting
#pragma config FSRSSEL = PRIORITY_7 // Shadow Register Set Priority 7
#pragma config FUSBIDIO = ON // USB USID Selection - Port Function
#pragma config FVBUSONIO = ON // USB VBUS ON Selection - Port Function
#pragma config FMIIEN = OFF
#pragma config FETHIO = OFF
#pragma config FCANIO = OFF
// DEVCFG2
#pragma config FPLLIDIV = DIV_2 // PLL Input Divider - 2x
#pragma config FPLLMUL = MUL_20 // PLL Multiplier - 20x
#pragma config UPLLIDIV = DIV_2 // USB PLL Input Divider - 2x
#pragma config UPLLEN = OFF // USB PLL Disabled and Bypassed
#pragma config FPLLODIV = DIV_1 // Sys PLL Output Divide by 1
// DEVCFG1
#pragma config FNOSC = FRCPLL // Oscillator 
#pragma config FSOSCEN = OFF // Secondary Oscillator Enabled
#pragma config IESO = ON // Internal/External Switch Over Enabled
#pragma config POSCMOD = OFF // Primary Oscillator Disabled
#pragma config OSCIOFNC = OFF // CLKO on OSCO Pin Disabled
#pragma config FPBDIV = DIV_1 // Peripheral Clock Divisor: Sys_Clk/1
#pragma config FCKSM = CSDCMD // Clock Switch Disable, FSCM Disabled
#pragma config WDTPS = PS1048576 // WDT Postscaler 1:1048576
#pragma config FWDTEN = OFF // WDT Disabled (SWDTEN Control)
// DEVCFG0
#pragma config DEBUG = ON // Background Debugger Enabled
#pragma config ICESEL = ICS_PGx2 // ICE/ICD Comm Channel PGEC2/PGED2
#pragma config PWP = OFF // Program Flash Write Protect Disabled
#pragma config BWP = OFF // Boot Flash Write Protect Disabled
#pragma config CP = OFF // Code Protect Disabled

#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>
#include <xc.h>
#include "millis.h"
#include "FatFS/ff.h"
#include "SoftSPI.h"

/* CPU clock frequency */
#define CPU_CLOCK_FREQUENCY 80000000

 //	Exception handler: 
static enum { 
  EXCEP_IRQ = 0,			// interrupt 
  EXCEP_AdEL = 4,			// address error exception (load or ifetch) 
  EXCEP_AdES,				// address error exception (store) 
  EXCEP_IBE,				// bus error (ifetch) 
  EXCEP_DBE,				// bus error (load/store) 
  EXCEP_Sys,				// syscall 
  EXCEP_Bp,				// breakpoint 
  EXCEP_RI,				// reserved instruction 
  EXCEP_CpU,				// coprocessor unusable 
  EXCEP_Overflow,			// arithmetic overflow 
  EXCEP_Trap,				// trap (possible divide by zero) 
  EXCEP_IS1 = 16,			// implementation specfic 1 
  EXCEP_CEU,				// CorExtend Unuseable 
  EXCEP_C2E				// coprocessor 2 
} _excep_code; 

static unsigned int _epc_code; 
static unsigned int _excep_addr; 

// this function overrides the normal _weak_ generic handler 
void _general_exception_handler(void) 
{ 
  asm volatile("mfc0 %0,$13" : "=r" (_excep_code)); 
  asm volatile("mfc0 %0,$14" : "=r" (_excep_addr)); 

  _excep_code = (_excep_code & 0x0000007C) >> 2; 
    while (1) { 
      // Examine _excep_code to identify the type of exception 
        unsigned int error = _excep_code;
        unsigned int addr = _excep_addr;
      // Examine _excep_addr to find the address that caused the exception 
      Nop(); 
      Nop(); 
      Nop();  
  } 
}//	End of exception handler

typedef struct
{
    int format;
    int filesize;
    int filetype;
    int frmtchunk_marker;
    int dataLen;
    short type_frmt;
    short numOfChan;
    int samplesPerSec;
    int bytesPerSec;
    short blockAlign;
    short bitsPerSample;
    int *extra;
    unsigned int extralen;        
} dWAVHEADER;

SOFTSPI fpgaspi = {
    .mosi = PINMOSI_FPGA,
    .miso = PINMISO_FPGA,
    .sck = PINSCK_FPGA,
    .delay = 2,
    .cke = 0,
    .ckp = 0,
    .order = MSBFIRST,
};

void delay(uint_fast16_t del) {
    for (uint_fast16_t i = 0; i < del; i++) {
        asm volatile("nop");
    }
}

int main(void){
    FATFS *fs;
    FIL *fil;        /* File object */
    uint32_t *line; /* Line buffer */
    UINT br;
    FRESULT fr;     /* FatFs return code */
    dWAVHEADER *header;
    //uint8_t b0,b1,b2,b3;
    
    millis_init();
    fs = malloc(sizeof(FATFS));
    fil = malloc(sizeof(FIL));
    header = malloc(sizeof(dWAVHEADER));
    header->extra = malloc(sizeof(int));
    line = malloc(sizeof(uint32_t));
    
    /* Setup Reading data */
    /* Give a work area to the default drive */
    fr = f_mount(fs, "", 1);
    if (fr) return (int)fr;
    
    /* Open a text file */
    //fr = f_open(fil, "filetest.wav", FA_READ);
    fr = f_open(fil, "champion.wav", FA_READ);
    if (fr) return (int)fr;
    
    fr = f_read(fil, header, sizeof(dWAVHEADER), &br);
    if (fr || br == 0) return (int)fr; 
    
    //initialise fpga spi
    SoftSPI_begin(&fpgaspi);
    //transfer setup fpga spi
    SoftSPI_setClockDivider(&fpgaspi, (uint16_t)baud_to_clock_div(20000000)); // 20,000,000
    pinMode(PINCS_FPGA, OUTPUT);
    digitalWrite(PINCS_FPGA, HIGH);
    
    /* "Play Song" */
    while(1){
        fr = f_read(fil, line, sizeof(uint32_t), &br);
        if (fr || br == 0) return (int)fr;
        
        //b0, b1, b2, b3 = *line;
        
        //write
        digitalWrite(PINCS_FPGA, LOW);
        SoftSPI_transfer32(&fpgaspi, *line + (65535/2 << 16) + 65535/2 );
        digitalWrite(PINCS_FPGA, HIGH);
        
        delay(1814);
    }

    /* Close the file */
    f_close(fil);
    
    return EXIT_FAILURE;
}
