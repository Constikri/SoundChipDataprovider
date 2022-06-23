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
#pragma config DEBUG = ON // Background Debugger Disabled
#pragma config ICESEL = ICS_PGx2 // ICE/ICD Comm Channel PGEC2/PGED2
#pragma config PWP = OFF // Program Flash Write Protect Disabled
#pragma config BWP = OFF // Boot Flash Write Protect Disabled
#pragma config CP = OFF // Code Protect Disabled

#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include <xc.h>
#include "millis.h"
#include "FatFS/ff.h"
#include "SoftSPI.h"

/* CPU clock frequency */
#define CPU_CLOCK_FREQUENCY 80000000

int main(void){
    FATFS *fs;
    FIL *fil;        /* File object */
    uint8_t *line; /* Line buffer */
    UINT br;
    FRESULT fr;     /* FatFs return code */
    uint32_t time;
    
    millis_init();
    fs = malloc(sizeof(FATFS));
    line = malloc(32*8);
    
    /* Give a work area to the default drive */
    fr = f_mount(fs, "", 0);
    if (fr) return (int)fr;
    
    /* Open a text file */
    fr = f_open(fil, "file.wav", FA_READ);
    if (fr) return (int)fr;

    fr = f_read(fil, &line, sizeof(line), &br);
    if (fr || br == 0) return (int)fr;

    /* Close the file */
    f_close(fil);
    
    return EXIT_FAILURE;
}
