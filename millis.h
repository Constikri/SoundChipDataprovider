#ifndef _MILLIS_H_
#define _MILLIS_H_

#ifdef __cplusplus
extern "C" {
#endif
    
#include <xc.h>

void millis_init(void);
uint32_t millis(void);


#ifdef __cplusplus
}
#endif

#endif /* _MILLIS_H_ */