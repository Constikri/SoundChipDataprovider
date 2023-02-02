#include "millis.h"
#include <cp0defs.h>
#include <sys/attribs.h>

#define CORE_TICK_RATE 40000u

volatile uint32_t core_timer_millis = 0;

void __ISR(_CORE_TIMER_VECTOR, IPL2SOFT) CoreTimer_InterruptHandler(void){
    unsigned long ct_count = _CP0_GET_COUNT();
    unsigned long period = CORE_TICK_RATE;
    
    // update the Compare period
    period += ct_count;
    _CP0_SET_COMPARE(period);
    core_timer_millis++;
    IFS0CLR = _IFS0_CTIF_MASK;
}

void millis_init(void) {
    unsigned int stat_gie, cause_val;
    // Disables interrupts by clearing the global interrupt enable bit
    // in the STATUS register.
    stat_gie = __builtin_disable_interrupts();
    // Configure the core timer
    // clear the CP0 Count register
    _CP0_SET_COUNT(0);
    // set up the period in the CP0 Compare register
    _CP0_SET_COMPARE(CORE_TICK_RATE);
    // halt core timer and program at a debug breakpoint
    _CP0_BIC_DEBUG(_CP0_DEBUG_COUNTDM_MASK);
    // Set up core timer interrupt
    // clear core timer interrupt flag
    IFS0CLR = _IFS0_CTIF_MASK;
    // set core time interrupt priority of 2
    IPC0CLR = _IPC0_CTIP_MASK;
    IPC0SET = (2 << _IPC0_CTIP_POSITION);
    // set core time interrupt subpriority of 0
    IPC0CLR = _IPC0_CTIS_MASK;
    IPC0SET = (0 << _IPC0_CTIS_POSITION);
    // enable core timer interrupt
    IEC0CLR = _IEC0_CTIE_MASK;
    IEC0SET = (1 << _IEC0_CTIE_POSITION);
    // set the CP0 Cause register Interrupt Vector bit
    cause_val = _CP0_GET_CAUSE();
    cause_val |= _CP0_CAUSE_IV_MASK;
    _CP0_SET_CAUSE(cause_val);

    // enable multi-vector interrupts
    INTCONSET = _INTCON_MVEC_MASK;

    // enable global interrupts
    __builtin_enable_interrupts();
}

uint32_t millis(void) {
    return core_timer_millis;
}