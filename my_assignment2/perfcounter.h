#ifndef PERFCOUNTER_H
#define PERFCOUNTER_H

#include <stdint.h>

void perfcounter_init(void);
uint64_t get_cycles(void);
uint64_t get_instret(void);

#endif /* PERFCOUNTER_H */
