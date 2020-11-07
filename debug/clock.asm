;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
; This file was generated Sat Nov  7 00:47:04 2020
;--------------------------------------------------------
	.module clock
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _EEPROM_UNLOCK
	.globl _transTime
	.globl _conSec
	.globl _RTC_Set
	.globl _RTC_Read
	.globl _i2c_read_byte
	.globl _i2c_send_byte
	.globl _i2c_init
	.globl _i2c_restart
	.globl _i2c_start
	.globl _i2c_stop
	.globl _TM1637_cleer
	.globl _TM1637_send
	.globl _TM1637_brigh
	.globl _TM1637_initialization
	.globl _buff
	.globl _auto_exit
	.globl _Buff_But
	.globl _Point_Meny
	.globl _Soft_Timer
	.globl _con_sec
	.globl _con_min
	.globl _con_hour
	.globl _con_day
	.globl _ASCI
	.globl _TM1637_seg
	.globl _command2
	.globl _command1
	.globl _brigh
	.globl _PointTimer
	.globl _timeRes
	.globl _timeToSec
	.globl _DnClock_Tim_3
	.globl _DnClock_Tim_2
	.globl _DnClock_Tim_1
	.globl _DnClock_Tim_0
	.globl _Clock_Temp
	.globl _dot
	.globl _year
	.globl _month
	.globl _date
	.globl _day
	.globl _hour
	.globl _min
	.globl _sec
	.globl _defStart
	.globl _setStat
	.globl _button
	.globl _hard_Reset
	.globl _Set_time
	.globl _Set_Brigh
	.globl _Set_DnTimer
	.globl _Set_Meny
	.globl _Meny
	.globl _clock
	.globl _dnClock
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_sec::
	.ds 1
_min::
	.ds 1
_hour::
	.ds 1
_day::
	.ds 1
_date::
	.ds 1
_month::
	.ds 1
_year::
	.ds 1
_dot::
	.ds 1
_Clock_Temp::
	.ds 2
_DnClock_Tim_0::
	.ds 4
_DnClock_Tim_1::
	.ds 4
_DnClock_Tim_2::
	.ds 4
_DnClock_Tim_3::
	.ds 4
_timeToSec::
	.ds 4
_timeRes::
	.ds 4
_PointTimer::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_brigh::
	.ds 1
_command1::
	.ds 1
_command2::
	.ds 1
_TM1637_seg::
	.ds 4
_ASCI::
	.ds 10
_con_day::
	.ds 4
_con_hour::
	.ds 4
_con_min::
	.ds 4
_con_sec::
	.ds 4
_Soft_Timer::
	.ds 2
_Point_Meny::
	.ds 2
_Buff_But::
	.ds 1
_auto_exit::
	.ds 1
