/*
 * app_shift_reg.xc
 *
 *  Created on: Apr 2, 2014
 *      Author: steve
 */

#include <xs1.h>
#include "shift_reg.h"

#define SHIFT_REG_DAT 1 // Data
#define SHIFT_REG_CLK 2 // Clock
#define SHIFT_REG_LAT 4 // Latch

shift_reg_interface ifConf =
{
        XS1_PORT_32A,
        SHIFT_REG_DAT,
        SHIFT_REG_CLK,
        SHIFT_REG_LAT
};

int main(void)
{

    par
    {
        {
            unsigned char data[] = {0x55, 0x55};

            shiftRegWrite(ifConf, data, 2);
        }

    }
    return 0;
}
