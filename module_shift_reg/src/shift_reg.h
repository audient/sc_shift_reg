#ifndef SHIFT_REG_H
#define SHIFT_REG_H

#include <xs1.h>

/** Structure containing the resources required for the Shift Register interface.
 *
 * It consists of:
 * - srPort multibit output port which must include a DATA, CLOCK and LATCH line.
 * - dataBitMask - a mask for the DATA line within srPort - eg. if DATA is bit 0 of srPort, dataBitMask = (0x01 << 0)
 * - clkBitMask - a mask for the CLOCK line within srPort
 * - latchBitMask - a mask for the LATCH line within srPort
 *
 * Select lines are intentionally not part of API, they are simple port outputs,
 * which depend on how many independent shift registers there are and how they're connected.
 *
 */
typedef struct shift_reg_interface
{
    out port srPort;
	unsigned int dataBitMask;
	unsigned int clkBitMask;
	unsigned int latchBitMask;
} shift_reg_interface;


/** Transmit a data buffer.
 *
 * Most significant bit first order.
 * Big endian byte order.
 *
 * \param ioConf  Resources for the Shift register interface
 * \param data    The data to transmit
 * \param length  The length of the data buffer
 *
 */
void shiftRegWrite(shift_reg_interface &ioConf, unsigned char data[], unsigned length);

#endif