_buff::
	.ds 1
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int 0x0000 ;int6
	int 0x0000 ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int 0x0000 ;int11
	int 0x0000 ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int 0x0000 ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int 0x0000 ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	lib/stm8.h: 4: static void delay(unsigned long t)
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	sub	sp, #8
;	lib/stm8.h: 6: while(t--){
	ldw	y, (0x0b, sp)
	ldw	(0x01, sp), y
	ldw	x, (0x0d, sp)
00101$:
	exg	a, xl
	ld	(0x08, sp), a
	exg	a, xl
	ldw	y, (0x01, sp)
	ldw	(0x05, sp), y
	ld	a, xh
	subw	x, #0x0001
	push	a
	ld	a, (0x03, sp)
	sbc	a, #0x00
	ld	(0x03, sp), a
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ld	(0x02, sp), a
	pop	a
	tnz	(0x08, sp)
	jrne	00115$
	tnz	a
	jrne	00115$
	ldw	y, (0x05, sp)
	jreq	00104$
00115$:
;	lib/stm8.h: 10: __endasm;
	nop
	nop
	jra	00101$
00104$:
	addw	sp, #8
	ret
;	lib/TM1637.c: 27: void TM1637_start(){
;	-----------------------------------------
;	 function TM1637_start
;	-----------------------------------------
_TM1637_start:
;	lib/TM1637.c: 28: TM1637_ODR |= 1<<TM1637_SCL;
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	lib/TM1637.c: 29: TM1637_ODR |= 1<<TM1637_SDA;
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	lib/TM1637.c: 30: TM1637_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/TM1637.c: 31: TM1637_ODR &= ~(1<<TM1637_SDA);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
	ret
;	lib/TM1637.c: 34: void TM1637_stop(){
;	-----------------------------------------
;	 function TM1637_stop
;	-----------------------------------------
_TM1637_stop:
;	lib/TM1637.c: 35: TM1637_ODR &= ~(1<<TM1637_SCL);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	lib/TM1637.c: 36: TM1637_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/TM1637.c: 37: TM1637_ODR &= ~(1<<TM1637_SDA);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	lib/TM1637.c: 38: TM1637_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/TM1637.c: 39: TM1637_ODR |= 1<<TM1637_SCL;;
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	lib/TM1637.c: 40: TM1637_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/TM1637.c: 41: TM1637_ODR |= 1<<TM1637_SDA;
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
	ret
;	lib/TM1637.c: 45: void TM1637_writeByte(char pack){
;	-----------------------------------------
;	 function TM1637_writeByte
;	-----------------------------------------
_TM1637_writeByte:
	push	a
;	lib/TM1637.c: 48: for(i=0;i<8;i++)  
	clr	(0x01, sp)
00108$:
;	lib/TM1637.c: 50: TM1637_ODR &= ~(1<<TM1637_SCL);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
	ldw	x, #0x500a
	ld	a, (x)
;	lib/TM1637.c: 51: if(pack & 0x01)
	push	a
	ld	a, (0x05, sp)
	srl	a
	pop	a
	jrnc	00102$
;	lib/TM1637.c: 52: { TM1637_ODR |= 1<<TM1637_SDA;}
	or	a, #0x10
	ldw	x, #0x500a
	ld	(x), a
	jra	00103$
00102$:
;	lib/TM1637.c: 53: else {TM1637_ODR &= ~(1<<TM1637_SDA);}
	and	a, #0xef
	ldw	x, #0x500a
	ld	(x), a
00103$:
;	lib/TM1637.c: 54: TM1637_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/TM1637.c: 55: pack = pack >> 1;
	sra	(0x04, sp)
;	lib/TM1637.c: 56: TM1637_ODR |= 1<<TM1637_SCL;
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	lib/TM1637.c: 57: TM1637_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/TM1637.c: 48: for(i=0;i<8;i++)  
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x08
	jrslt	00108$
;	lib/TM1637.c: 59: TM1637_ODR &= ~(1<<TM1637_SCL);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	lib/TM1637.c: 60: TM1637_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/TM1637.c: 61: TM1637_DDR &= ~(1<<TM1637_SDA);
	ldw	x, #0x500c
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	lib/TM1637.c: 62: while((TM1637_IDR & (1<<TM1637_SDA)));
00105$:
	ldw	x, #0x500b
	ld	a, (x)
	bcp	a, #0x10
	jrne	00105$
;	lib/TM1637.c: 63: TM1637_DDR |= (1<<TM1637_SDA);
	ldw	x, #0x500c
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	lib/TM1637.c: 64: TM1637_ODR |= 1<<TM1637_SCL;
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	lib/TM1637.c: 65: TM1637_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/TM1637.c: 66: TM1637_ODR &= ~(1<<TM1637_SCL);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
	pop	a
	ret
;	lib/TM1637.c: 70: void TM1637_brigh(char brigh){
;	-----------------------------------------
;	 function TM1637_brigh
;	-----------------------------------------
_TM1637_brigh:
;	lib/TM1637.c: 71: if(brigh>7)brigh = 7;
	ld	a, (0x03, sp)
	cp	a, #0x07
	jrsle	00102$
	ld	a, #0x07
	ld	(0x03, sp), a
00102$:
;	lib/TM1637.c: 73: TM1637_start();
	call	_TM1637_start
;	lib/TM1637.c: 74: TM1637_writeByte(0x88 + brigh); //Команда, задающая яркость дисплея
	ld	a, (0x03, sp)
	add	a, #0x88
	push	a
	call	_TM1637_writeByte
	pop	a
;	lib/TM1637.c: 75: TM1637_stop();
	jp	_TM1637_stop
;	lib/TM1637.c: 78: void TM1637_send(){
;	-----------------------------------------
;	 function TM1637_send
;	-----------------------------------------
_TM1637_send:
	sub	sp, #2
;	lib/TM1637.c: 80: TM1637_start();                  
	call	_TM1637_start
;	lib/TM1637.c: 81: TM1637_writeByte(command1);			//Команда записи в регистр дисплея
	push	_command1+0
	call	_TM1637_writeByte
	pop	a
;	lib/TM1637.c: 82: TM1637_stop();
	call	_TM1637_stop
;	lib/TM1637.c: 84: TM1637_start();
	call	_TM1637_start
;	lib/TM1637.c: 85: TM1637_writeByte(command2); //Команда начального адреса для автоинкремента адреса
	push	_command2+0
	call	_TM1637_writeByte
	pop	a
;	lib/TM1637.c: 87: TM1637_writeByte(TM1637_seg[0]);
	ldw	x, #_TM1637_seg+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	ld	a, (x)
	push	a
	call	_TM1637_writeByte
	pop	a
;	lib/TM1637.c: 88: TM1637_writeByte(TM1637_seg[1]);
	ldw	x, (0x01, sp)
	ld	a, (0x1, x)
	push	a
	call	_TM1637_writeByte
	pop	a
;	lib/TM1637.c: 89: TM1637_writeByte(TM1637_seg[2]);
	ldw	x, (0x01, sp)
	ld	a, (0x2, x)
	push	a
	call	_TM1637_writeByte
	pop	a
;	lib/TM1637.c: 90: TM1637_writeByte(TM1637_seg[3]);
	ldw	x, (0x01, sp)
	ld	a, (0x3, x)
	push	a
	call	_TM1637_writeByte
	pop	a
;	lib/TM1637.c: 92: TM1637_stop();
	call	_TM1637_stop
	addw	sp, #2
	ret
;	lib/TM1637.c: 95: void TM1637_cleer(){
;	-----------------------------------------
;	 function TM1637_cleer
;	-----------------------------------------
_TM1637_cleer:
	sub	sp, #2
;	lib/TM1637.c: 96: TM1637_seg[0] = 0x00;
	ldw	x, #_TM1637_seg+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	clr	(x)
;	lib/TM1637.c: 97: TM1637_seg[1] = 0x00;
	ldw	x, (0x01, sp)
	incw	x
	clr	(x)
;	lib/TM1637.c: 98: TM1637_seg[2] = 0x00;
	ldw	x, (0x01, sp)
	incw	x
	incw	x
	clr	(x)
;	lib/TM1637.c: 99: TM1637_seg[3] = 0x00;
	ldw	x, (0x01, sp)
	addw	x, #0x0003
	clr	(x)
;	lib/TM1637.c: 100: TM1637_send();
	call	_TM1637_send
	addw	sp, #2
	ret
;	lib/TM1637.c: 103: void TM1637_initialization(){
;	-----------------------------------------
;	 function TM1637_initialization
;	-----------------------------------------
_TM1637_initialization:
;	lib/TM1637.c: 104: TM1637_ODR |= (1<<TM1637_SCL) | (1<<TM1637_SDA); 
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x18
	ld	(x), a
;	lib/TM1637.c: 107: TM1637_cleer();
	jp	_TM1637_cleer
;	lib/TM1637.c: 110: void TM1637_dot(char d){
;	-----------------------------------------
;	 function TM1637_dot
;	-----------------------------------------
_TM1637_dot:
;	lib/TM1637.c: 111: if(d == 1)TM1637_seg[1] = TM1637_seg[1] + 0x80; 
	ld	a, (0x03, sp)
	cp	a, #0x01
	jrne	00103$
	ldw	x, #_TM1637_seg+1
	ld	a, (x)
	add	a, #0x80
	ld	(x), a
00103$:
	ret
;	lib/i2c.c: 16: unsigned char i2c_stop(void)
;	-----------------------------------------
;	 function i2c_stop
;	-----------------------------------------
_i2c_stop:
	push	a
;	lib/i2c.c: 18: unsigned char error = 0;
	clr	(0x01, sp)
;	lib/i2c.c: 20: NULL_SCL();
	ldw	x, #0x5007
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	lib/i2c.c: 21: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/i2c.c: 22: NULL_SDA();
	ldw	x, #0x5007
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
;	lib/i2c.c: 23: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/i2c.c: 25: ONE_SCL();
	ldw	x, #0x5007
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	lib/i2c.c: 26: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/i2c.c: 27: ONE_SDA();
	ldw	x, #0x5007
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
;	lib/i2c.c: 28: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/i2c.c: 30: if((I2C_IDR & (1 << I2C_SDA)) == 0) error = 2;
	ldw	x, #0x5006
	ld	a, (x)
	bcp	a, #0x20
	jrne	00102$
	push	a
	ld	a, #0x02
	ld	(0x02, sp), a
	pop	a
00102$:
;	lib/i2c.c: 31: if((I2C_IDR & (1 << I2C_SCL)) == 0) error |= 1;
	bcp	a, #0x10
	jrne	00104$
	ld	a, (0x01, sp)
	or	a, #0x01
	ld	(0x01, sp), a
00104$:
;	lib/i2c.c: 32: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/i2c.c: 33: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/i2c.c: 34: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/i2c.c: 35: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/i2c.c: 37: return error;
	ld	a, (0x01, sp)
	addw	sp, #1
	ret
;	lib/i2c.c: 44: void i2c_start(void)
;	-----------------------------------------
;	 function i2c_start
;	-----------------------------------------
_i2c_start:
;	lib/i2c.c: 46: NULL_SDA();
	ldw	x, #0x5007
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
;	lib/i2c.c: 47: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/i2c.c: 48: NULL_SCL();
	ldw	x, #0x5007
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	lib/i2c.c: 49: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
	ret
;	lib/i2c.c: 56: void i2c_restart(void)
;	-----------------------------------------
;	 function i2c_restart
;	-----------------------------------------
_i2c_restart:
;	lib/i2c.c: 58: ONE_SDA();
	ldw	x, #0x5007
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
;	lib/i2c.c: 59: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/i2c.c: 60: ONE_SCL();
	ldw	x, #0x5007
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	lib/i2c.c: 61: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/i2c.c: 63: NULL_SDA();
	ldw	x, #0x5007
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
;	lib/i2c.c: 64: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/i2c.c: 65: NULL_SCL();
	ldw	x, #0x5007
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	lib/i2c.c: 66: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
	ret
;	lib/i2c.c: 73: void i2c_init(void)
;	-----------------------------------------
;	 function i2c_init
;	-----------------------------------------
_i2c_init:
;	lib/i2c.c: 75: ONE_SDA();
	ldw	x, #0x5007
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
;	lib/i2c.c: 76: ONE_SCL();
	ldw	x, #0x5007
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	lib/i2c.c: 78: i2c_stop();
	jp	_i2c_stop
;	lib/i2c.c: 85: unsigned char i2c_send_byte(unsigned char data)
;	-----------------------------------------
;	 function i2c_send_byte
;	-----------------------------------------
_i2c_send_byte:
	sub	sp, #2
;	lib/i2c.c: 90: for(i = 0; i < 8; i++)
	clr	(0x01, sp)
00108$:
;	lib/i2c.c: 94: NULL_SDA();
	ldw	x, #0x5007
	ld	a, (x)
;	lib/i2c.c: 92: if((data & 0x80) == 0)
	tnz	(0x05, sp)
	jrmi	00102$
;	lib/i2c.c: 94: NULL_SDA();
	or	a, #0x20
	ldw	x, #0x5007
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
	jra	00103$
00102$:
;	lib/i2c.c: 98: ONE_SDA();
	and	a, #0xdf
	ldw	x, #0x5007
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
00103$:
;	lib/i2c.c: 100: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/i2c.c: 101: ONE_SCL();
	ldw	x, #0x5007
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	lib/i2c.c: 102: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/i2c.c: 103: NULL_SCL();
	ldw	x, #0x5007
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	lib/i2c.c: 105: data = (data << 1);
	sll	(0x05, sp)
;	lib/i2c.c: 90: for(i = 0; i < 8; i++)
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x08
	jrc	00108$
;	lib/i2c.c: 108: ONE_SDA();
	ldw	x, #0x5007
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
;	lib/i2c.c: 109: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/i2c.c: 110: ONE_SCL();
	ldw	x, #0x5007
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	lib/i2c.c: 111: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/i2c.c: 113: if((I2C_IDR & (1 << I2C_SDA)) == (1 << I2C_SDA))
	ldw	x, #0x5006
	ld	a, (x)
	and	a, #0x20
	cp	a, #0x20
	jrne	00106$
;	lib/i2c.c: 115: ask = NACK;
	ld	a, #0x01
	ld	(0x02, sp), a
	jra	00107$
00106$:
;	lib/i2c.c: 119: ask = ACK;
	clr	(0x02, sp)
00107$:
;	lib/i2c.c: 122: NULL_SCL();
	ldw	x, #0x5007
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	lib/i2c.c: 124: return ask;
	ld	a, (0x02, sp)
	addw	sp, #2
	ret
;	lib/i2c.c: 131: unsigned char i2c_read_byte(unsigned char ask)
;	-----------------------------------------
;	 function i2c_read_byte
;	-----------------------------------------
_i2c_read_byte:
	sub	sp, #2
;	lib/i2c.c: 133: unsigned char byte = 0;
	clr	(0x01, sp)
;	lib/i2c.c: 136: ONE_SDA();
	ldw	x, #0x5007
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
;	lib/i2c.c: 138: for(i = 0; i < 8; i++)
	clr	(0x02, sp)
00107$:
;	lib/i2c.c: 140: byte = (byte << 1);
	sll	(0x01, sp)
;	lib/i2c.c: 141: ONE_SCL();
	ldw	x, #0x5007
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	lib/i2c.c: 142: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/i2c.c: 143: if((I2C_IDR & (1 << I2C_SDA)) == (1 << I2C_SDA)) byte |= 0x01;
	ldw	x, #0x5006
	ld	a, (x)
	and	a, #0x20
	cp	a, #0x20
	jrne	00102$
	ld	a, (0x01, sp)
	or	a, #0x01
	ld	(0x01, sp), a
00102$:
;	lib/i2c.c: 144: NULL_SCL();
	ldw	x, #0x5007
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	lib/i2c.c: 145: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/i2c.c: 138: for(i = 0; i < 8; i++)
	inc	(0x02, sp)
	ld	a, (0x02, sp)
	cp	a, #0x08
	jrc	00107$
;	lib/i2c.c: 136: ONE_SDA();
	ldw	x, #0x5007
	ld	a, (x)
;	lib/i2c.c: 148: if(ask == ACK)
	tnz	(0x05, sp)
	jrne	00105$
;	lib/i2c.c: 150: NULL_SDA();
	or	a, #0x20
	ldw	x, #0x5007
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
	jra	00106$
00105$:
;	lib/i2c.c: 154: ONE_SDA();
	and	a, #0xdf
	ldw	x, #0x5007
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
00106$:
;	lib/i2c.c: 156: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/i2c.c: 157: ONE_SCL();
	ldw	x, #0x5007
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	lib/i2c.c: 158: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/i2c.c: 159: NULL_SCL();
	ldw	x, #0x5007
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	lib/i2c.c: 160: I2C_DELAY();
	push	#0x05
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
;	lib/i2c.c: 161: ONE_SDA();
	ldw	x, #0x5007
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
;	lib/i2c.c: 163: return byte;
	ld	a, (0x01, sp)
	addw	sp, #2
	ret
;	lib/rtc.c: 3: unsigned char RTC_ConvertFromDec(unsigned char c){
;	-----------------------------------------
;	 function RTC_ConvertFromDec
;	-----------------------------------------
_RTC_ConvertFromDec:
	push	a
;	lib/rtc.c: 4: unsigned char ch = ((c>>4)*10+(0b00001111&c));
	ld	a, (0x04, sp)
	swap	a
	and	a, #0x0f
	exg	a, xl
	ld	a, #0x0a
	exg	a, xl
	mul	x, a
	ld	a, (0x04, sp)
	and	a, #0x0f
	ld	(0x01, sp), a
	ld	a, xl
	add	a, (0x01, sp)
;	lib/rtc.c: 5: return ch;
	addw	sp, #1
	ret
;	lib/rtc.c: 8: unsigned char RTC_ConvertFromBinDec(unsigned char c){
;	-----------------------------------------
;	 function RTC_ConvertFromBinDec
;	-----------------------------------------
_RTC_ConvertFromBinDec:
	push	a
;	lib/rtc.c: 9: unsigned char ch = ((c/10)<<4)|(c%10);
	clrw	x
	ld	a, (0x04, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	swap	a
	and	a, #0xf0
	ld	(0x01, sp), a
	clrw	x
	ld	a, (0x04, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	or	a, (0x01, sp)
;	lib/rtc.c: 10: return ch;
	addw	sp, #1
	ret
;	lib/rtc.c: 18: void RTC_Read(){
;	-----------------------------------------
;	 function RTC_Read
;	-----------------------------------------
_RTC_Read:
;	lib/rtc.c: 21: i2c_start();
	call	_i2c_start
;	lib/rtc.c: 22: i2c_send_byte(0xD0);
	push	#0xd0
	call	_i2c_send_byte
	pop	a
;	lib/rtc.c: 23: i2c_send_byte(0x00);
	push	#0x00
	call	_i2c_send_byte
	pop	a
;	lib/rtc.c: 24: i2c_restart();
	call	_i2c_restart
;	lib/rtc.c: 25: i2c_send_byte(0xD1);
	push	#0xd1
	call	_i2c_send_byte
	pop	a
;	lib/rtc.c: 26: sec		= i2c_read_byte(0);
	push	#0x00
	call	_i2c_read_byte
	addw	sp, #1
	ld	_sec+0, a
;	lib/rtc.c: 27: min		= i2c_read_byte(0);
	push	#0x00
	call	_i2c_read_byte
	addw	sp, #1
	ld	_min+0, a
;	lib/rtc.c: 28: hour	= i2c_read_byte(0);
	push	#0x00
	call	_i2c_read_byte
	addw	sp, #1
	ld	_hour+0, a
;	lib/rtc.c: 29: day		= i2c_read_byte(0);
	push	#0x00
	call	_i2c_read_byte
	addw	sp, #1
	ld	_day+0, a
;	lib/rtc.c: 30: date	= i2c_read_byte(0);
	push	#0x00
	call	_i2c_read_byte
	addw	sp, #1
	ld	_date+0, a
;	lib/rtc.c: 31: month	= i2c_read_byte(0);
	push	#0x00
	call	_i2c_read_byte
	addw	sp, #1
	ld	_month+0, a
;	lib/rtc.c: 32: year	= i2c_read_byte(1);
	push	#0x01
	call	_i2c_read_byte
	addw	sp, #1
	ld	_year+0, a
;	lib/rtc.c: 33: i2c_stop();
	call	_i2c_stop
;	lib/rtc.c: 35: sec		= RTC_ConvertFromDec(sec);
	push	_sec+0
	call	_RTC_ConvertFromDec
	addw	sp, #1
	ld	_sec+0, a
;	lib/rtc.c: 36: min		= RTC_ConvertFromDec(min);
	push	_min+0
	call	_RTC_ConvertFromDec
	addw	sp, #1
	ld	_min+0, a
;	lib/rtc.c: 37: hour	= RTC_ConvertFromDec(hour);
	push	_hour+0
	call	_RTC_ConvertFromDec
	addw	sp, #1
	ld	_hour+0, a
;	lib/rtc.c: 38: day		= RTC_ConvertFromDec(day);
	push	_day+0
	call	_RTC_ConvertFromDec
	addw	sp, #1
	ld	_day+0, a
;	lib/rtc.c: 39: date	= RTC_ConvertFromDec(date);
	push	_date+0
	call	_RTC_ConvertFromDec
	addw	sp, #1
	ld	_date+0, a
;	lib/rtc.c: 40: month	= RTC_ConvertFromDec(month);
	push	_month+0
	call	_RTC_ConvertFromDec
	addw	sp, #1
	ld	_month+0, a
;	lib/rtc.c: 41: year	= RTC_ConvertFromDec(year);
	push	_year+0
	call	_RTC_ConvertFromDec
	addw	sp, #1
	ld	_year+0, a
	ret
;	lib/rtc.c: 45: void RTC_Set(unsigned char sec, unsigned char min, unsigned char hour, unsigned char day, unsigned char date, unsigned char month, unsigned char year){
;	-----------------------------------------
;	 function RTC_Set
;	-----------------------------------------
_RTC_Set:
	sub	sp, #7
;	lib/rtc.c: 46: sec		= RTC_ConvertFromBinDec(sec);
	ld	a, (0x0a, sp)
	push	a
	call	_RTC_ConvertFromBinDec
	addw	sp, #1
	ld	(0x04, sp), a
;	lib/rtc.c: 47: min		= RTC_ConvertFromBinDec(min);
	ld	a, (0x0b, sp)
	push	a
	call	_RTC_ConvertFromBinDec
	addw	sp, #1
	ld	(0x05, sp), a
;	lib/rtc.c: 48: hour	= RTC_ConvertFromBinDec(hour);
	ld	a, (0x0c, sp)
	push	a
	call	_RTC_ConvertFromBinDec
	addw	sp, #1
	ld	(0x06, sp), a
;	lib/rtc.c: 49: day		= RTC_ConvertFromBinDec(day);
	ld	a, (0x0d, sp)
	push	a
	call	_RTC_ConvertFromBinDec
	addw	sp, #1
	ld	(0x07, sp), a
;	lib/rtc.c: 50: date	= RTC_ConvertFromBinDec(date);
	ld	a, (0x0e, sp)
	push	a
	call	_RTC_ConvertFromBinDec
	addw	sp, #1
	ld	(0x03, sp), a
;	lib/rtc.c: 51: month	= RTC_ConvertFromBinDec(month);
	ld	a, (0x0f, sp)
	push	a
	call	_RTC_ConvertFromBinDec
	addw	sp, #1
	ld	(0x02, sp), a
;	lib/rtc.c: 52: year	= RTC_ConvertFromBinDec(year);
	ld	a, (0x10, sp)
	push	a
	call	_RTC_ConvertFromBinDec
	addw	sp, #1
	ld	(0x01, sp), a
;	lib/rtc.c: 54: i2c_start();
	call	_i2c_start
;	lib/rtc.c: 55: i2c_send_byte(0xD0);
	push	#0xd0
	call	_i2c_send_byte
	pop	a
;	lib/rtc.c: 56: i2c_send_byte(0x00);
	push	#0x00
	call	_i2c_send_byte
	pop	a
;	lib/rtc.c: 58: i2c_send_byte(sec);
	ld	a, (0x04, sp)
	push	a
	call	_i2c_send_byte
	pop	a
;	lib/rtc.c: 59: i2c_send_byte(min);
	ld	a, (0x05, sp)
	push	a
	call	_i2c_send_byte
	pop	a
;	lib/rtc.c: 60: i2c_send_byte(hour);
	ld	a, (0x06, sp)
	push	a
	call	_i2c_send_byte
	pop	a
;	lib/rtc.c: 61: i2c_send_byte(day);
	ld	a, (0x07, sp)
	push	a
	call	_i2c_send_byte
	pop	a
;	lib/rtc.c: 62: i2c_send_byte(date);
	ld	a, (0x03, sp)
	push	a
	call	_i2c_send_byte
	pop	a
;	lib/rtc.c: 63: i2c_send_byte(month);
	ld	a, (0x02, sp)
	push	a
	call	_i2c_send_byte
	pop	a
;	lib/rtc.c: 64: i2c_send_byte(year);
	ld	a, (0x01, sp)
	push	a
	call	_i2c_send_byte
	pop	a
;	lib/rtc.c: 65: i2c_stop();
	call	_i2c_stop
	addw	sp, #7
	ret
;	lib/rtc.c: 81: void conSec(long secin){
;	-----------------------------------------
;	 function conSec
;	-----------------------------------------
_conSec:
	sub	sp, #16
;	lib/rtc.c: 87: con_day = secin/86400;
	push	#0x80
	push	#0x51
	push	#0x01
	push	#0x00
	ldw	x, (0x19, sp)
	pushw	x
	ldw	x, (0x19, sp)
	pushw	x
	call	__divslong
	addw	sp, #8
	ldw	_con_day+2, x
	ldw	_con_day+0, y
;	lib/rtc.c: 88: secin = secin-(con_day*86400);
	push	_con_day+3
	push	_con_day+2
	push	_con_day+1
	push	_con_day+0
	push	#0x80
	push	#0x51
	push	#0x01
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x07, sp), x
	ldw	(0x05, sp), y
	ldw	y, (0x15, sp)
	ldw	x, (0x13, sp)
	subw	y, (0x07, sp)
	ld	a, xl
	sbc	a, (0x06, sp)
	rlwa	x
	sbc	a, (0x05, sp)
	ld	xh, a
	ldw	(0x15, sp), y
	ldw	(0x13, sp), x
;	lib/rtc.c: 90: con_hour = (secin/3600);
	push	#0x10
	push	#0x0e
	clrw	x
	pushw	x
	ldw	x, (0x19, sp)
	pushw	x
	ldw	x, (0x19, sp)
	pushw	x
	call	__divslong
	addw	sp, #8
	ldw	_con_hour+2, x
	ldw	_con_hour+0, y
;	lib/rtc.c: 91: con_min	 = ((secin-(3600*con_hour))/60);
	push	_con_hour+3
	push	_con_hour+2
	push	_con_hour+1
	push	_con_hour+0
	push	#0x10
	push	#0x0e
	clrw	x
	pushw	x
	call	__mullong
	addw	sp, #8
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
	ldw	y, (0x15, sp)
	ldw	(0x0f, sp), y
	ldw	y, (0x13, sp)
	ldw	(0x0d, sp), y
	ldw	y, (0x0f, sp)
	subw	y, (0x03, sp)
	ld	a, (0x0e, sp)
	sbc	a, (0x02, sp)
	ld	xl, a
	ld	a, (0x0d, sp)
	sbc	a, (0x01, sp)
	ld	xh, a
	push	#0x3c
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	y
	pushw	x
	call	__divulong
	addw	sp, #8
	ldw	_con_min+2, x
	ldw	_con_min+0, y
;	lib/rtc.c: 92: con_sec	 = (secin-(((con_hour*60)*60)+(con_min*60)));
	push	_con_min+3
	push	_con_min+2
	push	_con_min+1
	push	_con_min+0
	push	#0x3c
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	exgw	x, y
	addw	y, (0x03, sp)
	ld	a, xl
	adc	a, (0x02, sp)
	ld	(0x0a, sp), a
	ld	a, xh
	adc	a, (0x01, sp)
	ld	xh, a
	ld	a, (0x10, sp)
	pushw	y
	sub	a, (#2, sp)
	popw	y
	ld	yl, a
	ld	a, (0x0f, sp)
	pushw	y
	sbc	a, (#1, sp)
	popw	y
	ld	yh, a
	ld	a, (0x0e, sp)
	sbc	a, (0x0a, sp)
	ld	xl, a
	ld	a, (0x0d, sp)
	pushw	x
	sbc	a, (#1, sp)
	popw	x
	ld	xh, a
	ldw	_con_sec+2, y
	ldw	_con_sec+0, x
	addw	sp, #16
	ret
;	lib/rtc.c: 95: unsigned long transTime(unsigned long d, unsigned long h, unsigned long m, unsigned long s){ //d, h, m, s
;	-----------------------------------------
;	 function transTime
;	-----------------------------------------
_transTime:
	sub	sp, #4
;	lib/rtc.c: 96: return ((d*86400)+(((h*60)+m)*60+s));
	ldw	x, (0x09, sp)
	pushw	x
	ldw	x, (0x09, sp)
	pushw	x
	push	#0x80
	push	#0x51
	push	#0x01
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
	ldw	x, (0x0d, sp)
	pushw	x
	ldw	x, (0x0d, sp)
	pushw	x
	push	#0x3c
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	exgw	x, y
	addw	y, (0x11, sp)
	ld	a, xl
	adc	a, (0x10, sp)
	rlwa	x
	adc	a, (0x0f, sp)
	ld	xh, a
	pushw	y
	pushw	x
	push	#0x3c
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	exgw	x, y
	addw	y, (0x15, sp)
	ld	a, xl
	adc	a, (0x14, sp)
	rlwa	x
	adc	a, (0x13, sp)
	ld	xh, a
	addw	y, (0x03, sp)
	ld	a, xl
	adc	a, (0x02, sp)
	rlwa	x
	adc	a, (0x01, sp)
	ld	xh, a
	exgw	x, y
	addw	sp, #4
	ret
;	lib/eeprom.c: 3: void EEPROM_UNLOCK(void){
;	-----------------------------------------
;	 function EEPROM_UNLOCK
;	-----------------------------------------
_EEPROM_UNLOCK:
;	lib/eeprom.c: 5: FLASH_DUKR = 0xAE; // unlock EEPROM
	mov	0x5064+0, #0xae
;	lib/eeprom.c: 6: FLASH_DUKR = 0x56;
	mov	0x5064+0, #0x56
;	lib/eeprom.c: 8: while (!(FLASH_IAPSR & (1<<3))); // check protection off
00101$:
	ldw	x, #0x505f
	ld	a, (x)
	bcp	a, #0x08
	jreq	00101$
	ret
;	clock.c: 97: void defStart(_Bool pos){ //"r__3" стандартная функция при загрузке 
;	-----------------------------------------
;	 function defStart
;	-----------------------------------------
_defStart:
;	clock.c: 99: switch(pos) {
	ld	a, (0x03, sp)
	cp	a, #0x00
	jreq	00101$
	cp	a, #0x01
	jreq	00102$
	jra	00103$
;	clock.c: 100: case 0: clock();
00101$:
	call	_clock
;	clock.c: 101: case 1: dnClock();
00102$:
	call	_dnClock
;	clock.c: 102: default: clock();
00103$:
;	clock.c: 103: }
	jp	_clock
;	clock.c: 109: _Bool setStat(_Bool st){
;	-----------------------------------------
;	 function setStat
;	-----------------------------------------
_setStat:
	sub	sp, #6
;	clock.c: 111: TM1637_cleer();
	call	_TM1637_cleer
;	clock.c: 112: Soft_Timer = 0x00;
	clrw	x
	ldw	_Soft_Timer+0, x
;	clock.c: 113: buff = st;
	ld	a, (0x09, sp)
	ld	_buff+0, a
;	clock.c: 115: while(1){
	ldw	x, #_ASCI+0
	ldw	(0x03, sp), x
00108$:
;	clock.c: 117: if(button(up) | button(dn))buff =! buff;
	push	#0x05
	call	_button
	addw	sp, #1
	ld	(0x06, sp), a
	push	#0x07
	call	_button
	addw	sp, #1
	or	a, (0x06, sp)
	tnz	a
	jreq	00102$
	ld	a, _buff+0
	sub	a, #0x01
	clr	a
	rlc	a
	ld	_buff+0, a
00102$:
;	clock.c: 119: if(button(ok)){
	push	#0x06
	call	_button
	addw	sp, #1
	ld	(0x05, sp), a
	tnz	(0x05, sp)
	jreq	00104$
;	clock.c: 120: return buff;
	ld	a, _buff+0
	jra	00110$
00104$:
;	clock.c: 123: Soft_Timer++;
	ldw	x, _Soft_Timer+0
	incw	x
;	clock.c: 124: if(Soft_Timer == 300){
	ldw	_Soft_Timer+0, x
	cpw	x, #0x012c
	jrne	00108$
;	clock.c: 125: TM1637_sendMASS(0x50,0x08,0x00,ASCI[buff]);
	ldw	x, #_TM1637_seg+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	ld	a, #0x50
	ld	(x), a
	ldw	x, (0x01, sp)
	incw	x
	ld	a, #0x08
	ld	(x), a
	ldw	x, (0x01, sp)
	incw	x
	incw	x
	clr	(x)
	ldw	y, (0x01, sp)
	addw	y, #0x0003
	clrw	x
	ld	a, _buff+0
	ld	xl, a
	addw	x, (0x03, sp)
	ld	a, (x)
	ld	(y), a
	call	_TM1637_send
;	clock.c: 126: Soft_Timer = 0x00;
	clrw	x
	ldw	_Soft_Timer+0, x
	jra	00108$
00110$:
	addw	sp, #6
	ret
;	clock.c: 131: void main(){
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	clock.c: 133: PC_DDR &= ~(1<<ok) | (1<<dn) | (1<<up); //инициализация кнопок
	ldw	x, #0x500c
	ld	a, (x)
	and	a, #0xbf
	ld	(x), a
;	clock.c: 135: CLK_CKDIVR= 0b00001000; //Настройка тактирования на 8MHz, 
	mov	0x50c6+0, #0x08
;	clock.c: 137: TM1637_INIT();
	ldw	x, #0x500c
	ld	a, (x)
	or	a, #0x18
	ld	(x), a
	ldw	x, #0x500d
	ld	a, (x)
	or	a, #0x18
	ld	(x), a
	call	_TM1637_initialization
;	clock.c: 138: TM1637_brigh(EEPROM_DATA(setting_Brigh));
	ldw	x, #0x4000
	ld	a, (x)
	push	a
	call	_TM1637_brigh
	pop	a
;	clock.c: 139: I2C_INIT();
	ldw	x, #0x5007
	ld	a, (x)
	or	a, #0x30
	ld	(x), a
	ldw	x, #0x5008
	ld	a, (x)
	or	a, #0x30
	ld	(x), a
	call	_i2c_init
;	clock.c: 141: if(button(up) || button(dn))hard_Reset(); // Кнопки при включении зажать up + dn = hard reset
	push	#0x05
	call	_button
	addw	sp, #1
	tnz	a
	jrne	00101$
	push	#0x07
	call	_button
	addw	sp, #1
	tnz	a
	jreq	00105$
00101$:
	call	_hard_Reset
;	clock.c: 144: while(1){
00105$:
;	clock.c: 146: defStart(EEPROM_DATA(defStartER));
	ldw	x, #0x4008
	ld	a, (x)
	neg	a
	clr	a
	rlc	a
	push	a
	call	_defStart
	pop	a
	jra	00105$
	ret
;	clock.c: 154: char button(char but){ //Обработка кнопок
;	-----------------------------------------
;	 function button
;	-----------------------------------------
_button:
	sub	sp, #4
;	clock.c: 156: if(!(PC_IDR&(1<<but))){
	ldw	x, #0x500b
	ld	a, (x)
	ld	xh, a
	ldw	y, #0x0001
	ldw	(0x03, sp), y
	ld	a, (0x07, sp)
	jreq	00117$
00116$:
	sll	(0x04, sp)
	rlc	(0x03, sp)
	dec	a
	jrne	00116$
00117$:
	clr	a
	ld	xl, a
;	clock.c: 158: Buff_But &= ~(1 << but);
	ld	a, #0x01
	ld	yl, a
	ld	a, (0x07, sp)
	jreq	00119$
00118$:
	exg	a, yl
	sll	a
	exg	a, yl
	dec	a
	jrne	00118$
00119$:
;	clock.c: 156: if(!(PC_IDR&(1<<but))){
	ld	a, xh
	and	a, (0x04, sp)
	ld	(0x02, sp), a
	ld	a, xl
	and	a, (0x03, sp)
	ld	(0x01, sp), a
	ldw	x, (0x01, sp)
	jrne	00104$
;	clock.c: 157: if(Buff_But&(1 << but)){
	ld	a, _Buff_But+0
	ld	xh, a
	clr	a
	and	a, (0x03, sp)
	rlwa	x
	and	a, (0x04, sp)
	ld	xh, a
	tnzw	x
	jreq	00105$
;	clock.c: 158: Buff_But &= ~(1 << but);
	ld	a, yl
	cpl	a
	and	a, _Buff_But+0
	ld	_Buff_But+0, a
;	clock.c: 159: return but;
	ld	a, (0x07, sp)
	jra	00106$
00104$:
;	clock.c: 162: else Buff_But |= (1 << but);
	ld	a, yl
	or	a, _Buff_But+0
	ld	_Buff_But+0, a
00105$:
;	clock.c: 165: return 0;
	clr	a
00106$:
	addw	sp, #4
	ret
;	clock.c: 168: void hard_Reset(){ //default setting
;	-----------------------------------------
;	 function hard_Reset
;	-----------------------------------------
_hard_Reset:
	sub	sp, #2
;	clock.c: 170: EEPROM_UNLOCK();
	call	_EEPROM_UNLOCK
;	clock.c: 171: EEPROM_DATA(setting_Brigh) = 7;
	mov	0x4000+0, #0x07
;	clock.c: 173: EEPROM_DATA(DnClock_hour_0) = 0x00;
	mov	0x4000+0, #0x00
;	clock.c: 174: EEPROM_DATA(DnClock_min_0)	= 0x00;
	mov	0x4001+0, #0x00
;	clock.c: 176: EEPROM_DATA(DnClock_hour_1) = 0x00;
	mov	0x4002+0, #0x00
;	clock.c: 177: EEPROM_DATA(DnClock_min_1)	= 0x00;
	mov	0x4003+0, #0x00
;	clock.c: 179: EEPROM_DATA(DnClock_hour_2) = 0x00;
	mov	0x4004+0, #0x00
;	clock.c: 180: EEPROM_DATA(DnClock_min_2)	= 0x00;
	mov	0x4005+0, #0x00
;	clock.c: 182: EEPROM_DATA(DnClock_hour_3) = 0x00;
	mov	0x4006+0, #0x00
;	clock.c: 183: EEPROM_DATA(DnClock_min_3)	= 0x00;		
	mov	0x4007+0, #0x00
;	clock.c: 184: EEPROM_LOCK();
	ldw	x, #0x505f
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	clock.c: 186: RTC_Set(0, 0, 0, 1, 1, 1, 20); //reset RTC
	push	#0x14
	push	#0x01
	push	#0x01
	push	#0x01
	push	#0x00
	push	#0x00
	push	#0x00
	call	_RTC_Set
	addw	sp, #7
;	clock.c: 189: TM1637_cleer();
	call	_TM1637_cleer
;	clock.c: 190: TM1637_sendMASS(0x50,0x6D,0x78,0x00); //RESET
	ldw	x, #_TM1637_seg+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	ld	a, #0x50
	ld	(x), a
	ldw	x, (0x01, sp)
	incw	x
	ld	a, #0x6d
	ld	(x), a
	ldw	x, (0x01, sp)
	incw	x
	incw	x
	ld	a, #0x78
	ld	(x), a
	ldw	x, (0x01, sp)
	addw	x, #0x0003
	clr	(x)
	call	_TM1637_send
;	clock.c: 191: delay(99999);
	push	#0x9f
	push	#0x86
	push	#0x01
	push	#0x00
	call	_delay
	addw	sp, #4
;	clock.c: 193: WWDG_CR |= (1<<7); //software reset
	ldw	x, #0x50d1
	ld	a, (x)
	or	a, #0x80
	ld	(x), a
;	clock.c: 194: WWDG_CR = 0x40; 
	mov	0x50d1+0, #0x40
;	clock.c: 195: WWDG_CR = 0x3F;
	mov	0x50d1+0, #0x3f
	addw	sp, #2
	ret
;	clock.c: 202: char Set_time(unsigned char hourset, unsigned char minset){
;	-----------------------------------------
;	 function Set_time
;	-----------------------------------------
_Set_time:
	sub	sp, #12
;	clock.c: 204: TM1637_cleer();
	call	_TM1637_cleer
;	clock.c: 206: Soft_Timer = 0x00;
	clrw	x
	ldw	_Soft_Timer+0, x
;	clock.c: 209: while(1){
	ldw	x, #_ASCI+0
	ldw	(0x0a, sp), x
	ldw	x, #_TM1637_seg+0
	ldw	(0x08, sp), x
	clr	(0x01, sp)
00140$:
;	clock.c: 211: if(button(up)){
	push	#0x05
	call	_button
	addw	sp, #1
	ld	xh, a
;	clock.c: 216: if(Point == 1){
	ld	a, (0x01, sp)
	cp	a, #0x01
	jrne	00226$
	ld	a, #0x01
	ld	(0x0c, sp), a
	jra	00227$
00226$:
	clr	(0x0c, sp)
00227$:
;	clock.c: 211: if(button(up)){
	ld	a, xh
	tnz	a
	jreq	00110$
;	clock.c: 212: if(Point == 0){
	tnz	(0x01, sp)
	jrne	00104$
;	clock.c: 213: hourset++;
	inc	(0x0f, sp)
;	clock.c: 214: if(hourset > 23)hourset = 0;
	ld	a, (0x0f, sp)
	cp	a, #0x17
	jrule	00104$
	clr	(0x0f, sp)
00104$:
;	clock.c: 216: if(Point == 1){
	tnz	(0x0c, sp)
	jreq	00110$
;	clock.c: 217: minset++;
	inc	(0x10, sp)
;	clock.c: 218: if(minset > 59)minset = 0;
	ld	a, (0x10, sp)
	cp	a, #0x3b
	jrule	00110$
	clr	(0x10, sp)
00110$:
;	clock.c: 221: if(button(dn)){
	push	#0x07
	call	_button
	addw	sp, #1
	tnz	a
	jreq	00120$
;	clock.c: 222: if(Point == 0){
	tnz	(0x01, sp)
	jrne	00114$
;	clock.c: 223: hourset--;
	dec	(0x0f, sp)
;	clock.c: 224: if(hourset > 23)hourset = 23;
	ld	a, (0x0f, sp)
	cp	a, #0x17
	jrule	00114$
	ld	a, #0x17
	ld	(0x0f, sp), a
00114$:
;	clock.c: 226: if(Point == 1){
	tnz	(0x0c, sp)
	jreq	00120$
;	clock.c: 227: minset--;
	dec	(0x10, sp)
;	clock.c: 228: if(minset > 59)minset = 59;
	ld	a, (0x10, sp)
	cp	a, #0x3b
	jrule	00120$
	ld	a, #0x3b
	ld	(0x10, sp), a
00120$:
;	clock.c: 231: if(button(ok)){
	push	#0x06
	call	_button
	addw	sp, #1
	tnz	a
	jreq	00122$
;	clock.c: 232: Point++;
	inc	(0x01, sp)
00122$:
;	clock.c: 236: Soft_Timer++; //мигание
	ldw	x, _Soft_Timer+0
	incw	x
;	clock.c: 237: if(Soft_Timer == 80){			
	ldw	_Soft_Timer+0, x
	cpw	x, #0x0050
	jrne	00124$
;	clock.c: 238: dot = !dot;
	ld	a, _dot+0
	sub	a, #0x01
	clr	a
	rlc	a
	ld	_dot+0, a
;	clock.c: 239: Soft_Timer = 0;
	clrw	x
	ldw	_Soft_Timer+0, x
00124$:
;	clock.c: 244: if(Point<2){ 
	ld	a, (0x01, sp)
	cp	a, #0x02
	jrslt	00242$
	jp	00136$
00242$:
;	clock.c: 247: TM1637_seg[1] = 0x00;					
	ldw	x, (0x08, sp)
	incw	x
	ldw	(0x04, sp), x
;	clock.c: 245: if(Point == 0 && dot == 1){
	tnz	(0x01, sp)
	jrne	00128$
	ld	a, _dot+0
	cp	a, #0x01
	jrne	00128$
;	clock.c: 246: TM1637_seg[0] = 0x00;
	ldw	x, (0x08, sp)
	clr	(x)
;	clock.c: 247: TM1637_seg[1] = 0x00;					
	ldw	x, (0x04, sp)
	clr	(x)
	jra	00129$
00128$:
;	clock.c: 250: if(hourset/10)TM1637_seg[0] = ASCI[hourset/10];
	clrw	x
	ld	a, (0x0f, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	tnz	a
	jreq	00126$
	clr	a
	ld	xh, a
	addw	x, (0x0a, sp)
	ldw	(0x06, sp), x
	ldw	x, (0x06, sp)
	ld	a, (x)
	ldw	x, (0x08, sp)
	ld	(x), a
00126$:
;	clock.c: 251: TM1637_seg[1] = ASCI[hourset%10];		
	clrw	x
	ld	a, (0x0f, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	clrw	x
	ld	xl, a
	addw	x, (0x0a, sp)
	ld	a, (x)
	ldw	x, (0x04, sp)
	ld	(x), a
00129$:
;	clock.c: 254: TM1637_seg[1] = TM1637_seg[1] +0x80;
	ldw	x, (0x04, sp)
	ld	a, (x)
	add	a, #0x80
	ldw	x, (0x04, sp)
	ld	(x), a
;	clock.c: 257: TM1637_seg[2] = 0x00;
	ldw	x, (0x08, sp)
	incw	x
	incw	x
	ldw	(0x02, sp), x
;	clock.c: 258: TM1637_seg[3] = 0x00;					
	ldw	y, (0x08, sp)
	addw	y, #0x0003
;	clock.c: 256: if(Point == 1 && dot == 1){
	ld	a, (0x01, sp)
	cp	a, #0x01
	jrne	00132$
	ld	a, _dot+0
	cp	a, #0x01
	jrne	00132$
;	clock.c: 257: TM1637_seg[2] = 0x00;
	ldw	x, (0x02, sp)
	clr	(x)
;	clock.c: 258: TM1637_seg[3] = 0x00;					
	clr	(y)
	jra	00133$
00132$:
;	clock.c: 261: TM1637_seg[2] = ASCI[minset/10];
	clrw	x
	ld	a, (0x10, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	clr	a
	ld	xh, a
	addw	x, (0x0a, sp)
	ld	a, (x)
	ldw	x, (0x02, sp)
	ld	(x), a
;	clock.c: 262: TM1637_seg[3] = ASCI[minset%10];		
	clrw	x
	ld	a, (0x10, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	clrw	x
	ld	xl, a
	addw	x, (0x0a, sp)
	ld	a, (x)
	ld	(y), a
00133$:
;	clock.c: 264: TM1637_send();				
	call	_TM1637_send
00136$:
;	clock.c: 267: if(Point == 2){
	ld	a, (0x01, sp)
	cp	a, #0x02
	jreq	00256$
	jp	00140$
00256$:
;	clock.c: 268: Clock_Temp[0] = hourset;
	ldw	x, #_Clock_Temp+0
	ld	a, (0x0f, sp)
	ld	(x), a
;	clock.c: 269: Clock_Temp[1] = minset;
	incw	x
	ld	a, (0x10, sp)
	ld	(x), a
;	clock.c: 270: Soft_Timer = 0x00;
	clrw	x
	ldw	_Soft_Timer+0, x
;	clock.c: 271: return 1;
	ld	a, #0x01
	addw	sp, #12
	ret
;	clock.c: 277: char Set_Brigh(){
;	-----------------------------------------
;	 function Set_Brigh
;	-----------------------------------------
_Set_Brigh:
	sub	sp, #4
;	clock.c: 278: TM1637_cleer();
	call	_TM1637_cleer
;	clock.c: 279: Soft_Timer = 0x00;
	clrw	x
	ldw	_Soft_Timer+0, x
;	clock.c: 280: Point_Meny = EEPROM_DATA(setting_Brigh);
	ldw	x, #0x4000
	ld	a, (x)
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	ldw	_Point_Meny+0, x
;	clock.c: 282: auto_exit = 0;
	clr	_auto_exit+0
;	clock.c: 284: while(1){
	ldw	x, #_ASCI+0
	ldw	(0x01, sp), x
00116$:
;	clock.c: 286: if(button(up)){
	push	#0x05
	call	_button
	addw	sp, #1
	tnz	a
	jreq	00104$
;	clock.c: 287: Point_Meny++;
	ldw	x, _Point_Meny+0
	incw	x
	ldw	_Point_Meny+0, x
;	clock.c: 288: auto_exit = 0;
	clr	_auto_exit+0
;	clock.c: 289: if(Point_Meny > 7)Point_Meny = 7;
	ldw	x, _Point_Meny+0
	cpw	x, #0x0007
	jrule	00104$
	ldw	x, #0x0007
	ldw	_Point_Meny+0, x
00104$:
;	clock.c: 292: if(button(dn)){
	push	#0x07
	call	_button
	addw	sp, #1
	tnz	a
	jreq	00108$
;	clock.c: 293: Point_Meny--;
	ldw	x, _Point_Meny+0
	decw	x
	ldw	_Point_Meny+0, x
;	clock.c: 294: auto_exit = 0;
	clr	_auto_exit+0
;	clock.c: 295: if(Point_Meny > 7)Point_Meny = 0;
	ldw	x, _Point_Meny+0
	cpw	x, #0x0007
	jrule	00108$
	clrw	x
	ldw	_Point_Meny+0, x
00108$:
;	clock.c: 297: if(button(ok)){
	push	#0x06
	call	_button
	addw	sp, #1
	tnz	a
	jreq	00110$
;	clock.c: 298: auto_exit = 0;
	clr	_auto_exit+0
;	clock.c: 300: EEPROM_UNLOCK();
	call	_EEPROM_UNLOCK
;	clock.c: 301: EEPROM_DATA(setting_Brigh) = Point_Meny;
	ld	a, _Point_Meny+1
	ldw	x, #0x4000
	ld	(x), a
;	clock.c: 302: EEPROM_LOCK();
	ldw	x, #0x505f
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	clock.c: 304: return Point_Meny;
	ld	a, _Point_Meny+1
	jra	00118$
00110$:
;	clock.c: 308: Soft_Timer++;
	ldw	x, _Soft_Timer+0
	incw	x
;	clock.c: 309: if(Soft_Timer == 300){
	ldw	_Soft_Timer+0, x
	cpw	x, #0x012c
	jrne	00112$
;	clock.c: 310: TM1637_sendMASS(0x7C,0x50,0x00,ASCI[Point_Meny]);
	ldw	x, #_TM1637_seg+0
	ldw	(0x03, sp), x
	ldw	x, (0x03, sp)
	ld	a, #0x7c
	ld	(x), a
	ldw	x, (0x03, sp)
	incw	x
	ld	a, #0x50
	ld	(x), a
	ldw	x, (0x03, sp)
	incw	x
	incw	x
	clr	(x)
	ldw	y, (0x03, sp)
	addw	y, #0x0003
	ldw	x, (0x01, sp)
	addw	x, _Point_Meny+0
	ld	a, (x)
	ld	(y), a
	call	_TM1637_send
;	clock.c: 311: TM1637_brigh(Point_Meny);
	ld	a, _Point_Meny+1
	push	a
	call	_TM1637_brigh
	pop	a
;	clock.c: 312: Soft_Timer = 0x00;
	clrw	x
	ldw	_Soft_Timer+0, x
;	clock.c: 313: auto_exit++;
	ld	a, _auto_exit+0
	inc	a
	ld	_auto_exit+0, a
00112$:
;	clock.c: 317: if(auto_exit == 100){
	ld	a, _auto_exit+0
	cp	a, #0x64
	jreq	00162$
	jp	00116$
00162$:
;	clock.c: 319: TM1637_brigh(EEPROM_DATA(setting_Brigh));
	ldw	x, #0x4000
	ld	a, (x)
	push	a
	call	_TM1637_brigh
	pop	a
;	clock.c: 320: clock();
	call	_clock
	jp	00116$
00118$:
	addw	sp, #4
	ret
;	clock.c: 329: void Set_DnTimer(){ //"r__1"
;	-----------------------------------------
;	 function Set_DnTimer
;	-----------------------------------------
_Set_DnTimer:
	sub	sp, #2
;	clock.c: 330: TM1637_cleer();
	call	_TM1637_cleer
;	clock.c: 331: Point_Meny = 0;
	clrw	x
	ldw	_Point_Meny+0, x
;	clock.c: 332: Soft_Timer = 0x00;
	clrw	x
	ldw	_Soft_Timer+0, x
;	clock.c: 334: while(1){
00124$:
;	clock.c: 335: if(button(up)){
	push	#0x05
	call	_button
	addw	sp, #1
	tnz	a
	jreq	00104$
;	clock.c: 336: Point_Meny++;
	ldw	x, _Point_Meny+0
	incw	x
;	clock.c: 337: if(Point_Meny > 4)Point_Meny = 0;
	ldw	_Point_Meny+0, x
	cpw	x, #0x0004
	jrule	00104$
	clrw	x
	ldw	_Point_Meny+0, x
00104$:
;	clock.c: 340: if(button(dn)){
	push	#0x07
	call	_button
	addw	sp, #1
	tnz	a
	jreq	00108$
;	clock.c: 341: Point_Meny--;
	ldw	x, _Point_Meny+0
	decw	x
;	clock.c: 342: if(Point_Meny > 4)Point_Meny = 4;
	ldw	_Point_Meny+0, x
	cpw	x, #0x0004
	jrule	00108$
	ldw	x, #0x0004
	ldw	_Point_Meny+0, x
00108$:
;	clock.c: 345: if(button(ok)){
	push	#0x06
	call	_button
	addw	sp, #1
	tnz	a
	jrne	00180$
	jp	00120$
00180$:
;	clock.c: 348: if(Point_Meny == 0){
	ldw	x, _Point_Meny+0
	jrne	00110$
;	clock.c: 349: Set_time(EEPROM_DATA(DnClock_hour_0),EEPROM_DATA(DnClock_min_0));
	ldw	x, #0x4001
	ld	a, (x)
	ldw	x, #0x4000
	push	a
	ld	a, (x)
	ld	xh, a
	push	a
	call	_Set_time
	addw	sp, #2
;	clock.c: 350: EEPROM_UNLOCK();
	call	_EEPROM_UNLOCK
;	clock.c: 351: EEPROM_DATA(DnClock_hour_0) = Clock_Temp[0];
	ldw	x, #_Clock_Temp+0
	ld	a, (x)
	ldw	y, #0x4000
	ld	(y), a
;	clock.c: 352: EEPROM_DATA(DnClock_min_0)	= Clock_Temp[1];
	ld	a, (0x1, x)
	ldw	x, #0x4001
	ld	(x), a
;	clock.c: 353: EEPROM_LOCK();
	ldw	x, #0x505f
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	clock.c: 354: Point_Meny = 0;
	clrw	x
	ldw	_Point_Meny+0, x
00110$:
;	clock.c: 357: if(Point_Meny == 1){
	ldw	x, _Point_Meny+0
	cpw	x, #0x0001
	jrne	00112$
;	clock.c: 358: Set_time(EEPROM_DATA(DnClock_hour_1),EEPROM_DATA(DnClock_min_1));
	ldw	x, #0x4003
	ld	a, (x)
	ldw	x, #0x4002
	push	a
	ld	a, (x)
	ld	xh, a
	push	a
	call	_Set_time
	addw	sp, #2
;	clock.c: 359: EEPROM_UNLOCK();
	call	_EEPROM_UNLOCK
;	clock.c: 360: EEPROM_DATA(DnClock_hour_1) = Clock_Temp[0];
	ldw	x, #_Clock_Temp+0
	ld	a, (x)
	ldw	y, #0x4002
	ld	(y), a
;	clock.c: 361: EEPROM_DATA(DnClock_min_1)	= Clock_Temp[1];
	ld	a, (0x1, x)
	ldw	x, #0x4003
	ld	(x), a
;	clock.c: 362: EEPROM_LOCK();
	ldw	x, #0x505f
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	clock.c: 363: Point_Meny = 1;
	ldw	x, #0x0001
	ldw	_Point_Meny+0, x
00112$:
;	clock.c: 366: if(Point_Meny == 2){
	ldw	x, _Point_Meny+0
	cpw	x, #0x0002
	jrne	00114$
;	clock.c: 367: Set_time(EEPROM_DATA(DnClock_hour_2),EEPROM_DATA(DnClock_min_2));
	ldw	x, #0x4005
	ld	a, (x)
	ldw	x, #0x4004
	push	a
	ld	a, (x)
	ld	xh, a
	push	a
	call	_Set_time
	addw	sp, #2
;	clock.c: 368: EEPROM_UNLOCK();
	call	_EEPROM_UNLOCK
;	clock.c: 369: EEPROM_DATA(DnClock_hour_2) = Clock_Temp[0];
	ldw	x, #_Clock_Temp+0
	ld	a, (x)
	ldw	y, #0x4004
	ld	(y), a
;	clock.c: 370: EEPROM_DATA(DnClock_min_2)	= Clock_Temp[1];
	ld	a, (0x1, x)
	ldw	x, #0x4005
	ld	(x), a
;	clock.c: 371: EEPROM_LOCK();
	ldw	x, #0x505f
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	clock.c: 372: Point_Meny = 2;
	ldw	x, #0x0002
	ldw	_Point_Meny+0, x
00114$:
;	clock.c: 375: if(Point_Meny == 3){
	ldw	x, _Point_Meny+0
	cpw	x, #0x0003
	jrne	00116$
;	clock.c: 376: Set_time(EEPROM_DATA(DnClock_hour_3),EEPROM_DATA(DnClock_min_3));
	ldw	x, #0x4007
	ld	a, (x)
	ldw	x, #0x4006
	push	a
	ld	a, (x)
	ld	xh, a
	push	a
	call	_Set_time
	addw	sp, #2
;	clock.c: 377: EEPROM_UNLOCK();
	call	_EEPROM_UNLOCK
;	clock.c: 378: EEPROM_DATA(DnClock_hour_3) = Clock_Temp[0];
	ldw	x, #_Clock_Temp+0
	ld	a, (x)
	ldw	y, #0x4006
	ld	(y), a
;	clock.c: 379: EEPROM_DATA(DnClock_min_3)	= Clock_Temp[1];
	ld	a, (0x1, x)
	ldw	x, #0x4007
	ld	(x), a
;	clock.c: 380: EEPROM_LOCK();
	ldw	x, #0x505f
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	clock.c: 381: Point_Meny = 3;
	ldw	x, #0x0003
	ldw	_Point_Meny+0, x
00116$:
;	clock.c: 387: if(Point_Meny == 4)clock(); //exit
	ldw	x, _Point_Meny+0
	cpw	x, #0x0004
	jrne	00120$
	call	_clock
00120$:
;	clock.c: 394: Soft_Timer++;
	ldw	x, _Soft_Timer+0
	incw	x
;	clock.c: 395: if(Soft_Timer == 300){
	ldw	_Soft_Timer+0, x
	cpw	x, #0x012c
	jreq	00196$
	jp	00124$
00196$:
;	clock.c: 396: TM1637_sendMASS(0x5E,0x78,0x08,ASCI[Point_Meny]);
	ldw	x, #_TM1637_seg+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	ld	a, #0x5e
	ld	(x), a
	ldw	x, (0x01, sp)
	incw	x
	ld	a, #0x78
	ld	(x), a
	ldw	x, (0x01, sp)
	incw	x
	incw	x
	ld	a, #0x08
	ld	(x), a
	ldw	y, (0x01, sp)
	addw	y, #0x0003
	ldw	x, #_ASCI+0
	addw	x, _Point_Meny+0
	ld	a, (x)
	ld	(y), a
	call	_TM1637_send
;	clock.c: 397: Soft_Timer = 0x00;
	clrw	x
	ldw	_Soft_Timer+0, x
	jp	00124$
	addw	sp, #2
	ret
;	clock.c: 402: void Set_Meny(){ //Настройки "C__2"
;	-----------------------------------------
;	 function Set_Meny
;	-----------------------------------------
_Set_Meny:
	sub	sp, #2
;	clock.c: 404: TM1637_cleer();
	call	_TM1637_cleer
;	clock.c: 405: Point_Meny = 0;
	clrw	x
	ldw	_Point_Meny+0, x
;	clock.c: 406: Soft_Timer = 0x00;
	clrw	x
	ldw	_Soft_Timer+0, x
;	clock.c: 408: while(1){
00126$:
;	clock.c: 410: if(button(up)){
	push	#0x05
	call	_button
	addw	sp, #1
	tnz	a
	jreq	00104$
;	clock.c: 411: Point_Meny++;
	ldw	x, _Point_Meny+0
	incw	x
;	clock.c: 412: if(Point_Meny > 5)Point_Meny = 0;
	ldw	_Point_Meny+0, x
	cpw	x, #0x0005
	jrule	00104$
	clrw	x
	ldw	_Point_Meny+0, x
00104$:
;	clock.c: 415: if(button(dn)){
	push	#0x07
	call	_button
	addw	sp, #1
	tnz	a
	jreq	00108$
;	clock.c: 416: Point_Meny--;
	ldw	x, _Point_Meny+0
	decw	x
;	clock.c: 417: if(Point_Meny > 5)Point_Meny = 5;
	ldw	_Point_Meny+0, x
	cpw	x, #0x0005
	jrule	00108$
	ldw	x, #0x0005
	ldw	_Point_Meny+0, x
00108$:
;	clock.c: 420: if(button(ok)){
	push	#0x06
	call	_button
	addw	sp, #1
	tnz	a
	jrne	00186$
	jp	00122$
00186$:
;	clock.c: 422: if(Point_Meny == 0){ //тут настройка RTC
	ldw	x, _Point_Meny+0
	jrne	00110$
;	clock.c: 423: RTC_Read();
	call	_RTC_Read
;	clock.c: 424: Set_time(hour,min);
	push	_min+0
	push	_hour+0
	call	_Set_time
	addw	sp, #2
;	clock.c: 425: RTC_Set(0, Clock_Temp[1], Clock_Temp[0], 1, 1, 1, 20);
	ldw	x, #_Clock_Temp+0
	ld	a, (x)
	push	a
	ld	a, (0x1, x)
	ld	xl, a
	pop	a
	push	#0x14
	push	#0x01
	push	#0x01
	push	#0x01
	push	a
	ld	a, xl
	push	a
	push	#0x00
	call	_RTC_Set
	addw	sp, #7
;	clock.c: 426: clock();
	call	_clock
00110$:
;	clock.c: 429: if(Point_Meny == 1)Set_DnTimer();
	ldw	x, _Point_Meny+0
	cpw	x, #0x0001
	jrne	00112$
	call	_Set_DnTimer
00112$:
;	clock.c: 431: if(Point_Meny == 3){ //Настройка загрузки при включении "r__3"
	ldw	x, _Point_Meny+0
	cpw	x, #0x0003
	jrne	00114$
;	clock.c: 432: EEPROM_UNLOCK();
	call	_EEPROM_UNLOCK
;	clock.c: 433: EEPROM_DATA(defStartER) = setStat(EEPROM_DATA(defStartER)); 
	ldw	x, #0x4008
	ld	a, (x)
	neg	a
	clr	a
	rlc	a
	push	a
	call	_setStat
	addw	sp, #1
	ldw	x, #0x4008
	ld	(x), a
;	clock.c: 434: EEPROM_LOCK();
	ldw	x, #0x505f
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
00114$:
;	clock.c: 437: if(Point_Meny == 4){ //Настройка выключение высшего разряда времени "r__4"
	ldw	x, _Point_Meny+0
	cpw	x, #0x0004
	jrne	00116$
;	clock.c: 438: EEPROM_UNLOCK();
	call	_EEPROM_UNLOCK
;	clock.c: 439: EEPROM_DATA(UpLevel) = setStat(EEPROM_DATA(UpLevel)); 
	ldw	x, #0x4009
	ld	a, (x)
	neg	a
	clr	a
	rlc	a
	push	a
	call	_setStat
	addw	sp, #1
	ldw	x, #0x4009
	ld	(x), a
;	clock.c: 440: EEPROM_LOCK();
	ldw	x, #0x505f
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
00116$:
;	clock.c: 444: if(Point_Meny == 5) clock();
	ldw	x, _Point_Meny+0
	cpw	x, #0x0005
	jrne	00118$
	call	_clock
00118$:
;	clock.c: 445: if(Point_Meny == 2){
	ldw	x, _Point_Meny+0
	cpw	x, #0x0002
	jrne	00122$
;	clock.c: 446: Set_Brigh();
	call	_Set_Brigh
;	clock.c: 447: clock();
	call	_clock
00122$:
;	clock.c: 453: Soft_Timer++;
	ldw	x, _Soft_Timer+0
	incw	x
;	clock.c: 454: if(Soft_Timer == 300){
	ldw	_Soft_Timer+0, x
	cpw	x, #0x012c
	jreq	00205$
	jp	00126$
00205$:
;	clock.c: 455: TM1637_sendMASS(0x50,0x08,0x08,ASCI[Point_Meny]);
	ldw	x, #_TM1637_seg+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	ld	a, #0x50
	ld	(x), a
	ldw	x, (0x01, sp)
	incw	x
	ld	a, #0x08
	ld	(x), a
	ldw	x, (0x01, sp)
	incw	x
	incw	x
	ld	a, #0x08
	ld	(x), a
	ldw	y, (0x01, sp)
	addw	y, #0x0003
	ldw	x, #_ASCI+0
	addw	x, _Point_Meny+0
	ld	a, (x)
	ld	(y), a
	call	_TM1637_send
;	clock.c: 456: Soft_Timer = 0x00;
	clrw	x
	ldw	_Soft_Timer+0, x
	jp	00126$
	addw	sp, #2
	ret
;	clock.c: 462: void Meny(){ //Меню
;	-----------------------------------------
;	 function Meny
;	-----------------------------------------
_Meny:
	sub	sp, #2
;	clock.c: 464: TM1637_cleer();
	call	_TM1637_cleer
;	clock.c: 465: Point_Meny = 0;
	clrw	x
	ldw	_Point_Meny+0, x
;	clock.c: 466: Soft_Timer = 0x00;
	clrw	x
	ldw	_Soft_Timer+0, x
;	clock.c: 468: while(1){
00121$:
;	clock.c: 470: if(button(up)){
	push	#0x05
	call	_button
	addw	sp, #1
	tnz	a
	jreq	00104$
;	clock.c: 471: Point_Meny++;
	ldw	x, _Point_Meny+0
	incw	x
;	clock.c: 472: if(Point_Meny > 3)Point_Meny = 0;
	ldw	_Point_Meny+0, x
	cpw	x, #0x0003
	jrule	00104$
	clrw	x
	ldw	_Point_Meny+0, x
00104$:
;	clock.c: 475: if(button(dn)){
	push	#0x07
	call	_button
	addw	sp, #1
	tnz	a
	jreq	00108$
;	clock.c: 476: Point_Meny--;
	ldw	x, _Point_Meny+0
	decw	x
;	clock.c: 477: if(Point_Meny > 3)Point_Meny = 3;
	ldw	_Point_Meny+0, x
	cpw	x, #0x0003
	jrule	00108$
	ldw	x, #0x0003
	ldw	_Point_Meny+0, x
00108$:
;	clock.c: 480: if(button(ok)){
	push	#0x06
	call	_button
	addw	sp, #1
	tnz	a
	jreq	00117$
;	clock.c: 481: if(Point_Meny == 0)dnClock(); //обратные часы "С__0"
	ldw	x, _Point_Meny+0
	jrne	00110$
	call	_dnClock
00110$:
;	clock.c: 482: if(Point_Meny == 1 || Point_Meny == 3)clock(); //Часы "C__1"
	ldw	x, _Point_Meny+0
	cpw	x, #0x0001
	jreq	00111$
	ldw	x, _Point_Meny+0
	cpw	x, #0x0003
	jrne	00112$
00111$:
	call	_clock
00112$:
;	clock.c: 483: if(Point_Meny == 2) Set_Meny(); //Настройки "C__2"
	ldw	x, _Point_Meny+0
	cpw	x, #0x0002
	jrne	00117$
	call	_Set_Meny
00117$:
;	clock.c: 488: Soft_Timer++;
	ldw	x, _Soft_Timer+0
	incw	x
;	clock.c: 489: if(Soft_Timer == 300){
	ldw	_Soft_Timer+0, x
	cpw	x, #0x012c
	jrne	00121$
;	clock.c: 490: TM1637_sendMASS(0x39,0x08,0x08,ASCI[Point_Meny]);
	ldw	x, #_TM1637_seg+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	ld	a, #0x39
	ld	(x), a
	ldw	x, (0x01, sp)
	incw	x
	ld	a, #0x08
	ld	(x), a
	ldw	x, (0x01, sp)
	incw	x
	incw	x
	ld	a, #0x08
	ld	(x), a
	ldw	y, (0x01, sp)
	addw	y, #0x0003
	ldw	x, #_ASCI+0
	addw	x, _Point_Meny+0
	ld	a, (x)
	ld	(y), a
	call	_TM1637_send
;	clock.c: 491: Soft_Timer = 0x00;
	clrw	x
	ldw	_Soft_Timer+0, x
	jp	00121$
	addw	sp, #2
	ret
;	clock.c: 497: void clock(void){
;	-----------------------------------------
;	 function clock
;	-----------------------------------------
_clock:
	sub	sp, #6
;	clock.c: 499: TM1637_cleer();
	call	_TM1637_cleer
;	clock.c: 500: Soft_Timer = 0x00; //Сброс таймера
	clrw	x
	ldw	_Soft_Timer+0, x
;	clock.c: 502: while(1){
00116$:
;	clock.c: 504: Soft_Timer++;
	ldw	x, _Soft_Timer+0
	incw	x
	ldw	_Soft_Timer+0, x
;	clock.c: 509: if(button(up))Set_Brigh();
	push	#0x05
	call	_button
	addw	sp, #1
	tnz	a
	jreq	00102$
	call	_Set_Brigh
00102$:
;	clock.c: 510: if(button(dn))Set_Brigh();
	push	#0x07
	call	_button
	addw	sp, #1
	tnz	a
	jreq	00104$
	call	_Set_Brigh
00104$:
;	clock.c: 511: if(button(ok))Meny();
	push	#0x06
	call	_button
	addw	sp, #1
	tnz	a
	jreq	00106$
	call	_Meny
00106$:
;	clock.c: 513: if(Soft_Timer == 12000){ // Отображение времени при значении Программного таймера
	ldw	x, _Soft_Timer+0
	cpw	x, #0x2ee0
	jrne	00116$
;	clock.c: 514: RTC_Read();
	call	_RTC_Read
;	clock.c: 515: dot = !dot;
	ld	a, _dot+0
	sub	a, #0x01
	clr	a
	rlc	a
	ld	_dot+0, a
;	clock.c: 518: TM1637_seg[0] = ASCI[hour/10];
	ldw	x, #_TM1637_seg+0
	ldw	(0x05, sp), x
	ldw	x, #_ASCI+0
	ldw	(0x03, sp), x
	clrw	x
	ld	a, _hour+0
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	clr	a
	ld	xh, a
	addw	x, (0x03, sp)
	ld	a, (x)
	ldw	x, (0x05, sp)
	ld	(x), a
;	clock.c: 519: TM1637_seg[1] = ASCI[hour%10];
	ldw	x, (0x05, sp)
	incw	x
	ldw	(0x01, sp), x
	clrw	x
	ld	a, _hour+0
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	clrw	x
	ld	xl, a
	addw	x, (0x03, sp)
	ld	a, (x)
	ldw	x, (0x01, sp)
	ld	(x), a
;	clock.c: 520: TM1637_seg[2] = ASCI[min/10];
	ldw	y, (0x05, sp)
	addw	y, #0x0002
	clrw	x
	ld	a, _min+0
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	clr	a
	ld	xh, a
	addw	x, (0x03, sp)
	ld	a, (x)
	ld	(y), a
;	clock.c: 521: TM1637_seg[3] = ASCI[min%10];
	ldw	y, (0x05, sp)
	addw	y, #0x0003
	clrw	x
	ld	a, _min+0
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	clrw	x
	ld	xl, a
	addw	x, (0x03, sp)
	ld	a, (x)
	ld	(y), a
;	clock.c: 523: if(EEPROM_DATA(UpLevel))if(hour<10)	TM1637_seg[0] =  0x00; //Отключение первого разряда если в нем 0
	ldw	x, #0x4009
	ld	a, (x)
	tnz	a
	jreq	00110$
	ld	a, _hour+0
	cp	a, #0x0a
	jrnc	00110$
	ldw	x, (0x05, sp)
	clr	(x)
00110$:
;	clock.c: 524: if(dot) TM1637_seg[1] = TM1637_seg[1] + 0x80; //Включение секундных точек
	btjt	_dot+0, #0, 00160$
	jra	00112$
00160$:
	ldw	x, (0x01, sp)
	ld	a, (x)
	add	a, #0x80
	ldw	x, (0x01, sp)
	ld	(x), a
00112$:
;	clock.c: 526: TM1637_send();
	call	_TM1637_send
;	clock.c: 527: Soft_Timer = 0x00; //Сброс таймера
	clrw	x
	ldw	_Soft_Timer+0, x
	jp	00116$
	addw	sp, #6
	ret
;	clock.c: 535: void dnClock(void){
;	-----------------------------------------
;	 function dnClock
;	-----------------------------------------
_dnClock:
	sub	sp, #66
;	clock.c: 537: TM1637_cleer();
	call	_TM1637_cleer
;	clock.c: 538: Soft_Timer = 0x00; //Сброс таймера
	clrw	x
	ldw	_Soft_Timer+0, x
;	clock.c: 539: PointTimer = 0;
	clr	_PointTimer+0
;	clock.c: 541: DnClock_Tim_0 = transTime(0,EEPROM_DATA(DnClock_hour_0),EEPROM_DATA(DnClock_min_0),0);
	ldw	x, #0x4001
	ld	a, (x)
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	ld	(0x35, sp), a
	ld	(0x34, sp), a
	ldw	y, #0x4000
	ld	a, (y)
	ld	(0x2d, sp), a
	ld	a, (0x2d, sp)
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x2c, sp), a
	ld	yl, a
	ld	yh, a
	push	#0x00
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	ldw	x, (0x3a, sp)
	pushw	x
	ldw	x, (0x34, sp)
	pushw	x
	pushw	y
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	call	_transTime
	addw	sp, #16
	ldw	_DnClock_Tim_0+2, x
	ldw	_DnClock_Tim_0+0, y
;	clock.c: 542: DnClock_Tim_1 = transTime(0,EEPROM_DATA(DnClock_hour_1),EEPROM_DATA(DnClock_min_1),0);
	ldw	x, #0x4003
	ld	a, (x)
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	ld	(0x0a, sp), a
	ld	(0x09, sp), a
	ldw	y, #0x4002
	ld	a, (y)
	ld	(0x41, sp), a
	ld	a, (0x41, sp)
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x40, sp), a
	ld	yl, a
	ld	yh, a
	push	#0x00
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	ldw	x, (0x0f, sp)
	pushw	x
	ldw	x, (0x48, sp)
	pushw	x
	pushw	y
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	call	_transTime
	addw	sp, #16
	ldw	_DnClock_Tim_1+2, x
	ldw	_DnClock_Tim_1+0, y
;	clock.c: 543: DnClock_Tim_2 = transTime(0,EEPROM_DATA(DnClock_hour_2),EEPROM_DATA(DnClock_min_2),0);
	ldw	x, #0x4005
	ld	a, (x)
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	ld	(0x27, sp), a
	ld	(0x26, sp), a
	ldw	y, #0x4004
	ld	a, (y)
	ld	(0x06, sp), a
	ld	a, (0x06, sp)
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x05, sp), a
	ld	yl, a
	ld	yh, a
	push	#0x00
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	ldw	x, (0x2c, sp)
	pushw	x
	ldw	x, (0x0d, sp)
	pushw	x
	pushw	y
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	call	_transTime
	addw	sp, #16
	ldw	_DnClock_Tim_2+2, x
	ldw	_DnClock_Tim_2+0, y
;	clock.c: 544: DnClock_Tim_3 = transTime(0,EEPROM_DATA(DnClock_hour_3),EEPROM_DATA(DnClock_min_3),0);
	ldw	x, #0x4007
	ld	a, (x)
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	ld	(0x0e, sp), a
	ld	(0x0d, sp), a
	ldw	y, #0x4006
	ld	a, (y)
	ld	(0x22, sp), a
	ld	a, (0x22, sp)
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x21, sp), a
	ld	yl, a
	ld	yh, a
	push	#0x00
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	ldw	x, (0x13, sp)
	pushw	x
	ldw	x, (0x29, sp)
	pushw	x
	pushw	y
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	call	_transTime
	addw	sp, #16
	ldw	_DnClock_Tim_3+2, x
	ldw	_DnClock_Tim_3+0, y
;	clock.c: 546: while(1){
00128$:
;	clock.c: 548: Soft_Timer++;
	ldw	x, _Soft_Timer+0
	incw	x
	ldw	_Soft_Timer+0, x
;	clock.c: 550: if(button(ok))Meny();
	push	#0x06
	call	_button
	addw	sp, #1
	tnz	a
	jreq	00102$
	call	_Meny
00102$:
;	clock.c: 552: if(button(up)){
	push	#0x05
	call	_button
	addw	sp, #1
	ld	(0x19, sp), a
	tnz	(0x19, sp)
	jreq	00104$
;	clock.c: 553: TM1637_sendMASS(0x78,0x50,0x08,ASCI[PointTimer]);
	ldw	x, #_TM1637_seg+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	ld	a, #0x78
	ld	(x), a
	ldw	x, (0x01, sp)
	incw	x
	ld	a, #0x50
	ld	(x), a
	ldw	x, (0x01, sp)
	incw	x
	incw	x
	ld	a, #0x08
	ld	(x), a
	ldw	y, (0x01, sp)
	addw	y, #0x0003
	ldw	x, #_ASCI+0
	ld	a, xl
	add	a, _PointTimer+0
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, (x)
	ld	(y), a
	call	_TM1637_send
;	clock.c: 554: delay(9000);
	push	#0x28
	push	#0x23
	clrw	x
	pushw	x
	call	_delay
	addw	sp, #4
00104$:
;	clock.c: 558: if(Soft_Timer == 15000){ // Отображение времени при значении Программного таймера
	ldw	x, _Soft_Timer+0
	cpw	x, #0x3a98
	jrne	00128$
;	clock.c: 559: RTC_Read();
	call	_RTC_Read
;	clock.c: 562: timeToSec = transTime(0,hour,min,sec);
	clrw	x
	ld	a, _sec+0
	ld	xl, a
	clr	(0x31, sp)
	clr	(0x30, sp)
	ld	a, _min+0
	ld	(0x18, sp), a
	clr	(0x17, sp)
	clrw	y
	ld	a, _hour+0
	ld	(0x3b, sp), a
	clr	(0x3a, sp)
	clr	(0x39, sp)
	clr	(0x38, sp)
	pushw	x
	ldw	x, (0x32, sp)
	pushw	x
	ldw	x, (0x1b, sp)
	pushw	x
	pushw	y
	ldw	x, (0x42, sp)
	pushw	x
	ldw	x, (0x42, sp)
	pushw	x
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	call	_transTime
	addw	sp, #16
	ldw	_timeToSec+2, x
	ldw	_timeToSec+0, y
;	clock.c: 563: dot = !dot;
	ld	a, _dot+0
	sub	a, #0x01
	clr	a
	rlc	a
	ld	_dot+0, a
;	clock.c: 564: PointTimer = 0x00;
	clr	_PointTimer+0
;	clock.c: 567: if( timeToSec+1 > DnClock_Tim_0 & timeToSec < DnClock_Tim_1) PointTimer = 1; //От начало смены до начало обеда
	ldw	x, _timeToSec+2
	addw	x, #0x0001
	ldw	(0x1d, sp), x
	ld	a, _timeToSec+1
	adc	a, #0x00
	ld	(0x1c, sp), a
	ld	a, _timeToSec+0
	adc	a, #0x00
	ld	(0x1b, sp), a
	ldw	x, _DnClock_Tim_0+2
	cpw	x, (0x1d, sp)
	ld	a, _DnClock_Tim_0+1
	sbc	a, (0x1c, sp)
	ld	a, _DnClock_Tim_0+0
	sbc	a, (0x1b, sp)
	jrc	00193$
	clr	(0x1a, sp)
	jra	00194$
00193$:
	ld	a, #0x01
	ld	(0x1a, sp), a
00194$:
	ldw	x, _timeToSec+2
	cpw	x, _DnClock_Tim_1+2
	ld	a, _timeToSec+1
	sbc	a, _DnClock_Tim_1+1
	ld	a, _timeToSec+0
	sbc	a, _DnClock_Tim_1+0
	jrc	00195$
	clr	a
	jra	00196$
00195$:
	ld	a, #0x01
00196$:
	and	a, (0x1a, sp)
	tnz	a
	jreq	00106$
	mov	_PointTimer+0, #0x01
00106$:
;	clock.c: 569: if( timeToSec+1 > DnClock_Tim_1 & timeToSec < DnClock_Tim_2) PointTimer = 2; //от начала обеда до  конца обеда;
	ldw	x, _DnClock_Tim_1+2
	cpw	x, (0x1d, sp)
	ld	a, _DnClock_Tim_1+1
	sbc	a, (0x1c, sp)
	ld	a, _DnClock_Tim_1+0
	sbc	a, (0x1b, sp)
	jrc	00198$
	clr	(0x23, sp)
	jra	00199$
00198$:
	ld	a, #0x01
	ld	(0x23, sp), a
00199$:
	ldw	x, _timeToSec+2
	cpw	x, _DnClock_Tim_2+2
	ld	a, _timeToSec+1
	sbc	a, _DnClock_Tim_2+1
	ld	a, _timeToSec+0
	sbc	a, _DnClock_Tim_2+0
	jrc	00200$
	clr	a
	jra	00201$
00200$:
	ld	a, #0x01
00201$:
	and	a, (0x23, sp)
	tnz	a
	jreq	00108$
	mov	_PointTimer+0, #0x02
00108$:
;	clock.c: 571: if( timeToSec+1 > DnClock_Tim_2 & timeToSec < DnClock_Tim_3) PointTimer = 3; //от конца  обеда до  конца смены
	ldw	x, _DnClock_Tim_2+2
	cpw	x, (0x1d, sp)
	ld	a, _DnClock_Tim_2+1
	sbc	a, (0x1c, sp)
	ld	a, _DnClock_Tim_2+0
	sbc	a, (0x1b, sp)
	jrc	00203$
	clr	(0x42, sp)
	jra	00204$
00203$:
	ld	a, #0x01
	ld	(0x42, sp), a
00204$:
	ldw	x, _timeToSec+2
	cpw	x, _DnClock_Tim_3+2
	ld	a, _timeToSec+1
	sbc	a, _DnClock_Tim_3+1
	ld	a, _timeToSec+0
	sbc	a, _DnClock_Tim_3+0
	jrc	00205$
	clr	a
	jra	00206$
00205$:
	ld	a, #0x01
00206$:
	and	a, (0x42, sp)
	tnz	a
	jreq	00110$
	mov	_PointTimer+0, #0x03
00110$:
;	clock.c: 574: switch (PointTimer) {
	ld	a, _PointTimer+0
	cp	a, #0x01
	jreq	00111$
	ld	a, _PointTimer+0
	cp	a, #0x02
	jreq	00112$
	ld	a, _PointTimer+0
	cp	a, #0x03
	jreq	00113$
	jra	00114$
;	clock.c: 575: case 1: timeRes = DnClock_Tim_1 - timeToSec; break;
00111$:
	ldw	y, _DnClock_Tim_1+2
	subw	y, _timeToSec+2
	ld	a, _DnClock_Tim_1+1
	sbc	a, _timeToSec+1
	ld	xl, a
	ld	a, _DnClock_Tim_1+0
	sbc	a, _timeToSec+0
	ld	xh, a
	ldw	_timeRes+2, y
	ldw	_timeRes+0, x
	jra	00115$
;	clock.c: 576: case 2: timeRes = DnClock_Tim_2 - timeToSec; break;
00112$:
	ldw	y, _DnClock_Tim_2+2
	subw	y, _timeToSec+2
	ld	a, _DnClock_Tim_2+1
	sbc	a, _timeToSec+1
	ld	xl, a
	ld	a, _DnClock_Tim_2+0
	sbc	a, _timeToSec+0
	ld	xh, a
	ldw	_timeRes+2, y
	ldw	_timeRes+0, x
	jra	00115$
;	clock.c: 577: case 3: timeRes = DnClock_Tim_3 - timeToSec; break;
00113$:
	ldw	y, _DnClock_Tim_3+2
	subw	y, _timeToSec+2
	ld	a, _DnClock_Tim_3+1
	sbc	a, _timeToSec+1
	ld	xl, a
	ld	a, _DnClock_Tim_3+0
	sbc	a, _timeToSec+0
	ld	xh, a
	ldw	_timeRes+2, y
	ldw	_timeRes+0, x
	jra	00115$
;	clock.c: 579: default: timeRes = 0; break;
00114$:
	clrw	x
	ldw	_timeRes+2, x
	ldw	_timeRes+0, x
;	clock.c: 580: }
00115$:
;	clock.c: 583: if(timeRes>0){
	ldw	x, _timeRes+2
	jrne	00217$
	ldw	x, _timeRes+0
	jrne	00217$
	jp	00123$
00217$:
;	clock.c: 584: conSec(timeRes);
	push	_timeRes+3
	push	_timeRes+2
	push	_timeRes+1
	push	_timeRes+0
	call	_conSec
	addw	sp, #4
;	clock.c: 585: TM1637_seg[0] = ASCI[con_hour/10];
	ldw	x, #_TM1637_seg+0
	ldw	(0x24, sp), x
	ldw	x, #_ASCI+0
	ldw	(0x2e, sp), x
	push	#0x0a
	clrw	x
	pushw	x
	push	#0x00
	push	_con_hour+3
	push	_con_hour+2
	push	_con_hour+1
	push	_con_hour+0
	call	__divulong
	addw	sp, #8
	addw	x, (0x2e, sp)
	ld	a, (x)
	ldw	x, (0x24, sp)
	ld	(x), a
;	clock.c: 586: TM1637_seg[1] = ASCI[con_hour%10];
	ldw	x, (0x24, sp)
	incw	x
	ldw	(0x11, sp), x
	push	#0x0a
	clrw	x
	pushw	x
	push	#0x00
	push	_con_hour+3
	push	_con_hour+2
	push	_con_hour+1
	push	_con_hour+0
	call	__modulong
	addw	sp, #8
	addw	x, (0x2e, sp)
	ld	a, (x)
	ldw	x, (0x11, sp)
	ld	(x), a
;	clock.c: 587: TM1637_seg[2] = ASCI[con_min/10];
	ldw	x, (0x24, sp)
	incw	x
	incw	x
	ldw	(0x3c, sp), x
	push	#0x0a
	clrw	x
	pushw	x
	push	#0x00
	push	_con_min+3
	push	_con_min+2
	push	_con_min+1
	push	_con_min+0
	call	__divulong
	addw	sp, #8
	addw	x, (0x2e, sp)
	ld	a, (x)
	ldw	x, (0x3c, sp)
	ld	(x), a
;	clock.c: 588: TM1637_seg[3] = ASCI[con_min%10];
	ldw	x, (0x24, sp)
	addw	x, #0x0003
	ldw	(0x13, sp), x
	push	#0x0a
	clrw	x
	pushw	x
	push	#0x00
	push	_con_min+3
	push	_con_min+2
	push	_con_min+1
	push	_con_min+0
	call	__modulong
	addw	sp, #8
	addw	x, (0x2e, sp)
	ld	a, (x)
	ldw	x, (0x13, sp)
	ld	(x), a
;	clock.c: 589: if(EEPROM_DATA(UpLevel))if(con_hour<10)	TM1637_seg[0] =  0x00; //Отключение первого разряда если в нем 0
	ldw	x, #0x4009
	ld	a, (x)
	tnz	a
	jreq	00119$
	ldw	x, _con_hour+2
	cpw	x, #0x000a
	ld	a, _con_hour+1
	sbc	a, #0x00
	ld	a, _con_hour+0
	sbc	a, #0x00
	jrnc	00119$
	ldw	x, (0x24, sp)
	clr	(x)
00119$:
;	clock.c: 590: if(dot) TM1637_seg[1] = TM1637_seg[1] + 0x80; //Включение секундных точек
	btjt	_dot+0, #0, 00220$
	jra	00124$
00220$:
	ldw	x, (0x11, sp)
	ld	a, (x)
	add	a, #0x80
	ldw	x, (0x11, sp)
	ld	(x), a
	jra	00124$
00123$:
;	clock.c: 593: TM1637_seg[0] = 0x40;
	ldw	x, #_TM1637_seg+0
	ldw	(0x07, sp), x
	ldw	x, (0x07, sp)
	ld	a, #0x40
	ld	(x), a
;	clock.c: 594: TM1637_seg[1] = 0x40;
	ldw	x, (0x07, sp)
	incw	x
	ld	a, #0x40
	ld	(x), a
;	clock.c: 595: TM1637_seg[2] = 0x40;
	ldw	x, (0x07, sp)
	incw	x
	incw	x
	ld	a, #0x40
	ld	(x), a
;	clock.c: 596: TM1637_seg[3] = 0x40;
	ldw	x, (0x07, sp)
	ld	a, #0x40
	ld	(0x0003, x), a
00124$:
;	clock.c: 598: TM1637_send();
	call	_TM1637_send
;	clock.c: 600: Soft_Timer = 0x00; //Сброс таймера
	clrw	x
	ldw	_Soft_Timer+0, x
	jp	00128$
	addw	sp, #66
	ret
	.area CODE
	.area INITIALIZER
__xinit__brigh:
	.db #0x07	; 7
__xinit__command1:
	.db #0x40	; 64
__xinit__command2:
	.db #0xC0	; 192
__xinit__TM1637_seg:
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
__xinit__ASCI:
	.db #0x3F	; 63
	.db #0x06	; 6
	.db #0x5B	; 91
	.db #0x4F	; 79	'O'
	.db #0x66	; 102	'f'
	.db #0x6D	; 109	'm'
	.db #0x7D	; 125
	.db #0x07	; 7
	.db #0x7F	; 127
	.db #0x6F	; 111	'o'
__xinit__con_day:
	.byte #0x00,#0x00,#0x00,#0x00	; 0
__xinit__con_hour:
	.byte #0x00,#0x00,#0x00,#0x00	; 0
__xinit__con_min:
	.byte #0x00,#0x00,#0x00,#0x00	; 0
__xinit__con_sec:
	.byte #0x00,#0x00,#0x00,#0x00	; 0
__xinit__Soft_Timer:
	.dw #0x0000
__xinit__Point_Meny:
	.dw #0x0000
__xinit__Buff_But:
	.db #0xFF	; 255
__xinit__auto_exit:
	.db #0x00	; 0
__xinit__buff:
	.db #0x00	;  0
	.area CABS (ABS)
