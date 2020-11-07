#include "main.h"


/*

TODO:	1-Рабочие таймерные часы "C__0"


RELIS:	1- Работа с EEPROM
		2- Hard reset при включении зажать up + dn


*/


/*
	Меню при нажатии кнопки "OK"

** - Реализовано
			 |- Рабочие таймерные часы "C__0"
			 |- Часы "C__1"**
	Меню-->	 |- 
			 |- Настройки "C__2"** -----------> | Настройка RTC "r__0"**
			 |- Выход "C__4"					| Настройка Рабочих таймерных часов "r__1"** (BETA) ---->   | Начало смены
			 									| Настройка Будильника"r__2" (BETA)               			| Конец смены
												| Настройка яркости "r__3"**                              	| Начало обеда
												| Выход "r__4"**                                          	| Конец обеда
                                                | Настройка яркости по часам "r__4" (BETA)->| 00:00-04:00
                                                                                     		| 05:00-07:00
                                                                                     		| 08:00-20:00
                                                                                     		| 21:00-23:00

*/

/*
Рабочие таймерные часы- Часы которые запраграммированы показывать время в трех режимах

	Режимы:
		1-Таймер от начало смены до обеда
		2-Таймер от начало обеда до конца обеда
		3-От конца обеда до конца смены
		4-От конца смены до будуйщей смены

*/

#define TM1637_sendMASS(a,b,c,d) {TM1637_seg[0] = a; TM1637_seg[1] = b; TM1637_seg[2] = c; TM1637_seg[3] = d; TM1637_send();}

_Bool dot;

unsigned int Soft_Timer		= 0x00; //Программный таймер используется в циклах вместо прерываний
unsigned int Point_Meny		= 0x00;
unsigned char But_Buff		= 0xff;
unsigned char Clock_Temp[2];

unsigned char auto_exit = 0;

void clock(void);
char Set_time(unsigned char hourset, unsigned char minset);




/*		Настройки		*/

#define setting_Brigh	0

#define DnClock_hour_0	0
#define DnClock_min_0	1

#define DnClock_hour_1	2
#define DnClock_min_1	3

#define DnClock_hour_2	4
#define DnClock_min_2	5

#define DnClock_hour_3	6
#define DnClock_min_3	7

//Example EEPROM_DATA(DnClock_hour_0)

/*		Настройки		*/


void hard_Reset(){ //default setting

		EEPROM_UNLOCK();
			EEPROM_DATA(setting_Brigh) = 7;

			EEPROM_DATA(DnClock_hour_0) = 0x00;
			EEPROM_DATA(DnClock_min_0)	= 0x00;

			EEPROM_DATA(DnClock_hour_1) = 0x00;
			EEPROM_DATA(DnClock_min_1)	= 0x00;

			EEPROM_DATA(DnClock_hour_2) = 0x00;
			EEPROM_DATA(DnClock_min_2)	= 0x00;

			EEPROM_DATA(DnClock_hour_3) = 0x00;
			EEPROM_DATA(DnClock_min_3)	= 0x00;		


		EEPROM_LOCK();

	RTC_Set(0, 0, 0, 1, 1, 1, 20); //reset RTC

	
	TM1637_cleer();
	TM1637_sendMASS(0x50,0x6D,0x78,0x00); //RESET
	delay(99999);

	WWDG_CR = 0xFF; //software reset

}


char button(char but){ //Обработка кнопок
	
		if(!(PC_IDR&(1<<but))){
			if(But_Buff&(1 << but)){
				But_Buff &= ~(1 << but);
					return but;
			  }
			}
		else But_Buff |= (1 << but);
		
		
	return 0;
}



