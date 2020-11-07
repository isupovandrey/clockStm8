#ifndef TM1637_H_
#define TM1637_H_

#include "TM1637.c"


void TM1637_initialization();
void TM1637_start();
void TM1637_stop();
void TM1637_writeByte(char pack);
void TM1637_brigh(char brigh);
void TM1637_send();
void TM1637_dot(char d);
void TM1637_cleer();





#endif /* TM1637_H_ */