#ifndef MAIN_H_
#define MAIN_H_

#include "stm8.h"

#define ok		6
#define dn		7
#define up		5


#define TM1637_SCL 3
#define TM1637_SDA 4
#define TM1637_DELAY() delay(5);
#define TM1637_DDR PC_DDR
#define TM1637_ODR PC_ODR
#define TM1637_IDR PC_IDR
#define TM1637_INIT() {TM1637_DDR |= (1<<TM1637_SCL) | (1<<TM1637_SDA); PC_CR1 |= (1<<TM1637_SCL) | (1<<TM1637_SDA); TM1637_initialization();}
#include "TM1637.h"

#define I2C_SCL		4
#define I2C_SDA		5
#define I2C_DDR		PB_DDR	
#define I2C_ODR		PB_ODR	
#define I2C_IDR		PB_IDR	
#define I2C_DELAY()	delay(5);
#define I2C_INIT()	{I2C_DDR |= (1<<I2C_SCL) | (1<<I2C_SDA); PB_CR1 |= (1<<I2C_SCL) | (1<<I2C_SDA); i2c_init();}
#include "i2c.h"

unsigned char sec,min,hour,day,date,month,year;
#include "rtc.h"


#include "eeprom.h"



#endif /* MAIN_H_ */