char Set_time(unsigned char hourset, unsigned char minset){
char Point = 0x00;
TM1637_cleer();

Soft_Timer = 0x00;


	while(1){
		
		if(button(up)){
			if(Point == 0){
				hourset++;
				if(hourset > 23)hourset = 0;
			}
			if(Point == 1){
				minset++;
				if(minset > 59)minset = 0;
			}
		}
		if(button(dn)){
			if(Point == 0){
				hourset--;
				if(hourset > 23)hourset = 23;
			}
			if(Point == 1){
				minset--;
				if(minset > 59)minset = 59;
			}
		}
		if(button(ok)){
			Point++;
		}
		
		
		Soft_Timer++; //мигание
		if(Soft_Timer == 10){			
			dot = !dot;
			Soft_Timer = 0;
		}
		

			if(Point<2){ 
				if(Point == 0 && dot == 1){
					TM1637_seg[0] = 0x00;
					TM1637_seg[1] = 0x00;					
				}
				else{
					if(hourset/10)TM1637_seg[0] = ASCI[hourset/10];
					TM1637_seg[1] = ASCI[hourset%10];		
				}
				
				TM1637_seg[1] = TM1637_seg[1] +0x80;
				
				if(Point == 1 && dot == 1){
					TM1637_seg[2] = 0x00;
					TM1637_seg[3] = 0x00;					
				}
				else{
					TM1637_seg[2] = ASCI[minset/10];
					TM1637_seg[3] = ASCI[minset%10];		
				}
				TM1637_send();				
			}

		if(Point == 2){
			Clock_Temp[0] = hourset;
			Clock_Temp[1] = minset;
			Soft_Timer = 0x00;
			return 1;

		}

		
		
		
		
	}
}

char Set_Brigh(){
	TM1637_cleer();
	Soft_Timer = 0x00;
	Point_Meny = EEPROM_DATA(setting_Brigh);

	auto_exit = 0;

while(1){

	if(button(up)){
		Point_Meny++;
		auto_exit = 0;
		if(Point_Meny > 7)Point_Meny = 7;
	}

	if(button(dn)){
		Point_Meny--;
		auto_exit = 0;
		if(Point_Meny > 7)Point_Meny = 0;
	}
	if(button(ok)){
		auto_exit = 0;

		EEPROM_UNLOCK();
			EEPROM_DATA(setting_Brigh) = Point_Meny;
		EEPROM_LOCK();

		return Point_Meny;
	}


	Soft_Timer++;
		if(Soft_Timer == 300){
			TM1637_sendMASS(0x7C,0x50,0x00,ASCI[Point_Meny]);
			TM1637_brigh(Point_Meny);
			Soft_Timer = 0x00;
			auto_exit++;
		}


	if(auto_exit == 20){
		
		TM1637_brigh(EEPROM_DATA(setting_Brigh));
		clock();
	}


}
	
}

void Set_DnTimer(){ //"r__1"
	TM1637_cleer();
	Point_Meny = 0;
	Soft_Timer = 0x00;
	
	while(1){
		if(button(up)){
			Point_Meny++;
			if(Point_Meny > 4)Point_Meny = 0;
		}

		if(button(dn)){
			Point_Meny--;
			if(Point_Meny > 4)Point_Meny = 4;
		}

		if(button(ok)){
			if(Point_Meny == 0){
				Set_time(EEPROM_DATA(DnClock_hour_0),EEPROM_DATA(DnClock_min_0));
					EEPROM_UNLOCK();
						EEPROM_DATA(DnClock_hour_0) = Clock_Temp[0];
						EEPROM_DATA(DnClock_min_0)	= Clock_Temp[1];
					EEPROM_LOCK();
				Point_Meny = 0;
			}

			if(Point_Meny == 1){
				Set_time(EEPROM_DATA(DnClock_hour_1),EEPROM_DATA(DnClock_min_1));
					EEPROM_UNLOCK();
						EEPROM_DATA(DnClock_hour_1) = Clock_Temp[0];
						EEPROM_DATA(DnClock_min_1)	= Clock_Temp[1];
					EEPROM_LOCK();
				Point_Meny = 1;
			}

			if(Point_Meny == 2){
				Set_time(EEPROM_DATA(DnClock_hour_2),EEPROM_DATA(DnClock_min_2));
					EEPROM_UNLOCK();
						EEPROM_DATA(DnClock_hour_2) = Clock_Temp[0];
						EEPROM_DATA(DnClock_min_2)	= Clock_Temp[1];
					EEPROM_LOCK();
				Point_Meny = 2;
			}

			if(Point_Meny == 3){
				Set_time(EEPROM_DATA(DnClock_hour_3),EEPROM_DATA(DnClock_min_3));
					EEPROM_UNLOCK();
						EEPROM_DATA(DnClock_hour_3) = Clock_Temp[0];
						EEPROM_DATA(DnClock_min_3)	= Clock_Temp[1];
					EEPROM_LOCK();
				Point_Meny = 3;
			}

			if(Point_Meny == 4)clock(); //exit



		}


		Soft_Timer++;
		if(Soft_Timer == 300){
			TM1637_sendMASS(0x5E,0x78,0x08,ASCI[Point_Meny]);
			Soft_Timer = 0x00;
		}
	}
}

