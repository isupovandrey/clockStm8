#include "i2c.h"



#define ACK 0		// Ответ удачный
#define NACK 1		// Ответ не удачный



#define ONE_SCL()	{ I2C_DDR &= ~(1 << I2C_SCL); I2C_ODR |= (1 << I2C_SCL); } // Установка единицы на линии SCL
#define NULL_SCL()	{ I2C_DDR |= (1 << I2C_SCL);  I2C_ODR &= ~(1 << I2C_SCL); } // Установка нуля на линии SCL
#define ONE_SDA()	{ I2C_DDR &= ~(1 << I2C_SDA); I2C_ODR |= (1 << I2C_SDA); } // Установка единицы на линии SDA
#define NULL_SDA()	{ I2C_DDR |= (1 << I2C_SDA);  I2C_ODR &= ~(1 << I2C_SDA); } // Установка нуля на линии SDA


unsigned char i2c_stop(void)
	{
		unsigned char error = 0;
		
		NULL_SCL();
		I2C_DELAY();
		NULL_SDA();
		I2C_DELAY();
		
		ONE_SCL();
		I2C_DELAY();
		ONE_SDA();
		I2C_DELAY();
		
		if((I2C_IDR & (1 << I2C_SDA)) == 0) error = 2;
		if((I2C_IDR & (1 << I2C_SCL)) == 0) error |= 1;
		I2C_DELAY();
		I2C_DELAY();
		I2C_DELAY();
		I2C_DELAY();
		
		return error;
	}
	
//=======================================================================
//					       Функция генерирующая условия старт
//=======================================================================

void i2c_start(void)
	{
		NULL_SDA();
		I2C_DELAY();
		NULL_SCL();
		I2C_DELAY();
	}
	
//=======================================================================
//					       Функция генерирующая условия рестарт
//=======================================================================

void i2c_restart(void)
	{
		ONE_SDA();
		I2C_DELAY();
		ONE_SCL();
		I2C_DELAY();
		
		NULL_SDA();
		I2C_DELAY();
		NULL_SCL();
		I2C_DELAY();
	}
	
//=======================================================================
//					       Функция инициализации шины
//=======================================================================

void i2c_init(void)
	{
		ONE_SDA();
		ONE_SCL();
		
		i2c_stop();
	}
	
//=======================================================================
//					       Функция отправки байта по шине
//=======================================================================

unsigned char i2c_send_byte(unsigned char data)
	{
		unsigned char i;
		unsigned char ask = ACK;
		
		for(i = 0; i < 8; i++)
			{
				if((data & 0x80) == 0)
					{
						NULL_SDA();
					}
				else
					{
						ONE_SDA();
					}
				I2C_DELAY();
				ONE_SCL();
				I2C_DELAY();
				NULL_SCL();
				
				data = (data << 1);
			}
			
		ONE_SDA();
		I2C_DELAY();
		ONE_SCL();
		I2C_DELAY();
		
		if((I2C_IDR & (1 << I2C_SDA)) == (1 << I2C_SDA))
			{
				ask = NACK;
			}
		else
			{
				ask = ACK;
			}
			
		NULL_SCL();
			
		return ask;
	}
	
//=======================================================================
//					       Функция чтения байта c шинs
//=======================================================================

unsigned char i2c_read_byte(unsigned char ask)
	{
		unsigned char byte = 0;
		unsigned char i;
		
		ONE_SDA();
		
		for(i = 0; i < 8; i++)
			{
				byte = (byte << 1);
				ONE_SCL();
				I2C_DELAY();
				if((I2C_IDR & (1 << I2C_SDA)) == (1 << I2C_SDA)) byte |= 0x01;
				NULL_SCL();
				I2C_DELAY();
			}
			
		if(ask == ACK)
			{
				NULL_SDA();
			}
		else
			{
				ONE_SDA();
			}
		I2C_DELAY();
		ONE_SCL();
		I2C_DELAY();
		NULL_SCL();
		I2C_DELAY();
		ONE_SDA();
			
		return byte;
	}