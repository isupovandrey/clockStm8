#include "rtc.h"

unsigned char RTC_ConvertFromDec(unsigned char c){
	unsigned char ch = ((c>>4)*10+(0b00001111&c));
	return ch;
}

unsigned char RTC_ConvertFromBinDec(unsigned char c){
	unsigned char ch = ((c/10)<<4)|(c%10);
	return ch;
}

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