void Set_Meny(){ //Настройки "C__2"

	TM1637_cleer();
	Point_Meny = 0;
	Soft_Timer = 0x00;

	while(1){

	if(button(up)){
		Point_Meny++;
		if(Point_Meny > 4)Point_Meny = 0;
	}

	if(button(dn)){
		Point_Meny--;
		if(Point_Meny > 4)Point_Meny = 4;
	}

	if(button(ok)){
		
		if(Point_Meny == 0){ //тут настройка RTC
			RTC_Read();
			Set_time(hour,min);
			RTC_Set(0, Clock_Temp[1], Clock_Temp[0], 1, 1, 1, 20);
			clock();
		}

		if(Point_Meny == 1)Set_DnTimer();

		if(Point_Meny == 4) clock();
		if(Point_Meny == 3){
			Set_Brigh();
			clock();
		};
	}
	


	Soft_Timer++;
		if(Soft_Timer == 300){
			TM1637_sendMASS(0x50,0x08,0x08,ASCI[Point_Meny]);
			Soft_Timer = 0x00;
		}

	}
}

void Meny(){ //Меню

	TM1637_cleer();
	Point_Meny = 0;
	Soft_Timer = 0x00;

	while(1){

	if(button(up)){
		Point_Meny++;
		if(Point_Meny > 3)Point_Meny = 0;
	}

	if(button(dn)){
		Point_Meny--;
		if(Point_Meny > 3)Point_Meny = 3;
	}

	if(button(ok)){
		if(Point_Meny == 0)dnClock(); //обратные часы "С__0"
		if(Point_Meny == 1 || Point_Meny == 3)clock(); //Часы "C__1"
		if(Point_Meny == 2) Set_Meny(); //Настройки "C__2"
	}
	


	Soft_Timer++;
		if(Soft_Timer == 300){
			TM1637_sendMASS(0x39,0x08,0x08,ASCI[Point_Meny]);
			Soft_Timer = 0x00;
		}

	}
}

void clock(void){

TM1637_cleer();
Soft_Timer = 0x00; //Сброс таймера

while(1){
	
	Soft_Timer++;

	
	if(button(up))Set_Brigh();
	if(button(dn))Set_Brigh();
	if(button(ok))Meny();

		if(Soft_Timer == 3000){ // Отображение времени при значении Программного таймера
			RTC_Read();
			dot = !dot;

			
				TM1637_seg[0] = ASCI[hour/10];
				TM1637_seg[1] = ASCI[hour%10];
				TM1637_seg[2] = ASCI[min/10];
				TM1637_seg[3] = ASCI[min%10];
			
			if(hour<10)	TM1637_seg[0] =  0x00; //Отключение первого разряда если в нем 0
			if(dot) TM1637_seg[1] = TM1637_seg[1] + 0x80; //Включение секундных точек

			TM1637_send();
		Soft_Timer = 0x00; //Сброс таймера
		}
}

}




unsigned long con_day	= 0x00;
unsigned long con_hour	= 0x00;
unsigned long con_min	= 0x00;
unsigned long con_sec	= 0x00;

unsigned long cl_hour	= 23;
unsigned long cl_min	= 58;
unsigned long cl_sec	= 59;

