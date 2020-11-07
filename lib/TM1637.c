#include "TM1637.h"

unsigned char brigh = 0x07;

unsigned  char command1 = 0b01000000; //Команда записи данных в регистр дисплея
unsigned  char command2 = 0b11000000; //Команда "начальный адрес дисплея"



unsigned  char TM1637_seg[] = {0xFF,0xFF,0xFF,0xFF};

unsigned  char ASCI[] = {	//.gfedcba
				0b00111111, //0
				0b00000110, //1
				0b01011011, //2
				0b01001111, //3
				0b01100110, //4
				0b01101101, //5
				0b01111101, //6
				0b00000111, //7
				0b01111111, //8
				0b01101111, //9
};



void TM1637_start(){
   TM1637_ODR |= 1<<TM1637_SCL;
   TM1637_ODR |= 1<<TM1637_SDA;
TM1637_DELAY();
  TM1637_ODR &= ~(1<<TM1637_SDA);
}

void TM1637_stop(){
  TM1637_ODR &= ~(1<<TM1637_SCL);
TM1637_DELAY();
  TM1637_ODR &= ~(1<<TM1637_SDA);
TM1637_DELAY();
  TM1637_ODR |= 1<<TM1637_SCL;;
TM1637_DELAY();
  TM1637_ODR |= 1<<TM1637_SDA;
}


void TM1637_writeByte(char pack){

  char i;
    for(i=0;i<8;i++)  
  {
   TM1637_ODR &= ~(1<<TM1637_SCL);
    if(pack & 0x01)
  { TM1637_ODR |= 1<<TM1637_SDA;}
    else {TM1637_ODR &= ~(1<<TM1637_SDA);}
  TM1637_DELAY();
    pack = pack >> 1;
    TM1637_ODR |= 1<<TM1637_SCL;
  TM1637_DELAY();
  }
  TM1637_ODR &= ~(1<<TM1637_SCL);
  TM1637_DELAY();
  TM1637_DDR &= ~(1<<TM1637_SDA);
  while((TM1637_IDR & (1<<TM1637_SDA)));
  TM1637_DDR |= (1<<TM1637_SDA);
  TM1637_ODR |= 1<<TM1637_SCL;
  TM1637_DELAY();
  TM1637_ODR &= ~(1<<TM1637_SCL);
}


void TM1637_brigh(char brigh){
	if(brigh>7)brigh = 7;
	
	TM1637_start();
	TM1637_writeByte(0x88 + brigh); //Команда, задающая яркость дисплея
	TM1637_stop();
}

void TM1637_send(){
	
TM1637_start();                  
TM1637_writeByte(command1);			//Команда записи в регистр дисплея
TM1637_stop();

TM1637_start();
TM1637_writeByte(command2); //Команда начального адреса для автоинкремента адреса
			
TM1637_writeByte(TM1637_seg[0]);
TM1637_writeByte(TM1637_seg[1]);
TM1637_writeByte(TM1637_seg[2]);
TM1637_writeByte(TM1637_seg[3]);

TM1637_stop();
}

void TM1637_cleer(){
      TM1637_seg[0] = 0x00;
      TM1637_seg[1] = 0x00;
      TM1637_seg[2] = 0x00;
      TM1637_seg[3] = 0x00;
      TM1637_send();
}

void TM1637_initialization(){
  TM1637_ODR |= (1<<TM1637_SCL) | (1<<TM1637_SDA); 


  TM1637_cleer();
}

void TM1637_dot(char d){
	if(d == 1)TM1637_seg[1] = TM1637_seg[1] + 0x80; 
}






