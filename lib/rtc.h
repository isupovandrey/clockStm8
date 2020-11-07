#ifndef RTC_H_
#define RTC_H_

#include "rtc.c"

unsigned char sec,min,hour,day,date,month,year;



unsigned char RTC_ConvertFromDec(unsigned char c);
unsigned char RTC_ConvertFromBinDec(unsigned char c);

void RTC_Read();
void RTC_Set(unsigned char sec, unsigned char min, unsigned char hour, unsigned char day, unsigned char date, unsigned char month, unsigned char year);

void conSec(long secin);
unsigned long transTime(unsigned long d, unsigned long h, unsigned long m, unsigned long s);


#endif /* RTC_H_ */