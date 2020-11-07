#ifndef EEPROM_H_
#define EEPROM_H_

#include "eeprom.c"



#define EEPROM_DATA(address) *(volatile char*)(0x4000+address)

void EEPROM_UNLOCK(void);
#define EEPROM_LOCK() FLASH_IAPSR &= ~(1<<3)

/*
	Example write

		EEPROM_UNLOCK();
			EEPROM_DATA(0) =	0xFF;
			EEPROM_DATA(...) =	0xFF;
			EEPROM_DATA(640) =	0xFF;
		EEPROM_LOCK();




	
	Example read
		user_data = EEPROM_DATA(0); 

		//value		user_data	0xFF

*/

#endif /* EEPROM_H_ */




/*

Спасибо 
	www.count-zero.ru/2018/stm8_eeprom_flash

*/