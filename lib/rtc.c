#include "rtc.h"

unsigned char RTC_ConvertFromDec(unsigned char c){
	unsigned char ch = ((c>>4)*10+(0b00001111&c));
	return ch;
}

unsigned char RTC_ConvertFromBinDec(unsigned char c){
	unsigned char ch = ((c/10)<<4)|(c%10);
	return ch;
}

unsigned long con_day	= 0x00;
unsigned long con_hour	= 0x00;
unsigned long con_min	= 0x00;
unsigned long con_sec	= 0x00;

void RTC_Read(){
	

	i2c_start();
	i2c_send_byte(0xD0);
	i2c_send_byte(0x00);
	i2c_restart();
	i2c_send_byte(0xD1);
		sec		= i2c_read_byte(0);
		min		= i2c_read_byte(0);
		hour	= i2c_read_byte(0);
		day		= i2c_read_byte(0);
		date	= i2c_read_byte(0);
		month	= i2c_read_byte(0);
		year	= i2c_read_byte(1);
	i2c_stop();

	sec		= RTC_ConvertFromDec(sec);
	min		= RTC_ConvertFromDec(min);
	hour	= RTC_ConvertFromDec(hour);
	day		= RTC_ConvertFromDec(day);
	date	= RTC_ConvertFromDec(date);
	month	= RTC_ConvertFromDec(month);
	year	= RTC_ConvertFromDec(year);
}


void RTC_Set(unsigned char sec, unsigned char min, unsigned char hour, unsigned char day, unsigned char date, unsigned char month, unsigned char year){
	sec		= RTC_ConvertFromBinDec(sec);
	min		= RTC_ConvertFromBinDec(min);
	hour	= RTC_ConvertFromBinDec(hour);
	day		= RTC_ConvertFromBinDec(day);
	date	= RTC_ConvertFromBinDec(date);
	month	= RTC_ConvertFromBinDec(month);
	year	= RTC_ConvertFromBinDec(year);
	
	i2c_start();
	i2c_send_byte(0xD0);
	i2c_send_byte(0x00);
	
	i2c_send_byte(sec);
	i2c_send_byte(min);
	i2c_send_byte(hour);
	i2c_send_byte(day);
	i2c_send_byte(date);
	i2c_send_byte(month);
	i2c_send_byte(year);
	i2c_stop();
	
}




/*конвертер H:M:S в секунды

1сек = 1сек
1мин = 60сек
1час = 3600сек
24часа = 86400сек
*/
 

void conSec(long secin){
	con_day	= 0x00;
	con_hour= 0x00;
	con_min	= 0x00;
	con_sec	= 0x00;

	con_day = secin/86400;
	secin = secin-(con_day*86400);
	
	con_hour = (secin/3600);
	con_min	 = ((secin-(3600*con_hour))/60);
	con_sec	 = (secin-(((con_hour*60)*60)+(con_min*60)));
}

unsigned long transTime(unsigned long d, unsigned long h, unsigned long m, unsigned long s){ //d, h, m, s
 	return ((d*86400)+(((h*60)+m)*60+s));

 }