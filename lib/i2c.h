#ifndef I2C_H_
#define I2C_H_

#include "i2c.c"



unsigned char i2c_stop(void);
void i2c_start(void);
void i2c_restart(void);
void i2c_init(void);
unsigned char i2c_send_byte(unsigned char data);
unsigned char i2c_read_byte(unsigned char ask);




#endif /* I2C_H_ */