unsigned long con1_sec	= 3600;

unsigned long clockTemp1 = 0x00;
unsigned long clockTemp2 = 0x00;
unsigned long clockTemp3 = 0x00;


 unsigned long transTime(unsigned long d, unsigned long h, unsigned long m, unsigned long s){ //d, h, m, s
 	return ((d*86400)+(((h*60)+m)*60+s));

 }

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




 unsigned long DnClock_Tim_0;
 unsigned long DnClock_Tim_1;
 unsigned long DnClock_Tim_2;
 unsigned long DnClock_Tim_3;





unsigned long timeToSec;
unsigned long timeRes;
unsigned char PointTimer;

void dnClock(void){

	TM1637_cleer();
	Soft_Timer = 0x00; //Сброс таймера
	PointTimer = 0;

	DnClock_Tim_0 = transTime(0,EEPROM_DATA(DnClock_hour_0),EEPROM_DATA(DnClock_min_0),0);
	DnClock_Tim_1 = transTime(0,EEPROM_DATA(DnClock_hour_1),EEPROM_DATA(DnClock_min_1),0);
	DnClock_Tim_2 = transTime(0,EEPROM_DATA(DnClock_hour_2),EEPROM_DATA(DnClock_min_2),0);
	DnClock_Tim_3 = transTime(0,EEPROM_DATA(DnClock_hour_3),EEPROM_DATA(DnClock_min_3),0);

	while(1){
		
		Soft_Timer++;

			if(button(ok))Meny();

			if(button(up)){
				TM1637_sendMASS(0x78,0x50,0x08,ASCI[PointTimer]);
				delay(9000);
			}


			if(Soft_Timer == 5000){ // Отображение времени при значении Программного таймера
				RTC_Read();
				

				timeToSec = transTime(0,hour,min,sec);
				dot = !dot;
				PointTimer = 0x00;
					
						
					if( timeToSec+1 > DnClock_Tim_0 & timeToSec < DnClock_Tim_1) PointTimer = 1; //От начало смены до начало обеда

					if( timeToSec+1 > DnClock_Tim_1 & timeToSec < DnClock_Tim_2) PointTimer = 2; //от начала обеда до  конца обеда;

					if( timeToSec+1 > DnClock_Tim_2 & timeToSec < DnClock_Tim_3) PointTimer = 3; //от конца  обеда до  конца смены


						switch (PointTimer) {
						case 1: timeRes = DnClock_Tim_1 - timeToSec; break;
						case 2: timeRes = DnClock_Tim_2 - timeToSec; break;
						case 3: timeRes = DnClock_Tim_3 - timeToSec; break;

						default: timeRes = 0; break;
						}




			if(timeRes>0){
				conSec(timeRes);
					TM1637_seg[0] = ASCI[con_hour/10];
					TM1637_seg[1] = ASCI[con_hour%10];
					TM1637_seg[2] = ASCI[con_min/10];
					TM1637_seg[3] = ASCI[con_min%10];
				if(con_hour<10)	TM1637_seg[0] =  0x00; //Отключение первого разряда если в нем 0
				if(dot) TM1637_seg[1] = TM1637_seg[1] + 0x80; //Включение секундных точек
			}
			else{
					TM1637_seg[0] = 0x40;
					TM1637_seg[1] = 0x40;
					TM1637_seg[2] = 0x40;
					TM1637_seg[3] = 0x40;
			}
				TM1637_send();

			Soft_Timer = 0x00; //Сброс таймера
			}
	}

}	

void main(){

	PC_DDR &= ~(1<<ok) | (1<<dn) | (1<<up); //инициализация кнопок

	//CLK_CKDIVR=0; //Настройка тактирования на 16MHz, по умолчанию работает на 2MHz

	TM1637_INIT();
	TM1637_brigh(EEPROM_DATA(setting_Brigh));
	I2C_INIT();

	if(button(up) || button(dn))hard_Reset();






	while(1){

		//clock();
		dnClock();

	}

}