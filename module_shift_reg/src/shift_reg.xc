#include "shift_reg.h"

static inline void shiftOut(shift_reg_interface &ifConf, unsigned char data)
{
    unsigned tmp;

#pragma loop unroll
    for(int i = 7; i >= 0; i--)
    {
        ifConf.srPort <: 0;

        tmp = data >> i;
        tmp &= 0x01;

        if(tmp)
        {
            ifConf.srPort <: ifConf.dataBitMask;
        }

        tmp |= ifConf.clkBitMask;

        ifConf.srPort <: tmp;
    }

    ifConf.srPort <: 0;
}

void shiftRegWrite(shift_reg_interface &ifConf, unsigned char data[], unsigned length)
{

    ifConf.srPort <: 0;
#pragma unsafe arrays
    for(int i = 0; i < length; i++)
    {
        shiftOut(ifConf, data[i]);
    }

    ifConf.srPort <: ifConf.latchBitMask;
}
