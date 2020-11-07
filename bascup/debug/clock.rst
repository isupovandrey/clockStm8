                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
                                      4 ; This file was generated Fri Nov  6 21:37:46 2020
                                      5 ;--------------------------------------------------------
                                      6 	.module clock
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _main
                                     13 	.globl _dnClock
                                     14 	.globl _conSec
                                     15 	.globl _transTime
                                     16 	.globl _Meny
                                     17 	.globl _Set_Meny
                                     18 	.globl _Set_DnTimer
                                     19 	.globl _Set_Brigh
                                     20 	.globl _button
                                     21 	.globl _hard_Reset
                                     22 	.globl _EEPROM_UNLOCK
                                     23 	.globl _RTC_Set
                                     24 	.globl _RTC_Read
                                     25 	.globl _i2c_read_byte
                                     26 	.globl _i2c_send_byte
                                     27 	.globl _i2c_init
                                     28 	.globl _i2c_restart
                                     29 	.globl _i2c_start
                                     30 	.globl _i2c_stop
                                     31 	.globl _TM1637_cleer
                                     32 	.globl _TM1637_send
                                     33 	.globl _TM1637_brigh
                                     34 	.globl _TM1637_initialization
                                     35 	.globl _clockTemp3
                                     36 	.globl _clockTemp2
                                     37 	.globl _clockTemp1
                                     38 	.globl _con1_sec
                                     39 	.globl _cl_sec
                                     40 	.globl _cl_min
                                     41 	.globl _cl_hour
                                     42 	.globl _con_sec
                                     43 	.globl _con_min
                                     44 	.globl _con_hour
                                     45 	.globl _con_day
                                     46 	.globl _auto_exit
                                     47 	.globl _But_Buff
                                     48 	.globl _Point_Meny
                                     49 	.globl _Soft_Timer
                                     50 	.globl _ASCI
                                     51 	.globl _TM1637_seg
                                     52 	.globl _command2
                                     53 	.globl _command1
                                     54 	.globl _brigh
                                     55 	.globl _PointTimer
                                     56 	.globl _timeRes
                                     57 	.globl _timeToSec
                                     58 	.globl _DnClock_Tim_3
                                     59 	.globl _DnClock_Tim_2
                                     60 	.globl _DnClock_Tim_1
                                     61 	.globl _DnClock_Tim_0
                                     62 	.globl _Clock_Temp
                                     63 	.globl _dot
                                     64 	.globl _year
                                     65 	.globl _month
                                     66 	.globl _date
                                     67 	.globl _day
                                     68 	.globl _hour
                                     69 	.globl _min
                                     70 	.globl _sec
                                     71 	.globl _Set_time
                                     72 	.globl _clock
                                     73 ;--------------------------------------------------------
                                     74 ; ram data
                                     75 ;--------------------------------------------------------
                                     76 	.area DATA
      000001                         77 _sec::
      000001                         78 	.ds 1
      000002                         79 _min::
      000002                         80 	.ds 1
      000003                         81 _hour::
      000003                         82 	.ds 1
      000004                         83 _day::
      000004                         84 	.ds 1
      000005                         85 _date::
      000005                         86 	.ds 1
      000006                         87 _month::
      000006                         88 	.ds 1
      000007                         89 _year::
      000007                         90 	.ds 1
      000008                         91 _dot::
      000008                         92 	.ds 1
      000009                         93 _Clock_Temp::
      000009                         94 	.ds 2
      00000B                         95 _DnClock_Tim_0::
      00000B                         96 	.ds 4
      00000F                         97 _DnClock_Tim_1::
      00000F                         98 	.ds 4
      000013                         99 _DnClock_Tim_2::
      000013                        100 	.ds 4
      000017                        101 _DnClock_Tim_3::
      000017                        102 	.ds 4
      00001B                        103 _timeToSec::
      00001B                        104 	.ds 4
      00001F                        105 _timeRes::
      00001F                        106 	.ds 4
      000023                        107 _PointTimer::
      000023                        108 	.ds 1
                                    109 ;--------------------------------------------------------
                                    110 ; ram data
                                    111 ;--------------------------------------------------------
                                    112 	.area INITIALIZED
      000024                        113 _brigh::
      000024                        114 	.ds 1
      000025                        115 _command1::
      000025                        116 	.ds 1
      000026                        117 _command2::
      000026                        118 	.ds 1
      000027                        119 _TM1637_seg::
      000027                        120 	.ds 4
      00002B                        121 _ASCI::
      00002B                        122 	.ds 10
      000035                        123 _Soft_Timer::
      000035                        124 	.ds 2
      000037                        125 _Point_Meny::
      000037                        126 	.ds 2
      000039                        127 _But_Buff::
      000039                        128 	.ds 1
      00003A                        129 _auto_exit::
      00003A                        130 	.ds 1
      00003B                        131 _con_day::
      00003B                        132 	.ds 4
      00003F                        133 _con_hour::
      00003F                        134 	.ds 4
      000043                        135 _con_min::
      000043                        136 	.ds 4
      000047                        137 _con_sec::
      000047                        138 	.ds 4
      00004B                        139 _cl_hour::
      00004B                        140 	.ds 4
      00004F                        141 _cl_min::
      00004F                        142 	.ds 4
      000053                        143 _cl_sec::
      000053                        144 	.ds 4
      000057                        145 _con1_sec::
      000057                        146 	.ds 4
      00005B                        147 _clockTemp1::
      00005B                        148 	.ds 4
      00005F                        149 _clockTemp2::
      00005F                        150 	.ds 4
      000063                        151 _clockTemp3::
      000063                        152 	.ds 4
                                    153 ;--------------------------------------------------------
                                    154 ; Stack segment in internal ram 
                                    155 ;--------------------------------------------------------
                                    156 	.area	SSEG
      000067                        157 __start__stack:
      000067                        158 	.ds	1
                                    159 
                                    160 ;--------------------------------------------------------
                                    161 ; absolute external ram data
                                    162 ;--------------------------------------------------------
                                    163 	.area DABS (ABS)
                                    164 ;--------------------------------------------------------
                                    165 ; interrupt vector 
                                    166 ;--------------------------------------------------------
                                    167 	.area HOME
      008000                        168 __interrupt_vect:
      008000 82 00 80 83            169 	int s_GSINIT ;reset
      008004 82 00 00 00            170 	int 0x0000 ;trap
      008008 82 00 00 00            171 	int 0x0000 ;int0
      00800C 82 00 00 00            172 	int 0x0000 ;int1
      008010 82 00 00 00            173 	int 0x0000 ;int2
      008014 82 00 00 00            174 	int 0x0000 ;int3
      008018 82 00 00 00            175 	int 0x0000 ;int4
      00801C 82 00 00 00            176 	int 0x0000 ;int5
      008020 82 00 00 00            177 	int 0x0000 ;int6
      008024 82 00 00 00            178 	int 0x0000 ;int7
      008028 82 00 00 00            179 	int 0x0000 ;int8
      00802C 82 00 00 00            180 	int 0x0000 ;int9
      008030 82 00 00 00            181 	int 0x0000 ;int10
      008034 82 00 00 00            182 	int 0x0000 ;int11
      008038 82 00 00 00            183 	int 0x0000 ;int12
      00803C 82 00 00 00            184 	int 0x0000 ;int13
      008040 82 00 00 00            185 	int 0x0000 ;int14
      008044 82 00 00 00            186 	int 0x0000 ;int15
      008048 82 00 00 00            187 	int 0x0000 ;int16
      00804C 82 00 00 00            188 	int 0x0000 ;int17
      008050 82 00 00 00            189 	int 0x0000 ;int18
      008054 82 00 00 00            190 	int 0x0000 ;int19
      008058 82 00 00 00            191 	int 0x0000 ;int20
      00805C 82 00 00 00            192 	int 0x0000 ;int21
      008060 82 00 00 00            193 	int 0x0000 ;int22
      008064 82 00 00 00            194 	int 0x0000 ;int23
      008068 82 00 00 00            195 	int 0x0000 ;int24
      00806C 82 00 00 00            196 	int 0x0000 ;int25
      008070 82 00 00 00            197 	int 0x0000 ;int26
      008074 82 00 00 00            198 	int 0x0000 ;int27
      008078 82 00 00 00            199 	int 0x0000 ;int28
      00807C 82 00 00 00            200 	int 0x0000 ;int29
                                    201 ;--------------------------------------------------------
                                    202 ; global & static initialisations
                                    203 ;--------------------------------------------------------
                                    204 	.area HOME
                                    205 	.area GSINIT
                                    206 	.area GSFINAL
                                    207 	.area GSINIT
      008083                        208 __sdcc_gs_init_startup:
      008083                        209 __sdcc_init_data:
                                    210 ; stm8_genXINIT() start
      008083 AE 00 23         [ 2]  211 	ldw x, #l_DATA
      008086 27 07            [ 1]  212 	jreq	00002$
      008088                        213 00001$:
      008088 72 4F 00 00      [ 1]  214 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  215 	decw x
      00808D 26 F9            [ 1]  216 	jrne	00001$
      00808F                        217 00002$:
      00808F AE 00 43         [ 2]  218 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  219 	jreq	00004$
      008094                        220 00003$:
      008094 D6 94 DE         [ 1]  221 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 23         [ 1]  222 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  223 	decw	x
      00809B 26 F7            [ 1]  224 	jrne	00003$
      00809D                        225 00004$:
                                    226 ; stm8_genXINIT() end
                                    227 	.area GSFINAL
      00809D CC 80 80         [ 2]  228 	jp	__sdcc_program_startup
                                    229 ;--------------------------------------------------------
                                    230 ; Home
                                    231 ;--------------------------------------------------------
                                    232 	.area HOME
                                    233 	.area HOME
      008080                        234 __sdcc_program_startup:
      008080 CC 93 18         [ 2]  235 	jp	_main
                                    236 ;	return from main will return to caller
                                    237 ;--------------------------------------------------------
                                    238 ; code
                                    239 ;--------------------------------------------------------
                                    240 	.area CODE
                                    241 ;	lib/stm8.h: 4: static void delay(unsigned long t)
                                    242 ;	-----------------------------------------
                                    243 ;	 function delay
                                    244 ;	-----------------------------------------
      0080A0                        245 _delay:
      0080A0 52 08            [ 2]  246 	sub	sp, #8
                                    247 ;	lib/stm8.h: 6: while(t--){
      0080A2 16 0B            [ 2]  248 	ldw	y, (0x0b, sp)
      0080A4 17 01            [ 2]  249 	ldw	(0x01, sp), y
      0080A6 1E 0D            [ 2]  250 	ldw	x, (0x0d, sp)
      0080A8                        251 00101$:
      0080A8 41               [ 1]  252 	exg	a, xl
      0080A9 6B 08            [ 1]  253 	ld	(0x08, sp), a
      0080AB 41               [ 1]  254 	exg	a, xl
      0080AC 16 01            [ 2]  255 	ldw	y, (0x01, sp)
      0080AE 17 05            [ 2]  256 	ldw	(0x05, sp), y
      0080B0 9E               [ 1]  257 	ld	a, xh
      0080B1 1D 00 01         [ 2]  258 	subw	x, #0x0001
      0080B4 88               [ 1]  259 	push	a
      0080B5 7B 03            [ 1]  260 	ld	a, (0x03, sp)
      0080B7 A2 00            [ 1]  261 	sbc	a, #0x00
      0080B9 6B 03            [ 1]  262 	ld	(0x03, sp), a
      0080BB 7B 02            [ 1]  263 	ld	a, (0x02, sp)
      0080BD A2 00            [ 1]  264 	sbc	a, #0x00
      0080BF 6B 02            [ 1]  265 	ld	(0x02, sp), a
      0080C1 84               [ 1]  266 	pop	a
      0080C2 0D 08            [ 1]  267 	tnz	(0x08, sp)
      0080C4 26 07            [ 1]  268 	jrne	00115$
      0080C6 4D               [ 1]  269 	tnz	a
      0080C7 26 04            [ 1]  270 	jrne	00115$
      0080C9 16 05            [ 2]  271 	ldw	y, (0x05, sp)
      0080CB 27 04            [ 1]  272 	jreq	00104$
      0080CD                        273 00115$:
                                    274 ;	lib/stm8.h: 10: __endasm;
      0080CD 9D               [ 1]  275 	nop
      0080CE 9D               [ 1]  276 	nop
      0080CF 20 D7            [ 2]  277 	jra	00101$
      0080D1                        278 00104$:
      0080D1 5B 08            [ 2]  279 	addw	sp, #8
      0080D3 81               [ 4]  280 	ret
                                    281 ;	lib/TM1637.c: 27: void TM1637_start(){
                                    282 ;	-----------------------------------------
                                    283 ;	 function TM1637_start
                                    284 ;	-----------------------------------------
      0080D4                        285 _TM1637_start:
                                    286 ;	lib/TM1637.c: 28: TM1637_ODR |= 1<<TM1637_SCL;
      0080D4 AE 50 0A         [ 2]  287 	ldw	x, #0x500a
      0080D7 F6               [ 1]  288 	ld	a, (x)
      0080D8 AA 08            [ 1]  289 	or	a, #0x08
      0080DA F7               [ 1]  290 	ld	(x), a
                                    291 ;	lib/TM1637.c: 29: TM1637_ODR |= 1<<TM1637_SDA;
      0080DB AE 50 0A         [ 2]  292 	ldw	x, #0x500a
      0080DE F6               [ 1]  293 	ld	a, (x)
      0080DF AA 10            [ 1]  294 	or	a, #0x10
      0080E1 F7               [ 1]  295 	ld	(x), a
                                    296 ;	lib/TM1637.c: 30: TM1637_DELAY();
      0080E2 4B 05            [ 1]  297 	push	#0x05
      0080E4 5F               [ 1]  298 	clrw	x
      0080E5 89               [ 2]  299 	pushw	x
      0080E6 4B 00            [ 1]  300 	push	#0x00
      0080E8 CD 80 A0         [ 4]  301 	call	_delay
      0080EB 5B 04            [ 2]  302 	addw	sp, #4
                                    303 ;	lib/TM1637.c: 31: TM1637_ODR &= ~(1<<TM1637_SDA);
      0080ED AE 50 0A         [ 2]  304 	ldw	x, #0x500a
      0080F0 F6               [ 1]  305 	ld	a, (x)
      0080F1 A4 EF            [ 1]  306 	and	a, #0xef
      0080F3 F7               [ 1]  307 	ld	(x), a
      0080F4 81               [ 4]  308 	ret
                                    309 ;	lib/TM1637.c: 34: void TM1637_stop(){
                                    310 ;	-----------------------------------------
                                    311 ;	 function TM1637_stop
                                    312 ;	-----------------------------------------
      0080F5                        313 _TM1637_stop:
                                    314 ;	lib/TM1637.c: 35: TM1637_ODR &= ~(1<<TM1637_SCL);
      0080F5 AE 50 0A         [ 2]  315 	ldw	x, #0x500a
      0080F8 F6               [ 1]  316 	ld	a, (x)
      0080F9 A4 F7            [ 1]  317 	and	a, #0xf7
      0080FB F7               [ 1]  318 	ld	(x), a
                                    319 ;	lib/TM1637.c: 36: TM1637_DELAY();
      0080FC 4B 05            [ 1]  320 	push	#0x05
      0080FE 5F               [ 1]  321 	clrw	x
      0080FF 89               [ 2]  322 	pushw	x
      008100 4B 00            [ 1]  323 	push	#0x00
      008102 CD 80 A0         [ 4]  324 	call	_delay
      008105 5B 04            [ 2]  325 	addw	sp, #4
                                    326 ;	lib/TM1637.c: 37: TM1637_ODR &= ~(1<<TM1637_SDA);
      008107 AE 50 0A         [ 2]  327 	ldw	x, #0x500a
      00810A F6               [ 1]  328 	ld	a, (x)
      00810B A4 EF            [ 1]  329 	and	a, #0xef
      00810D F7               [ 1]  330 	ld	(x), a
                                    331 ;	lib/TM1637.c: 38: TM1637_DELAY();
      00810E 4B 05            [ 1]  332 	push	#0x05
      008110 5F               [ 1]  333 	clrw	x
      008111 89               [ 2]  334 	pushw	x
      008112 4B 00            [ 1]  335 	push	#0x00
      008114 CD 80 A0         [ 4]  336 	call	_delay
      008117 5B 04            [ 2]  337 	addw	sp, #4
                                    338 ;	lib/TM1637.c: 39: TM1637_ODR |= 1<<TM1637_SCL;;
      008119 AE 50 0A         [ 2]  339 	ldw	x, #0x500a
      00811C F6               [ 1]  340 	ld	a, (x)
      00811D AA 08            [ 1]  341 	or	a, #0x08
      00811F F7               [ 1]  342 	ld	(x), a
                                    343 ;	lib/TM1637.c: 40: TM1637_DELAY();
      008120 4B 05            [ 1]  344 	push	#0x05
      008122 5F               [ 1]  345 	clrw	x
      008123 89               [ 2]  346 	pushw	x
      008124 4B 00            [ 1]  347 	push	#0x00
      008126 CD 80 A0         [ 4]  348 	call	_delay
      008129 5B 04            [ 2]  349 	addw	sp, #4
                                    350 ;	lib/TM1637.c: 41: TM1637_ODR |= 1<<TM1637_SDA;
      00812B AE 50 0A         [ 2]  351 	ldw	x, #0x500a
      00812E F6               [ 1]  352 	ld	a, (x)
      00812F AA 10            [ 1]  353 	or	a, #0x10
      008131 F7               [ 1]  354 	ld	(x), a
      008132 81               [ 4]  355 	ret
                                    356 ;	lib/TM1637.c: 45: void TM1637_writeByte(char pack){
                                    357 ;	-----------------------------------------
                                    358 ;	 function TM1637_writeByte
                                    359 ;	-----------------------------------------
      008133                        360 _TM1637_writeByte:
      008133 88               [ 1]  361 	push	a
                                    362 ;	lib/TM1637.c: 48: for(i=0;i<8;i++)  
      008134 0F 01            [ 1]  363 	clr	(0x01, sp)
      008136                        364 00108$:
                                    365 ;	lib/TM1637.c: 50: TM1637_ODR &= ~(1<<TM1637_SCL);
      008136 AE 50 0A         [ 2]  366 	ldw	x, #0x500a
      008139 F6               [ 1]  367 	ld	a, (x)
      00813A A4 F7            [ 1]  368 	and	a, #0xf7
      00813C F7               [ 1]  369 	ld	(x), a
      00813D AE 50 0A         [ 2]  370 	ldw	x, #0x500a
      008140 F6               [ 1]  371 	ld	a, (x)
                                    372 ;	lib/TM1637.c: 51: if(pack & 0x01)
      008141 88               [ 1]  373 	push	a
      008142 7B 05            [ 1]  374 	ld	a, (0x05, sp)
      008144 44               [ 1]  375 	srl	a
      008145 84               [ 1]  376 	pop	a
      008146 24 08            [ 1]  377 	jrnc	00102$
                                    378 ;	lib/TM1637.c: 52: { TM1637_ODR |= 1<<TM1637_SDA;}
      008148 AA 10            [ 1]  379 	or	a, #0x10
      00814A AE 50 0A         [ 2]  380 	ldw	x, #0x500a
      00814D F7               [ 1]  381 	ld	(x), a
      00814E 20 06            [ 2]  382 	jra	00103$
      008150                        383 00102$:
                                    384 ;	lib/TM1637.c: 53: else {TM1637_ODR &= ~(1<<TM1637_SDA);}
      008150 A4 EF            [ 1]  385 	and	a, #0xef
      008152 AE 50 0A         [ 2]  386 	ldw	x, #0x500a
      008155 F7               [ 1]  387 	ld	(x), a
      008156                        388 00103$:
                                    389 ;	lib/TM1637.c: 54: TM1637_DELAY();
      008156 4B 05            [ 1]  390 	push	#0x05
      008158 5F               [ 1]  391 	clrw	x
      008159 89               [ 2]  392 	pushw	x
      00815A 4B 00            [ 1]  393 	push	#0x00
      00815C CD 80 A0         [ 4]  394 	call	_delay
      00815F 5B 04            [ 2]  395 	addw	sp, #4
                                    396 ;	lib/TM1637.c: 55: pack = pack >> 1;
      008161 07 04            [ 1]  397 	sra	(0x04, sp)
                                    398 ;	lib/TM1637.c: 56: TM1637_ODR |= 1<<TM1637_SCL;
      008163 AE 50 0A         [ 2]  399 	ldw	x, #0x500a
      008166 F6               [ 1]  400 	ld	a, (x)
      008167 AA 08            [ 1]  401 	or	a, #0x08
      008169 F7               [ 1]  402 	ld	(x), a
                                    403 ;	lib/TM1637.c: 57: TM1637_DELAY();
      00816A 4B 05            [ 1]  404 	push	#0x05
      00816C 5F               [ 1]  405 	clrw	x
      00816D 89               [ 2]  406 	pushw	x
      00816E 4B 00            [ 1]  407 	push	#0x00
      008170 CD 80 A0         [ 4]  408 	call	_delay
      008173 5B 04            [ 2]  409 	addw	sp, #4
                                    410 ;	lib/TM1637.c: 48: for(i=0;i<8;i++)  
      008175 0C 01            [ 1]  411 	inc	(0x01, sp)
      008177 7B 01            [ 1]  412 	ld	a, (0x01, sp)
      008179 A1 08            [ 1]  413 	cp	a, #0x08
      00817B 2F B9            [ 1]  414 	jrslt	00108$
                                    415 ;	lib/TM1637.c: 59: TM1637_ODR &= ~(1<<TM1637_SCL);
      00817D AE 50 0A         [ 2]  416 	ldw	x, #0x500a
      008180 F6               [ 1]  417 	ld	a, (x)
      008181 A4 F7            [ 1]  418 	and	a, #0xf7
      008183 F7               [ 1]  419 	ld	(x), a
                                    420 ;	lib/TM1637.c: 60: TM1637_DELAY();
      008184 4B 05            [ 1]  421 	push	#0x05
      008186 5F               [ 1]  422 	clrw	x
      008187 89               [ 2]  423 	pushw	x
      008188 4B 00            [ 1]  424 	push	#0x00
      00818A CD 80 A0         [ 4]  425 	call	_delay
      00818D 5B 04            [ 2]  426 	addw	sp, #4
                                    427 ;	lib/TM1637.c: 61: TM1637_DDR &= ~(1<<TM1637_SDA);
      00818F AE 50 0C         [ 2]  428 	ldw	x, #0x500c
      008192 F6               [ 1]  429 	ld	a, (x)
      008193 A4 EF            [ 1]  430 	and	a, #0xef
      008195 F7               [ 1]  431 	ld	(x), a
                                    432 ;	lib/TM1637.c: 62: while((TM1637_IDR & (1<<TM1637_SDA)));
      008196                        433 00105$:
      008196 AE 50 0B         [ 2]  434 	ldw	x, #0x500b
      008199 F6               [ 1]  435 	ld	a, (x)
      00819A A5 10            [ 1]  436 	bcp	a, #0x10
      00819C 26 F8            [ 1]  437 	jrne	00105$
                                    438 ;	lib/TM1637.c: 63: TM1637_DDR |= (1<<TM1637_SDA);
      00819E AE 50 0C         [ 2]  439 	ldw	x, #0x500c
      0081A1 F6               [ 1]  440 	ld	a, (x)
      0081A2 AA 10            [ 1]  441 	or	a, #0x10
      0081A4 F7               [ 1]  442 	ld	(x), a
                                    443 ;	lib/TM1637.c: 64: TM1637_ODR |= 1<<TM1637_SCL;
      0081A5 AE 50 0A         [ 2]  444 	ldw	x, #0x500a
      0081A8 F6               [ 1]  445 	ld	a, (x)
      0081A9 AA 08            [ 1]  446 	or	a, #0x08
      0081AB F7               [ 1]  447 	ld	(x), a
                                    448 ;	lib/TM1637.c: 65: TM1637_DELAY();
      0081AC 4B 05            [ 1]  449 	push	#0x05
      0081AE 5F               [ 1]  450 	clrw	x
      0081AF 89               [ 2]  451 	pushw	x
      0081B0 4B 00            [ 1]  452 	push	#0x00
      0081B2 CD 80 A0         [ 4]  453 	call	_delay
      0081B5 5B 04            [ 2]  454 	addw	sp, #4
                                    455 ;	lib/TM1637.c: 66: TM1637_ODR &= ~(1<<TM1637_SCL);
      0081B7 AE 50 0A         [ 2]  456 	ldw	x, #0x500a
      0081BA F6               [ 1]  457 	ld	a, (x)
      0081BB A4 F7            [ 1]  458 	and	a, #0xf7
      0081BD F7               [ 1]  459 	ld	(x), a
      0081BE 84               [ 1]  460 	pop	a
      0081BF 81               [ 4]  461 	ret
                                    462 ;	lib/TM1637.c: 70: void TM1637_brigh(char brigh){
                                    463 ;	-----------------------------------------
                                    464 ;	 function TM1637_brigh
                                    465 ;	-----------------------------------------
      0081C0                        466 _TM1637_brigh:
                                    467 ;	lib/TM1637.c: 71: if(brigh>7)brigh = 7;
      0081C0 7B 03            [ 1]  468 	ld	a, (0x03, sp)
      0081C2 A1 07            [ 1]  469 	cp	a, #0x07
      0081C4 2D 04            [ 1]  470 	jrsle	00102$
      0081C6 A6 07            [ 1]  471 	ld	a, #0x07
      0081C8 6B 03            [ 1]  472 	ld	(0x03, sp), a
      0081CA                        473 00102$:
                                    474 ;	lib/TM1637.c: 73: TM1637_start();
      0081CA CD 80 D4         [ 4]  475 	call	_TM1637_start
                                    476 ;	lib/TM1637.c: 74: TM1637_writeByte(0x88 + brigh); //Команда, задающая яркость дисплея
      0081CD 7B 03            [ 1]  477 	ld	a, (0x03, sp)
      0081CF AB 88            [ 1]  478 	add	a, #0x88
      0081D1 88               [ 1]  479 	push	a
      0081D2 CD 81 33         [ 4]  480 	call	_TM1637_writeByte
      0081D5 84               [ 1]  481 	pop	a
                                    482 ;	lib/TM1637.c: 75: TM1637_stop();
      0081D6 CC 80 F5         [ 2]  483 	jp	_TM1637_stop
                                    484 ;	lib/TM1637.c: 78: void TM1637_send(){
                                    485 ;	-----------------------------------------
                                    486 ;	 function TM1637_send
                                    487 ;	-----------------------------------------
      0081D9                        488 _TM1637_send:
      0081D9 52 02            [ 2]  489 	sub	sp, #2
                                    490 ;	lib/TM1637.c: 80: TM1637_start();                  
      0081DB CD 80 D4         [ 4]  491 	call	_TM1637_start
                                    492 ;	lib/TM1637.c: 81: TM1637_writeByte(command1);			//Команда записи в регистр дисплея
      0081DE 3B 00 25         [ 1]  493 	push	_command1+0
      0081E1 CD 81 33         [ 4]  494 	call	_TM1637_writeByte
      0081E4 84               [ 1]  495 	pop	a
                                    496 ;	lib/TM1637.c: 82: TM1637_stop();
      0081E5 CD 80 F5         [ 4]  497 	call	_TM1637_stop
                                    498 ;	lib/TM1637.c: 84: TM1637_start();
      0081E8 CD 80 D4         [ 4]  499 	call	_TM1637_start
                                    500 ;	lib/TM1637.c: 85: TM1637_writeByte(command2); //Команда начального адреса для автоинкремента адреса
      0081EB 3B 00 26         [ 1]  501 	push	_command2+0
      0081EE CD 81 33         [ 4]  502 	call	_TM1637_writeByte
      0081F1 84               [ 1]  503 	pop	a
                                    504 ;	lib/TM1637.c: 87: TM1637_writeByte(TM1637_seg[0]);
      0081F2 AE 00 27         [ 2]  505 	ldw	x, #_TM1637_seg+0
      0081F5 1F 01            [ 2]  506 	ldw	(0x01, sp), x
      0081F7 1E 01            [ 2]  507 	ldw	x, (0x01, sp)
      0081F9 F6               [ 1]  508 	ld	a, (x)
      0081FA 88               [ 1]  509 	push	a
      0081FB CD 81 33         [ 4]  510 	call	_TM1637_writeByte
      0081FE 84               [ 1]  511 	pop	a
                                    512 ;	lib/TM1637.c: 88: TM1637_writeByte(TM1637_seg[1]);
      0081FF 1E 01            [ 2]  513 	ldw	x, (0x01, sp)
      008201 E6 01            [ 1]  514 	ld	a, (0x1, x)
      008203 88               [ 1]  515 	push	a
      008204 CD 81 33         [ 4]  516 	call	_TM1637_writeByte
      008207 84               [ 1]  517 	pop	a
                                    518 ;	lib/TM1637.c: 89: TM1637_writeByte(TM1637_seg[2]);
      008208 1E 01            [ 2]  519 	ldw	x, (0x01, sp)
      00820A E6 02            [ 1]  520 	ld	a, (0x2, x)
      00820C 88               [ 1]  521 	push	a
      00820D CD 81 33         [ 4]  522 	call	_TM1637_writeByte
      008210 84               [ 1]  523 	pop	a
                                    524 ;	lib/TM1637.c: 90: TM1637_writeByte(TM1637_seg[3]);
      008211 1E 01            [ 2]  525 	ldw	x, (0x01, sp)
      008213 E6 03            [ 1]  526 	ld	a, (0x3, x)
      008215 88               [ 1]  527 	push	a
      008216 CD 81 33         [ 4]  528 	call	_TM1637_writeByte
      008219 84               [ 1]  529 	pop	a
                                    530 ;	lib/TM1637.c: 92: TM1637_stop();
      00821A CD 80 F5         [ 4]  531 	call	_TM1637_stop
      00821D 5B 02            [ 2]  532 	addw	sp, #2
      00821F 81               [ 4]  533 	ret
                                    534 ;	lib/TM1637.c: 95: void TM1637_cleer(){
                                    535 ;	-----------------------------------------
                                    536 ;	 function TM1637_cleer
                                    537 ;	-----------------------------------------
      008220                        538 _TM1637_cleer:
      008220 52 02            [ 2]  539 	sub	sp, #2
                                    540 ;	lib/TM1637.c: 96: TM1637_seg[0] = 0x00;
      008222 AE 00 27         [ 2]  541 	ldw	x, #_TM1637_seg+0
      008225 1F 01            [ 2]  542 	ldw	(0x01, sp), x
      008227 1E 01            [ 2]  543 	ldw	x, (0x01, sp)
      008229 7F               [ 1]  544 	clr	(x)
                                    545 ;	lib/TM1637.c: 97: TM1637_seg[1] = 0x00;
      00822A 1E 01            [ 2]  546 	ldw	x, (0x01, sp)
      00822C 5C               [ 2]  547 	incw	x
      00822D 7F               [ 1]  548 	clr	(x)
                                    549 ;	lib/TM1637.c: 98: TM1637_seg[2] = 0x00;
      00822E 1E 01            [ 2]  550 	ldw	x, (0x01, sp)
      008230 5C               [ 2]  551 	incw	x
      008231 5C               [ 2]  552 	incw	x
      008232 7F               [ 1]  553 	clr	(x)
                                    554 ;	lib/TM1637.c: 99: TM1637_seg[3] = 0x00;
      008233 1E 01            [ 2]  555 	ldw	x, (0x01, sp)
      008235 1C 00 03         [ 2]  556 	addw	x, #0x0003
      008238 7F               [ 1]  557 	clr	(x)
                                    558 ;	lib/TM1637.c: 100: TM1637_send();
      008239 CD 81 D9         [ 4]  559 	call	_TM1637_send
      00823C 5B 02            [ 2]  560 	addw	sp, #2
      00823E 81               [ 4]  561 	ret
                                    562 ;	lib/TM1637.c: 103: void TM1637_initialization(){
                                    563 ;	-----------------------------------------
                                    564 ;	 function TM1637_initialization
                                    565 ;	-----------------------------------------
      00823F                        566 _TM1637_initialization:
                                    567 ;	lib/TM1637.c: 104: TM1637_ODR |= (1<<TM1637_SCL) | (1<<TM1637_SDA); 
      00823F AE 50 0A         [ 2]  568 	ldw	x, #0x500a
      008242 F6               [ 1]  569 	ld	a, (x)
      008243 AA 18            [ 1]  570 	or	a, #0x18
      008245 F7               [ 1]  571 	ld	(x), a
                                    572 ;	lib/TM1637.c: 107: TM1637_cleer();
      008246 CC 82 20         [ 2]  573 	jp	_TM1637_cleer
                                    574 ;	lib/TM1637.c: 110: void TM1637_dot(char d){
                                    575 ;	-----------------------------------------
                                    576 ;	 function TM1637_dot
                                    577 ;	-----------------------------------------
      008249                        578 _TM1637_dot:
                                    579 ;	lib/TM1637.c: 111: if(d == 1)TM1637_seg[1] = TM1637_seg[1] + 0x80; 
      008249 7B 03            [ 1]  580 	ld	a, (0x03, sp)
      00824B A1 01            [ 1]  581 	cp	a, #0x01
      00824D 26 07            [ 1]  582 	jrne	00103$
      00824F AE 00 28         [ 2]  583 	ldw	x, #_TM1637_seg+1
      008252 F6               [ 1]  584 	ld	a, (x)
      008253 AB 80            [ 1]  585 	add	a, #0x80
      008255 F7               [ 1]  586 	ld	(x), a
      008256                        587 00103$:
      008256 81               [ 4]  588 	ret
                                    589 ;	lib/i2c.c: 16: unsigned char i2c_stop(void)
                                    590 ;	-----------------------------------------
                                    591 ;	 function i2c_stop
                                    592 ;	-----------------------------------------
      008257                        593 _i2c_stop:
      008257 88               [ 1]  594 	push	a
                                    595 ;	lib/i2c.c: 18: unsigned char error = 0;
      008258 0F 01            [ 1]  596 	clr	(0x01, sp)
                                    597 ;	lib/i2c.c: 20: NULL_SCL();
      00825A AE 50 07         [ 2]  598 	ldw	x, #0x5007
      00825D F6               [ 1]  599 	ld	a, (x)
      00825E AA 10            [ 1]  600 	or	a, #0x10
      008260 F7               [ 1]  601 	ld	(x), a
      008261 AE 50 05         [ 2]  602 	ldw	x, #0x5005
      008264 F6               [ 1]  603 	ld	a, (x)
      008265 A4 EF            [ 1]  604 	and	a, #0xef
      008267 F7               [ 1]  605 	ld	(x), a
                                    606 ;	lib/i2c.c: 21: I2C_DELAY();
      008268 4B 05            [ 1]  607 	push	#0x05
      00826A 5F               [ 1]  608 	clrw	x
      00826B 89               [ 2]  609 	pushw	x
      00826C 4B 00            [ 1]  610 	push	#0x00
      00826E CD 80 A0         [ 4]  611 	call	_delay
      008271 5B 04            [ 2]  612 	addw	sp, #4
                                    613 ;	lib/i2c.c: 22: NULL_SDA();
      008273 AE 50 07         [ 2]  614 	ldw	x, #0x5007
      008276 F6               [ 1]  615 	ld	a, (x)
      008277 AA 20            [ 1]  616 	or	a, #0x20
      008279 F7               [ 1]  617 	ld	(x), a
      00827A AE 50 05         [ 2]  618 	ldw	x, #0x5005
      00827D F6               [ 1]  619 	ld	a, (x)
      00827E A4 DF            [ 1]  620 	and	a, #0xdf
      008280 F7               [ 1]  621 	ld	(x), a
                                    622 ;	lib/i2c.c: 23: I2C_DELAY();
      008281 4B 05            [ 1]  623 	push	#0x05
      008283 5F               [ 1]  624 	clrw	x
      008284 89               [ 2]  625 	pushw	x
      008285 4B 00            [ 1]  626 	push	#0x00
      008287 CD 80 A0         [ 4]  627 	call	_delay
      00828A 5B 04            [ 2]  628 	addw	sp, #4
                                    629 ;	lib/i2c.c: 25: ONE_SCL();
      00828C AE 50 07         [ 2]  630 	ldw	x, #0x5007
      00828F F6               [ 1]  631 	ld	a, (x)
      008290 A4 EF            [ 1]  632 	and	a, #0xef
      008292 F7               [ 1]  633 	ld	(x), a
      008293 AE 50 05         [ 2]  634 	ldw	x, #0x5005
      008296 F6               [ 1]  635 	ld	a, (x)
      008297 AA 10            [ 1]  636 	or	a, #0x10
      008299 F7               [ 1]  637 	ld	(x), a
                                    638 ;	lib/i2c.c: 26: I2C_DELAY();
      00829A 4B 05            [ 1]  639 	push	#0x05
      00829C 5F               [ 1]  640 	clrw	x
      00829D 89               [ 2]  641 	pushw	x
      00829E 4B 00            [ 1]  642 	push	#0x00
      0082A0 CD 80 A0         [ 4]  643 	call	_delay
      0082A3 5B 04            [ 2]  644 	addw	sp, #4
                                    645 ;	lib/i2c.c: 27: ONE_SDA();
      0082A5 AE 50 07         [ 2]  646 	ldw	x, #0x5007
      0082A8 F6               [ 1]  647 	ld	a, (x)
      0082A9 A4 DF            [ 1]  648 	and	a, #0xdf
      0082AB F7               [ 1]  649 	ld	(x), a
      0082AC AE 50 05         [ 2]  650 	ldw	x, #0x5005
      0082AF F6               [ 1]  651 	ld	a, (x)
      0082B0 AA 20            [ 1]  652 	or	a, #0x20
      0082B2 F7               [ 1]  653 	ld	(x), a
                                    654 ;	lib/i2c.c: 28: I2C_DELAY();
      0082B3 4B 05            [ 1]  655 	push	#0x05
      0082B5 5F               [ 1]  656 	clrw	x
      0082B6 89               [ 2]  657 	pushw	x
      0082B7 4B 00            [ 1]  658 	push	#0x00
      0082B9 CD 80 A0         [ 4]  659 	call	_delay
      0082BC 5B 04            [ 2]  660 	addw	sp, #4
                                    661 ;	lib/i2c.c: 30: if((I2C_IDR & (1 << I2C_SDA)) == 0) error = 2;
      0082BE AE 50 06         [ 2]  662 	ldw	x, #0x5006
      0082C1 F6               [ 1]  663 	ld	a, (x)
      0082C2 A5 20            [ 1]  664 	bcp	a, #0x20
      0082C4 26 06            [ 1]  665 	jrne	00102$
      0082C6 88               [ 1]  666 	push	a
      0082C7 A6 02            [ 1]  667 	ld	a, #0x02
      0082C9 6B 02            [ 1]  668 	ld	(0x02, sp), a
      0082CB 84               [ 1]  669 	pop	a
      0082CC                        670 00102$:
                                    671 ;	lib/i2c.c: 31: if((I2C_IDR & (1 << I2C_SCL)) == 0) error |= 1;
      0082CC A5 10            [ 1]  672 	bcp	a, #0x10
      0082CE 26 06            [ 1]  673 	jrne	00104$
      0082D0 7B 01            [ 1]  674 	ld	a, (0x01, sp)
      0082D2 AA 01            [ 1]  675 	or	a, #0x01
      0082D4 6B 01            [ 1]  676 	ld	(0x01, sp), a
      0082D6                        677 00104$:
                                    678 ;	lib/i2c.c: 32: I2C_DELAY();
      0082D6 4B 05            [ 1]  679 	push	#0x05
      0082D8 5F               [ 1]  680 	clrw	x
      0082D9 89               [ 2]  681 	pushw	x
      0082DA 4B 00            [ 1]  682 	push	#0x00
      0082DC CD 80 A0         [ 4]  683 	call	_delay
      0082DF 5B 04            [ 2]  684 	addw	sp, #4
                                    685 ;	lib/i2c.c: 33: I2C_DELAY();
      0082E1 4B 05            [ 1]  686 	push	#0x05
      0082E3 5F               [ 1]  687 	clrw	x
      0082E4 89               [ 2]  688 	pushw	x
      0082E5 4B 00            [ 1]  689 	push	#0x00
      0082E7 CD 80 A0         [ 4]  690 	call	_delay
      0082EA 5B 04            [ 2]  691 	addw	sp, #4
                                    692 ;	lib/i2c.c: 34: I2C_DELAY();
      0082EC 4B 05            [ 1]  693 	push	#0x05
      0082EE 5F               [ 1]  694 	clrw	x
      0082EF 89               [ 2]  695 	pushw	x
      0082F0 4B 00            [ 1]  696 	push	#0x00
      0082F2 CD 80 A0         [ 4]  697 	call	_delay
      0082F5 5B 04            [ 2]  698 	addw	sp, #4
                                    699 ;	lib/i2c.c: 35: I2C_DELAY();
      0082F7 4B 05            [ 1]  700 	push	#0x05
      0082F9 5F               [ 1]  701 	clrw	x
      0082FA 89               [ 2]  702 	pushw	x
      0082FB 4B 00            [ 1]  703 	push	#0x00
      0082FD CD 80 A0         [ 4]  704 	call	_delay
      008300 5B 04            [ 2]  705 	addw	sp, #4
                                    706 ;	lib/i2c.c: 37: return error;
      008302 7B 01            [ 1]  707 	ld	a, (0x01, sp)
      008304 5B 01            [ 2]  708 	addw	sp, #1
      008306 81               [ 4]  709 	ret
                                    710 ;	lib/i2c.c: 44: void i2c_start(void)
                                    711 ;	-----------------------------------------
                                    712 ;	 function i2c_start
                                    713 ;	-----------------------------------------
      008307                        714 _i2c_start:
                                    715 ;	lib/i2c.c: 46: NULL_SDA();
      008307 AE 50 07         [ 2]  716 	ldw	x, #0x5007
      00830A F6               [ 1]  717 	ld	a, (x)
      00830B AA 20            [ 1]  718 	or	a, #0x20
      00830D F7               [ 1]  719 	ld	(x), a
      00830E AE 50 05         [ 2]  720 	ldw	x, #0x5005
      008311 F6               [ 1]  721 	ld	a, (x)
      008312 A4 DF            [ 1]  722 	and	a, #0xdf
      008314 F7               [ 1]  723 	ld	(x), a
                                    724 ;	lib/i2c.c: 47: I2C_DELAY();
      008315 4B 05            [ 1]  725 	push	#0x05
      008317 5F               [ 1]  726 	clrw	x
      008318 89               [ 2]  727 	pushw	x
      008319 4B 00            [ 1]  728 	push	#0x00
      00831B CD 80 A0         [ 4]  729 	call	_delay
      00831E 5B 04            [ 2]  730 	addw	sp, #4
                                    731 ;	lib/i2c.c: 48: NULL_SCL();
      008320 AE 50 07         [ 2]  732 	ldw	x, #0x5007
      008323 F6               [ 1]  733 	ld	a, (x)
      008324 AA 10            [ 1]  734 	or	a, #0x10
      008326 F7               [ 1]  735 	ld	(x), a
      008327 AE 50 05         [ 2]  736 	ldw	x, #0x5005
      00832A F6               [ 1]  737 	ld	a, (x)
      00832B A4 EF            [ 1]  738 	and	a, #0xef
      00832D F7               [ 1]  739 	ld	(x), a
                                    740 ;	lib/i2c.c: 49: I2C_DELAY();
      00832E 4B 05            [ 1]  741 	push	#0x05
      008330 5F               [ 1]  742 	clrw	x
      008331 89               [ 2]  743 	pushw	x
      008332 4B 00            [ 1]  744 	push	#0x00
      008334 CD 80 A0         [ 4]  745 	call	_delay
      008337 5B 04            [ 2]  746 	addw	sp, #4
      008339 81               [ 4]  747 	ret
                                    748 ;	lib/i2c.c: 56: void i2c_restart(void)
                                    749 ;	-----------------------------------------
                                    750 ;	 function i2c_restart
                                    751 ;	-----------------------------------------
      00833A                        752 _i2c_restart:
                                    753 ;	lib/i2c.c: 58: ONE_SDA();
      00833A AE 50 07         [ 2]  754 	ldw	x, #0x5007
      00833D F6               [ 1]  755 	ld	a, (x)
      00833E A4 DF            [ 1]  756 	and	a, #0xdf
      008340 F7               [ 1]  757 	ld	(x), a
      008341 AE 50 05         [ 2]  758 	ldw	x, #0x5005
      008344 F6               [ 1]  759 	ld	a, (x)
      008345 AA 20            [ 1]  760 	or	a, #0x20
      008347 F7               [ 1]  761 	ld	(x), a
                                    762 ;	lib/i2c.c: 59: I2C_DELAY();
      008348 4B 05            [ 1]  763 	push	#0x05
      00834A 5F               [ 1]  764 	clrw	x
      00834B 89               [ 2]  765 	pushw	x
      00834C 4B 00            [ 1]  766 	push	#0x00
      00834E CD 80 A0         [ 4]  767 	call	_delay
      008351 5B 04            [ 2]  768 	addw	sp, #4
                                    769 ;	lib/i2c.c: 60: ONE_SCL();
      008353 AE 50 07         [ 2]  770 	ldw	x, #0x5007
      008356 F6               [ 1]  771 	ld	a, (x)
      008357 A4 EF            [ 1]  772 	and	a, #0xef
      008359 F7               [ 1]  773 	ld	(x), a
      00835A AE 50 05         [ 2]  774 	ldw	x, #0x5005
      00835D F6               [ 1]  775 	ld	a, (x)
      00835E AA 10            [ 1]  776 	or	a, #0x10
      008360 F7               [ 1]  777 	ld	(x), a
                                    778 ;	lib/i2c.c: 61: I2C_DELAY();
      008361 4B 05            [ 1]  779 	push	#0x05
      008363 5F               [ 1]  780 	clrw	x
      008364 89               [ 2]  781 	pushw	x
      008365 4B 00            [ 1]  782 	push	#0x00
      008367 CD 80 A0         [ 4]  783 	call	_delay
      00836A 5B 04            [ 2]  784 	addw	sp, #4
                                    785 ;	lib/i2c.c: 63: NULL_SDA();
      00836C AE 50 07         [ 2]  786 	ldw	x, #0x5007
      00836F F6               [ 1]  787 	ld	a, (x)
      008370 AA 20            [ 1]  788 	or	a, #0x20
      008372 F7               [ 1]  789 	ld	(x), a
      008373 AE 50 05         [ 2]  790 	ldw	x, #0x5005
      008376 F6               [ 1]  791 	ld	a, (x)
      008377 A4 DF            [ 1]  792 	and	a, #0xdf
      008379 F7               [ 1]  793 	ld	(x), a
                                    794 ;	lib/i2c.c: 64: I2C_DELAY();
      00837A 4B 05            [ 1]  795 	push	#0x05
      00837C 5F               [ 1]  796 	clrw	x
      00837D 89               [ 2]  797 	pushw	x
      00837E 4B 00            [ 1]  798 	push	#0x00
      008380 CD 80 A0         [ 4]  799 	call	_delay
      008383 5B 04            [ 2]  800 	addw	sp, #4
                                    801 ;	lib/i2c.c: 65: NULL_SCL();
      008385 AE 50 07         [ 2]  802 	ldw	x, #0x5007
      008388 F6               [ 1]  803 	ld	a, (x)
      008389 AA 10            [ 1]  804 	or	a, #0x10
      00838B F7               [ 1]  805 	ld	(x), a
      00838C AE 50 05         [ 2]  806 	ldw	x, #0x5005
      00838F F6               [ 1]  807 	ld	a, (x)
      008390 A4 EF            [ 1]  808 	and	a, #0xef
      008392 F7               [ 1]  809 	ld	(x), a
                                    810 ;	lib/i2c.c: 66: I2C_DELAY();
      008393 4B 05            [ 1]  811 	push	#0x05
      008395 5F               [ 1]  812 	clrw	x
      008396 89               [ 2]  813 	pushw	x
      008397 4B 00            [ 1]  814 	push	#0x00
      008399 CD 80 A0         [ 4]  815 	call	_delay
      00839C 5B 04            [ 2]  816 	addw	sp, #4
      00839E 81               [ 4]  817 	ret
                                    818 ;	lib/i2c.c: 73: void i2c_init(void)
                                    819 ;	-----------------------------------------
                                    820 ;	 function i2c_init
                                    821 ;	-----------------------------------------
      00839F                        822 _i2c_init:
                                    823 ;	lib/i2c.c: 75: ONE_SDA();
      00839F AE 50 07         [ 2]  824 	ldw	x, #0x5007
      0083A2 F6               [ 1]  825 	ld	a, (x)
      0083A3 A4 DF            [ 1]  826 	and	a, #0xdf
      0083A5 F7               [ 1]  827 	ld	(x), a
      0083A6 AE 50 05         [ 2]  828 	ldw	x, #0x5005
      0083A9 F6               [ 1]  829 	ld	a, (x)
      0083AA AA 20            [ 1]  830 	or	a, #0x20
      0083AC F7               [ 1]  831 	ld	(x), a
                                    832 ;	lib/i2c.c: 76: ONE_SCL();
      0083AD AE 50 07         [ 2]  833 	ldw	x, #0x5007
      0083B0 F6               [ 1]  834 	ld	a, (x)
      0083B1 A4 EF            [ 1]  835 	and	a, #0xef
      0083B3 F7               [ 1]  836 	ld	(x), a
      0083B4 AE 50 05         [ 2]  837 	ldw	x, #0x5005
      0083B7 F6               [ 1]  838 	ld	a, (x)
      0083B8 AA 10            [ 1]  839 	or	a, #0x10
      0083BA F7               [ 1]  840 	ld	(x), a
                                    841 ;	lib/i2c.c: 78: i2c_stop();
      0083BB CC 82 57         [ 2]  842 	jp	_i2c_stop
                                    843 ;	lib/i2c.c: 85: unsigned char i2c_send_byte(unsigned char data)
                                    844 ;	-----------------------------------------
                                    845 ;	 function i2c_send_byte
                                    846 ;	-----------------------------------------
      0083BE                        847 _i2c_send_byte:
      0083BE 52 02            [ 2]  848 	sub	sp, #2
                                    849 ;	lib/i2c.c: 90: for(i = 0; i < 8; i++)
      0083C0 0F 01            [ 1]  850 	clr	(0x01, sp)
      0083C2                        851 00108$:
                                    852 ;	lib/i2c.c: 94: NULL_SDA();
      0083C2 AE 50 07         [ 2]  853 	ldw	x, #0x5007
      0083C5 F6               [ 1]  854 	ld	a, (x)
                                    855 ;	lib/i2c.c: 92: if((data & 0x80) == 0)
      0083C6 0D 05            [ 1]  856 	tnz	(0x05, sp)
      0083C8 2B 0F            [ 1]  857 	jrmi	00102$
                                    858 ;	lib/i2c.c: 94: NULL_SDA();
      0083CA AA 20            [ 1]  859 	or	a, #0x20
      0083CC AE 50 07         [ 2]  860 	ldw	x, #0x5007
      0083CF F7               [ 1]  861 	ld	(x), a
      0083D0 AE 50 05         [ 2]  862 	ldw	x, #0x5005
      0083D3 F6               [ 1]  863 	ld	a, (x)
      0083D4 A4 DF            [ 1]  864 	and	a, #0xdf
      0083D6 F7               [ 1]  865 	ld	(x), a
      0083D7 20 0D            [ 2]  866 	jra	00103$
      0083D9                        867 00102$:
                                    868 ;	lib/i2c.c: 98: ONE_SDA();
      0083D9 A4 DF            [ 1]  869 	and	a, #0xdf
      0083DB AE 50 07         [ 2]  870 	ldw	x, #0x5007
      0083DE F7               [ 1]  871 	ld	(x), a
      0083DF AE 50 05         [ 2]  872 	ldw	x, #0x5005
      0083E2 F6               [ 1]  873 	ld	a, (x)
      0083E3 AA 20            [ 1]  874 	or	a, #0x20
      0083E5 F7               [ 1]  875 	ld	(x), a
      0083E6                        876 00103$:
                                    877 ;	lib/i2c.c: 100: I2C_DELAY();
      0083E6 4B 05            [ 1]  878 	push	#0x05
      0083E8 5F               [ 1]  879 	clrw	x
      0083E9 89               [ 2]  880 	pushw	x
      0083EA 4B 00            [ 1]  881 	push	#0x00
      0083EC CD 80 A0         [ 4]  882 	call	_delay
      0083EF 5B 04            [ 2]  883 	addw	sp, #4
                                    884 ;	lib/i2c.c: 101: ONE_SCL();
      0083F1 AE 50 07         [ 2]  885 	ldw	x, #0x5007
      0083F4 F6               [ 1]  886 	ld	a, (x)
      0083F5 A4 EF            [ 1]  887 	and	a, #0xef
      0083F7 F7               [ 1]  888 	ld	(x), a
      0083F8 AE 50 05         [ 2]  889 	ldw	x, #0x5005
      0083FB F6               [ 1]  890 	ld	a, (x)
      0083FC AA 10            [ 1]  891 	or	a, #0x10
      0083FE F7               [ 1]  892 	ld	(x), a
                                    893 ;	lib/i2c.c: 102: I2C_DELAY();
      0083FF 4B 05            [ 1]  894 	push	#0x05
      008401 5F               [ 1]  895 	clrw	x
      008402 89               [ 2]  896 	pushw	x
      008403 4B 00            [ 1]  897 	push	#0x00
      008405 CD 80 A0         [ 4]  898 	call	_delay
      008408 5B 04            [ 2]  899 	addw	sp, #4
                                    900 ;	lib/i2c.c: 103: NULL_SCL();
      00840A AE 50 07         [ 2]  901 	ldw	x, #0x5007
      00840D F6               [ 1]  902 	ld	a, (x)
      00840E AA 10            [ 1]  903 	or	a, #0x10
      008410 F7               [ 1]  904 	ld	(x), a
      008411 AE 50 05         [ 2]  905 	ldw	x, #0x5005
      008414 F6               [ 1]  906 	ld	a, (x)
      008415 A4 EF            [ 1]  907 	and	a, #0xef
      008417 F7               [ 1]  908 	ld	(x), a
                                    909 ;	lib/i2c.c: 105: data = (data << 1);
      008418 08 05            [ 1]  910 	sll	(0x05, sp)
                                    911 ;	lib/i2c.c: 90: for(i = 0; i < 8; i++)
      00841A 0C 01            [ 1]  912 	inc	(0x01, sp)
      00841C 7B 01            [ 1]  913 	ld	a, (0x01, sp)
      00841E A1 08            [ 1]  914 	cp	a, #0x08
      008420 25 A0            [ 1]  915 	jrc	00108$
                                    916 ;	lib/i2c.c: 108: ONE_SDA();
      008422 AE 50 07         [ 2]  917 	ldw	x, #0x5007
      008425 F6               [ 1]  918 	ld	a, (x)
      008426 A4 DF            [ 1]  919 	and	a, #0xdf
      008428 F7               [ 1]  920 	ld	(x), a
      008429 AE 50 05         [ 2]  921 	ldw	x, #0x5005
      00842C F6               [ 1]  922 	ld	a, (x)
      00842D AA 20            [ 1]  923 	or	a, #0x20
      00842F F7               [ 1]  924 	ld	(x), a
                                    925 ;	lib/i2c.c: 109: I2C_DELAY();
      008430 4B 05            [ 1]  926 	push	#0x05
      008432 5F               [ 1]  927 	clrw	x
      008433 89               [ 2]  928 	pushw	x
      008434 4B 00            [ 1]  929 	push	#0x00
      008436 CD 80 A0         [ 4]  930 	call	_delay
      008439 5B 04            [ 2]  931 	addw	sp, #4
                                    932 ;	lib/i2c.c: 110: ONE_SCL();
      00843B AE 50 07         [ 2]  933 	ldw	x, #0x5007
      00843E F6               [ 1]  934 	ld	a, (x)
      00843F A4 EF            [ 1]  935 	and	a, #0xef
      008441 F7               [ 1]  936 	ld	(x), a
      008442 AE 50 05         [ 2]  937 	ldw	x, #0x5005
      008445 F6               [ 1]  938 	ld	a, (x)
      008446 AA 10            [ 1]  939 	or	a, #0x10
      008448 F7               [ 1]  940 	ld	(x), a
                                    941 ;	lib/i2c.c: 111: I2C_DELAY();
      008449 4B 05            [ 1]  942 	push	#0x05
      00844B 5F               [ 1]  943 	clrw	x
      00844C 89               [ 2]  944 	pushw	x
      00844D 4B 00            [ 1]  945 	push	#0x00
      00844F CD 80 A0         [ 4]  946 	call	_delay
      008452 5B 04            [ 2]  947 	addw	sp, #4
                                    948 ;	lib/i2c.c: 113: if((I2C_IDR & (1 << I2C_SDA)) == (1 << I2C_SDA))
      008454 AE 50 06         [ 2]  949 	ldw	x, #0x5006
      008457 F6               [ 1]  950 	ld	a, (x)
      008458 A4 20            [ 1]  951 	and	a, #0x20
      00845A A1 20            [ 1]  952 	cp	a, #0x20
      00845C 26 06            [ 1]  953 	jrne	00106$
                                    954 ;	lib/i2c.c: 115: ask = NACK;
      00845E A6 01            [ 1]  955 	ld	a, #0x01
      008460 6B 02            [ 1]  956 	ld	(0x02, sp), a
      008462 20 02            [ 2]  957 	jra	00107$
      008464                        958 00106$:
                                    959 ;	lib/i2c.c: 119: ask = ACK;
      008464 0F 02            [ 1]  960 	clr	(0x02, sp)
      008466                        961 00107$:
                                    962 ;	lib/i2c.c: 122: NULL_SCL();
      008466 AE 50 07         [ 2]  963 	ldw	x, #0x5007
      008469 F6               [ 1]  964 	ld	a, (x)
      00846A AA 10            [ 1]  965 	or	a, #0x10
      00846C F7               [ 1]  966 	ld	(x), a
      00846D AE 50 05         [ 2]  967 	ldw	x, #0x5005
      008470 F6               [ 1]  968 	ld	a, (x)
      008471 A4 EF            [ 1]  969 	and	a, #0xef
      008473 F7               [ 1]  970 	ld	(x), a
                                    971 ;	lib/i2c.c: 124: return ask;
      008474 7B 02            [ 1]  972 	ld	a, (0x02, sp)
      008476 5B 02            [ 2]  973 	addw	sp, #2
      008478 81               [ 4]  974 	ret
                                    975 ;	lib/i2c.c: 131: unsigned char i2c_read_byte(unsigned char ask)
                                    976 ;	-----------------------------------------
                                    977 ;	 function i2c_read_byte
                                    978 ;	-----------------------------------------
      008479                        979 _i2c_read_byte:
      008479 52 02            [ 2]  980 	sub	sp, #2
                                    981 ;	lib/i2c.c: 133: unsigned char byte = 0;
      00847B 0F 01            [ 1]  982 	clr	(0x01, sp)
                                    983 ;	lib/i2c.c: 136: ONE_SDA();
      00847D AE 50 07         [ 2]  984 	ldw	x, #0x5007
      008480 F6               [ 1]  985 	ld	a, (x)
      008481 A4 DF            [ 1]  986 	and	a, #0xdf
      008483 F7               [ 1]  987 	ld	(x), a
      008484 AE 50 05         [ 2]  988 	ldw	x, #0x5005
      008487 F6               [ 1]  989 	ld	a, (x)
      008488 AA 20            [ 1]  990 	or	a, #0x20
      00848A F7               [ 1]  991 	ld	(x), a
                                    992 ;	lib/i2c.c: 138: for(i = 0; i < 8; i++)
      00848B 0F 02            [ 1]  993 	clr	(0x02, sp)
      00848D                        994 00107$:
                                    995 ;	lib/i2c.c: 140: byte = (byte << 1);
      00848D 08 01            [ 1]  996 	sll	(0x01, sp)
                                    997 ;	lib/i2c.c: 141: ONE_SCL();
      00848F AE 50 07         [ 2]  998 	ldw	x, #0x5007
      008492 F6               [ 1]  999 	ld	a, (x)
      008493 A4 EF            [ 1] 1000 	and	a, #0xef
      008495 F7               [ 1] 1001 	ld	(x), a
      008496 AE 50 05         [ 2] 1002 	ldw	x, #0x5005
      008499 F6               [ 1] 1003 	ld	a, (x)
      00849A AA 10            [ 1] 1004 	or	a, #0x10
      00849C F7               [ 1] 1005 	ld	(x), a
                                   1006 ;	lib/i2c.c: 142: I2C_DELAY();
      00849D 4B 05            [ 1] 1007 	push	#0x05
      00849F 5F               [ 1] 1008 	clrw	x
      0084A0 89               [ 2] 1009 	pushw	x
      0084A1 4B 00            [ 1] 1010 	push	#0x00
      0084A3 CD 80 A0         [ 4] 1011 	call	_delay
      0084A6 5B 04            [ 2] 1012 	addw	sp, #4
                                   1013 ;	lib/i2c.c: 143: if((I2C_IDR & (1 << I2C_SDA)) == (1 << I2C_SDA)) byte |= 0x01;
      0084A8 AE 50 06         [ 2] 1014 	ldw	x, #0x5006
      0084AB F6               [ 1] 1015 	ld	a, (x)
      0084AC A4 20            [ 1] 1016 	and	a, #0x20
      0084AE A1 20            [ 1] 1017 	cp	a, #0x20
      0084B0 26 06            [ 1] 1018 	jrne	00102$
      0084B2 7B 01            [ 1] 1019 	ld	a, (0x01, sp)
      0084B4 AA 01            [ 1] 1020 	or	a, #0x01
      0084B6 6B 01            [ 1] 1021 	ld	(0x01, sp), a
      0084B8                       1022 00102$:
                                   1023 ;	lib/i2c.c: 144: NULL_SCL();
      0084B8 AE 50 07         [ 2] 1024 	ldw	x, #0x5007
      0084BB F6               [ 1] 1025 	ld	a, (x)
      0084BC AA 10            [ 1] 1026 	or	a, #0x10
      0084BE F7               [ 1] 1027 	ld	(x), a
      0084BF AE 50 05         [ 2] 1028 	ldw	x, #0x5005
      0084C2 F6               [ 1] 1029 	ld	a, (x)
      0084C3 A4 EF            [ 1] 1030 	and	a, #0xef
      0084C5 F7               [ 1] 1031 	ld	(x), a
                                   1032 ;	lib/i2c.c: 145: I2C_DELAY();
      0084C6 4B 05            [ 1] 1033 	push	#0x05
      0084C8 5F               [ 1] 1034 	clrw	x
      0084C9 89               [ 2] 1035 	pushw	x
      0084CA 4B 00            [ 1] 1036 	push	#0x00
      0084CC CD 80 A0         [ 4] 1037 	call	_delay
      0084CF 5B 04            [ 2] 1038 	addw	sp, #4
                                   1039 ;	lib/i2c.c: 138: for(i = 0; i < 8; i++)
      0084D1 0C 02            [ 1] 1040 	inc	(0x02, sp)
      0084D3 7B 02            [ 1] 1041 	ld	a, (0x02, sp)
      0084D5 A1 08            [ 1] 1042 	cp	a, #0x08
      0084D7 25 B4            [ 1] 1043 	jrc	00107$
                                   1044 ;	lib/i2c.c: 136: ONE_SDA();
      0084D9 AE 50 07         [ 2] 1045 	ldw	x, #0x5007
      0084DC F6               [ 1] 1046 	ld	a, (x)
                                   1047 ;	lib/i2c.c: 148: if(ask == ACK)
      0084DD 0D 05            [ 1] 1048 	tnz	(0x05, sp)
      0084DF 26 0F            [ 1] 1049 	jrne	00105$
                                   1050 ;	lib/i2c.c: 150: NULL_SDA();
      0084E1 AA 20            [ 1] 1051 	or	a, #0x20
      0084E3 AE 50 07         [ 2] 1052 	ldw	x, #0x5007
      0084E6 F7               [ 1] 1053 	ld	(x), a
      0084E7 AE 50 05         [ 2] 1054 	ldw	x, #0x5005
      0084EA F6               [ 1] 1055 	ld	a, (x)
      0084EB A4 DF            [ 1] 1056 	and	a, #0xdf
      0084ED F7               [ 1] 1057 	ld	(x), a
      0084EE 20 0D            [ 2] 1058 	jra	00106$
      0084F0                       1059 00105$:
                                   1060 ;	lib/i2c.c: 154: ONE_SDA();
      0084F0 A4 DF            [ 1] 1061 	and	a, #0xdf
      0084F2 AE 50 07         [ 2] 1062 	ldw	x, #0x5007
      0084F5 F7               [ 1] 1063 	ld	(x), a
      0084F6 AE 50 05         [ 2] 1064 	ldw	x, #0x5005
      0084F9 F6               [ 1] 1065 	ld	a, (x)
      0084FA AA 20            [ 1] 1066 	or	a, #0x20
      0084FC F7               [ 1] 1067 	ld	(x), a
      0084FD                       1068 00106$:
                                   1069 ;	lib/i2c.c: 156: I2C_DELAY();
      0084FD 4B 05            [ 1] 1070 	push	#0x05
      0084FF 5F               [ 1] 1071 	clrw	x
      008500 89               [ 2] 1072 	pushw	x
      008501 4B 00            [ 1] 1073 	push	#0x00
      008503 CD 80 A0         [ 4] 1074 	call	_delay
      008506 5B 04            [ 2] 1075 	addw	sp, #4
                                   1076 ;	lib/i2c.c: 157: ONE_SCL();
      008508 AE 50 07         [ 2] 1077 	ldw	x, #0x5007
      00850B F6               [ 1] 1078 	ld	a, (x)
      00850C A4 EF            [ 1] 1079 	and	a, #0xef
      00850E F7               [ 1] 1080 	ld	(x), a
      00850F AE 50 05         [ 2] 1081 	ldw	x, #0x5005
      008512 F6               [ 1] 1082 	ld	a, (x)
      008513 AA 10            [ 1] 1083 	or	a, #0x10
      008515 F7               [ 1] 1084 	ld	(x), a
                                   1085 ;	lib/i2c.c: 158: I2C_DELAY();
      008516 4B 05            [ 1] 1086 	push	#0x05
      008518 5F               [ 1] 1087 	clrw	x
      008519 89               [ 2] 1088 	pushw	x
      00851A 4B 00            [ 1] 1089 	push	#0x00
      00851C CD 80 A0         [ 4] 1090 	call	_delay
      00851F 5B 04            [ 2] 1091 	addw	sp, #4
                                   1092 ;	lib/i2c.c: 159: NULL_SCL();
      008521 AE 50 07         [ 2] 1093 	ldw	x, #0x5007
      008524 F6               [ 1] 1094 	ld	a, (x)
      008525 AA 10            [ 1] 1095 	or	a, #0x10
      008527 F7               [ 1] 1096 	ld	(x), a
      008528 AE 50 05         [ 2] 1097 	ldw	x, #0x5005
      00852B F6               [ 1] 1098 	ld	a, (x)
      00852C A4 EF            [ 1] 1099 	and	a, #0xef
      00852E F7               [ 1] 1100 	ld	(x), a
                                   1101 ;	lib/i2c.c: 160: I2C_DELAY();
      00852F 4B 05            [ 1] 1102 	push	#0x05
      008531 5F               [ 1] 1103 	clrw	x
      008532 89               [ 2] 1104 	pushw	x
      008533 4B 00            [ 1] 1105 	push	#0x00
      008535 CD 80 A0         [ 4] 1106 	call	_delay
      008538 5B 04            [ 2] 1107 	addw	sp, #4
                                   1108 ;	lib/i2c.c: 161: ONE_SDA();
      00853A AE 50 07         [ 2] 1109 	ldw	x, #0x5007
      00853D F6               [ 1] 1110 	ld	a, (x)
      00853E A4 DF            [ 1] 1111 	and	a, #0xdf
      008540 F7               [ 1] 1112 	ld	(x), a
      008541 AE 50 05         [ 2] 1113 	ldw	x, #0x5005
      008544 F6               [ 1] 1114 	ld	a, (x)
      008545 AA 20            [ 1] 1115 	or	a, #0x20
      008547 F7               [ 1] 1116 	ld	(x), a
                                   1117 ;	lib/i2c.c: 163: return byte;
      008548 7B 01            [ 1] 1118 	ld	a, (0x01, sp)
      00854A 5B 02            [ 2] 1119 	addw	sp, #2
      00854C 81               [ 4] 1120 	ret
                                   1121 ;	lib/rtc.c: 3: unsigned char RTC_ConvertFromDec(unsigned char c){
                                   1122 ;	-----------------------------------------
                                   1123 ;	 function RTC_ConvertFromDec
                                   1124 ;	-----------------------------------------
      00854D                       1125 _RTC_ConvertFromDec:
      00854D 88               [ 1] 1126 	push	a
                                   1127 ;	lib/rtc.c: 4: unsigned char ch = ((c>>4)*10+(0b00001111&c));
      00854E 7B 04            [ 1] 1128 	ld	a, (0x04, sp)
      008550 4E               [ 1] 1129 	swap	a
      008551 A4 0F            [ 1] 1130 	and	a, #0x0f
      008553 41               [ 1] 1131 	exg	a, xl
      008554 A6 0A            [ 1] 1132 	ld	a, #0x0a
      008556 41               [ 1] 1133 	exg	a, xl
      008557 42               [ 4] 1134 	mul	x, a
      008558 7B 04            [ 1] 1135 	ld	a, (0x04, sp)
      00855A A4 0F            [ 1] 1136 	and	a, #0x0f
      00855C 6B 01            [ 1] 1137 	ld	(0x01, sp), a
      00855E 9F               [ 1] 1138 	ld	a, xl
      00855F 1B 01            [ 1] 1139 	add	a, (0x01, sp)
                                   1140 ;	lib/rtc.c: 5: return ch;
      008561 5B 01            [ 2] 1141 	addw	sp, #1
      008563 81               [ 4] 1142 	ret
                                   1143 ;	lib/rtc.c: 8: unsigned char RTC_ConvertFromBinDec(unsigned char c){
                                   1144 ;	-----------------------------------------
                                   1145 ;	 function RTC_ConvertFromBinDec
                                   1146 ;	-----------------------------------------
      008564                       1147 _RTC_ConvertFromBinDec:
      008564 88               [ 1] 1148 	push	a
                                   1149 ;	lib/rtc.c: 9: unsigned char ch = ((c/10)<<4)|(c%10);
      008565 5F               [ 1] 1150 	clrw	x
      008566 7B 04            [ 1] 1151 	ld	a, (0x04, sp)
      008568 97               [ 1] 1152 	ld	xl, a
      008569 A6 0A            [ 1] 1153 	ld	a, #0x0a
      00856B 62               [ 2] 1154 	div	x, a
      00856C 9F               [ 1] 1155 	ld	a, xl
      00856D 4E               [ 1] 1156 	swap	a
      00856E A4 F0            [ 1] 1157 	and	a, #0xf0
      008570 6B 01            [ 1] 1158 	ld	(0x01, sp), a
      008572 5F               [ 1] 1159 	clrw	x
      008573 7B 04            [ 1] 1160 	ld	a, (0x04, sp)
      008575 97               [ 1] 1161 	ld	xl, a
      008576 A6 0A            [ 1] 1162 	ld	a, #0x0a
      008578 62               [ 2] 1163 	div	x, a
      008579 1A 01            [ 1] 1164 	or	a, (0x01, sp)
                                   1165 ;	lib/rtc.c: 10: return ch;
      00857B 5B 01            [ 2] 1166 	addw	sp, #1
      00857D 81               [ 4] 1167 	ret
                                   1168 ;	lib/rtc.c: 13: void RTC_Read(){
                                   1169 ;	-----------------------------------------
                                   1170 ;	 function RTC_Read
                                   1171 ;	-----------------------------------------
      00857E                       1172 _RTC_Read:
                                   1173 ;	lib/rtc.c: 16: i2c_start();
      00857E CD 83 07         [ 4] 1174 	call	_i2c_start
                                   1175 ;	lib/rtc.c: 17: i2c_send_byte(0xD0);
      008581 4B D0            [ 1] 1176 	push	#0xd0
      008583 CD 83 BE         [ 4] 1177 	call	_i2c_send_byte
      008586 84               [ 1] 1178 	pop	a
                                   1179 ;	lib/rtc.c: 18: i2c_send_byte(0x00);
      008587 4B 00            [ 1] 1180 	push	#0x00
      008589 CD 83 BE         [ 4] 1181 	call	_i2c_send_byte
      00858C 84               [ 1] 1182 	pop	a
                                   1183 ;	lib/rtc.c: 19: i2c_restart();
      00858D CD 83 3A         [ 4] 1184 	call	_i2c_restart
                                   1185 ;	lib/rtc.c: 20: i2c_send_byte(0xD1);
      008590 4B D1            [ 1] 1186 	push	#0xd1
      008592 CD 83 BE         [ 4] 1187 	call	_i2c_send_byte
      008595 84               [ 1] 1188 	pop	a
                                   1189 ;	lib/rtc.c: 21: sec		= i2c_read_byte(0);
      008596 4B 00            [ 1] 1190 	push	#0x00
      008598 CD 84 79         [ 4] 1191 	call	_i2c_read_byte
      00859B 5B 01            [ 2] 1192 	addw	sp, #1
      00859D C7 00 01         [ 1] 1193 	ld	_sec+0, a
                                   1194 ;	lib/rtc.c: 22: min		= i2c_read_byte(0);
      0085A0 4B 00            [ 1] 1195 	push	#0x00
      0085A2 CD 84 79         [ 4] 1196 	call	_i2c_read_byte
      0085A5 5B 01            [ 2] 1197 	addw	sp, #1
      0085A7 C7 00 02         [ 1] 1198 	ld	_min+0, a
                                   1199 ;	lib/rtc.c: 23: hour	= i2c_read_byte(0);
      0085AA 4B 00            [ 1] 1200 	push	#0x00
      0085AC CD 84 79         [ 4] 1201 	call	_i2c_read_byte
      0085AF 5B 01            [ 2] 1202 	addw	sp, #1
      0085B1 C7 00 03         [ 1] 1203 	ld	_hour+0, a
                                   1204 ;	lib/rtc.c: 24: day		= i2c_read_byte(0);
      0085B4 4B 00            [ 1] 1205 	push	#0x00
      0085B6 CD 84 79         [ 4] 1206 	call	_i2c_read_byte
      0085B9 5B 01            [ 2] 1207 	addw	sp, #1
      0085BB C7 00 04         [ 1] 1208 	ld	_day+0, a
                                   1209 ;	lib/rtc.c: 25: date	= i2c_read_byte(0);
      0085BE 4B 00            [ 1] 1210 	push	#0x00
      0085C0 CD 84 79         [ 4] 1211 	call	_i2c_read_byte
      0085C3 5B 01            [ 2] 1212 	addw	sp, #1
      0085C5 C7 00 05         [ 1] 1213 	ld	_date+0, a
                                   1214 ;	lib/rtc.c: 26: month	= i2c_read_byte(0);
      0085C8 4B 00            [ 1] 1215 	push	#0x00
      0085CA CD 84 79         [ 4] 1216 	call	_i2c_read_byte
      0085CD 5B 01            [ 2] 1217 	addw	sp, #1
      0085CF C7 00 06         [ 1] 1218 	ld	_month+0, a
                                   1219 ;	lib/rtc.c: 27: year	= i2c_read_byte(1);
      0085D2 4B 01            [ 1] 1220 	push	#0x01
      0085D4 CD 84 79         [ 4] 1221 	call	_i2c_read_byte
      0085D7 5B 01            [ 2] 1222 	addw	sp, #1
      0085D9 C7 00 07         [ 1] 1223 	ld	_year+0, a
                                   1224 ;	lib/rtc.c: 28: i2c_stop();
      0085DC CD 82 57         [ 4] 1225 	call	_i2c_stop
                                   1226 ;	lib/rtc.c: 30: sec		= RTC_ConvertFromDec(sec);
      0085DF 3B 00 01         [ 1] 1227 	push	_sec+0
      0085E2 CD 85 4D         [ 4] 1228 	call	_RTC_ConvertFromDec
      0085E5 5B 01            [ 2] 1229 	addw	sp, #1
      0085E7 C7 00 01         [ 1] 1230 	ld	_sec+0, a
                                   1231 ;	lib/rtc.c: 31: min		= RTC_ConvertFromDec(min);
      0085EA 3B 00 02         [ 1] 1232 	push	_min+0
      0085ED CD 85 4D         [ 4] 1233 	call	_RTC_ConvertFromDec
      0085F0 5B 01            [ 2] 1234 	addw	sp, #1
      0085F2 C7 00 02         [ 1] 1235 	ld	_min+0, a
                                   1236 ;	lib/rtc.c: 32: hour	= RTC_ConvertFromDec(hour);
      0085F5 3B 00 03         [ 1] 1237 	push	_hour+0
      0085F8 CD 85 4D         [ 4] 1238 	call	_RTC_ConvertFromDec
      0085FB 5B 01            [ 2] 1239 	addw	sp, #1
      0085FD C7 00 03         [ 1] 1240 	ld	_hour+0, a
                                   1241 ;	lib/rtc.c: 33: day		= RTC_ConvertFromDec(day);
      008600 3B 00 04         [ 1] 1242 	push	_day+0
      008603 CD 85 4D         [ 4] 1243 	call	_RTC_ConvertFromDec
      008606 5B 01            [ 2] 1244 	addw	sp, #1
      008608 C7 00 04         [ 1] 1245 	ld	_day+0, a
                                   1246 ;	lib/rtc.c: 34: date	= RTC_ConvertFromDec(date);
      00860B 3B 00 05         [ 1] 1247 	push	_date+0
      00860E CD 85 4D         [ 4] 1248 	call	_RTC_ConvertFromDec
      008611 5B 01            [ 2] 1249 	addw	sp, #1
      008613 C7 00 05         [ 1] 1250 	ld	_date+0, a
                                   1251 ;	lib/rtc.c: 35: month	= RTC_ConvertFromDec(month);
      008616 3B 00 06         [ 1] 1252 	push	_month+0
      008619 CD 85 4D         [ 4] 1253 	call	_RTC_ConvertFromDec
      00861C 5B 01            [ 2] 1254 	addw	sp, #1
      00861E C7 00 06         [ 1] 1255 	ld	_month+0, a
                                   1256 ;	lib/rtc.c: 36: year	= RTC_ConvertFromDec(year);
      008621 3B 00 07         [ 1] 1257 	push	_year+0
      008624 CD 85 4D         [ 4] 1258 	call	_RTC_ConvertFromDec
      008627 5B 01            [ 2] 1259 	addw	sp, #1
      008629 C7 00 07         [ 1] 1260 	ld	_year+0, a
      00862C 81               [ 4] 1261 	ret
                                   1262 ;	lib/rtc.c: 40: void RTC_Set(unsigned char sec, unsigned char min, unsigned char hour, unsigned char day, unsigned char date, unsigned char month, unsigned char year){
                                   1263 ;	-----------------------------------------
                                   1264 ;	 function RTC_Set
                                   1265 ;	-----------------------------------------
      00862D                       1266 _RTC_Set:
      00862D 52 07            [ 2] 1267 	sub	sp, #7
                                   1268 ;	lib/rtc.c: 41: sec		= RTC_ConvertFromBinDec(sec);
      00862F 7B 0A            [ 1] 1269 	ld	a, (0x0a, sp)
      008631 88               [ 1] 1270 	push	a
      008632 CD 85 64         [ 4] 1271 	call	_RTC_ConvertFromBinDec
      008635 5B 01            [ 2] 1272 	addw	sp, #1
      008637 6B 01            [ 1] 1273 	ld	(0x01, sp), a
                                   1274 ;	lib/rtc.c: 42: min		= RTC_ConvertFromBinDec(min);
      008639 7B 0B            [ 1] 1275 	ld	a, (0x0b, sp)
      00863B 88               [ 1] 1276 	push	a
      00863C CD 85 64         [ 4] 1277 	call	_RTC_ConvertFromBinDec
      00863F 5B 01            [ 2] 1278 	addw	sp, #1
      008641 6B 07            [ 1] 1279 	ld	(0x07, sp), a
                                   1280 ;	lib/rtc.c: 43: hour	= RTC_ConvertFromBinDec(hour);
      008643 7B 0C            [ 1] 1281 	ld	a, (0x0c, sp)
      008645 88               [ 1] 1282 	push	a
      008646 CD 85 64         [ 4] 1283 	call	_RTC_ConvertFromBinDec
      008649 5B 01            [ 2] 1284 	addw	sp, #1
      00864B 6B 06            [ 1] 1285 	ld	(0x06, sp), a
                                   1286 ;	lib/rtc.c: 44: day		= RTC_ConvertFromBinDec(day);
      00864D 7B 0D            [ 1] 1287 	ld	a, (0x0d, sp)
      00864F 88               [ 1] 1288 	push	a
      008650 CD 85 64         [ 4] 1289 	call	_RTC_ConvertFromBinDec
      008653 5B 01            [ 2] 1290 	addw	sp, #1
      008655 6B 05            [ 1] 1291 	ld	(0x05, sp), a
                                   1292 ;	lib/rtc.c: 45: date	= RTC_ConvertFromBinDec(date);
      008657 7B 0E            [ 1] 1293 	ld	a, (0x0e, sp)
      008659 88               [ 1] 1294 	push	a
      00865A CD 85 64         [ 4] 1295 	call	_RTC_ConvertFromBinDec
      00865D 5B 01            [ 2] 1296 	addw	sp, #1
      00865F 6B 04            [ 1] 1297 	ld	(0x04, sp), a
                                   1298 ;	lib/rtc.c: 46: month	= RTC_ConvertFromBinDec(month);
      008661 7B 0F            [ 1] 1299 	ld	a, (0x0f, sp)
      008663 88               [ 1] 1300 	push	a
      008664 CD 85 64         [ 4] 1301 	call	_RTC_ConvertFromBinDec
      008667 5B 01            [ 2] 1302 	addw	sp, #1
      008669 6B 03            [ 1] 1303 	ld	(0x03, sp), a
                                   1304 ;	lib/rtc.c: 47: year	= RTC_ConvertFromBinDec(year);
      00866B 7B 10            [ 1] 1305 	ld	a, (0x10, sp)
      00866D 88               [ 1] 1306 	push	a
      00866E CD 85 64         [ 4] 1307 	call	_RTC_ConvertFromBinDec
      008671 5B 01            [ 2] 1308 	addw	sp, #1
      008673 6B 02            [ 1] 1309 	ld	(0x02, sp), a
                                   1310 ;	lib/rtc.c: 49: i2c_start();
      008675 CD 83 07         [ 4] 1311 	call	_i2c_start
                                   1312 ;	lib/rtc.c: 50: i2c_send_byte(0xD0);
      008678 4B D0            [ 1] 1313 	push	#0xd0
      00867A CD 83 BE         [ 4] 1314 	call	_i2c_send_byte
      00867D 84               [ 1] 1315 	pop	a
                                   1316 ;	lib/rtc.c: 51: i2c_send_byte(0x00);
      00867E 4B 00            [ 1] 1317 	push	#0x00
      008680 CD 83 BE         [ 4] 1318 	call	_i2c_send_byte
      008683 84               [ 1] 1319 	pop	a
                                   1320 ;	lib/rtc.c: 53: i2c_send_byte(sec);
      008684 7B 01            [ 1] 1321 	ld	a, (0x01, sp)
      008686 88               [ 1] 1322 	push	a
      008687 CD 83 BE         [ 4] 1323 	call	_i2c_send_byte
      00868A 84               [ 1] 1324 	pop	a
                                   1325 ;	lib/rtc.c: 54: i2c_send_byte(min);
      00868B 7B 07            [ 1] 1326 	ld	a, (0x07, sp)
      00868D 88               [ 1] 1327 	push	a
      00868E CD 83 BE         [ 4] 1328 	call	_i2c_send_byte
      008691 84               [ 1] 1329 	pop	a
                                   1330 ;	lib/rtc.c: 55: i2c_send_byte(hour);
      008692 7B 06            [ 1] 1331 	ld	a, (0x06, sp)
      008694 88               [ 1] 1332 	push	a
      008695 CD 83 BE         [ 4] 1333 	call	_i2c_send_byte
      008698 84               [ 1] 1334 	pop	a
                                   1335 ;	lib/rtc.c: 56: i2c_send_byte(day);
      008699 7B 05            [ 1] 1336 	ld	a, (0x05, sp)
      00869B 88               [ 1] 1337 	push	a
      00869C CD 83 BE         [ 4] 1338 	call	_i2c_send_byte
      00869F 84               [ 1] 1339 	pop	a
                                   1340 ;	lib/rtc.c: 57: i2c_send_byte(date);
      0086A0 7B 04            [ 1] 1341 	ld	a, (0x04, sp)
      0086A2 88               [ 1] 1342 	push	a
      0086A3 CD 83 BE         [ 4] 1343 	call	_i2c_send_byte
      0086A6 84               [ 1] 1344 	pop	a
                                   1345 ;	lib/rtc.c: 58: i2c_send_byte(month);
      0086A7 7B 03            [ 1] 1346 	ld	a, (0x03, sp)
      0086A9 88               [ 1] 1347 	push	a
      0086AA CD 83 BE         [ 4] 1348 	call	_i2c_send_byte
      0086AD 84               [ 1] 1349 	pop	a
                                   1350 ;	lib/rtc.c: 59: i2c_send_byte(year);
      0086AE 7B 02            [ 1] 1351 	ld	a, (0x02, sp)
      0086B0 88               [ 1] 1352 	push	a
      0086B1 CD 83 BE         [ 4] 1353 	call	_i2c_send_byte
      0086B4 84               [ 1] 1354 	pop	a
                                   1355 ;	lib/rtc.c: 60: i2c_stop();
      0086B5 CD 82 57         [ 4] 1356 	call	_i2c_stop
      0086B8 5B 07            [ 2] 1357 	addw	sp, #7
      0086BA 81               [ 4] 1358 	ret
                                   1359 ;	lib/eeprom.c: 3: void EEPROM_UNLOCK(void){
                                   1360 ;	-----------------------------------------
                                   1361 ;	 function EEPROM_UNLOCK
                                   1362 ;	-----------------------------------------
      0086BB                       1363 _EEPROM_UNLOCK:
                                   1364 ;	lib/eeprom.c: 5: FLASH_DUKR = 0xAE; // unlock EEPROM
      0086BB 35 AE 50 64      [ 1] 1365 	mov	0x5064+0, #0xae
                                   1366 ;	lib/eeprom.c: 6: FLASH_DUKR = 0x56;
      0086BF 35 56 50 64      [ 1] 1367 	mov	0x5064+0, #0x56
                                   1368 ;	lib/eeprom.c: 8: while (!(FLASH_IAPSR & (1<<3))); // check protection off
      0086C3                       1369 00101$:
      0086C3 AE 50 5F         [ 2] 1370 	ldw	x, #0x505f
      0086C6 F6               [ 1] 1371 	ld	a, (x)
      0086C7 A5 08            [ 1] 1372 	bcp	a, #0x08
      0086C9 27 F8            [ 1] 1373 	jreq	00101$
      0086CB 81               [ 4] 1374 	ret
                                   1375 ;	clock.c: 84: void hard_Reset(){ //default setting
                                   1376 ;	-----------------------------------------
                                   1377 ;	 function hard_Reset
                                   1378 ;	-----------------------------------------
      0086CC                       1379 _hard_Reset:
      0086CC 52 02            [ 2] 1380 	sub	sp, #2
                                   1381 ;	clock.c: 86: EEPROM_UNLOCK();
      0086CE CD 86 BB         [ 4] 1382 	call	_EEPROM_UNLOCK
                                   1383 ;	clock.c: 87: EEPROM_DATA(setting_Brigh) = 7;
      0086D1 35 07 40 00      [ 1] 1384 	mov	0x4000+0, #0x07
                                   1385 ;	clock.c: 89: EEPROM_DATA(DnClock_hour_0) = 0x00;
      0086D5 35 00 40 00      [ 1] 1386 	mov	0x4000+0, #0x00
                                   1387 ;	clock.c: 90: EEPROM_DATA(DnClock_min_0)	= 0x00;
      0086D9 35 00 40 01      [ 1] 1388 	mov	0x4001+0, #0x00
                                   1389 ;	clock.c: 92: EEPROM_DATA(DnClock_hour_1) = 0x00;
      0086DD 35 00 40 02      [ 1] 1390 	mov	0x4002+0, #0x00
                                   1391 ;	clock.c: 93: EEPROM_DATA(DnClock_min_1)	= 0x00;
      0086E1 35 00 40 03      [ 1] 1392 	mov	0x4003+0, #0x00
                                   1393 ;	clock.c: 95: EEPROM_DATA(DnClock_hour_2) = 0x00;
      0086E5 35 00 40 04      [ 1] 1394 	mov	0x4004+0, #0x00
                                   1395 ;	clock.c: 96: EEPROM_DATA(DnClock_min_2)	= 0x00;
      0086E9 35 00 40 05      [ 1] 1396 	mov	0x4005+0, #0x00
                                   1397 ;	clock.c: 98: EEPROM_DATA(DnClock_hour_3) = 0x00;
      0086ED 35 00 40 06      [ 1] 1398 	mov	0x4006+0, #0x00
                                   1399 ;	clock.c: 99: EEPROM_DATA(DnClock_min_3)	= 0x00;		
      0086F1 35 00 40 07      [ 1] 1400 	mov	0x4007+0, #0x00
                                   1401 ;	clock.c: 102: EEPROM_LOCK();
      0086F5 AE 50 5F         [ 2] 1402 	ldw	x, #0x505f
      0086F8 F6               [ 1] 1403 	ld	a, (x)
      0086F9 A4 F7            [ 1] 1404 	and	a, #0xf7
      0086FB F7               [ 1] 1405 	ld	(x), a
                                   1406 ;	clock.c: 104: RTC_Set(0, 0, 0, 1, 1, 1, 20); //reset RTC
      0086FC 4B 14            [ 1] 1407 	push	#0x14
      0086FE 4B 01            [ 1] 1408 	push	#0x01
      008700 4B 01            [ 1] 1409 	push	#0x01
      008702 4B 01            [ 1] 1410 	push	#0x01
      008704 4B 00            [ 1] 1411 	push	#0x00
      008706 4B 00            [ 1] 1412 	push	#0x00
      008708 4B 00            [ 1] 1413 	push	#0x00
      00870A CD 86 2D         [ 4] 1414 	call	_RTC_Set
      00870D 5B 07            [ 2] 1415 	addw	sp, #7
                                   1416 ;	clock.c: 107: TM1637_cleer();
      00870F CD 82 20         [ 4] 1417 	call	_TM1637_cleer
                                   1418 ;	clock.c: 108: TM1637_sendMASS(0x50,0x6D,0x78,0x00); //RESET
      008712 AE 00 27         [ 2] 1419 	ldw	x, #_TM1637_seg+0
      008715 1F 01            [ 2] 1420 	ldw	(0x01, sp), x
      008717 1E 01            [ 2] 1421 	ldw	x, (0x01, sp)
      008719 A6 50            [ 1] 1422 	ld	a, #0x50
      00871B F7               [ 1] 1423 	ld	(x), a
      00871C 1E 01            [ 2] 1424 	ldw	x, (0x01, sp)
      00871E 5C               [ 2] 1425 	incw	x
      00871F A6 6D            [ 1] 1426 	ld	a, #0x6d
      008721 F7               [ 1] 1427 	ld	(x), a
      008722 1E 01            [ 2] 1428 	ldw	x, (0x01, sp)
      008724 5C               [ 2] 1429 	incw	x
      008725 5C               [ 2] 1430 	incw	x
      008726 A6 78            [ 1] 1431 	ld	a, #0x78
      008728 F7               [ 1] 1432 	ld	(x), a
      008729 1E 01            [ 2] 1433 	ldw	x, (0x01, sp)
      00872B 1C 00 03         [ 2] 1434 	addw	x, #0x0003
      00872E 7F               [ 1] 1435 	clr	(x)
      00872F CD 81 D9         [ 4] 1436 	call	_TM1637_send
                                   1437 ;	clock.c: 109: delay(99999);
      008732 4B 9F            [ 1] 1438 	push	#0x9f
      008734 4B 86            [ 1] 1439 	push	#0x86
      008736 4B 01            [ 1] 1440 	push	#0x01
      008738 4B 00            [ 1] 1441 	push	#0x00
      00873A CD 80 A0         [ 4] 1442 	call	_delay
      00873D 5B 04            [ 2] 1443 	addw	sp, #4
                                   1444 ;	clock.c: 111: WWDG_CR = 0xFF; //software reset
      00873F 35 FF 50 D1      [ 1] 1445 	mov	0x50d1+0, #0xff
      008743 5B 02            [ 2] 1446 	addw	sp, #2
      008745 81               [ 4] 1447 	ret
                                   1448 ;	clock.c: 116: char button(char but){ //Обработка кнопок
                                   1449 ;	-----------------------------------------
                                   1450 ;	 function button
                                   1451 ;	-----------------------------------------
      008746                       1452 _button:
      008746 52 04            [ 2] 1453 	sub	sp, #4
                                   1454 ;	clock.c: 118: if(!(PC_IDR&(1<<but))){
      008748 AE 50 0B         [ 2] 1455 	ldw	x, #0x500b
      00874B F6               [ 1] 1456 	ld	a, (x)
      00874C 95               [ 1] 1457 	ld	xh, a
      00874D 90 AE 00 01      [ 2] 1458 	ldw	y, #0x0001
      008751 17 01            [ 2] 1459 	ldw	(0x01, sp), y
      008753 7B 07            [ 1] 1460 	ld	a, (0x07, sp)
      008755 27 07            [ 1] 1461 	jreq	00117$
      008757                       1462 00116$:
      008757 08 02            [ 1] 1463 	sll	(0x02, sp)
      008759 09 01            [ 1] 1464 	rlc	(0x01, sp)
      00875B 4A               [ 1] 1465 	dec	a
      00875C 26 F9            [ 1] 1466 	jrne	00116$
      00875E                       1467 00117$:
      00875E 4F               [ 1] 1468 	clr	a
      00875F 97               [ 1] 1469 	ld	xl, a
                                   1470 ;	clock.c: 120: But_Buff &= ~(1 << but);
      008760 A6 01            [ 1] 1471 	ld	a, #0x01
      008762 90 97            [ 1] 1472 	ld	yl, a
      008764 7B 07            [ 1] 1473 	ld	a, (0x07, sp)
      008766 27 06            [ 1] 1474 	jreq	00119$
      008768                       1475 00118$:
      008768 61               [ 1] 1476 	exg	a, yl
      008769 48               [ 1] 1477 	sll	a
      00876A 61               [ 1] 1478 	exg	a, yl
      00876B 4A               [ 1] 1479 	dec	a
      00876C 26 FA            [ 1] 1480 	jrne	00118$
      00876E                       1481 00119$:
                                   1482 ;	clock.c: 118: if(!(PC_IDR&(1<<but))){
      00876E 9E               [ 1] 1483 	ld	a, xh
      00876F 14 02            [ 1] 1484 	and	a, (0x02, sp)
      008771 6B 04            [ 1] 1485 	ld	(0x04, sp), a
      008773 9F               [ 1] 1486 	ld	a, xl
      008774 14 01            [ 1] 1487 	and	a, (0x01, sp)
      008776 6B 03            [ 1] 1488 	ld	(0x03, sp), a
      008778 1E 03            [ 2] 1489 	ldw	x, (0x03, sp)
      00877A 26 1B            [ 1] 1490 	jrne	00104$
                                   1491 ;	clock.c: 119: if(But_Buff&(1 << but)){
      00877C C6 00 39         [ 1] 1492 	ld	a, _But_Buff+0
      00877F 95               [ 1] 1493 	ld	xh, a
      008780 4F               [ 1] 1494 	clr	a
      008781 14 01            [ 1] 1495 	and	a, (0x01, sp)
      008783 02               [ 1] 1496 	rlwa	x
      008784 14 02            [ 1] 1497 	and	a, (0x02, sp)
      008786 95               [ 1] 1498 	ld	xh, a
      008787 5D               [ 2] 1499 	tnzw	x
      008788 27 15            [ 1] 1500 	jreq	00105$
                                   1501 ;	clock.c: 120: But_Buff &= ~(1 << but);
      00878A 90 9F            [ 1] 1502 	ld	a, yl
      00878C 43               [ 1] 1503 	cpl	a
      00878D C4 00 39         [ 1] 1504 	and	a, _But_Buff+0
      008790 C7 00 39         [ 1] 1505 	ld	_But_Buff+0, a
                                   1506 ;	clock.c: 121: return but;
      008793 7B 07            [ 1] 1507 	ld	a, (0x07, sp)
      008795 20 09            [ 2] 1508 	jra	00106$
      008797                       1509 00104$:
                                   1510 ;	clock.c: 124: else But_Buff |= (1 << but);
      008797 90 9F            [ 1] 1511 	ld	a, yl
      008799 CA 00 39         [ 1] 1512 	or	a, _But_Buff+0
      00879C C7 00 39         [ 1] 1513 	ld	_But_Buff+0, a
      00879F                       1514 00105$:
                                   1515 ;	clock.c: 127: return 0;
      00879F 4F               [ 1] 1516 	clr	a
      0087A0                       1517 00106$:
      0087A0 5B 04            [ 2] 1518 	addw	sp, #4
      0087A2 81               [ 4] 1519 	ret
                                   1520 ;	clock.c: 132: char Set_time(unsigned char hourset, unsigned char minset){
                                   1521 ;	-----------------------------------------
                                   1522 ;	 function Set_time
                                   1523 ;	-----------------------------------------
      0087A3                       1524 _Set_time:
      0087A3 52 0C            [ 2] 1525 	sub	sp, #12
                                   1526 ;	clock.c: 134: TM1637_cleer();
      0087A5 CD 82 20         [ 4] 1527 	call	_TM1637_cleer
                                   1528 ;	clock.c: 136: Soft_Timer = 0x00;
      0087A8 5F               [ 1] 1529 	clrw	x
      0087A9 CF 00 35         [ 2] 1530 	ldw	_Soft_Timer+0, x
                                   1531 ;	clock.c: 139: while(1){
      0087AC AE 00 2B         [ 2] 1532 	ldw	x, #_ASCI+0
      0087AF 1F 03            [ 2] 1533 	ldw	(0x03, sp), x
      0087B1 AE 00 27         [ 2] 1534 	ldw	x, #_TM1637_seg+0
      0087B4 1F 05            [ 2] 1535 	ldw	(0x05, sp), x
      0087B6 0F 01            [ 1] 1536 	clr	(0x01, sp)
      0087B8                       1537 00140$:
                                   1538 ;	clock.c: 141: if(button(up)){
      0087B8 4B 05            [ 1] 1539 	push	#0x05
      0087BA CD 87 46         [ 4] 1540 	call	_button
      0087BD 5B 01            [ 2] 1541 	addw	sp, #1
      0087BF 95               [ 1] 1542 	ld	xh, a
                                   1543 ;	clock.c: 146: if(Point == 1){
      0087C0 7B 01            [ 1] 1544 	ld	a, (0x01, sp)
      0087C2 A1 01            [ 1] 1545 	cp	a, #0x01
      0087C4 26 06            [ 1] 1546 	jrne	00226$
      0087C6 A6 01            [ 1] 1547 	ld	a, #0x01
      0087C8 6B 02            [ 1] 1548 	ld	(0x02, sp), a
      0087CA 20 02            [ 2] 1549 	jra	00227$
      0087CC                       1550 00226$:
      0087CC 0F 02            [ 1] 1551 	clr	(0x02, sp)
      0087CE                       1552 00227$:
                                   1553 ;	clock.c: 141: if(button(up)){
      0087CE 9E               [ 1] 1554 	ld	a, xh
      0087CF 4D               [ 1] 1555 	tnz	a
      0087D0 27 1C            [ 1] 1556 	jreq	00110$
                                   1557 ;	clock.c: 142: if(Point == 0){
      0087D2 0D 01            [ 1] 1558 	tnz	(0x01, sp)
      0087D4 26 0A            [ 1] 1559 	jrne	00104$
                                   1560 ;	clock.c: 143: hourset++;
      0087D6 0C 0F            [ 1] 1561 	inc	(0x0f, sp)
                                   1562 ;	clock.c: 144: if(hourset > 23)hourset = 0;
      0087D8 7B 0F            [ 1] 1563 	ld	a, (0x0f, sp)
      0087DA A1 17            [ 1] 1564 	cp	a, #0x17
      0087DC 23 02            [ 2] 1565 	jrule	00104$
      0087DE 0F 0F            [ 1] 1566 	clr	(0x0f, sp)
      0087E0                       1567 00104$:
                                   1568 ;	clock.c: 146: if(Point == 1){
      0087E0 0D 02            [ 1] 1569 	tnz	(0x02, sp)
      0087E2 27 0A            [ 1] 1570 	jreq	00110$
                                   1571 ;	clock.c: 147: minset++;
      0087E4 0C 10            [ 1] 1572 	inc	(0x10, sp)
                                   1573 ;	clock.c: 148: if(minset > 59)minset = 0;
      0087E6 7B 10            [ 1] 1574 	ld	a, (0x10, sp)
      0087E8 A1 3B            [ 1] 1575 	cp	a, #0x3b
      0087EA 23 02            [ 2] 1576 	jrule	00110$
      0087EC 0F 10            [ 1] 1577 	clr	(0x10, sp)
      0087EE                       1578 00110$:
                                   1579 ;	clock.c: 151: if(button(dn)){
      0087EE 4B 07            [ 1] 1580 	push	#0x07
      0087F0 CD 87 46         [ 4] 1581 	call	_button
      0087F3 5B 01            [ 2] 1582 	addw	sp, #1
      0087F5 4D               [ 1] 1583 	tnz	a
      0087F6 27 20            [ 1] 1584 	jreq	00120$
                                   1585 ;	clock.c: 152: if(Point == 0){
      0087F8 0D 01            [ 1] 1586 	tnz	(0x01, sp)
      0087FA 26 0C            [ 1] 1587 	jrne	00114$
                                   1588 ;	clock.c: 153: hourset--;
      0087FC 0A 0F            [ 1] 1589 	dec	(0x0f, sp)
                                   1590 ;	clock.c: 154: if(hourset > 23)hourset = 23;
      0087FE 7B 0F            [ 1] 1591 	ld	a, (0x0f, sp)
      008800 A1 17            [ 1] 1592 	cp	a, #0x17
      008802 23 04            [ 2] 1593 	jrule	00114$
      008804 A6 17            [ 1] 1594 	ld	a, #0x17
      008806 6B 0F            [ 1] 1595 	ld	(0x0f, sp), a
      008808                       1596 00114$:
                                   1597 ;	clock.c: 156: if(Point == 1){
      008808 0D 02            [ 1] 1598 	tnz	(0x02, sp)
      00880A 27 0C            [ 1] 1599 	jreq	00120$
                                   1600 ;	clock.c: 157: minset--;
      00880C 0A 10            [ 1] 1601 	dec	(0x10, sp)
                                   1602 ;	clock.c: 158: if(minset > 59)minset = 59;
      00880E 7B 10            [ 1] 1603 	ld	a, (0x10, sp)
      008810 A1 3B            [ 1] 1604 	cp	a, #0x3b
      008812 23 04            [ 2] 1605 	jrule	00120$
      008814 A6 3B            [ 1] 1606 	ld	a, #0x3b
      008816 6B 10            [ 1] 1607 	ld	(0x10, sp), a
      008818                       1608 00120$:
                                   1609 ;	clock.c: 161: if(button(ok)){
      008818 4B 06            [ 1] 1610 	push	#0x06
      00881A CD 87 46         [ 4] 1611 	call	_button
      00881D 5B 01            [ 2] 1612 	addw	sp, #1
      00881F 4D               [ 1] 1613 	tnz	a
      008820 27 02            [ 1] 1614 	jreq	00122$
                                   1615 ;	clock.c: 162: Point++;
      008822 0C 01            [ 1] 1616 	inc	(0x01, sp)
      008824                       1617 00122$:
                                   1618 ;	clock.c: 166: Soft_Timer++; //мигание
      008824 CE 00 35         [ 2] 1619 	ldw	x, _Soft_Timer+0
      008827 5C               [ 2] 1620 	incw	x
                                   1621 ;	clock.c: 167: if(Soft_Timer == 10){			
      008828 CF 00 35         [ 2] 1622 	ldw	_Soft_Timer+0, x
      00882B A3 00 0A         [ 2] 1623 	cpw	x, #0x000a
      00882E 26 0E            [ 1] 1624 	jrne	00124$
                                   1625 ;	clock.c: 168: dot = !dot;
      008830 C6 00 08         [ 1] 1626 	ld	a, _dot+0
      008833 A0 01            [ 1] 1627 	sub	a, #0x01
      008835 4F               [ 1] 1628 	clr	a
      008836 49               [ 1] 1629 	rlc	a
      008837 C7 00 08         [ 1] 1630 	ld	_dot+0, a
                                   1631 ;	clock.c: 169: Soft_Timer = 0;
      00883A 5F               [ 1] 1632 	clrw	x
      00883B CF 00 35         [ 2] 1633 	ldw	_Soft_Timer+0, x
      00883E                       1634 00124$:
                                   1635 ;	clock.c: 173: if(Point<2){ 
      00883E 7B 01            [ 1] 1636 	ld	a, (0x01, sp)
      008840 A1 02            [ 1] 1637 	cp	a, #0x02
      008842 2F 03            [ 1] 1638 	jrslt	00242$
      008844 CC 88 D1         [ 2] 1639 	jp	00136$
      008847                       1640 00242$:
                                   1641 ;	clock.c: 176: TM1637_seg[1] = 0x00;					
      008847 1E 05            [ 2] 1642 	ldw	x, (0x05, sp)
      008849 5C               [ 2] 1643 	incw	x
      00884A 1F 07            [ 2] 1644 	ldw	(0x07, sp), x
                                   1645 ;	clock.c: 174: if(Point == 0 && dot == 1){
      00884C 0D 01            [ 1] 1646 	tnz	(0x01, sp)
      00884E 26 0F            [ 1] 1647 	jrne	00128$
      008850 C6 00 08         [ 1] 1648 	ld	a, _dot+0
      008853 A1 01            [ 1] 1649 	cp	a, #0x01
      008855 26 08            [ 1] 1650 	jrne	00128$
                                   1651 ;	clock.c: 175: TM1637_seg[0] = 0x00;
      008857 1E 05            [ 2] 1652 	ldw	x, (0x05, sp)
      008859 7F               [ 1] 1653 	clr	(x)
                                   1654 ;	clock.c: 176: TM1637_seg[1] = 0x00;					
      00885A 1E 07            [ 2] 1655 	ldw	x, (0x07, sp)
      00885C 7F               [ 1] 1656 	clr	(x)
      00885D 20 28            [ 2] 1657 	jra	00129$
      00885F                       1658 00128$:
                                   1659 ;	clock.c: 179: if(hourset/10)TM1637_seg[0] = ASCI[hourset/10];
      00885F 5F               [ 1] 1660 	clrw	x
      008860 7B 0F            [ 1] 1661 	ld	a, (0x0f, sp)
      008862 97               [ 1] 1662 	ld	xl, a
      008863 A6 0A            [ 1] 1663 	ld	a, #0x0a
      008865 62               [ 2] 1664 	div	x, a
      008866 9F               [ 1] 1665 	ld	a, xl
      008867 4D               [ 1] 1666 	tnz	a
      008868 27 0D            [ 1] 1667 	jreq	00126$
      00886A 4F               [ 1] 1668 	clr	a
      00886B 95               [ 1] 1669 	ld	xh, a
      00886C 72 FB 03         [ 2] 1670 	addw	x, (0x03, sp)
      00886F 1F 09            [ 2] 1671 	ldw	(0x09, sp), x
      008871 1E 09            [ 2] 1672 	ldw	x, (0x09, sp)
      008873 F6               [ 1] 1673 	ld	a, (x)
      008874 1E 05            [ 2] 1674 	ldw	x, (0x05, sp)
      008876 F7               [ 1] 1675 	ld	(x), a
      008877                       1676 00126$:
                                   1677 ;	clock.c: 180: TM1637_seg[1] = ASCI[hourset%10];		
      008877 5F               [ 1] 1678 	clrw	x
      008878 7B 0F            [ 1] 1679 	ld	a, (0x0f, sp)
      00887A 97               [ 1] 1680 	ld	xl, a
      00887B A6 0A            [ 1] 1681 	ld	a, #0x0a
      00887D 62               [ 2] 1682 	div	x, a
      00887E 5F               [ 1] 1683 	clrw	x
      00887F 97               [ 1] 1684 	ld	xl, a
      008880 72 FB 03         [ 2] 1685 	addw	x, (0x03, sp)
      008883 F6               [ 1] 1686 	ld	a, (x)
      008884 1E 07            [ 2] 1687 	ldw	x, (0x07, sp)
      008886 F7               [ 1] 1688 	ld	(x), a
      008887                       1689 00129$:
                                   1690 ;	clock.c: 183: TM1637_seg[1] = TM1637_seg[1] +0x80;
      008887 1E 07            [ 2] 1691 	ldw	x, (0x07, sp)
      008889 F6               [ 1] 1692 	ld	a, (x)
      00888A AB 80            [ 1] 1693 	add	a, #0x80
      00888C 1E 07            [ 2] 1694 	ldw	x, (0x07, sp)
      00888E F7               [ 1] 1695 	ld	(x), a
                                   1696 ;	clock.c: 186: TM1637_seg[2] = 0x00;
      00888F 1E 05            [ 2] 1697 	ldw	x, (0x05, sp)
      008891 5C               [ 2] 1698 	incw	x
      008892 5C               [ 2] 1699 	incw	x
      008893 1F 0B            [ 2] 1700 	ldw	(0x0b, sp), x
                                   1701 ;	clock.c: 187: TM1637_seg[3] = 0x00;					
      008895 16 05            [ 2] 1702 	ldw	y, (0x05, sp)
      008897 72 A9 00 03      [ 2] 1703 	addw	y, #0x0003
                                   1704 ;	clock.c: 185: if(Point == 1 && dot == 1){
      00889B 7B 01            [ 1] 1705 	ld	a, (0x01, sp)
      00889D A1 01            [ 1] 1706 	cp	a, #0x01
      00889F 26 0E            [ 1] 1707 	jrne	00132$
      0088A1 C6 00 08         [ 1] 1708 	ld	a, _dot+0
      0088A4 A1 01            [ 1] 1709 	cp	a, #0x01
      0088A6 26 07            [ 1] 1710 	jrne	00132$
                                   1711 ;	clock.c: 186: TM1637_seg[2] = 0x00;
      0088A8 1E 0B            [ 2] 1712 	ldw	x, (0x0b, sp)
      0088AA 7F               [ 1] 1713 	clr	(x)
                                   1714 ;	clock.c: 187: TM1637_seg[3] = 0x00;					
      0088AB 90 7F            [ 1] 1715 	clr	(y)
      0088AD 20 1F            [ 2] 1716 	jra	00133$
      0088AF                       1717 00132$:
                                   1718 ;	clock.c: 190: TM1637_seg[2] = ASCI[minset/10];
      0088AF 5F               [ 1] 1719 	clrw	x
      0088B0 7B 10            [ 1] 1720 	ld	a, (0x10, sp)
      0088B2 97               [ 1] 1721 	ld	xl, a
      0088B3 A6 0A            [ 1] 1722 	ld	a, #0x0a
      0088B5 62               [ 2] 1723 	div	x, a
      0088B6 4F               [ 1] 1724 	clr	a
      0088B7 95               [ 1] 1725 	ld	xh, a
      0088B8 72 FB 03         [ 2] 1726 	addw	x, (0x03, sp)
      0088BB F6               [ 1] 1727 	ld	a, (x)
      0088BC 1E 0B            [ 2] 1728 	ldw	x, (0x0b, sp)
      0088BE F7               [ 1] 1729 	ld	(x), a
                                   1730 ;	clock.c: 191: TM1637_seg[3] = ASCI[minset%10];		
      0088BF 5F               [ 1] 1731 	clrw	x
      0088C0 7B 10            [ 1] 1732 	ld	a, (0x10, sp)
      0088C2 97               [ 1] 1733 	ld	xl, a
      0088C3 A6 0A            [ 1] 1734 	ld	a, #0x0a
      0088C5 62               [ 2] 1735 	div	x, a
      0088C6 5F               [ 1] 1736 	clrw	x
      0088C7 97               [ 1] 1737 	ld	xl, a
      0088C8 72 FB 03         [ 2] 1738 	addw	x, (0x03, sp)
      0088CB F6               [ 1] 1739 	ld	a, (x)
      0088CC 90 F7            [ 1] 1740 	ld	(y), a
      0088CE                       1741 00133$:
                                   1742 ;	clock.c: 193: TM1637_send();				
      0088CE CD 81 D9         [ 4] 1743 	call	_TM1637_send
      0088D1                       1744 00136$:
                                   1745 ;	clock.c: 196: if(Point == 2){
      0088D1 7B 01            [ 1] 1746 	ld	a, (0x01, sp)
      0088D3 A1 02            [ 1] 1747 	cp	a, #0x02
      0088D5 27 03            [ 1] 1748 	jreq	00256$
      0088D7 CC 87 B8         [ 2] 1749 	jp	00140$
      0088DA                       1750 00256$:
                                   1751 ;	clock.c: 197: Clock_Temp[0] = hourset;
      0088DA AE 00 09         [ 2] 1752 	ldw	x, #_Clock_Temp+0
      0088DD 7B 0F            [ 1] 1753 	ld	a, (0x0f, sp)
      0088DF F7               [ 1] 1754 	ld	(x), a
                                   1755 ;	clock.c: 198: Clock_Temp[1] = minset;
      0088E0 5C               [ 2] 1756 	incw	x
      0088E1 7B 10            [ 1] 1757 	ld	a, (0x10, sp)
      0088E3 F7               [ 1] 1758 	ld	(x), a
                                   1759 ;	clock.c: 199: Soft_Timer = 0x00;
      0088E4 5F               [ 1] 1760 	clrw	x
      0088E5 CF 00 35         [ 2] 1761 	ldw	_Soft_Timer+0, x
                                   1762 ;	clock.c: 200: return 1;
      0088E8 A6 01            [ 1] 1763 	ld	a, #0x01
      0088EA 5B 0C            [ 2] 1764 	addw	sp, #12
      0088EC 81               [ 4] 1765 	ret
                                   1766 ;	clock.c: 211: char Set_Brigh(){
                                   1767 ;	-----------------------------------------
                                   1768 ;	 function Set_Brigh
                                   1769 ;	-----------------------------------------
      0088ED                       1770 _Set_Brigh:
      0088ED 52 04            [ 2] 1771 	sub	sp, #4
                                   1772 ;	clock.c: 212: TM1637_cleer();
      0088EF CD 82 20         [ 4] 1773 	call	_TM1637_cleer
                                   1774 ;	clock.c: 213: Soft_Timer = 0x00;
      0088F2 5F               [ 1] 1775 	clrw	x
      0088F3 CF 00 35         [ 2] 1776 	ldw	_Soft_Timer+0, x
                                   1777 ;	clock.c: 214: Point_Meny = EEPROM_DATA(setting_Brigh);
      0088F6 AE 40 00         [ 2] 1778 	ldw	x, #0x4000
      0088F9 F6               [ 1] 1779 	ld	a, (x)
      0088FA 97               [ 1] 1780 	ld	xl, a
      0088FB 49               [ 1] 1781 	rlc	a
      0088FC 4F               [ 1] 1782 	clr	a
      0088FD A2 00            [ 1] 1783 	sbc	a, #0x00
      0088FF 95               [ 1] 1784 	ld	xh, a
      008900 CF 00 37         [ 2] 1785 	ldw	_Point_Meny+0, x
                                   1786 ;	clock.c: 216: auto_exit = 0;
      008903 72 5F 00 3A      [ 1] 1787 	clr	_auto_exit+0
                                   1788 ;	clock.c: 218: while(1){
      008907 AE 00 2B         [ 2] 1789 	ldw	x, #_ASCI+0
      00890A 1F 03            [ 2] 1790 	ldw	(0x03, sp), x
      00890C                       1791 00116$:
                                   1792 ;	clock.c: 220: if(button(up)){
      00890C 4B 05            [ 1] 1793 	push	#0x05
      00890E CD 87 46         [ 4] 1794 	call	_button
      008911 5B 01            [ 2] 1795 	addw	sp, #1
      008913 4D               [ 1] 1796 	tnz	a
      008914 27 19            [ 1] 1797 	jreq	00104$
                                   1798 ;	clock.c: 221: Point_Meny++;
      008916 CE 00 37         [ 2] 1799 	ldw	x, _Point_Meny+0
      008919 5C               [ 2] 1800 	incw	x
      00891A CF 00 37         [ 2] 1801 	ldw	_Point_Meny+0, x
                                   1802 ;	clock.c: 222: auto_exit = 0;
      00891D 72 5F 00 3A      [ 1] 1803 	clr	_auto_exit+0
                                   1804 ;	clock.c: 223: if(Point_Meny > 7)Point_Meny = 7;
      008921 CE 00 37         [ 2] 1805 	ldw	x, _Point_Meny+0
      008924 A3 00 07         [ 2] 1806 	cpw	x, #0x0007
      008927 23 06            [ 2] 1807 	jrule	00104$
      008929 AE 00 07         [ 2] 1808 	ldw	x, #0x0007
      00892C CF 00 37         [ 2] 1809 	ldw	_Point_Meny+0, x
      00892F                       1810 00104$:
                                   1811 ;	clock.c: 226: if(button(dn)){
      00892F 4B 07            [ 1] 1812 	push	#0x07
      008931 CD 87 46         [ 4] 1813 	call	_button
      008934 5B 01            [ 2] 1814 	addw	sp, #1
      008936 4D               [ 1] 1815 	tnz	a
      008937 27 17            [ 1] 1816 	jreq	00108$
                                   1817 ;	clock.c: 227: Point_Meny--;
      008939 CE 00 37         [ 2] 1818 	ldw	x, _Point_Meny+0
      00893C 5A               [ 2] 1819 	decw	x
      00893D CF 00 37         [ 2] 1820 	ldw	_Point_Meny+0, x
                                   1821 ;	clock.c: 228: auto_exit = 0;
      008940 72 5F 00 3A      [ 1] 1822 	clr	_auto_exit+0
                                   1823 ;	clock.c: 229: if(Point_Meny > 7)Point_Meny = 0;
      008944 CE 00 37         [ 2] 1824 	ldw	x, _Point_Meny+0
      008947 A3 00 07         [ 2] 1825 	cpw	x, #0x0007
      00894A 23 04            [ 2] 1826 	jrule	00108$
      00894C 5F               [ 1] 1827 	clrw	x
      00894D CF 00 37         [ 2] 1828 	ldw	_Point_Meny+0, x
      008950                       1829 00108$:
                                   1830 ;	clock.c: 231: if(button(ok)){
      008950 4B 06            [ 1] 1831 	push	#0x06
      008952 CD 87 46         [ 4] 1832 	call	_button
      008955 5B 01            [ 2] 1833 	addw	sp, #1
      008957 4D               [ 1] 1834 	tnz	a
      008958 27 1A            [ 1] 1835 	jreq	00110$
                                   1836 ;	clock.c: 232: auto_exit = 0;
      00895A 72 5F 00 3A      [ 1] 1837 	clr	_auto_exit+0
                                   1838 ;	clock.c: 234: EEPROM_UNLOCK();
      00895E CD 86 BB         [ 4] 1839 	call	_EEPROM_UNLOCK
                                   1840 ;	clock.c: 235: EEPROM_DATA(setting_Brigh) = Point_Meny;
      008961 C6 00 38         [ 1] 1841 	ld	a, _Point_Meny+1
      008964 AE 40 00         [ 2] 1842 	ldw	x, #0x4000
      008967 F7               [ 1] 1843 	ld	(x), a
                                   1844 ;	clock.c: 236: EEPROM_LOCK();
      008968 AE 50 5F         [ 2] 1845 	ldw	x, #0x505f
      00896B F6               [ 1] 1846 	ld	a, (x)
      00896C A4 F7            [ 1] 1847 	and	a, #0xf7
      00896E F7               [ 1] 1848 	ld	(x), a
                                   1849 ;	clock.c: 238: return Point_Meny;
      00896F C6 00 38         [ 1] 1850 	ld	a, _Point_Meny+1
      008972 20 5F            [ 2] 1851 	jra	00118$
      008974                       1852 00110$:
                                   1853 ;	clock.c: 242: Soft_Timer++;
      008974 CE 00 35         [ 2] 1854 	ldw	x, _Soft_Timer+0
      008977 5C               [ 2] 1855 	incw	x
                                   1856 ;	clock.c: 243: if(Soft_Timer == 300){
      008978 CF 00 35         [ 2] 1857 	ldw	_Soft_Timer+0, x
      00897B A3 01 2C         [ 2] 1858 	cpw	x, #0x012c
      00897E 26 3A            [ 1] 1859 	jrne	00112$
                                   1860 ;	clock.c: 244: TM1637_sendMASS(0x7C,0x50,0x00,ASCI[Point_Meny]);
      008980 AE 00 27         [ 2] 1861 	ldw	x, #_TM1637_seg+0
      008983 1F 01            [ 2] 1862 	ldw	(0x01, sp), x
      008985 1E 01            [ 2] 1863 	ldw	x, (0x01, sp)
      008987 A6 7C            [ 1] 1864 	ld	a, #0x7c
      008989 F7               [ 1] 1865 	ld	(x), a
      00898A 1E 01            [ 2] 1866 	ldw	x, (0x01, sp)
      00898C 5C               [ 2] 1867 	incw	x
      00898D A6 50            [ 1] 1868 	ld	a, #0x50
      00898F F7               [ 1] 1869 	ld	(x), a
      008990 1E 01            [ 2] 1870 	ldw	x, (0x01, sp)
      008992 5C               [ 2] 1871 	incw	x
      008993 5C               [ 2] 1872 	incw	x
      008994 7F               [ 1] 1873 	clr	(x)
      008995 16 01            [ 2] 1874 	ldw	y, (0x01, sp)
      008997 72 A9 00 03      [ 2] 1875 	addw	y, #0x0003
      00899B 1E 03            [ 2] 1876 	ldw	x, (0x03, sp)
      00899D 72 BB 00 37      [ 2] 1877 	addw	x, _Point_Meny+0
      0089A1 F6               [ 1] 1878 	ld	a, (x)
      0089A2 90 F7            [ 1] 1879 	ld	(y), a
      0089A4 CD 81 D9         [ 4] 1880 	call	_TM1637_send
                                   1881 ;	clock.c: 245: TM1637_brigh(Point_Meny);
      0089A7 C6 00 38         [ 1] 1882 	ld	a, _Point_Meny+1
      0089AA 88               [ 1] 1883 	push	a
      0089AB CD 81 C0         [ 4] 1884 	call	_TM1637_brigh
      0089AE 84               [ 1] 1885 	pop	a
                                   1886 ;	clock.c: 246: Soft_Timer = 0x00;
      0089AF 5F               [ 1] 1887 	clrw	x
      0089B0 CF 00 35         [ 2] 1888 	ldw	_Soft_Timer+0, x
                                   1889 ;	clock.c: 247: auto_exit++;
      0089B3 C6 00 3A         [ 1] 1890 	ld	a, _auto_exit+0
      0089B6 4C               [ 1] 1891 	inc	a
      0089B7 C7 00 3A         [ 1] 1892 	ld	_auto_exit+0, a
      0089BA                       1893 00112$:
                                   1894 ;	clock.c: 251: if(auto_exit == 20){
      0089BA C6 00 3A         [ 1] 1895 	ld	a, _auto_exit+0
      0089BD A1 14            [ 1] 1896 	cp	a, #0x14
      0089BF 27 03            [ 1] 1897 	jreq	00162$
      0089C1 CC 89 0C         [ 2] 1898 	jp	00116$
      0089C4                       1899 00162$:
                                   1900 ;	clock.c: 253: TM1637_brigh(EEPROM_DATA(setting_Brigh));
      0089C4 AE 40 00         [ 2] 1901 	ldw	x, #0x4000
      0089C7 F6               [ 1] 1902 	ld	a, (x)
      0089C8 88               [ 1] 1903 	push	a
      0089C9 CD 81 C0         [ 4] 1904 	call	_TM1637_brigh
      0089CC 84               [ 1] 1905 	pop	a
                                   1906 ;	clock.c: 254: clock();
      0089CD CD 8C E7         [ 4] 1907 	call	_clock
      0089D0 CC 89 0C         [ 2] 1908 	jp	00116$
      0089D3                       1909 00118$:
      0089D3 5B 04            [ 2] 1910 	addw	sp, #4
      0089D5 81               [ 4] 1911 	ret
                                   1912 ;	clock.c: 262: void Set_DnTimer(){ //"r__1"
                                   1913 ;	-----------------------------------------
                                   1914 ;	 function Set_DnTimer
                                   1915 ;	-----------------------------------------
      0089D6                       1916 _Set_DnTimer:
      0089D6 52 02            [ 2] 1917 	sub	sp, #2
                                   1918 ;	clock.c: 263: TM1637_cleer();
      0089D8 CD 82 20         [ 4] 1919 	call	_TM1637_cleer
                                   1920 ;	clock.c: 264: Point_Meny = 0;
      0089DB 5F               [ 1] 1921 	clrw	x
      0089DC CF 00 37         [ 2] 1922 	ldw	_Point_Meny+0, x
                                   1923 ;	clock.c: 265: Soft_Timer = 0x00;
      0089DF 5F               [ 1] 1924 	clrw	x
      0089E0 CF 00 35         [ 2] 1925 	ldw	_Soft_Timer+0, x
                                   1926 ;	clock.c: 267: while(1){
      0089E3                       1927 00124$:
                                   1928 ;	clock.c: 268: if(button(up)){
      0089E3 4B 05            [ 1] 1929 	push	#0x05
      0089E5 CD 87 46         [ 4] 1930 	call	_button
      0089E8 5B 01            [ 2] 1931 	addw	sp, #1
      0089EA 4D               [ 1] 1932 	tnz	a
      0089EB 27 10            [ 1] 1933 	jreq	00104$
                                   1934 ;	clock.c: 269: Point_Meny++;
      0089ED CE 00 37         [ 2] 1935 	ldw	x, _Point_Meny+0
      0089F0 5C               [ 2] 1936 	incw	x
                                   1937 ;	clock.c: 270: if(Point_Meny > 4)Point_Meny = 0;
      0089F1 CF 00 37         [ 2] 1938 	ldw	_Point_Meny+0, x
      0089F4 A3 00 04         [ 2] 1939 	cpw	x, #0x0004
      0089F7 23 04            [ 2] 1940 	jrule	00104$
      0089F9 5F               [ 1] 1941 	clrw	x
      0089FA CF 00 37         [ 2] 1942 	ldw	_Point_Meny+0, x
      0089FD                       1943 00104$:
                                   1944 ;	clock.c: 273: if(button(dn)){
      0089FD 4B 07            [ 1] 1945 	push	#0x07
      0089FF CD 87 46         [ 4] 1946 	call	_button
      008A02 5B 01            [ 2] 1947 	addw	sp, #1
      008A04 4D               [ 1] 1948 	tnz	a
      008A05 27 12            [ 1] 1949 	jreq	00108$
                                   1950 ;	clock.c: 274: Point_Meny--;
      008A07 CE 00 37         [ 2] 1951 	ldw	x, _Point_Meny+0
      008A0A 5A               [ 2] 1952 	decw	x
                                   1953 ;	clock.c: 275: if(Point_Meny > 4)Point_Meny = 4;
      008A0B CF 00 37         [ 2] 1954 	ldw	_Point_Meny+0, x
      008A0E A3 00 04         [ 2] 1955 	cpw	x, #0x0004
      008A11 23 06            [ 2] 1956 	jrule	00108$
      008A13 AE 00 04         [ 2] 1957 	ldw	x, #0x0004
      008A16 CF 00 37         [ 2] 1958 	ldw	_Point_Meny+0, x
      008A19                       1959 00108$:
                                   1960 ;	clock.c: 278: if(button(ok)){
      008A19 4B 06            [ 1] 1961 	push	#0x06
      008A1B CD 87 46         [ 4] 1962 	call	_button
      008A1E 5B 01            [ 2] 1963 	addw	sp, #1
      008A20 4D               [ 1] 1964 	tnz	a
      008A21 26 03            [ 1] 1965 	jrne	00180$
      008A23 CC 8B 0C         [ 2] 1966 	jp	00120$
      008A26                       1967 00180$:
                                   1968 ;	clock.c: 279: if(Point_Meny == 0){
      008A26 CE 00 37         [ 2] 1969 	ldw	x, _Point_Meny+0
      008A29 26 2E            [ 1] 1970 	jrne	00110$
                                   1971 ;	clock.c: 280: Set_time(EEPROM_DATA(DnClock_hour_0),EEPROM_DATA(DnClock_min_0));
      008A2B AE 40 01         [ 2] 1972 	ldw	x, #0x4001
      008A2E F6               [ 1] 1973 	ld	a, (x)
      008A2F AE 40 00         [ 2] 1974 	ldw	x, #0x4000
      008A32 88               [ 1] 1975 	push	a
      008A33 F6               [ 1] 1976 	ld	a, (x)
      008A34 95               [ 1] 1977 	ld	xh, a
      008A35 88               [ 1] 1978 	push	a
      008A36 CD 87 A3         [ 4] 1979 	call	_Set_time
      008A39 5B 02            [ 2] 1980 	addw	sp, #2
                                   1981 ;	clock.c: 281: EEPROM_UNLOCK();
      008A3B CD 86 BB         [ 4] 1982 	call	_EEPROM_UNLOCK
                                   1983 ;	clock.c: 282: EEPROM_DATA(DnClock_hour_0) = Clock_Temp[0];
      008A3E AE 00 09         [ 2] 1984 	ldw	x, #_Clock_Temp+0
      008A41 F6               [ 1] 1985 	ld	a, (x)
      008A42 90 AE 40 00      [ 2] 1986 	ldw	y, #0x4000
      008A46 90 F7            [ 1] 1987 	ld	(y), a
                                   1988 ;	clock.c: 283: EEPROM_DATA(DnClock_min_0)	= Clock_Temp[1];
      008A48 E6 01            [ 1] 1989 	ld	a, (0x1, x)
      008A4A AE 40 01         [ 2] 1990 	ldw	x, #0x4001
      008A4D F7               [ 1] 1991 	ld	(x), a
                                   1992 ;	clock.c: 284: EEPROM_LOCK();
      008A4E AE 50 5F         [ 2] 1993 	ldw	x, #0x505f
      008A51 F6               [ 1] 1994 	ld	a, (x)
      008A52 A4 F7            [ 1] 1995 	and	a, #0xf7
      008A54 F7               [ 1] 1996 	ld	(x), a
                                   1997 ;	clock.c: 285: Point_Meny = 0;
      008A55 5F               [ 1] 1998 	clrw	x
      008A56 CF 00 37         [ 2] 1999 	ldw	_Point_Meny+0, x
      008A59                       2000 00110$:
                                   2001 ;	clock.c: 288: if(Point_Meny == 1){
      008A59 CE 00 37         [ 2] 2002 	ldw	x, _Point_Meny+0
      008A5C A3 00 01         [ 2] 2003 	cpw	x, #0x0001
      008A5F 26 30            [ 1] 2004 	jrne	00112$
                                   2005 ;	clock.c: 289: Set_time(EEPROM_DATA(DnClock_hour_1),EEPROM_DATA(DnClock_min_1));
      008A61 AE 40 03         [ 2] 2006 	ldw	x, #0x4003
      008A64 F6               [ 1] 2007 	ld	a, (x)
      008A65 AE 40 02         [ 2] 2008 	ldw	x, #0x4002
      008A68 88               [ 1] 2009 	push	a
      008A69 F6               [ 1] 2010 	ld	a, (x)
      008A6A 95               [ 1] 2011 	ld	xh, a
      008A6B 88               [ 1] 2012 	push	a
      008A6C CD 87 A3         [ 4] 2013 	call	_Set_time
      008A6F 5B 02            [ 2] 2014 	addw	sp, #2
                                   2015 ;	clock.c: 290: EEPROM_UNLOCK();
      008A71 CD 86 BB         [ 4] 2016 	call	_EEPROM_UNLOCK
                                   2017 ;	clock.c: 291: EEPROM_DATA(DnClock_hour_1) = Clock_Temp[0];
      008A74 AE 00 09         [ 2] 2018 	ldw	x, #_Clock_Temp+0
      008A77 F6               [ 1] 2019 	ld	a, (x)
      008A78 90 AE 40 02      [ 2] 2020 	ldw	y, #0x4002
      008A7C 90 F7            [ 1] 2021 	ld	(y), a
                                   2022 ;	clock.c: 292: EEPROM_DATA(DnClock_min_1)	= Clock_Temp[1];
      008A7E E6 01            [ 1] 2023 	ld	a, (0x1, x)
      008A80 AE 40 03         [ 2] 2024 	ldw	x, #0x4003
      008A83 F7               [ 1] 2025 	ld	(x), a
                                   2026 ;	clock.c: 293: EEPROM_LOCK();
      008A84 AE 50 5F         [ 2] 2027 	ldw	x, #0x505f
      008A87 F6               [ 1] 2028 	ld	a, (x)
      008A88 A4 F7            [ 1] 2029 	and	a, #0xf7
      008A8A F7               [ 1] 2030 	ld	(x), a
                                   2031 ;	clock.c: 294: Point_Meny = 1;
      008A8B AE 00 01         [ 2] 2032 	ldw	x, #0x0001
      008A8E CF 00 37         [ 2] 2033 	ldw	_Point_Meny+0, x
      008A91                       2034 00112$:
                                   2035 ;	clock.c: 297: if(Point_Meny == 2){
      008A91 CE 00 37         [ 2] 2036 	ldw	x, _Point_Meny+0
      008A94 A3 00 02         [ 2] 2037 	cpw	x, #0x0002
      008A97 26 30            [ 1] 2038 	jrne	00114$
                                   2039 ;	clock.c: 298: Set_time(EEPROM_DATA(DnClock_hour_2),EEPROM_DATA(DnClock_min_2));
      008A99 AE 40 05         [ 2] 2040 	ldw	x, #0x4005
      008A9C F6               [ 1] 2041 	ld	a, (x)
      008A9D AE 40 04         [ 2] 2042 	ldw	x, #0x4004
      008AA0 88               [ 1] 2043 	push	a
      008AA1 F6               [ 1] 2044 	ld	a, (x)
      008AA2 95               [ 1] 2045 	ld	xh, a
      008AA3 88               [ 1] 2046 	push	a
      008AA4 CD 87 A3         [ 4] 2047 	call	_Set_time
      008AA7 5B 02            [ 2] 2048 	addw	sp, #2
                                   2049 ;	clock.c: 299: EEPROM_UNLOCK();
      008AA9 CD 86 BB         [ 4] 2050 	call	_EEPROM_UNLOCK
                                   2051 ;	clock.c: 300: EEPROM_DATA(DnClock_hour_2) = Clock_Temp[0];
      008AAC AE 00 09         [ 2] 2052 	ldw	x, #_Clock_Temp+0
      008AAF F6               [ 1] 2053 	ld	a, (x)
      008AB0 90 AE 40 04      [ 2] 2054 	ldw	y, #0x4004
      008AB4 90 F7            [ 1] 2055 	ld	(y), a
                                   2056 ;	clock.c: 301: EEPROM_DATA(DnClock_min_2)	= Clock_Temp[1];
      008AB6 E6 01            [ 1] 2057 	ld	a, (0x1, x)
      008AB8 AE 40 05         [ 2] 2058 	ldw	x, #0x4005
      008ABB F7               [ 1] 2059 	ld	(x), a
                                   2060 ;	clock.c: 302: EEPROM_LOCK();
      008ABC AE 50 5F         [ 2] 2061 	ldw	x, #0x505f
      008ABF F6               [ 1] 2062 	ld	a, (x)
      008AC0 A4 F7            [ 1] 2063 	and	a, #0xf7
      008AC2 F7               [ 1] 2064 	ld	(x), a
                                   2065 ;	clock.c: 303: Point_Meny = 2;
      008AC3 AE 00 02         [ 2] 2066 	ldw	x, #0x0002
      008AC6 CF 00 37         [ 2] 2067 	ldw	_Point_Meny+0, x
      008AC9                       2068 00114$:
                                   2069 ;	clock.c: 306: if(Point_Meny == 3){
      008AC9 CE 00 37         [ 2] 2070 	ldw	x, _Point_Meny+0
      008ACC A3 00 03         [ 2] 2071 	cpw	x, #0x0003
      008ACF 26 30            [ 1] 2072 	jrne	00116$
                                   2073 ;	clock.c: 307: Set_time(EEPROM_DATA(DnClock_hour_3),EEPROM_DATA(DnClock_min_3));
      008AD1 AE 40 07         [ 2] 2074 	ldw	x, #0x4007
      008AD4 F6               [ 1] 2075 	ld	a, (x)
      008AD5 AE 40 06         [ 2] 2076 	ldw	x, #0x4006
      008AD8 88               [ 1] 2077 	push	a
      008AD9 F6               [ 1] 2078 	ld	a, (x)
      008ADA 95               [ 1] 2079 	ld	xh, a
      008ADB 88               [ 1] 2080 	push	a
      008ADC CD 87 A3         [ 4] 2081 	call	_Set_time
      008ADF 5B 02            [ 2] 2082 	addw	sp, #2
                                   2083 ;	clock.c: 308: EEPROM_UNLOCK();
      008AE1 CD 86 BB         [ 4] 2084 	call	_EEPROM_UNLOCK
                                   2085 ;	clock.c: 309: EEPROM_DATA(DnClock_hour_3) = Clock_Temp[0];
      008AE4 AE 00 09         [ 2] 2086 	ldw	x, #_Clock_Temp+0
      008AE7 F6               [ 1] 2087 	ld	a, (x)
      008AE8 90 AE 40 06      [ 2] 2088 	ldw	y, #0x4006
      008AEC 90 F7            [ 1] 2089 	ld	(y), a
                                   2090 ;	clock.c: 310: EEPROM_DATA(DnClock_min_3)	= Clock_Temp[1];
      008AEE E6 01            [ 1] 2091 	ld	a, (0x1, x)
      008AF0 AE 40 07         [ 2] 2092 	ldw	x, #0x4007
      008AF3 F7               [ 1] 2093 	ld	(x), a
                                   2094 ;	clock.c: 311: EEPROM_LOCK();
      008AF4 AE 50 5F         [ 2] 2095 	ldw	x, #0x505f
      008AF7 F6               [ 1] 2096 	ld	a, (x)
      008AF8 A4 F7            [ 1] 2097 	and	a, #0xf7
      008AFA F7               [ 1] 2098 	ld	(x), a
                                   2099 ;	clock.c: 312: Point_Meny = 3;
      008AFB AE 00 03         [ 2] 2100 	ldw	x, #0x0003
      008AFE CF 00 37         [ 2] 2101 	ldw	_Point_Meny+0, x
      008B01                       2102 00116$:
                                   2103 ;	clock.c: 315: if(Point_Meny == 4)clock(); //exit
      008B01 CE 00 37         [ 2] 2104 	ldw	x, _Point_Meny+0
      008B04 A3 00 04         [ 2] 2105 	cpw	x, #0x0004
      008B07 26 03            [ 1] 2106 	jrne	00120$
      008B09 CD 8C E7         [ 4] 2107 	call	_clock
      008B0C                       2108 00120$:
                                   2109 ;	clock.c: 322: Soft_Timer++;
      008B0C CE 00 35         [ 2] 2110 	ldw	x, _Soft_Timer+0
      008B0F 5C               [ 2] 2111 	incw	x
                                   2112 ;	clock.c: 323: if(Soft_Timer == 300){
      008B10 CF 00 35         [ 2] 2113 	ldw	_Soft_Timer+0, x
      008B13 A3 01 2C         [ 2] 2114 	cpw	x, #0x012c
      008B16 27 03            [ 1] 2115 	jreq	00196$
      008B18 CC 89 E3         [ 2] 2116 	jp	00124$
      008B1B                       2117 00196$:
                                   2118 ;	clock.c: 324: TM1637_sendMASS(0x5E,0x78,0x08,ASCI[Point_Meny]);
      008B1B AE 00 27         [ 2] 2119 	ldw	x, #_TM1637_seg+0
      008B1E 1F 01            [ 2] 2120 	ldw	(0x01, sp), x
      008B20 1E 01            [ 2] 2121 	ldw	x, (0x01, sp)
      008B22 A6 5E            [ 1] 2122 	ld	a, #0x5e
      008B24 F7               [ 1] 2123 	ld	(x), a
      008B25 1E 01            [ 2] 2124 	ldw	x, (0x01, sp)
      008B27 5C               [ 2] 2125 	incw	x
      008B28 A6 78            [ 1] 2126 	ld	a, #0x78
      008B2A F7               [ 1] 2127 	ld	(x), a
      008B2B 1E 01            [ 2] 2128 	ldw	x, (0x01, sp)
      008B2D 5C               [ 2] 2129 	incw	x
      008B2E 5C               [ 2] 2130 	incw	x
      008B2F A6 08            [ 1] 2131 	ld	a, #0x08
      008B31 F7               [ 1] 2132 	ld	(x), a
      008B32 16 01            [ 2] 2133 	ldw	y, (0x01, sp)
      008B34 72 A9 00 03      [ 2] 2134 	addw	y, #0x0003
      008B38 AE 00 2B         [ 2] 2135 	ldw	x, #_ASCI+0
      008B3B 72 BB 00 37      [ 2] 2136 	addw	x, _Point_Meny+0
      008B3F F6               [ 1] 2137 	ld	a, (x)
      008B40 90 F7            [ 1] 2138 	ld	(y), a
      008B42 CD 81 D9         [ 4] 2139 	call	_TM1637_send
                                   2140 ;	clock.c: 325: Soft_Timer = 0x00;
      008B45 5F               [ 1] 2141 	clrw	x
      008B46 CF 00 35         [ 2] 2142 	ldw	_Soft_Timer+0, x
      008B49 CC 89 E3         [ 2] 2143 	jp	00124$
      008B4C 5B 02            [ 2] 2144 	addw	sp, #2
      008B4E 81               [ 4] 2145 	ret
                                   2146 ;	clock.c: 330: void Set_Meny(){ //Настройки "C__2"
                                   2147 ;	-----------------------------------------
                                   2148 ;	 function Set_Meny
                                   2149 ;	-----------------------------------------
      008B4F                       2150 _Set_Meny:
      008B4F 52 02            [ 2] 2151 	sub	sp, #2
                                   2152 ;	clock.c: 332: TM1637_cleer();
      008B51 CD 82 20         [ 4] 2153 	call	_TM1637_cleer
                                   2154 ;	clock.c: 333: Point_Meny = 0;
      008B54 5F               [ 1] 2155 	clrw	x
      008B55 CF 00 37         [ 2] 2156 	ldw	_Point_Meny+0, x
                                   2157 ;	clock.c: 334: Soft_Timer = 0x00;
      008B58 5F               [ 1] 2158 	clrw	x
      008B59 CF 00 35         [ 2] 2159 	ldw	_Soft_Timer+0, x
                                   2160 ;	clock.c: 336: while(1){
      008B5C                       2161 00122$:
                                   2162 ;	clock.c: 338: if(button(up)){
      008B5C 4B 05            [ 1] 2163 	push	#0x05
      008B5E CD 87 46         [ 4] 2164 	call	_button
      008B61 5B 01            [ 2] 2165 	addw	sp, #1
      008B63 4D               [ 1] 2166 	tnz	a
      008B64 27 10            [ 1] 2167 	jreq	00104$
                                   2168 ;	clock.c: 339: Point_Meny++;
      008B66 CE 00 37         [ 2] 2169 	ldw	x, _Point_Meny+0
      008B69 5C               [ 2] 2170 	incw	x
                                   2171 ;	clock.c: 340: if(Point_Meny > 4)Point_Meny = 0;
      008B6A CF 00 37         [ 2] 2172 	ldw	_Point_Meny+0, x
      008B6D A3 00 04         [ 2] 2173 	cpw	x, #0x0004
      008B70 23 04            [ 2] 2174 	jrule	00104$
      008B72 5F               [ 1] 2175 	clrw	x
      008B73 CF 00 37         [ 2] 2176 	ldw	_Point_Meny+0, x
      008B76                       2177 00104$:
                                   2178 ;	clock.c: 343: if(button(dn)){
      008B76 4B 07            [ 1] 2179 	push	#0x07
      008B78 CD 87 46         [ 4] 2180 	call	_button
      008B7B 5B 01            [ 2] 2181 	addw	sp, #1
      008B7D 4D               [ 1] 2182 	tnz	a
      008B7E 27 12            [ 1] 2183 	jreq	00108$
                                   2184 ;	clock.c: 344: Point_Meny--;
      008B80 CE 00 37         [ 2] 2185 	ldw	x, _Point_Meny+0
      008B83 5A               [ 2] 2186 	decw	x
                                   2187 ;	clock.c: 345: if(Point_Meny > 4)Point_Meny = 4;
      008B84 CF 00 37         [ 2] 2188 	ldw	_Point_Meny+0, x
      008B87 A3 00 04         [ 2] 2189 	cpw	x, #0x0004
      008B8A 23 06            [ 2] 2190 	jrule	00108$
      008B8C AE 00 04         [ 2] 2191 	ldw	x, #0x0004
      008B8F CF 00 37         [ 2] 2192 	ldw	_Point_Meny+0, x
      008B92                       2193 00108$:
                                   2194 ;	clock.c: 348: if(button(ok)){
      008B92 4B 06            [ 1] 2195 	push	#0x06
      008B94 CD 87 46         [ 4] 2196 	call	_button
      008B97 5B 01            [ 2] 2197 	addw	sp, #1
      008B99 4D               [ 1] 2198 	tnz	a
      008B9A 27 55            [ 1] 2199 	jreq	00118$
                                   2200 ;	clock.c: 350: if(Point_Meny == 0){ //тут настройка RTC
      008B9C CE 00 37         [ 2] 2201 	ldw	x, _Point_Meny+0
      008B9F 26 2C            [ 1] 2202 	jrne	00110$
                                   2203 ;	clock.c: 351: RTC_Read();
      008BA1 CD 85 7E         [ 4] 2204 	call	_RTC_Read
                                   2205 ;	clock.c: 352: Set_time(hour,min);
      008BA4 3B 00 02         [ 1] 2206 	push	_min+0
      008BA7 3B 00 03         [ 1] 2207 	push	_hour+0
      008BAA CD 87 A3         [ 4] 2208 	call	_Set_time
      008BAD 5B 02            [ 2] 2209 	addw	sp, #2
                                   2210 ;	clock.c: 353: RTC_Set(0, Clock_Temp[1], Clock_Temp[0], 1, 1, 1, 20);
      008BAF AE 00 09         [ 2] 2211 	ldw	x, #_Clock_Temp+0
      008BB2 F6               [ 1] 2212 	ld	a, (x)
      008BB3 88               [ 1] 2213 	push	a
      008BB4 E6 01            [ 1] 2214 	ld	a, (0x1, x)
      008BB6 97               [ 1] 2215 	ld	xl, a
      008BB7 84               [ 1] 2216 	pop	a
      008BB8 4B 14            [ 1] 2217 	push	#0x14
      008BBA 4B 01            [ 1] 2218 	push	#0x01
      008BBC 4B 01            [ 1] 2219 	push	#0x01
      008BBE 4B 01            [ 1] 2220 	push	#0x01
      008BC0 88               [ 1] 2221 	push	a
      008BC1 9F               [ 1] 2222 	ld	a, xl
      008BC2 88               [ 1] 2223 	push	a
      008BC3 4B 00            [ 1] 2224 	push	#0x00
      008BC5 CD 86 2D         [ 4] 2225 	call	_RTC_Set
      008BC8 5B 07            [ 2] 2226 	addw	sp, #7
                                   2227 ;	clock.c: 354: clock();
      008BCA CD 8C E7         [ 4] 2228 	call	_clock
      008BCD                       2229 00110$:
                                   2230 ;	clock.c: 357: if(Point_Meny == 1)Set_DnTimer();
      008BCD CE 00 37         [ 2] 2231 	ldw	x, _Point_Meny+0
      008BD0 A3 00 01         [ 2] 2232 	cpw	x, #0x0001
      008BD3 26 03            [ 1] 2233 	jrne	00112$
      008BD5 CD 89 D6         [ 4] 2234 	call	_Set_DnTimer
      008BD8                       2235 00112$:
                                   2236 ;	clock.c: 359: if(Point_Meny == 4) clock();
      008BD8 CE 00 37         [ 2] 2237 	ldw	x, _Point_Meny+0
      008BDB A3 00 04         [ 2] 2238 	cpw	x, #0x0004
      008BDE 26 03            [ 1] 2239 	jrne	00114$
      008BE0 CD 8C E7         [ 4] 2240 	call	_clock
      008BE3                       2241 00114$:
                                   2242 ;	clock.c: 360: if(Point_Meny == 3){
      008BE3 CE 00 37         [ 2] 2243 	ldw	x, _Point_Meny+0
      008BE6 A3 00 03         [ 2] 2244 	cpw	x, #0x0003
      008BE9 26 06            [ 1] 2245 	jrne	00118$
                                   2246 ;	clock.c: 361: Set_Brigh();
      008BEB CD 88 ED         [ 4] 2247 	call	_Set_Brigh
                                   2248 ;	clock.c: 362: clock();
      008BEE CD 8C E7         [ 4] 2249 	call	_clock
      008BF1                       2250 00118$:
                                   2251 ;	clock.c: 368: Soft_Timer++;
      008BF1 CE 00 35         [ 2] 2252 	ldw	x, _Soft_Timer+0
      008BF4 5C               [ 2] 2253 	incw	x
                                   2254 ;	clock.c: 369: if(Soft_Timer == 300){
      008BF5 CF 00 35         [ 2] 2255 	ldw	_Soft_Timer+0, x
      008BF8 A3 01 2C         [ 2] 2256 	cpw	x, #0x012c
      008BFB 27 03            [ 1] 2257 	jreq	00187$
      008BFD CC 8B 5C         [ 2] 2258 	jp	00122$
      008C00                       2259 00187$:
                                   2260 ;	clock.c: 370: TM1637_sendMASS(0x50,0x08,0x08,ASCI[Point_Meny]);
      008C00 AE 00 27         [ 2] 2261 	ldw	x, #_TM1637_seg+0
      008C03 1F 01            [ 2] 2262 	ldw	(0x01, sp), x
      008C05 1E 01            [ 2] 2263 	ldw	x, (0x01, sp)
      008C07 A6 50            [ 1] 2264 	ld	a, #0x50
      008C09 F7               [ 1] 2265 	ld	(x), a
      008C0A 1E 01            [ 2] 2266 	ldw	x, (0x01, sp)
      008C0C 5C               [ 2] 2267 	incw	x
      008C0D A6 08            [ 1] 2268 	ld	a, #0x08
      008C0F F7               [ 1] 2269 	ld	(x), a
      008C10 1E 01            [ 2] 2270 	ldw	x, (0x01, sp)
      008C12 5C               [ 2] 2271 	incw	x
      008C13 5C               [ 2] 2272 	incw	x
      008C14 A6 08            [ 1] 2273 	ld	a, #0x08
      008C16 F7               [ 1] 2274 	ld	(x), a
      008C17 16 01            [ 2] 2275 	ldw	y, (0x01, sp)
      008C19 72 A9 00 03      [ 2] 2276 	addw	y, #0x0003
      008C1D AE 00 2B         [ 2] 2277 	ldw	x, #_ASCI+0
      008C20 72 BB 00 37      [ 2] 2278 	addw	x, _Point_Meny+0
      008C24 F6               [ 1] 2279 	ld	a, (x)
      008C25 90 F7            [ 1] 2280 	ld	(y), a
      008C27 CD 81 D9         [ 4] 2281 	call	_TM1637_send
                                   2282 ;	clock.c: 371: Soft_Timer = 0x00;
      008C2A 5F               [ 1] 2283 	clrw	x
      008C2B CF 00 35         [ 2] 2284 	ldw	_Soft_Timer+0, x
      008C2E CC 8B 5C         [ 2] 2285 	jp	00122$
      008C31 5B 02            [ 2] 2286 	addw	sp, #2
      008C33 81               [ 4] 2287 	ret
                                   2288 ;	clock.c: 377: void Meny(){ //Меню
                                   2289 ;	-----------------------------------------
                                   2290 ;	 function Meny
                                   2291 ;	-----------------------------------------
      008C34                       2292 _Meny:
      008C34 52 02            [ 2] 2293 	sub	sp, #2
                                   2294 ;	clock.c: 379: TM1637_cleer();
      008C36 CD 82 20         [ 4] 2295 	call	_TM1637_cleer
                                   2296 ;	clock.c: 380: Point_Meny = 0;
      008C39 5F               [ 1] 2297 	clrw	x
      008C3A CF 00 37         [ 2] 2298 	ldw	_Point_Meny+0, x
                                   2299 ;	clock.c: 381: Soft_Timer = 0x00;
      008C3D 5F               [ 1] 2300 	clrw	x
      008C3E CF 00 35         [ 2] 2301 	ldw	_Soft_Timer+0, x
                                   2302 ;	clock.c: 383: while(1){
      008C41                       2303 00121$:
                                   2304 ;	clock.c: 385: if(button(up)){
      008C41 4B 05            [ 1] 2305 	push	#0x05
      008C43 CD 87 46         [ 4] 2306 	call	_button
      008C46 5B 01            [ 2] 2307 	addw	sp, #1
      008C48 4D               [ 1] 2308 	tnz	a
      008C49 27 10            [ 1] 2309 	jreq	00104$
                                   2310 ;	clock.c: 386: Point_Meny++;
      008C4B CE 00 37         [ 2] 2311 	ldw	x, _Point_Meny+0
      008C4E 5C               [ 2] 2312 	incw	x
                                   2313 ;	clock.c: 387: if(Point_Meny > 3)Point_Meny = 0;
      008C4F CF 00 37         [ 2] 2314 	ldw	_Point_Meny+0, x
      008C52 A3 00 03         [ 2] 2315 	cpw	x, #0x0003
      008C55 23 04            [ 2] 2316 	jrule	00104$
      008C57 5F               [ 1] 2317 	clrw	x
      008C58 CF 00 37         [ 2] 2318 	ldw	_Point_Meny+0, x
      008C5B                       2319 00104$:
                                   2320 ;	clock.c: 390: if(button(dn)){
      008C5B 4B 07            [ 1] 2321 	push	#0x07
      008C5D CD 87 46         [ 4] 2322 	call	_button
      008C60 5B 01            [ 2] 2323 	addw	sp, #1
      008C62 4D               [ 1] 2324 	tnz	a
      008C63 27 12            [ 1] 2325 	jreq	00108$
                                   2326 ;	clock.c: 391: Point_Meny--;
      008C65 CE 00 37         [ 2] 2327 	ldw	x, _Point_Meny+0
      008C68 5A               [ 2] 2328 	decw	x
                                   2329 ;	clock.c: 392: if(Point_Meny > 3)Point_Meny = 3;
      008C69 CF 00 37         [ 2] 2330 	ldw	_Point_Meny+0, x
      008C6C A3 00 03         [ 2] 2331 	cpw	x, #0x0003
      008C6F 23 06            [ 2] 2332 	jrule	00108$
      008C71 AE 00 03         [ 2] 2333 	ldw	x, #0x0003
      008C74 CF 00 37         [ 2] 2334 	ldw	_Point_Meny+0, x
      008C77                       2335 00108$:
                                   2336 ;	clock.c: 395: if(button(ok)){
      008C77 4B 06            [ 1] 2337 	push	#0x06
      008C79 CD 87 46         [ 4] 2338 	call	_button
      008C7C 5B 01            [ 2] 2339 	addw	sp, #1
      008C7E 4D               [ 1] 2340 	tnz	a
      008C7F 27 26            [ 1] 2341 	jreq	00117$
                                   2342 ;	clock.c: 396: if(Point_Meny == 0)dnClock(); //обратные часы "С__0"
      008C81 CE 00 37         [ 2] 2343 	ldw	x, _Point_Meny+0
      008C84 26 03            [ 1] 2344 	jrne	00110$
      008C86 CD 8F 0C         [ 4] 2345 	call	_dnClock
      008C89                       2346 00110$:
                                   2347 ;	clock.c: 397: if(Point_Meny == 1 || Point_Meny == 3)clock(); //Часы "C__1"
      008C89 CE 00 37         [ 2] 2348 	ldw	x, _Point_Meny+0
      008C8C A3 00 01         [ 2] 2349 	cpw	x, #0x0001
      008C8F 27 08            [ 1] 2350 	jreq	00111$
      008C91 CE 00 37         [ 2] 2351 	ldw	x, _Point_Meny+0
      008C94 A3 00 03         [ 2] 2352 	cpw	x, #0x0003
      008C97 26 03            [ 1] 2353 	jrne	00112$
      008C99                       2354 00111$:
      008C99 CD 8C E7         [ 4] 2355 	call	_clock
      008C9C                       2356 00112$:
                                   2357 ;	clock.c: 398: if(Point_Meny == 2) Set_Meny(); //Настройки "C__2"
      008C9C CE 00 37         [ 2] 2358 	ldw	x, _Point_Meny+0
      008C9F A3 00 02         [ 2] 2359 	cpw	x, #0x0002
      008CA2 26 03            [ 1] 2360 	jrne	00117$
      008CA4 CD 8B 4F         [ 4] 2361 	call	_Set_Meny
      008CA7                       2362 00117$:
                                   2363 ;	clock.c: 403: Soft_Timer++;
      008CA7 CE 00 35         [ 2] 2364 	ldw	x, _Soft_Timer+0
      008CAA 5C               [ 2] 2365 	incw	x
                                   2366 ;	clock.c: 404: if(Soft_Timer == 300){
      008CAB CF 00 35         [ 2] 2367 	ldw	_Soft_Timer+0, x
      008CAE A3 01 2C         [ 2] 2368 	cpw	x, #0x012c
      008CB1 26 8E            [ 1] 2369 	jrne	00121$
                                   2370 ;	clock.c: 405: TM1637_sendMASS(0x39,0x08,0x08,ASCI[Point_Meny]);
      008CB3 AE 00 27         [ 2] 2371 	ldw	x, #_TM1637_seg+0
      008CB6 1F 01            [ 2] 2372 	ldw	(0x01, sp), x
      008CB8 1E 01            [ 2] 2373 	ldw	x, (0x01, sp)
      008CBA A6 39            [ 1] 2374 	ld	a, #0x39
      008CBC F7               [ 1] 2375 	ld	(x), a
      008CBD 1E 01            [ 2] 2376 	ldw	x, (0x01, sp)
      008CBF 5C               [ 2] 2377 	incw	x
      008CC0 A6 08            [ 1] 2378 	ld	a, #0x08
      008CC2 F7               [ 1] 2379 	ld	(x), a
      008CC3 1E 01            [ 2] 2380 	ldw	x, (0x01, sp)
      008CC5 5C               [ 2] 2381 	incw	x
      008CC6 5C               [ 2] 2382 	incw	x
      008CC7 A6 08            [ 1] 2383 	ld	a, #0x08
      008CC9 F7               [ 1] 2384 	ld	(x), a
      008CCA 16 01            [ 2] 2385 	ldw	y, (0x01, sp)
      008CCC 72 A9 00 03      [ 2] 2386 	addw	y, #0x0003
      008CD0 AE 00 2B         [ 2] 2387 	ldw	x, #_ASCI+0
      008CD3 72 BB 00 37      [ 2] 2388 	addw	x, _Point_Meny+0
      008CD7 F6               [ 1] 2389 	ld	a, (x)
      008CD8 90 F7            [ 1] 2390 	ld	(y), a
      008CDA CD 81 D9         [ 4] 2391 	call	_TM1637_send
                                   2392 ;	clock.c: 406: Soft_Timer = 0x00;
      008CDD 5F               [ 1] 2393 	clrw	x
      008CDE CF 00 35         [ 2] 2394 	ldw	_Soft_Timer+0, x
      008CE1 CC 8C 41         [ 2] 2395 	jp	00121$
      008CE4 5B 02            [ 2] 2396 	addw	sp, #2
      008CE6 81               [ 4] 2397 	ret
                                   2398 ;	clock.c: 412: void clock(void){
                                   2399 ;	-----------------------------------------
                                   2400 ;	 function clock
                                   2401 ;	-----------------------------------------
      008CE7                       2402 _clock:
      008CE7 52 06            [ 2] 2403 	sub	sp, #6
                                   2404 ;	clock.c: 414: TM1637_cleer();
      008CE9 CD 82 20         [ 4] 2405 	call	_TM1637_cleer
                                   2406 ;	clock.c: 415: Soft_Timer = 0x00; //Сброс таймера
      008CEC 5F               [ 1] 2407 	clrw	x
      008CED CF 00 35         [ 2] 2408 	ldw	_Soft_Timer+0, x
                                   2409 ;	clock.c: 417: while(1){
      008CF0                       2410 00114$:
                                   2411 ;	clock.c: 419: Soft_Timer++;
      008CF0 CE 00 35         [ 2] 2412 	ldw	x, _Soft_Timer+0
      008CF3 5C               [ 2] 2413 	incw	x
      008CF4 CF 00 35         [ 2] 2414 	ldw	_Soft_Timer+0, x
                                   2415 ;	clock.c: 422: if(button(up))Set_Brigh();
      008CF7 4B 05            [ 1] 2416 	push	#0x05
      008CF9 CD 87 46         [ 4] 2417 	call	_button
      008CFC 5B 01            [ 2] 2418 	addw	sp, #1
      008CFE 4D               [ 1] 2419 	tnz	a
      008CFF 27 03            [ 1] 2420 	jreq	00102$
      008D01 CD 88 ED         [ 4] 2421 	call	_Set_Brigh
      008D04                       2422 00102$:
                                   2423 ;	clock.c: 423: if(button(dn))Set_Brigh();
      008D04 4B 07            [ 1] 2424 	push	#0x07
      008D06 CD 87 46         [ 4] 2425 	call	_button
      008D09 5B 01            [ 2] 2426 	addw	sp, #1
      008D0B 4D               [ 1] 2427 	tnz	a
      008D0C 27 03            [ 1] 2428 	jreq	00104$
      008D0E CD 88 ED         [ 4] 2429 	call	_Set_Brigh
      008D11                       2430 00104$:
                                   2431 ;	clock.c: 424: if(button(ok))Meny();
      008D11 4B 06            [ 1] 2432 	push	#0x06
      008D13 CD 87 46         [ 4] 2433 	call	_button
      008D16 5B 01            [ 2] 2434 	addw	sp, #1
      008D18 4D               [ 1] 2435 	tnz	a
      008D19 27 03            [ 1] 2436 	jreq	00106$
      008D1B CD 8C 34         [ 4] 2437 	call	_Meny
      008D1E                       2438 00106$:
                                   2439 ;	clock.c: 426: if(Soft_Timer == 3000){ // Отображение времени при значении Программного таймера
      008D1E CE 00 35         [ 2] 2440 	ldw	x, _Soft_Timer+0
      008D21 A3 0B B8         [ 2] 2441 	cpw	x, #0x0bb8
      008D24 26 CA            [ 1] 2442 	jrne	00114$
                                   2443 ;	clock.c: 427: RTC_Read();
      008D26 CD 85 7E         [ 4] 2444 	call	_RTC_Read
                                   2445 ;	clock.c: 428: dot = !dot;
      008D29 C6 00 08         [ 1] 2446 	ld	a, _dot+0
      008D2C A0 01            [ 1] 2447 	sub	a, #0x01
      008D2E 4F               [ 1] 2448 	clr	a
      008D2F 49               [ 1] 2449 	rlc	a
      008D30 C7 00 08         [ 1] 2450 	ld	_dot+0, a
                                   2451 ;	clock.c: 431: TM1637_seg[0] = ASCI[hour/10];
      008D33 AE 00 27         [ 2] 2452 	ldw	x, #_TM1637_seg+0
      008D36 1F 05            [ 2] 2453 	ldw	(0x05, sp), x
      008D38 AE 00 2B         [ 2] 2454 	ldw	x, #_ASCI+0
      008D3B 1F 03            [ 2] 2455 	ldw	(0x03, sp), x
      008D3D 5F               [ 1] 2456 	clrw	x
      008D3E C6 00 03         [ 1] 2457 	ld	a, _hour+0
      008D41 97               [ 1] 2458 	ld	xl, a
      008D42 A6 0A            [ 1] 2459 	ld	a, #0x0a
      008D44 62               [ 2] 2460 	div	x, a
      008D45 4F               [ 1] 2461 	clr	a
      008D46 95               [ 1] 2462 	ld	xh, a
      008D47 72 FB 03         [ 2] 2463 	addw	x, (0x03, sp)
      008D4A F6               [ 1] 2464 	ld	a, (x)
      008D4B 1E 05            [ 2] 2465 	ldw	x, (0x05, sp)
      008D4D F7               [ 1] 2466 	ld	(x), a
                                   2467 ;	clock.c: 432: TM1637_seg[1] = ASCI[hour%10];
      008D4E 1E 05            [ 2] 2468 	ldw	x, (0x05, sp)
      008D50 5C               [ 2] 2469 	incw	x
      008D51 1F 01            [ 2] 2470 	ldw	(0x01, sp), x
      008D53 5F               [ 1] 2471 	clrw	x
      008D54 C6 00 03         [ 1] 2472 	ld	a, _hour+0
      008D57 97               [ 1] 2473 	ld	xl, a
      008D58 A6 0A            [ 1] 2474 	ld	a, #0x0a
      008D5A 62               [ 2] 2475 	div	x, a
      008D5B 5F               [ 1] 2476 	clrw	x
      008D5C 97               [ 1] 2477 	ld	xl, a
      008D5D 72 FB 03         [ 2] 2478 	addw	x, (0x03, sp)
      008D60 F6               [ 1] 2479 	ld	a, (x)
      008D61 1E 01            [ 2] 2480 	ldw	x, (0x01, sp)
      008D63 F7               [ 1] 2481 	ld	(x), a
                                   2482 ;	clock.c: 433: TM1637_seg[2] = ASCI[min/10];
      008D64 16 05            [ 2] 2483 	ldw	y, (0x05, sp)
      008D66 72 A9 00 02      [ 2] 2484 	addw	y, #0x0002
      008D6A 5F               [ 1] 2485 	clrw	x
      008D6B C6 00 02         [ 1] 2486 	ld	a, _min+0
      008D6E 97               [ 1] 2487 	ld	xl, a
      008D6F A6 0A            [ 1] 2488 	ld	a, #0x0a
      008D71 62               [ 2] 2489 	div	x, a
      008D72 4F               [ 1] 2490 	clr	a
      008D73 95               [ 1] 2491 	ld	xh, a
      008D74 72 FB 03         [ 2] 2492 	addw	x, (0x03, sp)
      008D77 F6               [ 1] 2493 	ld	a, (x)
      008D78 90 F7            [ 1] 2494 	ld	(y), a
                                   2495 ;	clock.c: 434: TM1637_seg[3] = ASCI[min%10];
      008D7A 16 05            [ 2] 2496 	ldw	y, (0x05, sp)
      008D7C 72 A9 00 03      [ 2] 2497 	addw	y, #0x0003
      008D80 5F               [ 1] 2498 	clrw	x
      008D81 C6 00 02         [ 1] 2499 	ld	a, _min+0
      008D84 97               [ 1] 2500 	ld	xl, a
      008D85 A6 0A            [ 1] 2501 	ld	a, #0x0a
      008D87 62               [ 2] 2502 	div	x, a
      008D88 5F               [ 1] 2503 	clrw	x
      008D89 97               [ 1] 2504 	ld	xl, a
      008D8A 72 FB 03         [ 2] 2505 	addw	x, (0x03, sp)
      008D8D F6               [ 1] 2506 	ld	a, (x)
      008D8E 90 F7            [ 1] 2507 	ld	(y), a
                                   2508 ;	clock.c: 436: if(hour<10)	TM1637_seg[0] =  0x00; //Отключение первого разряда если в нем 0
      008D90 C6 00 03         [ 1] 2509 	ld	a, _hour+0
      008D93 A1 0A            [ 1] 2510 	cp	a, #0x0a
      008D95 24 03            [ 1] 2511 	jrnc	00108$
      008D97 1E 05            [ 2] 2512 	ldw	x, (0x05, sp)
      008D99 7F               [ 1] 2513 	clr	(x)
      008D9A                       2514 00108$:
                                   2515 ;	clock.c: 437: if(dot) TM1637_seg[1] = TM1637_seg[1] + 0x80; //Включение секундных точек
      008D9A 72 00 00 08 02   [ 2] 2516 	btjt	_dot+0, #0, 00153$
      008D9F 20 08            [ 2] 2517 	jra	00110$
      008DA1                       2518 00153$:
      008DA1 1E 01            [ 2] 2519 	ldw	x, (0x01, sp)
      008DA3 F6               [ 1] 2520 	ld	a, (x)
      008DA4 AB 80            [ 1] 2521 	add	a, #0x80
      008DA6 1E 01            [ 2] 2522 	ldw	x, (0x01, sp)
      008DA8 F7               [ 1] 2523 	ld	(x), a
      008DA9                       2524 00110$:
                                   2525 ;	clock.c: 439: TM1637_send();
      008DA9 CD 81 D9         [ 4] 2526 	call	_TM1637_send
                                   2527 ;	clock.c: 440: Soft_Timer = 0x00; //Сброс таймера
      008DAC 5F               [ 1] 2528 	clrw	x
      008DAD CF 00 35         [ 2] 2529 	ldw	_Soft_Timer+0, x
      008DB0 CC 8C F0         [ 2] 2530 	jp	00114$
      008DB3 5B 06            [ 2] 2531 	addw	sp, #6
      008DB5 81               [ 4] 2532 	ret
                                   2533 ;	clock.c: 465: unsigned long transTime(unsigned long d, unsigned long h, unsigned long m, unsigned long s){ //d, h, m, s
                                   2534 ;	-----------------------------------------
                                   2535 ;	 function transTime
                                   2536 ;	-----------------------------------------
      008DB6                       2537 _transTime:
      008DB6 52 04            [ 2] 2538 	sub	sp, #4
                                   2539 ;	clock.c: 466: return ((d*86400)+(((h*60)+m)*60+s));
      008DB8 1E 09            [ 2] 2540 	ldw	x, (0x09, sp)
      008DBA 89               [ 2] 2541 	pushw	x
      008DBB 1E 09            [ 2] 2542 	ldw	x, (0x09, sp)
      008DBD 89               [ 2] 2543 	pushw	x
      008DBE 4B 80            [ 1] 2544 	push	#0x80
      008DC0 4B 51            [ 1] 2545 	push	#0x51
      008DC2 4B 01            [ 1] 2546 	push	#0x01
      008DC4 4B 00            [ 1] 2547 	push	#0x00
      008DC6 CD 94 58         [ 4] 2548 	call	__mullong
      008DC9 5B 08            [ 2] 2549 	addw	sp, #8
      008DCB 1F 03            [ 2] 2550 	ldw	(0x03, sp), x
      008DCD 17 01            [ 2] 2551 	ldw	(0x01, sp), y
      008DCF 1E 0D            [ 2] 2552 	ldw	x, (0x0d, sp)
      008DD1 89               [ 2] 2553 	pushw	x
      008DD2 1E 0D            [ 2] 2554 	ldw	x, (0x0d, sp)
      008DD4 89               [ 2] 2555 	pushw	x
      008DD5 4B 3C            [ 1] 2556 	push	#0x3c
      008DD7 5F               [ 1] 2557 	clrw	x
      008DD8 89               [ 2] 2558 	pushw	x
      008DD9 4B 00            [ 1] 2559 	push	#0x00
      008DDB CD 94 58         [ 4] 2560 	call	__mullong
      008DDE 5B 08            [ 2] 2561 	addw	sp, #8
      008DE0 51               [ 1] 2562 	exgw	x, y
      008DE1 72 F9 11         [ 2] 2563 	addw	y, (0x11, sp)
      008DE4 9F               [ 1] 2564 	ld	a, xl
      008DE5 19 10            [ 1] 2565 	adc	a, (0x10, sp)
      008DE7 02               [ 1] 2566 	rlwa	x
      008DE8 19 0F            [ 1] 2567 	adc	a, (0x0f, sp)
      008DEA 95               [ 1] 2568 	ld	xh, a
      008DEB 90 89            [ 2] 2569 	pushw	y
      008DED 89               [ 2] 2570 	pushw	x
      008DEE 4B 3C            [ 1] 2571 	push	#0x3c
      008DF0 5F               [ 1] 2572 	clrw	x
      008DF1 89               [ 2] 2573 	pushw	x
      008DF2 4B 00            [ 1] 2574 	push	#0x00
      008DF4 CD 94 58         [ 4] 2575 	call	__mullong
      008DF7 5B 08            [ 2] 2576 	addw	sp, #8
      008DF9 51               [ 1] 2577 	exgw	x, y
      008DFA 72 F9 15         [ 2] 2578 	addw	y, (0x15, sp)
      008DFD 9F               [ 1] 2579 	ld	a, xl
      008DFE 19 14            [ 1] 2580 	adc	a, (0x14, sp)
      008E00 02               [ 1] 2581 	rlwa	x
      008E01 19 13            [ 1] 2582 	adc	a, (0x13, sp)
      008E03 95               [ 1] 2583 	ld	xh, a
      008E04 72 F9 03         [ 2] 2584 	addw	y, (0x03, sp)
      008E07 9F               [ 1] 2585 	ld	a, xl
      008E08 19 02            [ 1] 2586 	adc	a, (0x02, sp)
      008E0A 02               [ 1] 2587 	rlwa	x
      008E0B 19 01            [ 1] 2588 	adc	a, (0x01, sp)
      008E0D 95               [ 1] 2589 	ld	xh, a
      008E0E 51               [ 1] 2590 	exgw	x, y
      008E0F 5B 04            [ 2] 2591 	addw	sp, #4
      008E11 81               [ 4] 2592 	ret
                                   2593 ;	clock.c: 470: void conSec(long secin){
                                   2594 ;	-----------------------------------------
                                   2595 ;	 function conSec
                                   2596 ;	-----------------------------------------
      008E12                       2597 _conSec:
      008E12 52 10            [ 2] 2598 	sub	sp, #16
                                   2599 ;	clock.c: 476: con_day = secin/86400;
      008E14 4B 80            [ 1] 2600 	push	#0x80
      008E16 4B 51            [ 1] 2601 	push	#0x51
      008E18 4B 01            [ 1] 2602 	push	#0x01
      008E1A 4B 00            [ 1] 2603 	push	#0x00
      008E1C 1E 19            [ 2] 2604 	ldw	x, (0x19, sp)
      008E1E 89               [ 2] 2605 	pushw	x
      008E1F 1E 19            [ 2] 2606 	ldw	x, (0x19, sp)
      008E21 89               [ 2] 2607 	pushw	x
      008E22 CD 93 D7         [ 4] 2608 	call	__divslong
      008E25 5B 08            [ 2] 2609 	addw	sp, #8
      008E27 CF 00 3D         [ 2] 2610 	ldw	_con_day+2, x
      008E2A 90 CF 00 3B      [ 2] 2611 	ldw	_con_day+0, y
                                   2612 ;	clock.c: 477: secin = secin-(con_day*86400);
      008E2E 3B 00 3E         [ 1] 2613 	push	_con_day+3
      008E31 3B 00 3D         [ 1] 2614 	push	_con_day+2
      008E34 3B 00 3C         [ 1] 2615 	push	_con_day+1
      008E37 3B 00 3B         [ 1] 2616 	push	_con_day+0
      008E3A 4B 80            [ 1] 2617 	push	#0x80
      008E3C 4B 51            [ 1] 2618 	push	#0x51
      008E3E 4B 01            [ 1] 2619 	push	#0x01
      008E40 4B 00            [ 1] 2620 	push	#0x00
      008E42 CD 94 58         [ 4] 2621 	call	__mullong
      008E45 5B 08            [ 2] 2622 	addw	sp, #8
      008E47 1F 0F            [ 2] 2623 	ldw	(0x0f, sp), x
      008E49 17 0D            [ 2] 2624 	ldw	(0x0d, sp), y
      008E4B 16 15            [ 2] 2625 	ldw	y, (0x15, sp)
      008E4D 1E 13            [ 2] 2626 	ldw	x, (0x13, sp)
      008E4F 72 F2 0F         [ 2] 2627 	subw	y, (0x0f, sp)
      008E52 9F               [ 1] 2628 	ld	a, xl
      008E53 12 0E            [ 1] 2629 	sbc	a, (0x0e, sp)
      008E55 02               [ 1] 2630 	rlwa	x
      008E56 12 0D            [ 1] 2631 	sbc	a, (0x0d, sp)
      008E58 95               [ 1] 2632 	ld	xh, a
      008E59 17 15            [ 2] 2633 	ldw	(0x15, sp), y
      008E5B 1F 13            [ 2] 2634 	ldw	(0x13, sp), x
                                   2635 ;	clock.c: 479: con_hour = (secin/3600);
      008E5D 4B 10            [ 1] 2636 	push	#0x10
      008E5F 4B 0E            [ 1] 2637 	push	#0x0e
      008E61 5F               [ 1] 2638 	clrw	x
      008E62 89               [ 2] 2639 	pushw	x
      008E63 1E 19            [ 2] 2640 	ldw	x, (0x19, sp)
      008E65 89               [ 2] 2641 	pushw	x
      008E66 1E 19            [ 2] 2642 	ldw	x, (0x19, sp)
      008E68 89               [ 2] 2643 	pushw	x
      008E69 CD 93 D7         [ 4] 2644 	call	__divslong
      008E6C 5B 08            [ 2] 2645 	addw	sp, #8
      008E6E CF 00 41         [ 2] 2646 	ldw	_con_hour+2, x
      008E71 90 CF 00 3F      [ 2] 2647 	ldw	_con_hour+0, y
                                   2648 ;	clock.c: 480: con_min	 = ((secin-(3600*con_hour))/60);
      008E75 3B 00 42         [ 1] 2649 	push	_con_hour+3
      008E78 3B 00 41         [ 1] 2650 	push	_con_hour+2
      008E7B 3B 00 40         [ 1] 2651 	push	_con_hour+1
      008E7E 3B 00 3F         [ 1] 2652 	push	_con_hour+0
      008E81 4B 10            [ 1] 2653 	push	#0x10
      008E83 4B 0E            [ 1] 2654 	push	#0x0e
      008E85 5F               [ 1] 2655 	clrw	x
      008E86 89               [ 2] 2656 	pushw	x
      008E87 CD 94 58         [ 4] 2657 	call	__mullong
      008E8A 5B 08            [ 2] 2658 	addw	sp, #8
      008E8C 1F 0B            [ 2] 2659 	ldw	(0x0b, sp), x
      008E8E 17 09            [ 2] 2660 	ldw	(0x09, sp), y
      008E90 16 15            [ 2] 2661 	ldw	y, (0x15, sp)
      008E92 17 07            [ 2] 2662 	ldw	(0x07, sp), y
      008E94 16 13            [ 2] 2663 	ldw	y, (0x13, sp)
      008E96 17 05            [ 2] 2664 	ldw	(0x05, sp), y
      008E98 16 07            [ 2] 2665 	ldw	y, (0x07, sp)
      008E9A 72 F2 0B         [ 2] 2666 	subw	y, (0x0b, sp)
      008E9D 7B 06            [ 1] 2667 	ld	a, (0x06, sp)
      008E9F 12 0A            [ 1] 2668 	sbc	a, (0x0a, sp)
      008EA1 97               [ 1] 2669 	ld	xl, a
      008EA2 7B 05            [ 1] 2670 	ld	a, (0x05, sp)
      008EA4 12 09            [ 1] 2671 	sbc	a, (0x09, sp)
      008EA6 95               [ 1] 2672 	ld	xh, a
      008EA7 4B 3C            [ 1] 2673 	push	#0x3c
      008EA9 4B 00            [ 1] 2674 	push	#0x00
      008EAB 4B 00            [ 1] 2675 	push	#0x00
      008EAD 4B 00            [ 1] 2676 	push	#0x00
      008EAF 90 89            [ 2] 2677 	pushw	y
      008EB1 89               [ 2] 2678 	pushw	x
      008EB2 CD 93 FE         [ 4] 2679 	call	__divulong
      008EB5 5B 08            [ 2] 2680 	addw	sp, #8
      008EB7 CF 00 45         [ 2] 2681 	ldw	_con_min+2, x
      008EBA 90 CF 00 43      [ 2] 2682 	ldw	_con_min+0, y
                                   2683 ;	clock.c: 481: con_sec	 = (secin-(((con_hour*60)*60)+(con_min*60)));
      008EBE 3B 00 46         [ 1] 2684 	push	_con_min+3
      008EC1 3B 00 45         [ 1] 2685 	push	_con_min+2
      008EC4 3B 00 44         [ 1] 2686 	push	_con_min+1
      008EC7 3B 00 43         [ 1] 2687 	push	_con_min+0
      008ECA 4B 3C            [ 1] 2688 	push	#0x3c
      008ECC 5F               [ 1] 2689 	clrw	x
      008ECD 89               [ 2] 2690 	pushw	x
      008ECE 4B 00            [ 1] 2691 	push	#0x00
      008ED0 CD 94 58         [ 4] 2692 	call	__mullong
      008ED3 5B 08            [ 2] 2693 	addw	sp, #8
      008ED5 51               [ 1] 2694 	exgw	x, y
      008ED6 72 F9 0B         [ 2] 2695 	addw	y, (0x0b, sp)
      008ED9 9F               [ 1] 2696 	ld	a, xl
      008EDA 19 0A            [ 1] 2697 	adc	a, (0x0a, sp)
      008EDC 6B 02            [ 1] 2698 	ld	(0x02, sp), a
      008EDE 9E               [ 1] 2699 	ld	a, xh
      008EDF 19 09            [ 1] 2700 	adc	a, (0x09, sp)
      008EE1 95               [ 1] 2701 	ld	xh, a
      008EE2 7B 08            [ 1] 2702 	ld	a, (0x08, sp)
      008EE4 90 89            [ 2] 2703 	pushw	y
      008EE6 10 02            [ 1] 2704 	sub	a, (#2, sp)
      008EE8 90 85            [ 2] 2705 	popw	y
      008EEA 90 97            [ 1] 2706 	ld	yl, a
      008EEC 7B 07            [ 1] 2707 	ld	a, (0x07, sp)
      008EEE 90 89            [ 2] 2708 	pushw	y
      008EF0 12 01            [ 1] 2709 	sbc	a, (#1, sp)
      008EF2 90 85            [ 2] 2710 	popw	y
      008EF4 90 95            [ 1] 2711 	ld	yh, a
      008EF6 7B 06            [ 1] 2712 	ld	a, (0x06, sp)
      008EF8 12 02            [ 1] 2713 	sbc	a, (0x02, sp)
      008EFA 97               [ 1] 2714 	ld	xl, a
      008EFB 7B 05            [ 1] 2715 	ld	a, (0x05, sp)
      008EFD 89               [ 2] 2716 	pushw	x
      008EFE 12 01            [ 1] 2717 	sbc	a, (#1, sp)
      008F00 85               [ 2] 2718 	popw	x
      008F01 95               [ 1] 2719 	ld	xh, a
      008F02 90 CF 00 49      [ 2] 2720 	ldw	_con_sec+2, y
      008F06 CF 00 47         [ 2] 2721 	ldw	_con_sec+0, x
      008F09 5B 10            [ 2] 2722 	addw	sp, #16
      008F0B 81               [ 4] 2723 	ret
                                   2724 ;	clock.c: 500: void dnClock(void){
                                   2725 ;	-----------------------------------------
                                   2726 ;	 function dnClock
                                   2727 ;	-----------------------------------------
      008F0C                       2728 _dnClock:
      008F0C 52 42            [ 2] 2729 	sub	sp, #66
                                   2730 ;	clock.c: 502: TM1637_cleer();
      008F0E CD 82 20         [ 4] 2731 	call	_TM1637_cleer
                                   2732 ;	clock.c: 503: Soft_Timer = 0x00; //Сброс таймера
      008F11 5F               [ 1] 2733 	clrw	x
      008F12 CF 00 35         [ 2] 2734 	ldw	_Soft_Timer+0, x
                                   2735 ;	clock.c: 504: PointTimer = 0;
      008F15 72 5F 00 23      [ 1] 2736 	clr	_PointTimer+0
                                   2737 ;	clock.c: 506: DnClock_Tim_0 = transTime(0,EEPROM_DATA(DnClock_hour_0),EEPROM_DATA(DnClock_min_0),0);
      008F19 AE 40 01         [ 2] 2738 	ldw	x, #0x4001
      008F1C F6               [ 1] 2739 	ld	a, (x)
      008F1D 97               [ 1] 2740 	ld	xl, a
      008F1E 49               [ 1] 2741 	rlc	a
      008F1F 4F               [ 1] 2742 	clr	a
      008F20 A2 00            [ 1] 2743 	sbc	a, #0x00
      008F22 95               [ 1] 2744 	ld	xh, a
      008F23 6B 09            [ 1] 2745 	ld	(0x09, sp), a
      008F25 6B 08            [ 1] 2746 	ld	(0x08, sp), a
      008F27 90 AE 40 00      [ 2] 2747 	ldw	y, #0x4000
      008F2B 90 F6            [ 1] 2748 	ld	a, (y)
      008F2D 6B 34            [ 1] 2749 	ld	(0x34, sp), a
      008F2F 7B 34            [ 1] 2750 	ld	a, (0x34, sp)
      008F31 49               [ 1] 2751 	rlc	a
      008F32 4F               [ 1] 2752 	clr	a
      008F33 A2 00            [ 1] 2753 	sbc	a, #0x00
      008F35 6B 33            [ 1] 2754 	ld	(0x33, sp), a
      008F37 90 97            [ 1] 2755 	ld	yl, a
      008F39 90 95            [ 1] 2756 	ld	yh, a
      008F3B 4B 00            [ 1] 2757 	push	#0x00
      008F3D 4B 00            [ 1] 2758 	push	#0x00
      008F3F 4B 00            [ 1] 2759 	push	#0x00
      008F41 4B 00            [ 1] 2760 	push	#0x00
      008F43 89               [ 2] 2761 	pushw	x
      008F44 1E 0E            [ 2] 2762 	ldw	x, (0x0e, sp)
      008F46 89               [ 2] 2763 	pushw	x
      008F47 1E 3B            [ 2] 2764 	ldw	x, (0x3b, sp)
      008F49 89               [ 2] 2765 	pushw	x
      008F4A 90 89            [ 2] 2766 	pushw	y
      008F4C 5F               [ 1] 2767 	clrw	x
      008F4D 89               [ 2] 2768 	pushw	x
      008F4E 5F               [ 1] 2769 	clrw	x
      008F4F 89               [ 2] 2770 	pushw	x
      008F50 CD 8D B6         [ 4] 2771 	call	_transTime
      008F53 5B 10            [ 2] 2772 	addw	sp, #16
      008F55 CF 00 0D         [ 2] 2773 	ldw	_DnClock_Tim_0+2, x
      008F58 90 CF 00 0B      [ 2] 2774 	ldw	_DnClock_Tim_0+0, y
                                   2775 ;	clock.c: 507: DnClock_Tim_1 = transTime(0,EEPROM_DATA(DnClock_hour_1),EEPROM_DATA(DnClock_min_1),0);
      008F5C AE 40 03         [ 2] 2776 	ldw	x, #0x4003
      008F5F F6               [ 1] 2777 	ld	a, (x)
      008F60 97               [ 1] 2778 	ld	xl, a
      008F61 49               [ 1] 2779 	rlc	a
      008F62 4F               [ 1] 2780 	clr	a
      008F63 A2 00            [ 1] 2781 	sbc	a, #0x00
      008F65 95               [ 1] 2782 	ld	xh, a
      008F66 6B 24            [ 1] 2783 	ld	(0x24, sp), a
      008F68 6B 23            [ 1] 2784 	ld	(0x23, sp), a
      008F6A 90 AE 40 02      [ 2] 2785 	ldw	y, #0x4002
      008F6E 90 F6            [ 1] 2786 	ld	a, (y)
      008F70 6B 21            [ 1] 2787 	ld	(0x21, sp), a
      008F72 7B 21            [ 1] 2788 	ld	a, (0x21, sp)
      008F74 49               [ 1] 2789 	rlc	a
      008F75 4F               [ 1] 2790 	clr	a
      008F76 A2 00            [ 1] 2791 	sbc	a, #0x00
      008F78 6B 20            [ 1] 2792 	ld	(0x20, sp), a
      008F7A 90 97            [ 1] 2793 	ld	yl, a
      008F7C 90 95            [ 1] 2794 	ld	yh, a
      008F7E 4B 00            [ 1] 2795 	push	#0x00
      008F80 4B 00            [ 1] 2796 	push	#0x00
      008F82 4B 00            [ 1] 2797 	push	#0x00
      008F84 4B 00            [ 1] 2798 	push	#0x00
      008F86 89               [ 2] 2799 	pushw	x
      008F87 1E 29            [ 2] 2800 	ldw	x, (0x29, sp)
      008F89 89               [ 2] 2801 	pushw	x
      008F8A 1E 28            [ 2] 2802 	ldw	x, (0x28, sp)
      008F8C 89               [ 2] 2803 	pushw	x
      008F8D 90 89            [ 2] 2804 	pushw	y
      008F8F 5F               [ 1] 2805 	clrw	x
      008F90 89               [ 2] 2806 	pushw	x
      008F91 5F               [ 1] 2807 	clrw	x
      008F92 89               [ 2] 2808 	pushw	x
      008F93 CD 8D B6         [ 4] 2809 	call	_transTime
      008F96 5B 10            [ 2] 2810 	addw	sp, #16
      008F98 CF 00 11         [ 2] 2811 	ldw	_DnClock_Tim_1+2, x
      008F9B 90 CF 00 0F      [ 2] 2812 	ldw	_DnClock_Tim_1+0, y
                                   2813 ;	clock.c: 508: DnClock_Tim_2 = transTime(0,EEPROM_DATA(DnClock_hour_2),EEPROM_DATA(DnClock_min_2),0);
      008F9F AE 40 05         [ 2] 2814 	ldw	x, #0x4005
      008FA2 F6               [ 1] 2815 	ld	a, (x)
      008FA3 97               [ 1] 2816 	ld	xl, a
      008FA4 49               [ 1] 2817 	rlc	a
      008FA5 4F               [ 1] 2818 	clr	a
      008FA6 A2 00            [ 1] 2819 	sbc	a, #0x00
      008FA8 95               [ 1] 2820 	ld	xh, a
      008FA9 6B 28            [ 1] 2821 	ld	(0x28, sp), a
      008FAB 6B 27            [ 1] 2822 	ld	(0x27, sp), a
      008FAD 90 AE 40 04      [ 2] 2823 	ldw	y, #0x4004
      008FB1 90 F6            [ 1] 2824 	ld	a, (y)
      008FB3 6B 2E            [ 1] 2825 	ld	(0x2e, sp), a
      008FB5 7B 2E            [ 1] 2826 	ld	a, (0x2e, sp)
      008FB7 49               [ 1] 2827 	rlc	a
      008FB8 4F               [ 1] 2828 	clr	a
      008FB9 A2 00            [ 1] 2829 	sbc	a, #0x00
      008FBB 6B 2D            [ 1] 2830 	ld	(0x2d, sp), a
      008FBD 90 97            [ 1] 2831 	ld	yl, a
      008FBF 90 95            [ 1] 2832 	ld	yh, a
      008FC1 4B 00            [ 1] 2833 	push	#0x00
      008FC3 4B 00            [ 1] 2834 	push	#0x00
      008FC5 4B 00            [ 1] 2835 	push	#0x00
      008FC7 4B 00            [ 1] 2836 	push	#0x00
      008FC9 89               [ 2] 2837 	pushw	x
      008FCA 1E 2D            [ 2] 2838 	ldw	x, (0x2d, sp)
      008FCC 89               [ 2] 2839 	pushw	x
      008FCD 1E 35            [ 2] 2840 	ldw	x, (0x35, sp)
      008FCF 89               [ 2] 2841 	pushw	x
      008FD0 90 89            [ 2] 2842 	pushw	y
      008FD2 5F               [ 1] 2843 	clrw	x
      008FD3 89               [ 2] 2844 	pushw	x
      008FD4 5F               [ 1] 2845 	clrw	x
      008FD5 89               [ 2] 2846 	pushw	x
      008FD6 CD 8D B6         [ 4] 2847 	call	_transTime
      008FD9 5B 10            [ 2] 2848 	addw	sp, #16
      008FDB CF 00 15         [ 2] 2849 	ldw	_DnClock_Tim_2+2, x
      008FDE 90 CF 00 13      [ 2] 2850 	ldw	_DnClock_Tim_2+0, y
                                   2851 ;	clock.c: 509: DnClock_Tim_3 = transTime(0,EEPROM_DATA(DnClock_hour_3),EEPROM_DATA(DnClock_min_3),0);
      008FE2 AE 40 07         [ 2] 2852 	ldw	x, #0x4007
      008FE5 F6               [ 1] 2853 	ld	a, (x)
      008FE6 97               [ 1] 2854 	ld	xl, a
      008FE7 49               [ 1] 2855 	rlc	a
      008FE8 4F               [ 1] 2856 	clr	a
      008FE9 A2 00            [ 1] 2857 	sbc	a, #0x00
      008FEB 95               [ 1] 2858 	ld	xh, a
      008FEC 6B 3B            [ 1] 2859 	ld	(0x3b, sp), a
      008FEE 6B 3A            [ 1] 2860 	ld	(0x3a, sp), a
      008FF0 90 AE 40 06      [ 2] 2861 	ldw	y, #0x4006
      008FF4 90 F6            [ 1] 2862 	ld	a, (y)
      008FF6 6B 0F            [ 1] 2863 	ld	(0x0f, sp), a
      008FF8 7B 0F            [ 1] 2864 	ld	a, (0x0f, sp)
      008FFA 49               [ 1] 2865 	rlc	a
      008FFB 4F               [ 1] 2866 	clr	a
      008FFC A2 00            [ 1] 2867 	sbc	a, #0x00
      008FFE 6B 0E            [ 1] 2868 	ld	(0x0e, sp), a
      009000 90 97            [ 1] 2869 	ld	yl, a
      009002 90 95            [ 1] 2870 	ld	yh, a
      009004 4B 00            [ 1] 2871 	push	#0x00
      009006 4B 00            [ 1] 2872 	push	#0x00
      009008 4B 00            [ 1] 2873 	push	#0x00
      00900A 4B 00            [ 1] 2874 	push	#0x00
      00900C 89               [ 2] 2875 	pushw	x
      00900D 1E 40            [ 2] 2876 	ldw	x, (0x40, sp)
      00900F 89               [ 2] 2877 	pushw	x
      009010 1E 16            [ 2] 2878 	ldw	x, (0x16, sp)
      009012 89               [ 2] 2879 	pushw	x
      009013 90 89            [ 2] 2880 	pushw	y
      009015 5F               [ 1] 2881 	clrw	x
      009016 89               [ 2] 2882 	pushw	x
      009017 5F               [ 1] 2883 	clrw	x
      009018 89               [ 2] 2884 	pushw	x
      009019 CD 8D B6         [ 4] 2885 	call	_transTime
      00901C 5B 10            [ 2] 2886 	addw	sp, #16
      00901E CF 00 19         [ 2] 2887 	ldw	_DnClock_Tim_3+2, x
      009021 90 CF 00 17      [ 2] 2888 	ldw	_DnClock_Tim_3+0, y
                                   2889 ;	clock.c: 511: while(1){
      009025                       2890 00126$:
                                   2891 ;	clock.c: 513: Soft_Timer++;
      009025 CE 00 35         [ 2] 2892 	ldw	x, _Soft_Timer+0
      009028 5C               [ 2] 2893 	incw	x
      009029 CF 00 35         [ 2] 2894 	ldw	_Soft_Timer+0, x
                                   2895 ;	clock.c: 515: if(button(ok))Meny();
      00902C 4B 06            [ 1] 2896 	push	#0x06
      00902E CD 87 46         [ 4] 2897 	call	_button
      009031 5B 01            [ 2] 2898 	addw	sp, #1
      009033 4D               [ 1] 2899 	tnz	a
      009034 27 03            [ 1] 2900 	jreq	00102$
      009036 CD 8C 34         [ 4] 2901 	call	_Meny
      009039                       2902 00102$:
                                   2903 ;	clock.c: 517: if(button(up)){
      009039 4B 05            [ 1] 2904 	push	#0x05
      00903B CD 87 46         [ 4] 2905 	call	_button
      00903E 5B 01            [ 2] 2906 	addw	sp, #1
      009040 6B 39            [ 1] 2907 	ld	(0x39, sp), a
      009042 0D 39            [ 1] 2908 	tnz	(0x39, sp)
      009044 27 39            [ 1] 2909 	jreq	00104$
                                   2910 ;	clock.c: 518: TM1637_sendMASS(0x78,0x50,0x08,ASCI[PointTimer]);
      009046 AE 00 27         [ 2] 2911 	ldw	x, #_TM1637_seg+0
      009049 1F 2F            [ 2] 2912 	ldw	(0x2f, sp), x
      00904B 1E 2F            [ 2] 2913 	ldw	x, (0x2f, sp)
      00904D A6 78            [ 1] 2914 	ld	a, #0x78
      00904F F7               [ 1] 2915 	ld	(x), a
      009050 1E 2F            [ 2] 2916 	ldw	x, (0x2f, sp)
      009052 5C               [ 2] 2917 	incw	x
      009053 A6 50            [ 1] 2918 	ld	a, #0x50
      009055 F7               [ 1] 2919 	ld	(x), a
      009056 1E 2F            [ 2] 2920 	ldw	x, (0x2f, sp)
      009058 5C               [ 2] 2921 	incw	x
      009059 5C               [ 2] 2922 	incw	x
      00905A A6 08            [ 1] 2923 	ld	a, #0x08
      00905C F7               [ 1] 2924 	ld	(x), a
      00905D 16 2F            [ 2] 2925 	ldw	y, (0x2f, sp)
      00905F 72 A9 00 03      [ 2] 2926 	addw	y, #0x0003
      009063 AE 00 2B         [ 2] 2927 	ldw	x, #_ASCI+0
      009066 9F               [ 1] 2928 	ld	a, xl
      009067 CB 00 23         [ 1] 2929 	add	a, _PointTimer+0
      00906A 02               [ 1] 2930 	rlwa	x
      00906B A9 00            [ 1] 2931 	adc	a, #0x00
      00906D 95               [ 1] 2932 	ld	xh, a
      00906E F6               [ 1] 2933 	ld	a, (x)
      00906F 90 F7            [ 1] 2934 	ld	(y), a
      009071 CD 81 D9         [ 4] 2935 	call	_TM1637_send
                                   2936 ;	clock.c: 519: delay(9000);
      009074 4B 28            [ 1] 2937 	push	#0x28
      009076 4B 23            [ 1] 2938 	push	#0x23
      009078 5F               [ 1] 2939 	clrw	x
      009079 89               [ 2] 2940 	pushw	x
      00907A CD 80 A0         [ 4] 2941 	call	_delay
      00907D 5B 04            [ 2] 2942 	addw	sp, #4
      00907F                       2943 00104$:
                                   2944 ;	clock.c: 523: if(Soft_Timer == 5000){ // Отображение времени при значении Программного таймера
      00907F CE 00 35         [ 2] 2945 	ldw	x, _Soft_Timer+0
      009082 A3 13 88         [ 2] 2946 	cpw	x, #0x1388
      009085 26 9E            [ 1] 2947 	jrne	00126$
                                   2948 ;	clock.c: 524: RTC_Read();
      009087 CD 85 7E         [ 4] 2949 	call	_RTC_Read
                                   2950 ;	clock.c: 527: timeToSec = transTime(0,hour,min,sec);
      00908A 5F               [ 1] 2951 	clrw	x
      00908B C6 00 01         [ 1] 2952 	ld	a, _sec+0
      00908E 97               [ 1] 2953 	ld	xl, a
      00908F 0F 13            [ 1] 2954 	clr	(0x13, sp)
      009091 0F 12            [ 1] 2955 	clr	(0x12, sp)
      009093 C6 00 02         [ 1] 2956 	ld	a, _min+0
      009096 6B 06            [ 1] 2957 	ld	(0x06, sp), a
      009098 0F 05            [ 1] 2958 	clr	(0x05, sp)
      00909A 90 5F            [ 1] 2959 	clrw	y
      00909C C6 00 03         [ 1] 2960 	ld	a, _hour+0
      00909F 6B 19            [ 1] 2961 	ld	(0x19, sp), a
      0090A1 0F 18            [ 1] 2962 	clr	(0x18, sp)
      0090A3 0F 17            [ 1] 2963 	clr	(0x17, sp)
      0090A5 0F 16            [ 1] 2964 	clr	(0x16, sp)
      0090A7 89               [ 2] 2965 	pushw	x
      0090A8 1E 14            [ 2] 2966 	ldw	x, (0x14, sp)
      0090AA 89               [ 2] 2967 	pushw	x
      0090AB 1E 09            [ 2] 2968 	ldw	x, (0x09, sp)
      0090AD 89               [ 2] 2969 	pushw	x
      0090AE 90 89            [ 2] 2970 	pushw	y
      0090B0 1E 20            [ 2] 2971 	ldw	x, (0x20, sp)
      0090B2 89               [ 2] 2972 	pushw	x
      0090B3 1E 20            [ 2] 2973 	ldw	x, (0x20, sp)
      0090B5 89               [ 2] 2974 	pushw	x
      0090B6 5F               [ 1] 2975 	clrw	x
      0090B7 89               [ 2] 2976 	pushw	x
      0090B8 5F               [ 1] 2977 	clrw	x
      0090B9 89               [ 2] 2978 	pushw	x
      0090BA CD 8D B6         [ 4] 2979 	call	_transTime
      0090BD 5B 10            [ 2] 2980 	addw	sp, #16
      0090BF CF 00 1D         [ 2] 2981 	ldw	_timeToSec+2, x
      0090C2 90 CF 00 1B      [ 2] 2982 	ldw	_timeToSec+0, y
                                   2983 ;	clock.c: 528: dot = !dot;
      0090C6 C6 00 08         [ 1] 2984 	ld	a, _dot+0
      0090C9 A0 01            [ 1] 2985 	sub	a, #0x01
      0090CB 4F               [ 1] 2986 	clr	a
      0090CC 49               [ 1] 2987 	rlc	a
      0090CD C7 00 08         [ 1] 2988 	ld	_dot+0, a
                                   2989 ;	clock.c: 529: PointTimer = 0x00;
      0090D0 72 5F 00 23      [ 1] 2990 	clr	_PointTimer+0
                                   2991 ;	clock.c: 532: if( timeToSec+1 > DnClock_Tim_0 & timeToSec < DnClock_Tim_1) PointTimer = 1; //От начало смены до начало обеда
      0090D4 CE 00 1D         [ 2] 2992 	ldw	x, _timeToSec+2
      0090D7 1C 00 01         [ 2] 2993 	addw	x, #0x0001
      0090DA 1F 37            [ 2] 2994 	ldw	(0x37, sp), x
      0090DC C6 00 1C         [ 1] 2995 	ld	a, _timeToSec+1
      0090DF A9 00            [ 1] 2996 	adc	a, #0x00
      0090E1 6B 36            [ 1] 2997 	ld	(0x36, sp), a
      0090E3 C6 00 1B         [ 1] 2998 	ld	a, _timeToSec+0
      0090E6 A9 00            [ 1] 2999 	adc	a, #0x00
      0090E8 6B 35            [ 1] 3000 	ld	(0x35, sp), a
      0090EA CE 00 0D         [ 2] 3001 	ldw	x, _DnClock_Tim_0+2
      0090ED 13 37            [ 2] 3002 	cpw	x, (0x37, sp)
      0090EF C6 00 0C         [ 1] 3003 	ld	a, _DnClock_Tim_0+1
      0090F2 12 36            [ 1] 3004 	sbc	a, (0x36, sp)
      0090F4 C6 00 0B         [ 1] 3005 	ld	a, _DnClock_Tim_0+0
      0090F7 12 35            [ 1] 3006 	sbc	a, (0x35, sp)
      0090F9 25 04            [ 1] 3007 	jrc	00187$
      0090FB 0F 22            [ 1] 3008 	clr	(0x22, sp)
      0090FD 20 04            [ 2] 3009 	jra	00188$
      0090FF                       3010 00187$:
      0090FF A6 01            [ 1] 3011 	ld	a, #0x01
      009101 6B 22            [ 1] 3012 	ld	(0x22, sp), a
      009103                       3013 00188$:
      009103 CE 00 1D         [ 2] 3014 	ldw	x, _timeToSec+2
      009106 C3 00 11         [ 2] 3015 	cpw	x, _DnClock_Tim_1+2
      009109 C6 00 1C         [ 1] 3016 	ld	a, _timeToSec+1
      00910C C2 00 10         [ 1] 3017 	sbc	a, _DnClock_Tim_1+1
      00910F C6 00 1B         [ 1] 3018 	ld	a, _timeToSec+0
      009112 C2 00 0F         [ 1] 3019 	sbc	a, _DnClock_Tim_1+0
      009115 25 03            [ 1] 3020 	jrc	00189$
      009117 4F               [ 1] 3021 	clr	a
      009118 20 02            [ 2] 3022 	jra	00190$
      00911A                       3023 00189$:
      00911A A6 01            [ 1] 3024 	ld	a, #0x01
      00911C                       3025 00190$:
      00911C 14 22            [ 1] 3026 	and	a, (0x22, sp)
      00911E 4D               [ 1] 3027 	tnz	a
      00911F 27 04            [ 1] 3028 	jreq	00106$
      009121 35 01 00 23      [ 1] 3029 	mov	_PointTimer+0, #0x01
      009125                       3030 00106$:
                                   3031 ;	clock.c: 534: if( timeToSec+1 > DnClock_Tim_1 & timeToSec < DnClock_Tim_2) PointTimer = 2; //от начала обеда до  конца обеда;
      009125 CE 00 11         [ 2] 3032 	ldw	x, _DnClock_Tim_1+2
      009128 13 37            [ 2] 3033 	cpw	x, (0x37, sp)
      00912A C6 00 10         [ 1] 3034 	ld	a, _DnClock_Tim_1+1
      00912D 12 36            [ 1] 3035 	sbc	a, (0x36, sp)
      00912F C6 00 0F         [ 1] 3036 	ld	a, _DnClock_Tim_1+0
      009132 12 35            [ 1] 3037 	sbc	a, (0x35, sp)
      009134 25 04            [ 1] 3038 	jrc	00192$
      009136 0F 42            [ 1] 3039 	clr	(0x42, sp)
      009138 20 04            [ 2] 3040 	jra	00193$
      00913A                       3041 00192$:
      00913A A6 01            [ 1] 3042 	ld	a, #0x01
      00913C 6B 42            [ 1] 3043 	ld	(0x42, sp), a
      00913E                       3044 00193$:
      00913E CE 00 1D         [ 2] 3045 	ldw	x, _timeToSec+2
      009141 C3 00 15         [ 2] 3046 	cpw	x, _DnClock_Tim_2+2
      009144 C6 00 1C         [ 1] 3047 	ld	a, _timeToSec+1
      009147 C2 00 14         [ 1] 3048 	sbc	a, _DnClock_Tim_2+1
      00914A C6 00 1B         [ 1] 3049 	ld	a, _timeToSec+0
      00914D C2 00 13         [ 1] 3050 	sbc	a, _DnClock_Tim_2+0
      009150 25 03            [ 1] 3051 	jrc	00194$
      009152 4F               [ 1] 3052 	clr	a
      009153 20 02            [ 2] 3053 	jra	00195$
      009155                       3054 00194$:
      009155 A6 01            [ 1] 3055 	ld	a, #0x01
      009157                       3056 00195$:
      009157 14 42            [ 1] 3057 	and	a, (0x42, sp)
      009159 4D               [ 1] 3058 	tnz	a
      00915A 27 04            [ 1] 3059 	jreq	00108$
      00915C 35 02 00 23      [ 1] 3060 	mov	_PointTimer+0, #0x02
      009160                       3061 00108$:
                                   3062 ;	clock.c: 536: if( timeToSec+1 > DnClock_Tim_2 & timeToSec < DnClock_Tim_3) PointTimer = 3; //от конца  обеда до  конца смены
      009160 CE 00 15         [ 2] 3063 	ldw	x, _DnClock_Tim_2+2
      009163 13 37            [ 2] 3064 	cpw	x, (0x37, sp)
      009165 C6 00 14         [ 1] 3065 	ld	a, _DnClock_Tim_2+1
      009168 12 36            [ 1] 3066 	sbc	a, (0x36, sp)
      00916A C6 00 13         [ 1] 3067 	ld	a, _DnClock_Tim_2+0
      00916D 12 35            [ 1] 3068 	sbc	a, (0x35, sp)
      00916F 25 04            [ 1] 3069 	jrc	00197$
      009171 0F 07            [ 1] 3070 	clr	(0x07, sp)
      009173 20 04            [ 2] 3071 	jra	00198$
      009175                       3072 00197$:
      009175 A6 01            [ 1] 3073 	ld	a, #0x01
      009177 6B 07            [ 1] 3074 	ld	(0x07, sp), a
      009179                       3075 00198$:
      009179 CE 00 1D         [ 2] 3076 	ldw	x, _timeToSec+2
      00917C C3 00 19         [ 2] 3077 	cpw	x, _DnClock_Tim_3+2
      00917F C6 00 1C         [ 1] 3078 	ld	a, _timeToSec+1
      009182 C2 00 18         [ 1] 3079 	sbc	a, _DnClock_Tim_3+1
      009185 C6 00 1B         [ 1] 3080 	ld	a, _timeToSec+0
      009188 C2 00 17         [ 1] 3081 	sbc	a, _DnClock_Tim_3+0
      00918B 25 03            [ 1] 3082 	jrc	00199$
      00918D 4F               [ 1] 3083 	clr	a
      00918E 20 02            [ 2] 3084 	jra	00200$
      009190                       3085 00199$:
      009190 A6 01            [ 1] 3086 	ld	a, #0x01
      009192                       3087 00200$:
      009192 14 07            [ 1] 3088 	and	a, (0x07, sp)
      009194 4D               [ 1] 3089 	tnz	a
      009195 27 04            [ 1] 3090 	jreq	00110$
      009197 35 03 00 23      [ 1] 3091 	mov	_PointTimer+0, #0x03
      00919B                       3092 00110$:
                                   3093 ;	clock.c: 539: switch (PointTimer) {
      00919B C6 00 23         [ 1] 3094 	ld	a, _PointTimer+0
      00919E A1 01            [ 1] 3095 	cp	a, #0x01
      0091A0 27 10            [ 1] 3096 	jreq	00111$
      0091A2 C6 00 23         [ 1] 3097 	ld	a, _PointTimer+0
      0091A5 A1 02            [ 1] 3098 	cp	a, #0x02
      0091A7 27 28            [ 1] 3099 	jreq	00112$
      0091A9 C6 00 23         [ 1] 3100 	ld	a, _PointTimer+0
      0091AC A1 03            [ 1] 3101 	cp	a, #0x03
      0091AE 27 40            [ 1] 3102 	jreq	00113$
      0091B0 20 5D            [ 2] 3103 	jra	00114$
                                   3104 ;	clock.c: 540: case 1: timeRes = DnClock_Tim_1 - timeToSec; break;
      0091B2                       3105 00111$:
      0091B2 90 CE 00 11      [ 2] 3106 	ldw	y, _DnClock_Tim_1+2
      0091B6 72 B2 00 1D      [ 2] 3107 	subw	y, _timeToSec+2
      0091BA C6 00 10         [ 1] 3108 	ld	a, _DnClock_Tim_1+1
      0091BD C2 00 1C         [ 1] 3109 	sbc	a, _timeToSec+1
      0091C0 97               [ 1] 3110 	ld	xl, a
      0091C1 C6 00 0F         [ 1] 3111 	ld	a, _DnClock_Tim_1+0
      0091C4 C2 00 1B         [ 1] 3112 	sbc	a, _timeToSec+0
      0091C7 95               [ 1] 3113 	ld	xh, a
      0091C8 90 CF 00 21      [ 2] 3114 	ldw	_timeRes+2, y
      0091CC CF 00 1F         [ 2] 3115 	ldw	_timeRes+0, x
      0091CF 20 45            [ 2] 3116 	jra	00115$
                                   3117 ;	clock.c: 541: case 2: timeRes = DnClock_Tim_2 - timeToSec; break;
      0091D1                       3118 00112$:
      0091D1 90 CE 00 15      [ 2] 3119 	ldw	y, _DnClock_Tim_2+2
      0091D5 72 B2 00 1D      [ 2] 3120 	subw	y, _timeToSec+2
      0091D9 C6 00 14         [ 1] 3121 	ld	a, _DnClock_Tim_2+1
      0091DC C2 00 1C         [ 1] 3122 	sbc	a, _timeToSec+1
      0091DF 97               [ 1] 3123 	ld	xl, a
      0091E0 C6 00 13         [ 1] 3124 	ld	a, _DnClock_Tim_2+0
      0091E3 C2 00 1B         [ 1] 3125 	sbc	a, _timeToSec+0
      0091E6 95               [ 1] 3126 	ld	xh, a
      0091E7 90 CF 00 21      [ 2] 3127 	ldw	_timeRes+2, y
      0091EB CF 00 1F         [ 2] 3128 	ldw	_timeRes+0, x
      0091EE 20 26            [ 2] 3129 	jra	00115$
                                   3130 ;	clock.c: 542: case 3: timeRes = DnClock_Tim_3 - timeToSec; break;
      0091F0                       3131 00113$:
      0091F0 90 CE 00 19      [ 2] 3132 	ldw	y, _DnClock_Tim_3+2
      0091F4 72 B2 00 1D      [ 2] 3133 	subw	y, _timeToSec+2
      0091F8 C6 00 18         [ 1] 3134 	ld	a, _DnClock_Tim_3+1
      0091FB C2 00 1C         [ 1] 3135 	sbc	a, _timeToSec+1
      0091FE 97               [ 1] 3136 	ld	xl, a
      0091FF C6 00 17         [ 1] 3137 	ld	a, _DnClock_Tim_3+0
      009202 C2 00 1B         [ 1] 3138 	sbc	a, _timeToSec+0
      009205 95               [ 1] 3139 	ld	xh, a
      009206 90 CF 00 21      [ 2] 3140 	ldw	_timeRes+2, y
      00920A CF 00 1F         [ 2] 3141 	ldw	_timeRes+0, x
      00920D 20 07            [ 2] 3142 	jra	00115$
                                   3143 ;	clock.c: 544: default: timeRes = 0; break;
      00920F                       3144 00114$:
      00920F 5F               [ 1] 3145 	clrw	x
      009210 CF 00 21         [ 2] 3146 	ldw	_timeRes+2, x
      009213 CF 00 1F         [ 2] 3147 	ldw	_timeRes+0, x
                                   3148 ;	clock.c: 545: }
      009216                       3149 00115$:
                                   3150 ;	clock.c: 550: if(timeRes>0){
      009216 CE 00 21         [ 2] 3151 	ldw	x, _timeRes+2
      009219 26 08            [ 1] 3152 	jrne	00211$
      00921B CE 00 1F         [ 2] 3153 	ldw	x, _timeRes+0
      00921E 26 03            [ 1] 3154 	jrne	00211$
      009220 CC 92 EE         [ 2] 3155 	jp	00121$
      009223                       3156 00211$:
                                   3157 ;	clock.c: 551: conSec(timeRes);
      009223 3B 00 22         [ 1] 3158 	push	_timeRes+3
      009226 3B 00 21         [ 1] 3159 	push	_timeRes+2
      009229 3B 00 20         [ 1] 3160 	push	_timeRes+1
      00922C 3B 00 1F         [ 1] 3161 	push	_timeRes+0
      00922F CD 8E 12         [ 4] 3162 	call	_conSec
      009232 5B 04            [ 2] 3163 	addw	sp, #4
                                   3164 ;	clock.c: 552: TM1637_seg[0] = ASCI[con_hour/10];
      009234 AE 00 27         [ 2] 3165 	ldw	x, #_TM1637_seg+0
      009237 1F 40            [ 2] 3166 	ldw	(0x40, sp), x
      009239 AE 00 2B         [ 2] 3167 	ldw	x, #_ASCI+0
      00923C 1F 01            [ 2] 3168 	ldw	(0x01, sp), x
      00923E 4B 0A            [ 1] 3169 	push	#0x0a
      009240 5F               [ 1] 3170 	clrw	x
      009241 89               [ 2] 3171 	pushw	x
      009242 4B 00            [ 1] 3172 	push	#0x00
      009244 3B 00 42         [ 1] 3173 	push	_con_hour+3
      009247 3B 00 41         [ 1] 3174 	push	_con_hour+2
      00924A 3B 00 40         [ 1] 3175 	push	_con_hour+1
      00924D 3B 00 3F         [ 1] 3176 	push	_con_hour+0
      009250 CD 93 FE         [ 4] 3177 	call	__divulong
      009253 5B 08            [ 2] 3178 	addw	sp, #8
      009255 72 FB 01         [ 2] 3179 	addw	x, (0x01, sp)
      009258 F6               [ 1] 3180 	ld	a, (x)
      009259 1E 40            [ 2] 3181 	ldw	x, (0x40, sp)
      00925B F7               [ 1] 3182 	ld	(x), a
                                   3183 ;	clock.c: 553: TM1637_seg[1] = ASCI[con_hour%10];
      00925C 1E 40            [ 2] 3184 	ldw	x, (0x40, sp)
      00925E 5C               [ 2] 3185 	incw	x
      00925F 1F 1A            [ 2] 3186 	ldw	(0x1a, sp), x
      009261 4B 0A            [ 1] 3187 	push	#0x0a
      009263 5F               [ 1] 3188 	clrw	x
      009264 89               [ 2] 3189 	pushw	x
      009265 4B 00            [ 1] 3190 	push	#0x00
      009267 3B 00 42         [ 1] 3191 	push	_con_hour+3
      00926A 3B 00 41         [ 1] 3192 	push	_con_hour+2
      00926D 3B 00 40         [ 1] 3193 	push	_con_hour+1
      009270 3B 00 3F         [ 1] 3194 	push	_con_hour+0
      009273 CD 93 67         [ 4] 3195 	call	__modulong
      009276 5B 08            [ 2] 3196 	addw	sp, #8
      009278 72 FB 01         [ 2] 3197 	addw	x, (0x01, sp)
      00927B F6               [ 1] 3198 	ld	a, (x)
      00927C 1E 1A            [ 2] 3199 	ldw	x, (0x1a, sp)
      00927E F7               [ 1] 3200 	ld	(x), a
                                   3201 ;	clock.c: 554: TM1637_seg[2] = ASCI[con_min/10];
      00927F 1E 40            [ 2] 3202 	ldw	x, (0x40, sp)
      009281 5C               [ 2] 3203 	incw	x
      009282 5C               [ 2] 3204 	incw	x
      009283 1F 10            [ 2] 3205 	ldw	(0x10, sp), x
      009285 4B 0A            [ 1] 3206 	push	#0x0a
      009287 5F               [ 1] 3207 	clrw	x
      009288 89               [ 2] 3208 	pushw	x
      009289 4B 00            [ 1] 3209 	push	#0x00
      00928B 3B 00 46         [ 1] 3210 	push	_con_min+3
      00928E 3B 00 45         [ 1] 3211 	push	_con_min+2
      009291 3B 00 44         [ 1] 3212 	push	_con_min+1
      009294 3B 00 43         [ 1] 3213 	push	_con_min+0
      009297 CD 93 FE         [ 4] 3214 	call	__divulong
      00929A 5B 08            [ 2] 3215 	addw	sp, #8
      00929C 72 FB 01         [ 2] 3216 	addw	x, (0x01, sp)
      00929F F6               [ 1] 3217 	ld	a, (x)
      0092A0 1E 10            [ 2] 3218 	ldw	x, (0x10, sp)
      0092A2 F7               [ 1] 3219 	ld	(x), a
                                   3220 ;	clock.c: 555: TM1637_seg[3] = ASCI[con_min%10];
      0092A3 1E 40            [ 2] 3221 	ldw	x, (0x40, sp)
      0092A5 1C 00 03         [ 2] 3222 	addw	x, #0x0003
      0092A8 1F 1C            [ 2] 3223 	ldw	(0x1c, sp), x
      0092AA 4B 0A            [ 1] 3224 	push	#0x0a
      0092AC 5F               [ 1] 3225 	clrw	x
      0092AD 89               [ 2] 3226 	pushw	x
      0092AE 4B 00            [ 1] 3227 	push	#0x00
      0092B0 3B 00 46         [ 1] 3228 	push	_con_min+3
      0092B3 3B 00 45         [ 1] 3229 	push	_con_min+2
      0092B6 3B 00 44         [ 1] 3230 	push	_con_min+1
      0092B9 3B 00 43         [ 1] 3231 	push	_con_min+0
      0092BC CD 93 67         [ 4] 3232 	call	__modulong
      0092BF 5B 08            [ 2] 3233 	addw	sp, #8
      0092C1 72 FB 01         [ 2] 3234 	addw	x, (0x01, sp)
      0092C4 F6               [ 1] 3235 	ld	a, (x)
      0092C5 1E 1C            [ 2] 3236 	ldw	x, (0x1c, sp)
      0092C7 F7               [ 1] 3237 	ld	(x), a
                                   3238 ;	clock.c: 556: if(con_hour<10)	TM1637_seg[0] =  0x00; //Отключение первого разряда если в нем 0
      0092C8 CE 00 41         [ 2] 3239 	ldw	x, _con_hour+2
      0092CB A3 00 0A         [ 2] 3240 	cpw	x, #0x000a
      0092CE C6 00 40         [ 1] 3241 	ld	a, _con_hour+1
      0092D1 A2 00            [ 1] 3242 	sbc	a, #0x00
      0092D3 C6 00 3F         [ 1] 3243 	ld	a, _con_hour+0
      0092D6 A2 00            [ 1] 3244 	sbc	a, #0x00
      0092D8 24 03            [ 1] 3245 	jrnc	00117$
      0092DA 1E 40            [ 2] 3246 	ldw	x, (0x40, sp)
      0092DC 7F               [ 1] 3247 	clr	(x)
      0092DD                       3248 00117$:
                                   3249 ;	clock.c: 557: if(dot) TM1637_seg[1] = TM1637_seg[1] + 0x80; //Включение секундных точек
      0092DD 72 00 00 08 02   [ 2] 3250 	btjt	_dot+0, #0, 00213$
      0092E2 20 27            [ 2] 3251 	jra	00122$
      0092E4                       3252 00213$:
      0092E4 1E 1A            [ 2] 3253 	ldw	x, (0x1a, sp)
      0092E6 F6               [ 1] 3254 	ld	a, (x)
      0092E7 AB 80            [ 1] 3255 	add	a, #0x80
      0092E9 1E 1A            [ 2] 3256 	ldw	x, (0x1a, sp)
      0092EB F7               [ 1] 3257 	ld	(x), a
      0092EC 20 1D            [ 2] 3258 	jra	00122$
      0092EE                       3259 00121$:
                                   3260 ;	clock.c: 560: TM1637_seg[0] = 0x40;
      0092EE AE 00 27         [ 2] 3261 	ldw	x, #_TM1637_seg+0
      0092F1 1F 3E            [ 2] 3262 	ldw	(0x3e, sp), x
      0092F3 1E 3E            [ 2] 3263 	ldw	x, (0x3e, sp)
      0092F5 A6 40            [ 1] 3264 	ld	a, #0x40
      0092F7 F7               [ 1] 3265 	ld	(x), a
                                   3266 ;	clock.c: 561: TM1637_seg[1] = 0x40;
      0092F8 1E 3E            [ 2] 3267 	ldw	x, (0x3e, sp)
      0092FA 5C               [ 2] 3268 	incw	x
      0092FB A6 40            [ 1] 3269 	ld	a, #0x40
      0092FD F7               [ 1] 3270 	ld	(x), a
                                   3271 ;	clock.c: 562: TM1637_seg[2] = 0x40;
      0092FE 1E 3E            [ 2] 3272 	ldw	x, (0x3e, sp)
      009300 5C               [ 2] 3273 	incw	x
      009301 5C               [ 2] 3274 	incw	x
      009302 A6 40            [ 1] 3275 	ld	a, #0x40
      009304 F7               [ 1] 3276 	ld	(x), a
                                   3277 ;	clock.c: 563: TM1637_seg[3] = 0x40;
      009305 1E 3E            [ 2] 3278 	ldw	x, (0x3e, sp)
      009307 A6 40            [ 1] 3279 	ld	a, #0x40
      009309 E7 03            [ 1] 3280 	ld	(0x0003, x), a
      00930B                       3281 00122$:
                                   3282 ;	clock.c: 565: TM1637_send();
      00930B CD 81 D9         [ 4] 3283 	call	_TM1637_send
                                   3284 ;	clock.c: 567: Soft_Timer = 0x00; //Сброс таймера
      00930E 5F               [ 1] 3285 	clrw	x
      00930F CF 00 35         [ 2] 3286 	ldw	_Soft_Timer+0, x
      009312 CC 90 25         [ 2] 3287 	jp	00126$
      009315 5B 42            [ 2] 3288 	addw	sp, #66
      009317 81               [ 4] 3289 	ret
                                   3290 ;	clock.c: 573: void main(){
                                   3291 ;	-----------------------------------------
                                   3292 ;	 function main
                                   3293 ;	-----------------------------------------
      009318                       3294 _main:
                                   3295 ;	clock.c: 575: PC_DDR &= ~(1<<ok) | (1<<dn) | (1<<up); //инициализация кнопок
      009318 AE 50 0C         [ 2] 3296 	ldw	x, #0x500c
      00931B F6               [ 1] 3297 	ld	a, (x)
      00931C A4 BF            [ 1] 3298 	and	a, #0xbf
      00931E F7               [ 1] 3299 	ld	(x), a
                                   3300 ;	clock.c: 579: TM1637_INIT();
      00931F AE 50 0C         [ 2] 3301 	ldw	x, #0x500c
      009322 F6               [ 1] 3302 	ld	a, (x)
      009323 AA 18            [ 1] 3303 	or	a, #0x18
      009325 F7               [ 1] 3304 	ld	(x), a
      009326 AE 50 0D         [ 2] 3305 	ldw	x, #0x500d
      009329 F6               [ 1] 3306 	ld	a, (x)
      00932A AA 18            [ 1] 3307 	or	a, #0x18
      00932C F7               [ 1] 3308 	ld	(x), a
      00932D CD 82 3F         [ 4] 3309 	call	_TM1637_initialization
                                   3310 ;	clock.c: 580: TM1637_brigh(EEPROM_DATA(setting_Brigh));
      009330 AE 40 00         [ 2] 3311 	ldw	x, #0x4000
      009333 F6               [ 1] 3312 	ld	a, (x)
      009334 88               [ 1] 3313 	push	a
      009335 CD 81 C0         [ 4] 3314 	call	_TM1637_brigh
      009338 84               [ 1] 3315 	pop	a
                                   3316 ;	clock.c: 581: I2C_INIT();
      009339 AE 50 07         [ 2] 3317 	ldw	x, #0x5007
      00933C F6               [ 1] 3318 	ld	a, (x)
      00933D AA 30            [ 1] 3319 	or	a, #0x30
      00933F F7               [ 1] 3320 	ld	(x), a
      009340 AE 50 08         [ 2] 3321 	ldw	x, #0x5008
      009343 F6               [ 1] 3322 	ld	a, (x)
      009344 AA 30            [ 1] 3323 	or	a, #0x30
      009346 F7               [ 1] 3324 	ld	(x), a
      009347 CD 83 9F         [ 4] 3325 	call	_i2c_init
                                   3326 ;	clock.c: 583: if(button(up) || button(dn))hard_Reset();
      00934A 4B 05            [ 1] 3327 	push	#0x05
      00934C CD 87 46         [ 4] 3328 	call	_button
      00934F 5B 01            [ 2] 3329 	addw	sp, #1
      009351 4D               [ 1] 3330 	tnz	a
      009352 26 0A            [ 1] 3331 	jrne	00101$
      009354 4B 07            [ 1] 3332 	push	#0x07
      009356 CD 87 46         [ 4] 3333 	call	_button
      009359 5B 01            [ 2] 3334 	addw	sp, #1
      00935B 4D               [ 1] 3335 	tnz	a
      00935C 27 03            [ 1] 3336 	jreq	00105$
      00935E                       3337 00101$:
      00935E CD 86 CC         [ 4] 3338 	call	_hard_Reset
                                   3339 ;	clock.c: 590: while(1){
      009361                       3340 00105$:
                                   3341 ;	clock.c: 593: dnClock();
      009361 CD 8F 0C         [ 4] 3342 	call	_dnClock
      009364 20 FB            [ 2] 3343 	jra	00105$
      009366 81               [ 4] 3344 	ret
                                   3345 	.area CODE
                                   3346 	.area INITIALIZER
      0094DF                       3347 __xinit__brigh:
      0094DF 07                    3348 	.db #0x07	; 7
      0094E0                       3349 __xinit__command1:
      0094E0 40                    3350 	.db #0x40	; 64
      0094E1                       3351 __xinit__command2:
      0094E1 C0                    3352 	.db #0xC0	; 192
      0094E2                       3353 __xinit__TM1637_seg:
      0094E2 FF                    3354 	.db #0xFF	; 255
      0094E3 FF                    3355 	.db #0xFF	; 255
      0094E4 FF                    3356 	.db #0xFF	; 255
      0094E5 FF                    3357 	.db #0xFF	; 255
      0094E6                       3358 __xinit__ASCI:
      0094E6 3F                    3359 	.db #0x3F	; 63
      0094E7 06                    3360 	.db #0x06	; 6
      0094E8 5B                    3361 	.db #0x5B	; 91
      0094E9 4F                    3362 	.db #0x4F	; 79	'O'
      0094EA 66                    3363 	.db #0x66	; 102	'f'
      0094EB 6D                    3364 	.db #0x6D	; 109	'm'
      0094EC 7D                    3365 	.db #0x7D	; 125
      0094ED 07                    3366 	.db #0x07	; 7
      0094EE 7F                    3367 	.db #0x7F	; 127
      0094EF 6F                    3368 	.db #0x6F	; 111	'o'
      0094F0                       3369 __xinit__Soft_Timer:
      0094F0 00 00                 3370 	.dw #0x0000
      0094F2                       3371 __xinit__Point_Meny:
      0094F2 00 00                 3372 	.dw #0x0000
      0094F4                       3373 __xinit__But_Buff:
      0094F4 FF                    3374 	.db #0xFF	; 255
      0094F5                       3375 __xinit__auto_exit:
      0094F5 00                    3376 	.db #0x00	; 0
      0094F6                       3377 __xinit__con_day:
      0094F6 00 00 00 00           3378 	.byte #0x00,#0x00,#0x00,#0x00	; 0
      0094FA                       3379 __xinit__con_hour:
      0094FA 00 00 00 00           3380 	.byte #0x00,#0x00,#0x00,#0x00	; 0
      0094FE                       3381 __xinit__con_min:
      0094FE 00 00 00 00           3382 	.byte #0x00,#0x00,#0x00,#0x00	; 0
      009502                       3383 __xinit__con_sec:
      009502 00 00 00 00           3384 	.byte #0x00,#0x00,#0x00,#0x00	; 0
      009506                       3385 __xinit__cl_hour:
      009506 00 00 00 17           3386 	.byte #0x00,#0x00,#0x00,#0x17	; 23
      00950A                       3387 __xinit__cl_min:
      00950A 00 00 00 3A           3388 	.byte #0x00,#0x00,#0x00,#0x3A	; 58
      00950E                       3389 __xinit__cl_sec:
      00950E 00 00 00 3B           3390 	.byte #0x00,#0x00,#0x00,#0x3B	; 59
      009512                       3391 __xinit__con1_sec:
      009512 00 00 0E 10           3392 	.byte #0x00,#0x00,#0x0E,#0x10	; 3600
      009516                       3393 __xinit__clockTemp1:
      009516 00 00 00 00           3394 	.byte #0x00,#0x00,#0x00,#0x00	; 0
      00951A                       3395 __xinit__clockTemp2:
      00951A 00 00 00 00           3396 	.byte #0x00,#0x00,#0x00,#0x00	; 0
      00951E                       3397 __xinit__clockTemp3:
      00951E 00 00 00 00           3398 	.byte #0x00,#0x00,#0x00,#0x00	; 0
                                   3399 	.area CABS (ABS)
