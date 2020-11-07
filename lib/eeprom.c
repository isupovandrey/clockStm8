#include "eeprom.h"

void EEPROM_UNLOCK(void){

	FLASH_DUKR = 0xAE; // unlock EEPROM
    FLASH_DUKR = 0x56;

    while (!(FLASH_IAPSR & (1<<3))); // check protection off

}