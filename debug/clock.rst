                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
                                      4 ; This file was generated Sat Nov  7 00:47:04 2020
                                      5 ;--------------------------------------------------------
                                      6 	.module clock
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _main
                                     13 	.globl _EEPROM_UNLOCK
                                     14 	.globl _transTime
                                     15 	.globl _conSec
                                     16 	.globl _RTC_Set
                                     17 	.globl _RTC_Read
                                     18 	.globl _i2c_read_byte
                                     19 	.globl _i2c_send_byte
                                     20 	.globl _i2c_init
                                     21 	.globl _i2c_restart
                                     22 	.globl _i2c_start
                                     23 	.globl _i2c_stop
                                     24 	.globl _TM1637_cleer
                                     25 	.globl _TM1637_send
                                     26 	.globl _TM1637_brigh
                                     27 	.globl _TM1637_initialization
                                     28 	.globl _buff
                                     29 	.globl _auto_exit
                                     30 	.globl _Buff_But
                                     31 	.globl _Point_Meny
                                     32 	.globl _Soft_Timer
                                     33 	.globl _con_sec
                                     34 	.globl _con_min
                                     35 	.globl _con_hour
                                     36 	.globl _con_day
                                     37 	.globl _ASCI
                                     38 	.globl _TM1637_seg
                                     39 	.globl _command2
                                     40 	.globl _command1
                                     41 	.globl _brigh
                                     42 	.globl _PointTimer
                                     43 	.globl _timeRes
                                     44 	.globl _timeToSec
                                     45 	.globl _DnClock_Tim_3
                                     46 	.globl _DnClock_Tim_2
                                     47 	.globl _DnClock_Tim_1
                                     48 	.globl _DnClock_Tim_0
                                     49 	.globl _Clock_Temp
                                     50 	.globl _dot
                                     51 	.globl _year
                                     52 	.globl _month
                                     53 	.globl _date
                                     54 	.globl _day
                                     55 	.globl _hour
                                     56 	.globl _min
                                     57 	.globl _sec
                                     58 	.globl _defStart
                                     59 	.globl _setStat
                                     60 	.globl _button
                                     61 	.globl _hard_Reset
                                     62 	.globl _Set_time
                                     63 	.globl _Set_Brigh
                                     64 	.globl _Set_DnTimer
                                     65 	.globl _Set_Meny
                                     66 	.globl _Meny
                                     67 	.globl _clock
                                     68 	.globl _dnClock
                                     69 ;--------------------------------------------------------
                                     70 ; ram data
                                     71 ;--------------------------------------------------------
                                     72 	.area DATA
      000001                         73 _sec::
      000001                         74 	.ds 1
      000002                         75 _min::
      000002                         76 	.ds 1
      000003                         77 _hour::
      000003                         78 	.ds 1
      000004                         79 _day::
      000004                         80 	.ds 1
      000005                         81 _date::
      000005                         82 	.ds 1
      000006                         83 _month::
      000006                         84 	.ds 1
      000007                         85 _year::
      000007                         86 	.ds 1
      000008                         87 _dot::
      000008                         88 	.ds 1
      000009                         89 _Clock_Temp::
      000009                         90 	.ds 2
      00000B                         91 _DnClock_Tim_0::
      00000B                         92 	.ds 4
      00000F                         93 _DnClock_Tim_1::
      00000F                         94 	.ds 4
      000013                         95 _DnClock_Tim_2::
      000013                         96 	.ds 4
      000017                         97 _DnClock_Tim_3::
      000017                         98 	.ds 4
      00001B                         99 _timeToSec::
      00001B                        100 	.ds 4
      00001F                        101 _timeRes::
      00001F                        102 	.ds 4
      000023                        103 _PointTimer::
      000023                        104 	.ds 1
                                    105 ;--------------------------------------------------------
                                    106 ; ram data
                                    107 ;--------------------------------------------------------
                                    108 	.area INITIALIZED
      000024                        109 _brigh::
      000024                        110 	.ds 1
      000025                        111 _command1::
      000025                        112 	.ds 1
      000026                        113 _command2::
      000026                        114 	.ds 1
      000027                        115 _TM1637_seg::
      000027                        116 	.ds 4
      00002B                        117 _ASCI::
      00002B                        118 	.ds 10
      000035                        119 _con_day::
      000035                        120 	.ds 4
      000039                        121 _con_hour::
      000039                        122 	.ds 4
      00003D                        123 _con_min::
      00003D                        124 	.ds 4
      000041                        125 _con_sec::
      000041                        126 	.ds 4
      000045                        127 _Soft_Timer::
      000045                        128 	.ds 2
      000047                        129 _Point_Meny::
      000047                        130 	.ds 2
      000049                        131 _Buff_But::
      000049                        132 	.ds 1
      00004A                        133 _auto_exit::
      00004A                        134 	.ds 1
      00004B                        135 _buff::
      00004B                        136 	.ds 1
                                    137 ;--------------------------------------------------------
                                    138 ; Stack segment in internal ram 
                                    139 ;--------------------------------------------------------
                                    140 	.area	SSEG
      00004C                        141 __start__stack:
      00004C                        142 	.ds	1
                                    143 
                                    144 ;--------------------------------------------------------
                                    145 ; absolute external ram data
                                    146 ;--------------------------------------------------------
                                    147 	.area DABS (ABS)
                                    148 ;--------------------------------------------------------
                                    149 ; interrupt vector 
                                    150 ;--------------------------------------------------------
                                    151 	.area HOME
      008000                        152 __interrupt_vect:
      008000 82 00 80 83            153 	int s_GSINIT ;reset
      008004 82 00 00 00            154 	int 0x0000 ;trap
      008008 82 00 00 00            155 	int 0x0000 ;int0
      00800C 82 00 00 00            156 	int 0x0000 ;int1
      008010 82 00 00 00            157 	int 0x0000 ;int2
      008014 82 00 00 00            158 	int 0x0000 ;int3
      008018 82 00 00 00            159 	int 0x0000 ;int4
      00801C 82 00 00 00            160 	int 0x0000 ;int5
      008020 82 00 00 00            161 	int 0x0000 ;int6
      008024 82 00 00 00            162 	int 0x0000 ;int7
      008028 82 00 00 00            163 	int 0x0000 ;int8
      00802C 82 00 00 00            164 	int 0x0000 ;int9
      008030 82 00 00 00            165 	int 0x0000 ;int10
      008034 82 00 00 00            166 	int 0x0000 ;int11
      008038 82 00 00 00            167 	int 0x0000 ;int12
      00803C 82 00 00 00            168 	int 0x0000 ;int13
      008040 82 00 00 00            169 	int 0x0000 ;int14
      008044 82 00 00 00            170 	int 0x0000 ;int15
      008048 82 00 00 00            171 	int 0x0000 ;int16
      00804C 82 00 00 00            172 	int 0x0000 ;int17
      008050 82 00 00 00            173 	int 0x0000 ;int18
      008054 82 00 00 00            174 	int 0x0000 ;int19
      008058 82 00 00 00            175 	int 0x0000 ;int20
      00805C 82 00 00 00            176 	int 0x0000 ;int21
      008060 82 00 00 00            177 	int 0x0000 ;int22
      008064 82 00 00 00            178 	int 0x0000 ;int23
      008068 82 00 00 00            179 	int 0x0000 ;int24
      00806C 82 00 00 00            180 	int 0x0000 ;int25
      008070 82 00 00 00            181 	int 0x0000 ;int26
      008074 82 00 00 00            182 	int 0x0000 ;int27
      008078 82 00 00 00            183 	int 0x0000 ;int28
      00807C 82 00 00 00            184 	int 0x0000 ;int29
                                    185 ;--------------------------------------------------------
                                    186 ; global & static initialisations
                                    187 ;--------------------------------------------------------
                                    188 	.area HOME
                                    189 	.area GSINIT
                                    190 	.area GSFINAL
                                    191 	.area GSINIT
      008083                        192 __sdcc_gs_init_startup:
      008083                        193 __sdcc_init_data:
                                    194 ; stm8_genXINIT() start
      008083 AE 00 23         [ 2]  195 	ldw x, #l_DATA
      008086 27 07            [ 1]  196 	jreq	00002$
      008088                        197 00001$:
      008088 72 4F 00 00      [ 1]  198 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  199 	decw x
      00808D 26 F9            [ 1]  200 	jrne	00001$
      00808F                        201 00002$:
      00808F AE 00 28         [ 2]  202 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  203 	jreq	00004$
      008094                        204 00003$:
      008094 D6 95 E4         [ 1]  205 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 23         [ 1]  206 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  207 	decw	x
      00809B 26 F7            [ 1]  208 	jrne	00003$
      00809D                        209 00004$:
                                    210 ; stm8_genXINIT() end
                                    211 	.area GSFINAL
      00809D CC 80 80         [ 2]  212 	jp	__sdcc_program_startup
                                    213 ;--------------------------------------------------------
                                    214 ; Home
                                    215 ;--------------------------------------------------------
                                    216 	.area HOME
                                    217 	.area HOME
      008080                        218 __sdcc_program_startup:
      008080 CC 88 B9         [ 2]  219 	jp	_main
                                    220 ;	return from main will return to caller
                                    221 ;--------------------------------------------------------
                                    222 ; code
                                    223 ;--------------------------------------------------------
                                    224 	.area CODE
                                    225 ;	lib/stm8.h: 4: static void delay(unsigned long t)
                                    226 ;	-----------------------------------------
                                    227 ;	 function delay
                                    228 ;	-----------------------------------------
      0080A0                        229 _delay:
      0080A0 52 08            [ 2]  230 	sub	sp, #8
                                    231 ;	lib/stm8.h: 6: while(t--){
      0080A2 16 0B            [ 2]  232 	ldw	y, (0x0b, sp)
      0080A4 17 01            [ 2]  233 	ldw	(0x01, sp), y
      0080A6 1E 0D            [ 2]  234 	ldw	x, (0x0d, sp)
      0080A8                        235 00101$:
      0080A8 41               [ 1]  236 	exg	a, xl
      0080A9 6B 08            [ 1]  237 	ld	(0x08, sp), a
      0080AB 41               [ 1]  238 	exg	a, xl
      0080AC 16 01            [ 2]  239 	ldw	y, (0x01, sp)
      0080AE 17 05            [ 2]  240 	ldw	(0x05, sp), y
      0080B0 9E               [ 1]  241 	ld	a, xh
      0080B1 1D 00 01         [ 2]  242 	subw	x, #0x0001
      0080B4 88               [ 1]  243 	push	a
      0080B5 7B 03            [ 1]  244 	ld	a, (0x03, sp)
      0080B7 A2 00            [ 1]  245 	sbc	a, #0x00
      0080B9 6B 03            [ 1]  246 	ld	(0x03, sp), a
      0080BB 7B 02            [ 1]  247 	ld	a, (0x02, sp)
      0080BD A2 00            [ 1]  248 	sbc	a, #0x00
      0080BF 6B 02            [ 1]  249 	ld	(0x02, sp), a
      0080C1 84               [ 1]  250 	pop	a
      0080C2 0D 08            [ 1]  251 	tnz	(0x08, sp)
      0080C4 26 07            [ 1]  252 	jrne	00115$
      0080C6 4D               [ 1]  253 	tnz	a
      0080C7 26 04            [ 1]  254 	jrne	00115$
      0080C9 16 05            [ 2]  255 	ldw	y, (0x05, sp)
      0080CB 27 04            [ 1]  256 	jreq	00104$
      0080CD                        257 00115$:
                                    258 ;	lib/stm8.h: 10: __endasm;
      0080CD 9D               [ 1]  259 	nop
      0080CE 9D               [ 1]  260 	nop
      0080CF 20 D7            [ 2]  261 	jra	00101$
      0080D1                        262 00104$:
      0080D1 5B 08            [ 2]  263 	addw	sp, #8
      0080D3 81               [ 4]  264 	ret
                                    265 ;	lib/TM1637.c: 27: void TM1637_start(){
                                    266 ;	-----------------------------------------
                                    267 ;	 function TM1637_start
                                    268 ;	-----------------------------------------
      0080D4                        269 _TM1637_start:
                                    270 ;	lib/TM1637.c: 28: TM1637_ODR |= 1<<TM1637_SCL;
      0080D4 AE 50 0A         [ 2]  271 	ldw	x, #0x500a
      0080D7 F6               [ 1]  272 	ld	a, (x)
      0080D8 AA 08            [ 1]  273 	or	a, #0x08
      0080DA F7               [ 1]  274 	ld	(x), a
                                    275 ;	lib/TM1637.c: 29: TM1637_ODR |= 1<<TM1637_SDA;
      0080DB AE 50 0A         [ 2]  276 	ldw	x, #0x500a
      0080DE F6               [ 1]  277 	ld	a, (x)
      0080DF AA 10            [ 1]  278 	or	a, #0x10
      0080E1 F7               [ 1]  279 	ld	(x), a
                                    280 ;	lib/TM1637.c: 30: TM1637_DELAY();
      0080E2 4B 05            [ 1]  281 	push	#0x05
      0080E4 5F               [ 1]  282 	clrw	x
      0080E5 89               [ 2]  283 	pushw	x
      0080E6 4B 00            [ 1]  284 	push	#0x00
      0080E8 CD 80 A0         [ 4]  285 	call	_delay
      0080EB 5B 04            [ 2]  286 	addw	sp, #4
                                    287 ;	lib/TM1637.c: 31: TM1637_ODR &= ~(1<<TM1637_SDA);
      0080ED AE 50 0A         [ 2]  288 	ldw	x, #0x500a
      0080F0 F6               [ 1]  289 	ld	a, (x)
      0080F1 A4 EF            [ 1]  290 	and	a, #0xef
      0080F3 F7               [ 1]  291 	ld	(x), a
      0080F4 81               [ 4]  292 	ret
                                    293 ;	lib/TM1637.c: 34: void TM1637_stop(){
                                    294 ;	-----------------------------------------
                                    295 ;	 function TM1637_stop
                                    296 ;	-----------------------------------------
      0080F5                        297 _TM1637_stop:
                                    298 ;	lib/TM1637.c: 35: TM1637_ODR &= ~(1<<TM1637_SCL);
      0080F5 AE 50 0A         [ 2]  299 	ldw	x, #0x500a
      0080F8 F6               [ 1]  300 	ld	a, (x)
      0080F9 A4 F7            [ 1]  301 	and	a, #0xf7
      0080FB F7               [ 1]  302 	ld	(x), a
                                    303 ;	lib/TM1637.c: 36: TM1637_DELAY();
      0080FC 4B 05            [ 1]  304 	push	#0x05
      0080FE 5F               [ 1]  305 	clrw	x
      0080FF 89               [ 2]  306 	pushw	x
      008100 4B 00            [ 1]  307 	push	#0x00
      008102 CD 80 A0         [ 4]  308 	call	_delay
      008105 5B 04            [ 2]  309 	addw	sp, #4
                                    310 ;	lib/TM1637.c: 37: TM1637_ODR &= ~(1<<TM1637_SDA);
      008107 AE 50 0A         [ 2]  311 	ldw	x, #0x500a
      00810A F6               [ 1]  312 	ld	a, (x)
      00810B A4 EF            [ 1]  313 	and	a, #0xef
      00810D F7               [ 1]  314 	ld	(x), a
                                    315 ;	lib/TM1637.c: 38: TM1637_DELAY();
      00810E 4B 05            [ 1]  316 	push	#0x05
      008110 5F               [ 1]  317 	clrw	x
      008111 89               [ 2]  318 	pushw	x
      008112 4B 00            [ 1]  319 	push	#0x00
      008114 CD 80 A0         [ 4]  320 	call	_delay
      008117 5B 04            [ 2]  321 	addw	sp, #4
                                    322 ;	lib/TM1637.c: 39: TM1637_ODR |= 1<<TM1637_SCL;;
      008119 AE 50 0A         [ 2]  323 	ldw	x, #0x500a
      00811C F6               [ 1]  324 	ld	a, (x)
      00811D AA 08            [ 1]  325 	or	a, #0x08
      00811F F7               [ 1]  326 	ld	(x), a
                                    327 ;	lib/TM1637.c: 40: TM1637_DELAY();
      008120 4B 05            [ 1]  328 	push	#0x05
      008122 5F               [ 1]  329 	clrw	x
      008123 89               [ 2]  330 	pushw	x
      008124 4B 00            [ 1]  331 	push	#0x00
      008126 CD 80 A0         [ 4]  332 	call	_delay
      008129 5B 04            [ 2]  333 	addw	sp, #4
                                    334 ;	lib/TM1637.c: 41: TM1637_ODR |= 1<<TM1637_SDA;
      00812B AE 50 0A         [ 2]  335 	ldw	x, #0x500a
      00812E F6               [ 1]  336 	ld	a, (x)
      00812F AA 10            [ 1]  337 	or	a, #0x10
      008131 F7               [ 1]  338 	ld	(x), a
      008132 81               [ 4]  339 	ret
                                    340 ;	lib/TM1637.c: 45: void TM1637_writeByte(char pack){
                                    341 ;	-----------------------------------------
                                    342 ;	 function TM1637_writeByte
                                    343 ;	-----------------------------------------
      008133                        344 _TM1637_writeByte:
      008133 88               [ 1]  345 	push	a
                                    346 ;	lib/TM1637.c: 48: for(i=0;i<8;i++)  
      008134 0F 01            [ 1]  347 	clr	(0x01, sp)
      008136                        348 00108$:
                                    349 ;	lib/TM1637.c: 50: TM1637_ODR &= ~(1<<TM1637_SCL);
      008136 AE 50 0A         [ 2]  350 	ldw	x, #0x500a
      008139 F6               [ 1]  351 	ld	a, (x)
      00813A A4 F7            [ 1]  352 	and	a, #0xf7
      00813C F7               [ 1]  353 	ld	(x), a
      00813D AE 50 0A         [ 2]  354 	ldw	x, #0x500a
      008140 F6               [ 1]  355 	ld	a, (x)
                                    356 ;	lib/TM1637.c: 51: if(pack & 0x01)
      008141 88               [ 1]  357 	push	a
      008142 7B 05            [ 1]  358 	ld	a, (0x05, sp)
      008144 44               [ 1]  359 	srl	a
      008145 84               [ 1]  360 	pop	a
      008146 24 08            [ 1]  361 	jrnc	00102$
                                    362 ;	lib/TM1637.c: 52: { TM1637_ODR |= 1<<TM1637_SDA;}
      008148 AA 10            [ 1]  363 	or	a, #0x10
      00814A AE 50 0A         [ 2]  364 	ldw	x, #0x500a
      00814D F7               [ 1]  365 	ld	(x), a
      00814E 20 06            [ 2]  366 	jra	00103$
      008150                        367 00102$:
                                    368 ;	lib/TM1637.c: 53: else {TM1637_ODR &= ~(1<<TM1637_SDA);}
      008150 A4 EF            [ 1]  369 	and	a, #0xef
      008152 AE 50 0A         [ 2]  370 	ldw	x, #0x500a
      008155 F7               [ 1]  371 	ld	(x), a
      008156                        372 00103$:
                                    373 ;	lib/TM1637.c: 54: TM1637_DELAY();
      008156 4B 05            [ 1]  374 	push	#0x05
      008158 5F               [ 1]  375 	clrw	x
      008159 89               [ 2]  376 	pushw	x
      00815A 4B 00            [ 1]  377 	push	#0x00
      00815C CD 80 A0         [ 4]  378 	call	_delay
      00815F 5B 04            [ 2]  379 	addw	sp, #4
                                    380 ;	lib/TM1637.c: 55: pack = pack >> 1;
      008161 07 04            [ 1]  381 	sra	(0x04, sp)
                                    382 ;	lib/TM1637.c: 56: TM1637_ODR |= 1<<TM1637_SCL;
      008163 AE 50 0A         [ 2]  383 	ldw	x, #0x500a
      008166 F6               [ 1]  384 	ld	a, (x)
      008167 AA 08            [ 1]  385 	or	a, #0x08
      008169 F7               [ 1]  386 	ld	(x), a
                                    387 ;	lib/TM1637.c: 57: TM1637_DELAY();
      00816A 4B 05            [ 1]  388 	push	#0x05
      00816C 5F               [ 1]  389 	clrw	x
      00816D 89               [ 2]  390 	pushw	x
      00816E 4B 00            [ 1]  391 	push	#0x00
      008170 CD 80 A0         [ 4]  392 	call	_delay
      008173 5B 04            [ 2]  393 	addw	sp, #4
                                    394 ;	lib/TM1637.c: 48: for(i=0;i<8;i++)  
      008175 0C 01            [ 1]  395 	inc	(0x01, sp)
      008177 7B 01            [ 1]  396 	ld	a, (0x01, sp)
      008179 A1 08            [ 1]  397 	cp	a, #0x08
      00817B 2F B9            [ 1]  398 	jrslt	00108$
                                    399 ;	lib/TM1637.c: 59: TM1637_ODR &= ~(1<<TM1637_SCL);
      00817D AE 50 0A         [ 2]  400 	ldw	x, #0x500a
      008180 F6               [ 1]  401 	ld	a, (x)
      008181 A4 F7            [ 1]  402 	and	a, #0xf7
      008183 F7               [ 1]  403 	ld	(x), a
                                    404 ;	lib/TM1637.c: 60: TM1637_DELAY();
      008184 4B 05            [ 1]  405 	push	#0x05
      008186 5F               [ 1]  406 	clrw	x
      008187 89               [ 2]  407 	pushw	x
      008188 4B 00            [ 1]  408 	push	#0x00
      00818A CD 80 A0         [ 4]  409 	call	_delay
      00818D 5B 04            [ 2]  410 	addw	sp, #4
                                    411 ;	lib/TM1637.c: 61: TM1637_DDR &= ~(1<<TM1637_SDA);
      00818F AE 50 0C         [ 2]  412 	ldw	x, #0x500c
      008192 F6               [ 1]  413 	ld	a, (x)
      008193 A4 EF            [ 1]  414 	and	a, #0xef
      008195 F7               [ 1]  415 	ld	(x), a
                                    416 ;	lib/TM1637.c: 62: while((TM1637_IDR & (1<<TM1637_SDA)));
      008196                        417 00105$:
      008196 AE 50 0B         [ 2]  418 	ldw	x, #0x500b
      008199 F6               [ 1]  419 	ld	a, (x)
      00819A A5 10            [ 1]  420 	bcp	a, #0x10
      00819C 26 F8            [ 1]  421 	jrne	00105$
                                    422 ;	lib/TM1637.c: 63: TM1637_DDR |= (1<<TM1637_SDA);
      00819E AE 50 0C         [ 2]  423 	ldw	x, #0x500c
      0081A1 F6               [ 1]  424 	ld	a, (x)
      0081A2 AA 10            [ 1]  425 	or	a, #0x10
      0081A4 F7               [ 1]  426 	ld	(x), a
                                    427 ;	lib/TM1637.c: 64: TM1637_ODR |= 1<<TM1637_SCL;
      0081A5 AE 50 0A         [ 2]  428 	ldw	x, #0x500a
      0081A8 F6               [ 1]  429 	ld	a, (x)
      0081A9 AA 08            [ 1]  430 	or	a, #0x08
      0081AB F7               [ 1]  431 	ld	(x), a
                                    432 ;	lib/TM1637.c: 65: TM1637_DELAY();
      0081AC 4B 05            [ 1]  433 	push	#0x05
      0081AE 5F               [ 1]  434 	clrw	x
      0081AF 89               [ 2]  435 	pushw	x
      0081B0 4B 00            [ 1]  436 	push	#0x00
      0081B2 CD 80 A0         [ 4]  437 	call	_delay
      0081B5 5B 04            [ 2]  438 	addw	sp, #4
                                    439 ;	lib/TM1637.c: 66: TM1637_ODR &= ~(1<<TM1637_SCL);
      0081B7 AE 50 0A         [ 2]  440 	ldw	x, #0x500a
      0081BA F6               [ 1]  441 	ld	a, (x)
      0081BB A4 F7            [ 1]  442 	and	a, #0xf7
      0081BD F7               [ 1]  443 	ld	(x), a
      0081BE 84               [ 1]  444 	pop	a
      0081BF 81               [ 4]  445 	ret
                                    446 ;	lib/TM1637.c: 70: void TM1637_brigh(char brigh){
                                    447 ;	-----------------------------------------
                                    448 ;	 function TM1637_brigh
                                    449 ;	-----------------------------------------
      0081C0                        450 _TM1637_brigh:
                                    451 ;	lib/TM1637.c: 71: if(brigh>7)brigh = 7;
      0081C0 7B 03            [ 1]  452 	ld	a, (0x03, sp)
      0081C2 A1 07            [ 1]  453 	cp	a, #0x07
      0081C4 2D 04            [ 1]  454 	jrsle	00102$
      0081C6 A6 07            [ 1]  455 	ld	a, #0x07
      0081C8 6B 03            [ 1]  456 	ld	(0x03, sp), a
      0081CA                        457 00102$:
                                    458 ;	lib/TM1637.c: 73: TM1637_start();
      0081CA CD 80 D4         [ 4]  459 	call	_TM1637_start
                                    460 ;	lib/TM1637.c: 74: TM1637_writeByte(0x88 + brigh); //Команда, задающая яркость дисплея
      0081CD 7B 03            [ 1]  461 	ld	a, (0x03, sp)
      0081CF AB 88            [ 1]  462 	add	a, #0x88
      0081D1 88               [ 1]  463 	push	a
      0081D2 CD 81 33         [ 4]  464 	call	_TM1637_writeByte
      0081D5 84               [ 1]  465 	pop	a
                                    466 ;	lib/TM1637.c: 75: TM1637_stop();
      0081D6 CC 80 F5         [ 2]  467 	jp	_TM1637_stop
                                    468 ;	lib/TM1637.c: 78: void TM1637_send(){
                                    469 ;	-----------------------------------------
                                    470 ;	 function TM1637_send
                                    471 ;	-----------------------------------------
      0081D9                        472 _TM1637_send:
      0081D9 52 02            [ 2]  473 	sub	sp, #2
                                    474 ;	lib/TM1637.c: 80: TM1637_start();                  
      0081DB CD 80 D4         [ 4]  475 	call	_TM1637_start
                                    476 ;	lib/TM1637.c: 81: TM1637_writeByte(command1);			//Команда записи в регистр дисплея
      0081DE 3B 00 25         [ 1]  477 	push	_command1+0
      0081E1 CD 81 33         [ 4]  478 	call	_TM1637_writeByte
      0081E4 84               [ 1]  479 	pop	a
                                    480 ;	lib/TM1637.c: 82: TM1637_stop();
      0081E5 CD 80 F5         [ 4]  481 	call	_TM1637_stop
                                    482 ;	lib/TM1637.c: 84: TM1637_start();
      0081E8 CD 80 D4         [ 4]  483 	call	_TM1637_start
                                    484 ;	lib/TM1637.c: 85: TM1637_writeByte(command2); //Команда начального адреса для автоинкремента адреса
      0081EB 3B 00 26         [ 1]  485 	push	_command2+0
      0081EE CD 81 33         [ 4]  486 	call	_TM1637_writeByte
      0081F1 84               [ 1]  487 	pop	a
                                    488 ;	lib/TM1637.c: 87: TM1637_writeByte(TM1637_seg[0]);
      0081F2 AE 00 27         [ 2]  489 	ldw	x, #_TM1637_seg+0
      0081F5 1F 01            [ 2]  490 	ldw	(0x01, sp), x
      0081F7 1E 01            [ 2]  491 	ldw	x, (0x01, sp)
      0081F9 F6               [ 1]  492 	ld	a, (x)
      0081FA 88               [ 1]  493 	push	a
      0081FB CD 81 33         [ 4]  494 	call	_TM1637_writeByte
      0081FE 84               [ 1]  495 	pop	a
                                    496 ;	lib/TM1637.c: 88: TM1637_writeByte(TM1637_seg[1]);
      0081FF 1E 01            [ 2]  497 	ldw	x, (0x01, sp)
      008201 E6 01            [ 1]  498 	ld	a, (0x1, x)
      008203 88               [ 1]  499 	push	a
      008204 CD 81 33         [ 4]  500 	call	_TM1637_writeByte
      008207 84               [ 1]  501 	pop	a
                                    502 ;	lib/TM1637.c: 89: TM1637_writeByte(TM1637_seg[2]);
      008208 1E 01            [ 2]  503 	ldw	x, (0x01, sp)
      00820A E6 02            [ 1]  504 	ld	a, (0x2, x)
      00820C 88               [ 1]  505 	push	a
      00820D CD 81 33         [ 4]  506 	call	_TM1637_writeByte
      008210 84               [ 1]  507 	pop	a
                                    508 ;	lib/TM1637.c: 90: TM1637_writeByte(TM1637_seg[3]);
      008211 1E 01            [ 2]  509 	ldw	x, (0x01, sp)
      008213 E6 03            [ 1]  510 	ld	a, (0x3, x)
      008215 88               [ 1]  511 	push	a
      008216 CD 81 33         [ 4]  512 	call	_TM1637_writeByte
      008219 84               [ 1]  513 	pop	a
                                    514 ;	lib/TM1637.c: 92: TM1637_stop();
      00821A CD 80 F5         [ 4]  515 	call	_TM1637_stop
      00821D 5B 02            [ 2]  516 	addw	sp, #2
      00821F 81               [ 4]  517 	ret
                                    518 ;	lib/TM1637.c: 95: void TM1637_cleer(){
                                    519 ;	-----------------------------------------
                                    520 ;	 function TM1637_cleer
                                    521 ;	-----------------------------------------
      008220                        522 _TM1637_cleer:
      008220 52 02            [ 2]  523 	sub	sp, #2
                                    524 ;	lib/TM1637.c: 96: TM1637_seg[0] = 0x00;
      008222 AE 00 27         [ 2]  525 	ldw	x, #_TM1637_seg+0
      008225 1F 01            [ 2]  526 	ldw	(0x01, sp), x
      008227 1E 01            [ 2]  527 	ldw	x, (0x01, sp)
      008229 7F               [ 1]  528 	clr	(x)
                                    529 ;	lib/TM1637.c: 97: TM1637_seg[1] = 0x00;
      00822A 1E 01            [ 2]  530 	ldw	x, (0x01, sp)
      00822C 5C               [ 2]  531 	incw	x
      00822D 7F               [ 1]  532 	clr	(x)
                                    533 ;	lib/TM1637.c: 98: TM1637_seg[2] = 0x00;
      00822E 1E 01            [ 2]  534 	ldw	x, (0x01, sp)
      008230 5C               [ 2]  535 	incw	x
      008231 5C               [ 2]  536 	incw	x
      008232 7F               [ 1]  537 	clr	(x)
                                    538 ;	lib/TM1637.c: 99: TM1637_seg[3] = 0x00;
      008233 1E 01            [ 2]  539 	ldw	x, (0x01, sp)
      008235 1C 00 03         [ 2]  540 	addw	x, #0x0003
      008238 7F               [ 1]  541 	clr	(x)
                                    542 ;	lib/TM1637.c: 100: TM1637_send();
      008239 CD 81 D9         [ 4]  543 	call	_TM1637_send
      00823C 5B 02            [ 2]  544 	addw	sp, #2
      00823E 81               [ 4]  545 	ret
                                    546 ;	lib/TM1637.c: 103: void TM1637_initialization(){
                                    547 ;	-----------------------------------------
                                    548 ;	 function TM1637_initialization
                                    549 ;	-----------------------------------------
      00823F                        550 _TM1637_initialization:
                                    551 ;	lib/TM1637.c: 104: TM1637_ODR |= (1<<TM1637_SCL) | (1<<TM1637_SDA); 
      00823F AE 50 0A         [ 2]  552 	ldw	x, #0x500a
      008242 F6               [ 1]  553 	ld	a, (x)
      008243 AA 18            [ 1]  554 	or	a, #0x18
      008245 F7               [ 1]  555 	ld	(x), a
                                    556 ;	lib/TM1637.c: 107: TM1637_cleer();
      008246 CC 82 20         [ 2]  557 	jp	_TM1637_cleer
                                    558 ;	lib/TM1637.c: 110: void TM1637_dot(char d){
                                    559 ;	-----------------------------------------
                                    560 ;	 function TM1637_dot
                                    561 ;	-----------------------------------------
      008249                        562 _TM1637_dot:
                                    563 ;	lib/TM1637.c: 111: if(d == 1)TM1637_seg[1] = TM1637_seg[1] + 0x80; 
      008249 7B 03            [ 1]  564 	ld	a, (0x03, sp)
      00824B A1 01            [ 1]  565 	cp	a, #0x01
      00824D 26 07            [ 1]  566 	jrne	00103$
      00824F AE 00 28         [ 2]  567 	ldw	x, #_TM1637_seg+1
      008252 F6               [ 1]  568 	ld	a, (x)
      008253 AB 80            [ 1]  569 	add	a, #0x80
      008255 F7               [ 1]  570 	ld	(x), a
      008256                        571 00103$:
      008256 81               [ 4]  572 	ret
                                    573 ;	lib/i2c.c: 16: unsigned char i2c_stop(void)
                                    574 ;	-----------------------------------------
                                    575 ;	 function i2c_stop
                                    576 ;	-----------------------------------------
      008257                        577 _i2c_stop:
      008257 88               [ 1]  578 	push	a
                                    579 ;	lib/i2c.c: 18: unsigned char error = 0;
      008258 0F 01            [ 1]  580 	clr	(0x01, sp)
                                    581 ;	lib/i2c.c: 20: NULL_SCL();
      00825A AE 50 07         [ 2]  582 	ldw	x, #0x5007
      00825D F6               [ 1]  583 	ld	a, (x)
      00825E AA 10            [ 1]  584 	or	a, #0x10
      008260 F7               [ 1]  585 	ld	(x), a
      008261 AE 50 05         [ 2]  586 	ldw	x, #0x5005
      008264 F6               [ 1]  587 	ld	a, (x)
      008265 A4 EF            [ 1]  588 	and	a, #0xef
      008267 F7               [ 1]  589 	ld	(x), a
                                    590 ;	lib/i2c.c: 21: I2C_DELAY();
      008268 4B 05            [ 1]  591 	push	#0x05
      00826A 5F               [ 1]  592 	clrw	x
      00826B 89               [ 2]  593 	pushw	x
      00826C 4B 00            [ 1]  594 	push	#0x00
      00826E CD 80 A0         [ 4]  595 	call	_delay
      008271 5B 04            [ 2]  596 	addw	sp, #4
                                    597 ;	lib/i2c.c: 22: NULL_SDA();
      008273 AE 50 07         [ 2]  598 	ldw	x, #0x5007
      008276 F6               [ 1]  599 	ld	a, (x)
      008277 AA 20            [ 1]  600 	or	a, #0x20
      008279 F7               [ 1]  601 	ld	(x), a
      00827A AE 50 05         [ 2]  602 	ldw	x, #0x5005
      00827D F6               [ 1]  603 	ld	a, (x)
      00827E A4 DF            [ 1]  604 	and	a, #0xdf
      008280 F7               [ 1]  605 	ld	(x), a
                                    606 ;	lib/i2c.c: 23: I2C_DELAY();
      008281 4B 05            [ 1]  607 	push	#0x05
      008283 5F               [ 1]  608 	clrw	x
      008284 89               [ 2]  609 	pushw	x
      008285 4B 00            [ 1]  610 	push	#0x00
      008287 CD 80 A0         [ 4]  611 	call	_delay
      00828A 5B 04            [ 2]  612 	addw	sp, #4
                                    613 ;	lib/i2c.c: 25: ONE_SCL();
      00828C AE 50 07         [ 2]  614 	ldw	x, #0x5007
      00828F F6               [ 1]  615 	ld	a, (x)
      008290 A4 EF            [ 1]  616 	and	a, #0xef
      008292 F7               [ 1]  617 	ld	(x), a
      008293 AE 50 05         [ 2]  618 	ldw	x, #0x5005
      008296 F6               [ 1]  619 	ld	a, (x)
      008297 AA 10            [ 1]  620 	or	a, #0x10
      008299 F7               [ 1]  621 	ld	(x), a
                                    622 ;	lib/i2c.c: 26: I2C_DELAY();
      00829A 4B 05            [ 1]  623 	push	#0x05
      00829C 5F               [ 1]  624 	clrw	x
      00829D 89               [ 2]  625 	pushw	x
      00829E 4B 00            [ 1]  626 	push	#0x00
      0082A0 CD 80 A0         [ 4]  627 	call	_delay
      0082A3 5B 04            [ 2]  628 	addw	sp, #4
                                    629 ;	lib/i2c.c: 27: ONE_SDA();
      0082A5 AE 50 07         [ 2]  630 	ldw	x, #0x5007
      0082A8 F6               [ 1]  631 	ld	a, (x)
      0082A9 A4 DF            [ 1]  632 	and	a, #0xdf
      0082AB F7               [ 1]  633 	ld	(x), a
      0082AC AE 50 05         [ 2]  634 	ldw	x, #0x5005
      0082AF F6               [ 1]  635 	ld	a, (x)
      0082B0 AA 20            [ 1]  636 	or	a, #0x20
      0082B2 F7               [ 1]  637 	ld	(x), a
                                    638 ;	lib/i2c.c: 28: I2C_DELAY();
      0082B3 4B 05            [ 1]  639 	push	#0x05
      0082B5 5F               [ 1]  640 	clrw	x
      0082B6 89               [ 2]  641 	pushw	x
      0082B7 4B 00            [ 1]  642 	push	#0x00
      0082B9 CD 80 A0         [ 4]  643 	call	_delay
      0082BC 5B 04            [ 2]  644 	addw	sp, #4
                                    645 ;	lib/i2c.c: 30: if((I2C_IDR & (1 << I2C_SDA)) == 0) error = 2;
      0082BE AE 50 06         [ 2]  646 	ldw	x, #0x5006
      0082C1 F6               [ 1]  647 	ld	a, (x)
      0082C2 A5 20            [ 1]  648 	bcp	a, #0x20
      0082C4 26 06            [ 1]  649 	jrne	00102$
      0082C6 88               [ 1]  650 	push	a
      0082C7 A6 02            [ 1]  651 	ld	a, #0x02
      0082C9 6B 02            [ 1]  652 	ld	(0x02, sp), a
      0082CB 84               [ 1]  653 	pop	a
      0082CC                        654 00102$:
                                    655 ;	lib/i2c.c: 31: if((I2C_IDR & (1 << I2C_SCL)) == 0) error |= 1;
      0082CC A5 10            [ 1]  656 	bcp	a, #0x10
      0082CE 26 06            [ 1]  657 	jrne	00104$
      0082D0 7B 01            [ 1]  658 	ld	a, (0x01, sp)
      0082D2 AA 01            [ 1]  659 	or	a, #0x01
      0082D4 6B 01            [ 1]  660 	ld	(0x01, sp), a
      0082D6                        661 00104$:
                                    662 ;	lib/i2c.c: 32: I2C_DELAY();
      0082D6 4B 05            [ 1]  663 	push	#0x05
      0082D8 5F               [ 1]  664 	clrw	x
      0082D9 89               [ 2]  665 	pushw	x
      0082DA 4B 00            [ 1]  666 	push	#0x00
      0082DC CD 80 A0         [ 4]  667 	call	_delay
      0082DF 5B 04            [ 2]  668 	addw	sp, #4
                                    669 ;	lib/i2c.c: 33: I2C_DELAY();
      0082E1 4B 05            [ 1]  670 	push	#0x05
      0082E3 5F               [ 1]  671 	clrw	x
      0082E4 89               [ 2]  672 	pushw	x
      0082E5 4B 00            [ 1]  673 	push	#0x00
      0082E7 CD 80 A0         [ 4]  674 	call	_delay
      0082EA 5B 04            [ 2]  675 	addw	sp, #4
                                    676 ;	lib/i2c.c: 34: I2C_DELAY();
      0082EC 4B 05            [ 1]  677 	push	#0x05
      0082EE 5F               [ 1]  678 	clrw	x
      0082EF 89               [ 2]  679 	pushw	x
      0082F0 4B 00            [ 1]  680 	push	#0x00
      0082F2 CD 80 A0         [ 4]  681 	call	_delay
      0082F5 5B 04            [ 2]  682 	addw	sp, #4
                                    683 ;	lib/i2c.c: 35: I2C_DELAY();
      0082F7 4B 05            [ 1]  684 	push	#0x05
      0082F9 5F               [ 1]  685 	clrw	x
      0082FA 89               [ 2]  686 	pushw	x
      0082FB 4B 00            [ 1]  687 	push	#0x00
      0082FD CD 80 A0         [ 4]  688 	call	_delay
      008300 5B 04            [ 2]  689 	addw	sp, #4
                                    690 ;	lib/i2c.c: 37: return error;
      008302 7B 01            [ 1]  691 	ld	a, (0x01, sp)
      008304 5B 01            [ 2]  692 	addw	sp, #1
      008306 81               [ 4]  693 	ret
                                    694 ;	lib/i2c.c: 44: void i2c_start(void)
                                    695 ;	-----------------------------------------
                                    696 ;	 function i2c_start
                                    697 ;	-----------------------------------------
      008307                        698 _i2c_start:
                                    699 ;	lib/i2c.c: 46: NULL_SDA();
      008307 AE 50 07         [ 2]  700 	ldw	x, #0x5007
      00830A F6               [ 1]  701 	ld	a, (x)
      00830B AA 20            [ 1]  702 	or	a, #0x20
      00830D F7               [ 1]  703 	ld	(x), a
      00830E AE 50 05         [ 2]  704 	ldw	x, #0x5005
      008311 F6               [ 1]  705 	ld	a, (x)
      008312 A4 DF            [ 1]  706 	and	a, #0xdf
      008314 F7               [ 1]  707 	ld	(x), a
                                    708 ;	lib/i2c.c: 47: I2C_DELAY();
      008315 4B 05            [ 1]  709 	push	#0x05
      008317 5F               [ 1]  710 	clrw	x
      008318 89               [ 2]  711 	pushw	x
      008319 4B 00            [ 1]  712 	push	#0x00
      00831B CD 80 A0         [ 4]  713 	call	_delay
      00831E 5B 04            [ 2]  714 	addw	sp, #4
                                    715 ;	lib/i2c.c: 48: NULL_SCL();
      008320 AE 50 07         [ 2]  716 	ldw	x, #0x5007
      008323 F6               [ 1]  717 	ld	a, (x)
      008324 AA 10            [ 1]  718 	or	a, #0x10
      008326 F7               [ 1]  719 	ld	(x), a
      008327 AE 50 05         [ 2]  720 	ldw	x, #0x5005
      00832A F6               [ 1]  721 	ld	a, (x)
      00832B A4 EF            [ 1]  722 	and	a, #0xef
      00832D F7               [ 1]  723 	ld	(x), a
                                    724 ;	lib/i2c.c: 49: I2C_DELAY();
      00832E 4B 05            [ 1]  725 	push	#0x05
      008330 5F               [ 1]  726 	clrw	x
      008331 89               [ 2]  727 	pushw	x
      008332 4B 00            [ 1]  728 	push	#0x00
      008334 CD 80 A0         [ 4]  729 	call	_delay
      008337 5B 04            [ 2]  730 	addw	sp, #4
      008339 81               [ 4]  731 	ret
                                    732 ;	lib/i2c.c: 56: void i2c_restart(void)
                                    733 ;	-----------------------------------------
                                    734 ;	 function i2c_restart
                                    735 ;	-----------------------------------------
      00833A                        736 _i2c_restart:
                                    737 ;	lib/i2c.c: 58: ONE_SDA();
      00833A AE 50 07         [ 2]  738 	ldw	x, #0x5007
      00833D F6               [ 1]  739 	ld	a, (x)
      00833E A4 DF            [ 1]  740 	and	a, #0xdf
      008340 F7               [ 1]  741 	ld	(x), a
      008341 AE 50 05         [ 2]  742 	ldw	x, #0x5005
      008344 F6               [ 1]  743 	ld	a, (x)
      008345 AA 20            [ 1]  744 	or	a, #0x20
      008347 F7               [ 1]  745 	ld	(x), a
                                    746 ;	lib/i2c.c: 59: I2C_DELAY();
      008348 4B 05            [ 1]  747 	push	#0x05
      00834A 5F               [ 1]  748 	clrw	x
      00834B 89               [ 2]  749 	pushw	x
      00834C 4B 00            [ 1]  750 	push	#0x00
      00834E CD 80 A0         [ 4]  751 	call	_delay
      008351 5B 04            [ 2]  752 	addw	sp, #4
                                    753 ;	lib/i2c.c: 60: ONE_SCL();
      008353 AE 50 07         [ 2]  754 	ldw	x, #0x5007
      008356 F6               [ 1]  755 	ld	a, (x)
      008357 A4 EF            [ 1]  756 	and	a, #0xef
      008359 F7               [ 1]  757 	ld	(x), a
      00835A AE 50 05         [ 2]  758 	ldw	x, #0x5005
      00835D F6               [ 1]  759 	ld	a, (x)
      00835E AA 10            [ 1]  760 	or	a, #0x10
      008360 F7               [ 1]  761 	ld	(x), a
                                    762 ;	lib/i2c.c: 61: I2C_DELAY();
      008361 4B 05            [ 1]  763 	push	#0x05
      008363 5F               [ 1]  764 	clrw	x
      008364 89               [ 2]  765 	pushw	x
      008365 4B 00            [ 1]  766 	push	#0x00
      008367 CD 80 A0         [ 4]  767 	call	_delay
      00836A 5B 04            [ 2]  768 	addw	sp, #4
                                    769 ;	lib/i2c.c: 63: NULL_SDA();
      00836C AE 50 07         [ 2]  770 	ldw	x, #0x5007
      00836F F6               [ 1]  771 	ld	a, (x)
      008370 AA 20            [ 1]  772 	or	a, #0x20
      008372 F7               [ 1]  773 	ld	(x), a
      008373 AE 50 05         [ 2]  774 	ldw	x, #0x5005
      008376 F6               [ 1]  775 	ld	a, (x)
      008377 A4 DF            [ 1]  776 	and	a, #0xdf
      008379 F7               [ 1]  777 	ld	(x), a
                                    778 ;	lib/i2c.c: 64: I2C_DELAY();
      00837A 4B 05            [ 1]  779 	push	#0x05
      00837C 5F               [ 1]  780 	clrw	x
      00837D 89               [ 2]  781 	pushw	x
      00837E 4B 00            [ 1]  782 	push	#0x00
      008380 CD 80 A0         [ 4]  783 	call	_delay
      008383 5B 04            [ 2]  784 	addw	sp, #4
                                    785 ;	lib/i2c.c: 65: NULL_SCL();
      008385 AE 50 07         [ 2]  786 	ldw	x, #0x5007
      008388 F6               [ 1]  787 	ld	a, (x)
      008389 AA 10            [ 1]  788 	or	a, #0x10
      00838B F7               [ 1]  789 	ld	(x), a
      00838C AE 50 05         [ 2]  790 	ldw	x, #0x5005
      00838F F6               [ 1]  791 	ld	a, (x)
      008390 A4 EF            [ 1]  792 	and	a, #0xef
      008392 F7               [ 1]  793 	ld	(x), a
                                    794 ;	lib/i2c.c: 66: I2C_DELAY();
      008393 4B 05            [ 1]  795 	push	#0x05
      008395 5F               [ 1]  796 	clrw	x
      008396 89               [ 2]  797 	pushw	x
      008397 4B 00            [ 1]  798 	push	#0x00
      008399 CD 80 A0         [ 4]  799 	call	_delay
      00839C 5B 04            [ 2]  800 	addw	sp, #4
      00839E 81               [ 4]  801 	ret
                                    802 ;	lib/i2c.c: 73: void i2c_init(void)
                                    803 ;	-----------------------------------------
                                    804 ;	 function i2c_init
                                    805 ;	-----------------------------------------
      00839F                        806 _i2c_init:
                                    807 ;	lib/i2c.c: 75: ONE_SDA();
      00839F AE 50 07         [ 2]  808 	ldw	x, #0x5007
      0083A2 F6               [ 1]  809 	ld	a, (x)
      0083A3 A4 DF            [ 1]  810 	and	a, #0xdf
      0083A5 F7               [ 1]  811 	ld	(x), a
      0083A6 AE 50 05         [ 2]  812 	ldw	x, #0x5005
      0083A9 F6               [ 1]  813 	ld	a, (x)
      0083AA AA 20            [ 1]  814 	or	a, #0x20
      0083AC F7               [ 1]  815 	ld	(x), a
                                    816 ;	lib/i2c.c: 76: ONE_SCL();
      0083AD AE 50 07         [ 2]  817 	ldw	x, #0x5007
      0083B0 F6               [ 1]  818 	ld	a, (x)
      0083B1 A4 EF            [ 1]  819 	and	a, #0xef
      0083B3 F7               [ 1]  820 	ld	(x), a
      0083B4 AE 50 05         [ 2]  821 	ldw	x, #0x5005
      0083B7 F6               [ 1]  822 	ld	a, (x)
      0083B8 AA 10            [ 1]  823 	or	a, #0x10
      0083BA F7               [ 1]  824 	ld	(x), a
                                    825 ;	lib/i2c.c: 78: i2c_stop();
      0083BB CC 82 57         [ 2]  826 	jp	_i2c_stop
                                    827 ;	lib/i2c.c: 85: unsigned char i2c_send_byte(unsigned char data)
                                    828 ;	-----------------------------------------
                                    829 ;	 function i2c_send_byte
                                    830 ;	-----------------------------------------
      0083BE                        831 _i2c_send_byte:
      0083BE 52 02            [ 2]  832 	sub	sp, #2
                                    833 ;	lib/i2c.c: 90: for(i = 0; i < 8; i++)
      0083C0 0F 01            [ 1]  834 	clr	(0x01, sp)
      0083C2                        835 00108$:
                                    836 ;	lib/i2c.c: 94: NULL_SDA();
      0083C2 AE 50 07         [ 2]  837 	ldw	x, #0x5007
      0083C5 F6               [ 1]  838 	ld	a, (x)
                                    839 ;	lib/i2c.c: 92: if((data & 0x80) == 0)
      0083C6 0D 05            [ 1]  840 	tnz	(0x05, sp)
      0083C8 2B 0F            [ 1]  841 	jrmi	00102$
                                    842 ;	lib/i2c.c: 94: NULL_SDA();
      0083CA AA 20            [ 1]  843 	or	a, #0x20
      0083CC AE 50 07         [ 2]  844 	ldw	x, #0x5007
      0083CF F7               [ 1]  845 	ld	(x), a
      0083D0 AE 50 05         [ 2]  846 	ldw	x, #0x5005
      0083D3 F6               [ 1]  847 	ld	a, (x)
      0083D4 A4 DF            [ 1]  848 	and	a, #0xdf
      0083D6 F7               [ 1]  849 	ld	(x), a
      0083D7 20 0D            [ 2]  850 	jra	00103$
      0083D9                        851 00102$:
                                    852 ;	lib/i2c.c: 98: ONE_SDA();
      0083D9 A4 DF            [ 1]  853 	and	a, #0xdf
      0083DB AE 50 07         [ 2]  854 	ldw	x, #0x5007
      0083DE F7               [ 1]  855 	ld	(x), a
      0083DF AE 50 05         [ 2]  856 	ldw	x, #0x5005
      0083E2 F6               [ 1]  857 	ld	a, (x)
      0083E3 AA 20            [ 1]  858 	or	a, #0x20
      0083E5 F7               [ 1]  859 	ld	(x), a
      0083E6                        860 00103$:
                                    861 ;	lib/i2c.c: 100: I2C_DELAY();
      0083E6 4B 05            [ 1]  862 	push	#0x05
      0083E8 5F               [ 1]  863 	clrw	x
      0083E9 89               [ 2]  864 	pushw	x
      0083EA 4B 00            [ 1]  865 	push	#0x00
      0083EC CD 80 A0         [ 4]  866 	call	_delay
      0083EF 5B 04            [ 2]  867 	addw	sp, #4
                                    868 ;	lib/i2c.c: 101: ONE_SCL();
      0083F1 AE 50 07         [ 2]  869 	ldw	x, #0x5007
      0083F4 F6               [ 1]  870 	ld	a, (x)
      0083F5 A4 EF            [ 1]  871 	and	a, #0xef
      0083F7 F7               [ 1]  872 	ld	(x), a
      0083F8 AE 50 05         [ 2]  873 	ldw	x, #0x5005
      0083FB F6               [ 1]  874 	ld	a, (x)
      0083FC AA 10            [ 1]  875 	or	a, #0x10
      0083FE F7               [ 1]  876 	ld	(x), a
                                    877 ;	lib/i2c.c: 102: I2C_DELAY();
      0083FF 4B 05            [ 1]  878 	push	#0x05
      008401 5F               [ 1]  879 	clrw	x
      008402 89               [ 2]  880 	pushw	x
      008403 4B 00            [ 1]  881 	push	#0x00
      008405 CD 80 A0         [ 4]  882 	call	_delay
      008408 5B 04            [ 2]  883 	addw	sp, #4
                                    884 ;	lib/i2c.c: 103: NULL_SCL();
      00840A AE 50 07         [ 2]  885 	ldw	x, #0x5007
      00840D F6               [ 1]  886 	ld	a, (x)
      00840E AA 10            [ 1]  887 	or	a, #0x10
      008410 F7               [ 1]  888 	ld	(x), a
      008411 AE 50 05         [ 2]  889 	ldw	x, #0x5005
      008414 F6               [ 1]  890 	ld	a, (x)
      008415 A4 EF            [ 1]  891 	and	a, #0xef
      008417 F7               [ 1]  892 	ld	(x), a
                                    893 ;	lib/i2c.c: 105: data = (data << 1);
      008418 08 05            [ 1]  894 	sll	(0x05, sp)
                                    895 ;	lib/i2c.c: 90: for(i = 0; i < 8; i++)
      00841A 0C 01            [ 1]  896 	inc	(0x01, sp)
      00841C 7B 01            [ 1]  897 	ld	a, (0x01, sp)
      00841E A1 08            [ 1]  898 	cp	a, #0x08
      008420 25 A0            [ 1]  899 	jrc	00108$
                                    900 ;	lib/i2c.c: 108: ONE_SDA();
      008422 AE 50 07         [ 2]  901 	ldw	x, #0x5007
      008425 F6               [ 1]  902 	ld	a, (x)
      008426 A4 DF            [ 1]  903 	and	a, #0xdf
      008428 F7               [ 1]  904 	ld	(x), a
      008429 AE 50 05         [ 2]  905 	ldw	x, #0x5005
      00842C F6               [ 1]  906 	ld	a, (x)
      00842D AA 20            [ 1]  907 	or	a, #0x20
      00842F F7               [ 1]  908 	ld	(x), a
                                    909 ;	lib/i2c.c: 109: I2C_DELAY();
      008430 4B 05            [ 1]  910 	push	#0x05
      008432 5F               [ 1]  911 	clrw	x
      008433 89               [ 2]  912 	pushw	x
      008434 4B 00            [ 1]  913 	push	#0x00
      008436 CD 80 A0         [ 4]  914 	call	_delay
      008439 5B 04            [ 2]  915 	addw	sp, #4
                                    916 ;	lib/i2c.c: 110: ONE_SCL();
      00843B AE 50 07         [ 2]  917 	ldw	x, #0x5007
      00843E F6               [ 1]  918 	ld	a, (x)
      00843F A4 EF            [ 1]  919 	and	a, #0xef
      008441 F7               [ 1]  920 	ld	(x), a
      008442 AE 50 05         [ 2]  921 	ldw	x, #0x5005
      008445 F6               [ 1]  922 	ld	a, (x)
      008446 AA 10            [ 1]  923 	or	a, #0x10
      008448 F7               [ 1]  924 	ld	(x), a
                                    925 ;	lib/i2c.c: 111: I2C_DELAY();
      008449 4B 05            [ 1]  926 	push	#0x05
      00844B 5F               [ 1]  927 	clrw	x
      00844C 89               [ 2]  928 	pushw	x
      00844D 4B 00            [ 1]  929 	push	#0x00
      00844F CD 80 A0         [ 4]  930 	call	_delay
      008452 5B 04            [ 2]  931 	addw	sp, #4
                                    932 ;	lib/i2c.c: 113: if((I2C_IDR & (1 << I2C_SDA)) == (1 << I2C_SDA))
      008454 AE 50 06         [ 2]  933 	ldw	x, #0x5006
      008457 F6               [ 1]  934 	ld	a, (x)
      008458 A4 20            [ 1]  935 	and	a, #0x20
      00845A A1 20            [ 1]  936 	cp	a, #0x20
      00845C 26 06            [ 1]  937 	jrne	00106$
                                    938 ;	lib/i2c.c: 115: ask = NACK;
      00845E A6 01            [ 1]  939 	ld	a, #0x01
      008460 6B 02            [ 1]  940 	ld	(0x02, sp), a
      008462 20 02            [ 2]  941 	jra	00107$
      008464                        942 00106$:
                                    943 ;	lib/i2c.c: 119: ask = ACK;
      008464 0F 02            [ 1]  944 	clr	(0x02, sp)
      008466                        945 00107$:
                                    946 ;	lib/i2c.c: 122: NULL_SCL();
      008466 AE 50 07         [ 2]  947 	ldw	x, #0x5007
      008469 F6               [ 1]  948 	ld	a, (x)
      00846A AA 10            [ 1]  949 	or	a, #0x10
      00846C F7               [ 1]  950 	ld	(x), a
      00846D AE 50 05         [ 2]  951 	ldw	x, #0x5005
      008470 F6               [ 1]  952 	ld	a, (x)
      008471 A4 EF            [ 1]  953 	and	a, #0xef
      008473 F7               [ 1]  954 	ld	(x), a
                                    955 ;	lib/i2c.c: 124: return ask;
      008474 7B 02            [ 1]  956 	ld	a, (0x02, sp)
      008476 5B 02            [ 2]  957 	addw	sp, #2
      008478 81               [ 4]  958 	ret
                                    959 ;	lib/i2c.c: 131: unsigned char i2c_read_byte(unsigned char ask)
                                    960 ;	-----------------------------------------
                                    961 ;	 function i2c_read_byte
                                    962 ;	-----------------------------------------
      008479                        963 _i2c_read_byte:
      008479 52 02            [ 2]  964 	sub	sp, #2
                                    965 ;	lib/i2c.c: 133: unsigned char byte = 0;
      00847B 0F 01            [ 1]  966 	clr	(0x01, sp)
                                    967 ;	lib/i2c.c: 136: ONE_SDA();
      00847D AE 50 07         [ 2]  968 	ldw	x, #0x5007
      008480 F6               [ 1]  969 	ld	a, (x)
      008481 A4 DF            [ 1]  970 	and	a, #0xdf
      008483 F7               [ 1]  971 	ld	(x), a
      008484 AE 50 05         [ 2]  972 	ldw	x, #0x5005
      008487 F6               [ 1]  973 	ld	a, (x)
      008488 AA 20            [ 1]  974 	or	a, #0x20
      00848A F7               [ 1]  975 	ld	(x), a
                                    976 ;	lib/i2c.c: 138: for(i = 0; i < 8; i++)
      00848B 0F 02            [ 1]  977 	clr	(0x02, sp)
      00848D                        978 00107$:
                                    979 ;	lib/i2c.c: 140: byte = (byte << 1);
      00848D 08 01            [ 1]  980 	sll	(0x01, sp)
                                    981 ;	lib/i2c.c: 141: ONE_SCL();
      00848F AE 50 07         [ 2]  982 	ldw	x, #0x5007
      008492 F6               [ 1]  983 	ld	a, (x)
      008493 A4 EF            [ 1]  984 	and	a, #0xef
      008495 F7               [ 1]  985 	ld	(x), a
      008496 AE 50 05         [ 2]  986 	ldw	x, #0x5005
      008499 F6               [ 1]  987 	ld	a, (x)
      00849A AA 10            [ 1]  988 	or	a, #0x10
      00849C F7               [ 1]  989 	ld	(x), a
                                    990 ;	lib/i2c.c: 142: I2C_DELAY();
      00849D 4B 05            [ 1]  991 	push	#0x05
      00849F 5F               [ 1]  992 	clrw	x
      0084A0 89               [ 2]  993 	pushw	x
      0084A1 4B 00            [ 1]  994 	push	#0x00
      0084A3 CD 80 A0         [ 4]  995 	call	_delay
      0084A6 5B 04            [ 2]  996 	addw	sp, #4
                                    997 ;	lib/i2c.c: 143: if((I2C_IDR & (1 << I2C_SDA)) == (1 << I2C_SDA)) byte |= 0x01;
      0084A8 AE 50 06         [ 2]  998 	ldw	x, #0x5006
      0084AB F6               [ 1]  999 	ld	a, (x)
      0084AC A4 20            [ 1] 1000 	and	a, #0x20
      0084AE A1 20            [ 1] 1001 	cp	a, #0x20
      0084B0 26 06            [ 1] 1002 	jrne	00102$
      0084B2 7B 01            [ 1] 1003 	ld	a, (0x01, sp)
      0084B4 AA 01            [ 1] 1004 	or	a, #0x01
      0084B6 6B 01            [ 1] 1005 	ld	(0x01, sp), a
      0084B8                       1006 00102$:
                                   1007 ;	lib/i2c.c: 144: NULL_SCL();
      0084B8 AE 50 07         [ 2] 1008 	ldw	x, #0x5007
      0084BB F6               [ 1] 1009 	ld	a, (x)
      0084BC AA 10            [ 1] 1010 	or	a, #0x10
      0084BE F7               [ 1] 1011 	ld	(x), a
      0084BF AE 50 05         [ 2] 1012 	ldw	x, #0x5005
      0084C2 F6               [ 1] 1013 	ld	a, (x)
      0084C3 A4 EF            [ 1] 1014 	and	a, #0xef
      0084C5 F7               [ 1] 1015 	ld	(x), a
                                   1016 ;	lib/i2c.c: 145: I2C_DELAY();
      0084C6 4B 05            [ 1] 1017 	push	#0x05
      0084C8 5F               [ 1] 1018 	clrw	x
      0084C9 89               [ 2] 1019 	pushw	x
      0084CA 4B 00            [ 1] 1020 	push	#0x00
      0084CC CD 80 A0         [ 4] 1021 	call	_delay
      0084CF 5B 04            [ 2] 1022 	addw	sp, #4
                                   1023 ;	lib/i2c.c: 138: for(i = 0; i < 8; i++)
      0084D1 0C 02            [ 1] 1024 	inc	(0x02, sp)
      0084D3 7B 02            [ 1] 1025 	ld	a, (0x02, sp)
      0084D5 A1 08            [ 1] 1026 	cp	a, #0x08
      0084D7 25 B4            [ 1] 1027 	jrc	00107$
                                   1028 ;	lib/i2c.c: 136: ONE_SDA();
      0084D9 AE 50 07         [ 2] 1029 	ldw	x, #0x5007
      0084DC F6               [ 1] 1030 	ld	a, (x)
                                   1031 ;	lib/i2c.c: 148: if(ask == ACK)
      0084DD 0D 05            [ 1] 1032 	tnz	(0x05, sp)
      0084DF 26 0F            [ 1] 1033 	jrne	00105$
                                   1034 ;	lib/i2c.c: 150: NULL_SDA();
      0084E1 AA 20            [ 1] 1035 	or	a, #0x20
      0084E3 AE 50 07         [ 2] 1036 	ldw	x, #0x5007
      0084E6 F7               [ 1] 1037 	ld	(x), a
      0084E7 AE 50 05         [ 2] 1038 	ldw	x, #0x5005
      0084EA F6               [ 1] 1039 	ld	a, (x)
      0084EB A4 DF            [ 1] 1040 	and	a, #0xdf
      0084ED F7               [ 1] 1041 	ld	(x), a
      0084EE 20 0D            [ 2] 1042 	jra	00106$
      0084F0                       1043 00105$:
                                   1044 ;	lib/i2c.c: 154: ONE_SDA();
      0084F0 A4 DF            [ 1] 1045 	and	a, #0xdf
      0084F2 AE 50 07         [ 2] 1046 	ldw	x, #0x5007
      0084F5 F7               [ 1] 1047 	ld	(x), a
      0084F6 AE 50 05         [ 2] 1048 	ldw	x, #0x5005
      0084F9 F6               [ 1] 1049 	ld	a, (x)
      0084FA AA 20            [ 1] 1050 	or	a, #0x20
      0084FC F7               [ 1] 1051 	ld	(x), a
      0084FD                       1052 00106$:
                                   1053 ;	lib/i2c.c: 156: I2C_DELAY();
      0084FD 4B 05            [ 1] 1054 	push	#0x05
      0084FF 5F               [ 1] 1055 	clrw	x
      008500 89               [ 2] 1056 	pushw	x
      008501 4B 00            [ 1] 1057 	push	#0x00
      008503 CD 80 A0         [ 4] 1058 	call	_delay
      008506 5B 04            [ 2] 1059 	addw	sp, #4
                                   1060 ;	lib/i2c.c: 157: ONE_SCL();
      008508 AE 50 07         [ 2] 1061 	ldw	x, #0x5007
      00850B F6               [ 1] 1062 	ld	a, (x)
      00850C A4 EF            [ 1] 1063 	and	a, #0xef
      00850E F7               [ 1] 1064 	ld	(x), a
      00850F AE 50 05         [ 2] 1065 	ldw	x, #0x5005
      008512 F6               [ 1] 1066 	ld	a, (x)
      008513 AA 10            [ 1] 1067 	or	a, #0x10
      008515 F7               [ 1] 1068 	ld	(x), a
                                   1069 ;	lib/i2c.c: 158: I2C_DELAY();
      008516 4B 05            [ 1] 1070 	push	#0x05
      008518 5F               [ 1] 1071 	clrw	x
      008519 89               [ 2] 1072 	pushw	x
      00851A 4B 00            [ 1] 1073 	push	#0x00
      00851C CD 80 A0         [ 4] 1074 	call	_delay
      00851F 5B 04            [ 2] 1075 	addw	sp, #4
                                   1076 ;	lib/i2c.c: 159: NULL_SCL();
      008521 AE 50 07         [ 2] 1077 	ldw	x, #0x5007
      008524 F6               [ 1] 1078 	ld	a, (x)
      008525 AA 10            [ 1] 1079 	or	a, #0x10
      008527 F7               [ 1] 1080 	ld	(x), a
      008528 AE 50 05         [ 2] 1081 	ldw	x, #0x5005
      00852B F6               [ 1] 1082 	ld	a, (x)
      00852C A4 EF            [ 1] 1083 	and	a, #0xef
      00852E F7               [ 1] 1084 	ld	(x), a
                                   1085 ;	lib/i2c.c: 160: I2C_DELAY();
      00852F 4B 05            [ 1] 1086 	push	#0x05
      008531 5F               [ 1] 1087 	clrw	x
      008532 89               [ 2] 1088 	pushw	x
      008533 4B 00            [ 1] 1089 	push	#0x00
      008535 CD 80 A0         [ 4] 1090 	call	_delay
      008538 5B 04            [ 2] 1091 	addw	sp, #4
                                   1092 ;	lib/i2c.c: 161: ONE_SDA();
      00853A AE 50 07         [ 2] 1093 	ldw	x, #0x5007
      00853D F6               [ 1] 1094 	ld	a, (x)
      00853E A4 DF            [ 1] 1095 	and	a, #0xdf
      008540 F7               [ 1] 1096 	ld	(x), a
      008541 AE 50 05         [ 2] 1097 	ldw	x, #0x5005
      008544 F6               [ 1] 1098 	ld	a, (x)
      008545 AA 20            [ 1] 1099 	or	a, #0x20
      008547 F7               [ 1] 1100 	ld	(x), a
                                   1101 ;	lib/i2c.c: 163: return byte;
      008548 7B 01            [ 1] 1102 	ld	a, (0x01, sp)
      00854A 5B 02            [ 2] 1103 	addw	sp, #2
      00854C 81               [ 4] 1104 	ret
                                   1105 ;	lib/rtc.c: 3: unsigned char RTC_ConvertFromDec(unsigned char c){
                                   1106 ;	-----------------------------------------
                                   1107 ;	 function RTC_ConvertFromDec
                                   1108 ;	-----------------------------------------
      00854D                       1109 _RTC_ConvertFromDec:
      00854D 88               [ 1] 1110 	push	a
                                   1111 ;	lib/rtc.c: 4: unsigned char ch = ((c>>4)*10+(0b00001111&c));
      00854E 7B 04            [ 1] 1112 	ld	a, (0x04, sp)
      008550 4E               [ 1] 1113 	swap	a
      008551 A4 0F            [ 1] 1114 	and	a, #0x0f
      008553 41               [ 1] 1115 	exg	a, xl
      008554 A6 0A            [ 1] 1116 	ld	a, #0x0a
      008556 41               [ 1] 1117 	exg	a, xl
      008557 42               [ 4] 1118 	mul	x, a
      008558 7B 04            [ 1] 1119 	ld	a, (0x04, sp)
      00855A A4 0F            [ 1] 1120 	and	a, #0x0f
      00855C 6B 01            [ 1] 1121 	ld	(0x01, sp), a
      00855E 9F               [ 1] 1122 	ld	a, xl
      00855F 1B 01            [ 1] 1123 	add	a, (0x01, sp)
                                   1124 ;	lib/rtc.c: 5: return ch;
      008561 5B 01            [ 2] 1125 	addw	sp, #1
      008563 81               [ 4] 1126 	ret
                                   1127 ;	lib/rtc.c: 8: unsigned char RTC_ConvertFromBinDec(unsigned char c){
                                   1128 ;	-----------------------------------------
                                   1129 ;	 function RTC_ConvertFromBinDec
                                   1130 ;	-----------------------------------------
      008564                       1131 _RTC_ConvertFromBinDec:
      008564 88               [ 1] 1132 	push	a
                                   1133 ;	lib/rtc.c: 9: unsigned char ch = ((c/10)<<4)|(c%10);
      008565 5F               [ 1] 1134 	clrw	x
      008566 7B 04            [ 1] 1135 	ld	a, (0x04, sp)
      008568 97               [ 1] 1136 	ld	xl, a
      008569 A6 0A            [ 1] 1137 	ld	a, #0x0a
      00856B 62               [ 2] 1138 	div	x, a
      00856C 9F               [ 1] 1139 	ld	a, xl
      00856D 4E               [ 1] 1140 	swap	a
      00856E A4 F0            [ 1] 1141 	and	a, #0xf0
      008570 6B 01            [ 1] 1142 	ld	(0x01, sp), a
      008572 5F               [ 1] 1143 	clrw	x
      008573 7B 04            [ 1] 1144 	ld	a, (0x04, sp)
      008575 97               [ 1] 1145 	ld	xl, a
      008576 A6 0A            [ 1] 1146 	ld	a, #0x0a
      008578 62               [ 2] 1147 	div	x, a
      008579 1A 01            [ 1] 1148 	or	a, (0x01, sp)
                                   1149 ;	lib/rtc.c: 10: return ch;
      00857B 5B 01            [ 2] 1150 	addw	sp, #1
      00857D 81               [ 4] 1151 	ret
                                   1152 ;	lib/rtc.c: 18: void RTC_Read(){
                                   1153 ;	-----------------------------------------
                                   1154 ;	 function RTC_Read
                                   1155 ;	-----------------------------------------
      00857E                       1156 _RTC_Read:
                                   1157 ;	lib/rtc.c: 21: i2c_start();
      00857E CD 83 07         [ 4] 1158 	call	_i2c_start
                                   1159 ;	lib/rtc.c: 22: i2c_send_byte(0xD0);
      008581 4B D0            [ 1] 1160 	push	#0xd0
      008583 CD 83 BE         [ 4] 1161 	call	_i2c_send_byte
      008586 84               [ 1] 1162 	pop	a
                                   1163 ;	lib/rtc.c: 23: i2c_send_byte(0x00);
      008587 4B 00            [ 1] 1164 	push	#0x00
      008589 CD 83 BE         [ 4] 1165 	call	_i2c_send_byte
      00858C 84               [ 1] 1166 	pop	a
                                   1167 ;	lib/rtc.c: 24: i2c_restart();
      00858D CD 83 3A         [ 4] 1168 	call	_i2c_restart
                                   1169 ;	lib/rtc.c: 25: i2c_send_byte(0xD1);
      008590 4B D1            [ 1] 1170 	push	#0xd1
      008592 CD 83 BE         [ 4] 1171 	call	_i2c_send_byte
      008595 84               [ 1] 1172 	pop	a
                                   1173 ;	lib/rtc.c: 26: sec		= i2c_read_byte(0);
      008596 4B 00            [ 1] 1174 	push	#0x00
      008598 CD 84 79         [ 4] 1175 	call	_i2c_read_byte
      00859B 5B 01            [ 2] 1176 	addw	sp, #1
      00859D C7 00 01         [ 1] 1177 	ld	_sec+0, a
                                   1178 ;	lib/rtc.c: 27: min		= i2c_read_byte(0);
      0085A0 4B 00            [ 1] 1179 	push	#0x00
      0085A2 CD 84 79         [ 4] 1180 	call	_i2c_read_byte
      0085A5 5B 01            [ 2] 1181 	addw	sp, #1
      0085A7 C7 00 02         [ 1] 1182 	ld	_min+0, a
                                   1183 ;	lib/rtc.c: 28: hour	= i2c_read_byte(0);
      0085AA 4B 00            [ 1] 1184 	push	#0x00
      0085AC CD 84 79         [ 4] 1185 	call	_i2c_read_byte
      0085AF 5B 01            [ 2] 1186 	addw	sp, #1
      0085B1 C7 00 03         [ 1] 1187 	ld	_hour+0, a
                                   1188 ;	lib/rtc.c: 29: day		= i2c_read_byte(0);
      0085B4 4B 00            [ 1] 1189 	push	#0x00
      0085B6 CD 84 79         [ 4] 1190 	call	_i2c_read_byte
      0085B9 5B 01            [ 2] 1191 	addw	sp, #1
      0085BB C7 00 04         [ 1] 1192 	ld	_day+0, a
                                   1193 ;	lib/rtc.c: 30: date	= i2c_read_byte(0);
      0085BE 4B 00            [ 1] 1194 	push	#0x00
      0085C0 CD 84 79         [ 4] 1195 	call	_i2c_read_byte
      0085C3 5B 01            [ 2] 1196 	addw	sp, #1
      0085C5 C7 00 05         [ 1] 1197 	ld	_date+0, a
                                   1198 ;	lib/rtc.c: 31: month	= i2c_read_byte(0);
      0085C8 4B 00            [ 1] 1199 	push	#0x00
      0085CA CD 84 79         [ 4] 1200 	call	_i2c_read_byte
      0085CD 5B 01            [ 2] 1201 	addw	sp, #1
      0085CF C7 00 06         [ 1] 1202 	ld	_month+0, a
                                   1203 ;	lib/rtc.c: 32: year	= i2c_read_byte(1);
      0085D2 4B 01            [ 1] 1204 	push	#0x01
      0085D4 CD 84 79         [ 4] 1205 	call	_i2c_read_byte
      0085D7 5B 01            [ 2] 1206 	addw	sp, #1
      0085D9 C7 00 07         [ 1] 1207 	ld	_year+0, a
                                   1208 ;	lib/rtc.c: 33: i2c_stop();
      0085DC CD 82 57         [ 4] 1209 	call	_i2c_stop
                                   1210 ;	lib/rtc.c: 35: sec		= RTC_ConvertFromDec(sec);
      0085DF 3B 00 01         [ 1] 1211 	push	_sec+0
      0085E2 CD 85 4D         [ 4] 1212 	call	_RTC_ConvertFromDec
      0085E5 5B 01            [ 2] 1213 	addw	sp, #1
      0085E7 C7 00 01         [ 1] 1214 	ld	_sec+0, a
                                   1215 ;	lib/rtc.c: 36: min		= RTC_ConvertFromDec(min);
      0085EA 3B 00 02         [ 1] 1216 	push	_min+0
      0085ED CD 85 4D         [ 4] 1217 	call	_RTC_ConvertFromDec
      0085F0 5B 01            [ 2] 1218 	addw	sp, #1
      0085F2 C7 00 02         [ 1] 1219 	ld	_min+0, a
                                   1220 ;	lib/rtc.c: 37: hour	= RTC_ConvertFromDec(hour);
      0085F5 3B 00 03         [ 1] 1221 	push	_hour+0
      0085F8 CD 85 4D         [ 4] 1222 	call	_RTC_ConvertFromDec
      0085FB 5B 01            [ 2] 1223 	addw	sp, #1
      0085FD C7 00 03         [ 1] 1224 	ld	_hour+0, a
                                   1225 ;	lib/rtc.c: 38: day		= RTC_ConvertFromDec(day);
      008600 3B 00 04         [ 1] 1226 	push	_day+0
      008603 CD 85 4D         [ 4] 1227 	call	_RTC_ConvertFromDec
      008606 5B 01            [ 2] 1228 	addw	sp, #1
      008608 C7 00 04         [ 1] 1229 	ld	_day+0, a
                                   1230 ;	lib/rtc.c: 39: date	= RTC_ConvertFromDec(date);
      00860B 3B 00 05         [ 1] 1231 	push	_date+0
      00860E CD 85 4D         [ 4] 1232 	call	_RTC_ConvertFromDec
      008611 5B 01            [ 2] 1233 	addw	sp, #1
      008613 C7 00 05         [ 1] 1234 	ld	_date+0, a
                                   1235 ;	lib/rtc.c: 40: month	= RTC_ConvertFromDec(month);
      008616 3B 00 06         [ 1] 1236 	push	_month+0
      008619 CD 85 4D         [ 4] 1237 	call	_RTC_ConvertFromDec
      00861C 5B 01            [ 2] 1238 	addw	sp, #1
      00861E C7 00 06         [ 1] 1239 	ld	_month+0, a
                                   1240 ;	lib/rtc.c: 41: year	= RTC_ConvertFromDec(year);
      008621 3B 00 07         [ 1] 1241 	push	_year+0
      008624 CD 85 4D         [ 4] 1242 	call	_RTC_ConvertFromDec
      008627 5B 01            [ 2] 1243 	addw	sp, #1
      008629 C7 00 07         [ 1] 1244 	ld	_year+0, a
      00862C 81               [ 4] 1245 	ret
                                   1246 ;	lib/rtc.c: 45: void RTC_Set(unsigned char sec, unsigned char min, unsigned char hour, unsigned char day, unsigned char date, unsigned char month, unsigned char year){
                                   1247 ;	-----------------------------------------
                                   1248 ;	 function RTC_Set
                                   1249 ;	-----------------------------------------
      00862D                       1250 _RTC_Set:
      00862D 52 07            [ 2] 1251 	sub	sp, #7
                                   1252 ;	lib/rtc.c: 46: sec		= RTC_ConvertFromBinDec(sec);
      00862F 7B 0A            [ 1] 1253 	ld	a, (0x0a, sp)
      008631 88               [ 1] 1254 	push	a
      008632 CD 85 64         [ 4] 1255 	call	_RTC_ConvertFromBinDec
      008635 5B 01            [ 2] 1256 	addw	sp, #1
      008637 6B 04            [ 1] 1257 	ld	(0x04, sp), a
                                   1258 ;	lib/rtc.c: 47: min		= RTC_ConvertFromBinDec(min);
      008639 7B 0B            [ 1] 1259 	ld	a, (0x0b, sp)
      00863B 88               [ 1] 1260 	push	a
      00863C CD 85 64         [ 4] 1261 	call	_RTC_ConvertFromBinDec
      00863F 5B 01            [ 2] 1262 	addw	sp, #1
      008641 6B 05            [ 1] 1263 	ld	(0x05, sp), a
                                   1264 ;	lib/rtc.c: 48: hour	= RTC_ConvertFromBinDec(hour);
      008643 7B 0C            [ 1] 1265 	ld	a, (0x0c, sp)
      008645 88               [ 1] 1266 	push	a
      008646 CD 85 64         [ 4] 1267 	call	_RTC_ConvertFromBinDec
      008649 5B 01            [ 2] 1268 	addw	sp, #1
      00864B 6B 06            [ 1] 1269 	ld	(0x06, sp), a
                                   1270 ;	lib/rtc.c: 49: day		= RTC_ConvertFromBinDec(day);
      00864D 7B 0D            [ 1] 1271 	ld	a, (0x0d, sp)
      00864F 88               [ 1] 1272 	push	a
      008650 CD 85 64         [ 4] 1273 	call	_RTC_ConvertFromBinDec
      008653 5B 01            [ 2] 1274 	addw	sp, #1
      008655 6B 07            [ 1] 1275 	ld	(0x07, sp), a
                                   1276 ;	lib/rtc.c: 50: date	= RTC_ConvertFromBinDec(date);
      008657 7B 0E            [ 1] 1277 	ld	a, (0x0e, sp)
      008659 88               [ 1] 1278 	push	a
      00865A CD 85 64         [ 4] 1279 	call	_RTC_ConvertFromBinDec
      00865D 5B 01            [ 2] 1280 	addw	sp, #1
      00865F 6B 03            [ 1] 1281 	ld	(0x03, sp), a
                                   1282 ;	lib/rtc.c: 51: month	= RTC_ConvertFromBinDec(month);
      008661 7B 0F            [ 1] 1283 	ld	a, (0x0f, sp)
      008663 88               [ 1] 1284 	push	a
      008664 CD 85 64         [ 4] 1285 	call	_RTC_ConvertFromBinDec
      008667 5B 01            [ 2] 1286 	addw	sp, #1
      008669 6B 02            [ 1] 1287 	ld	(0x02, sp), a
                                   1288 ;	lib/rtc.c: 52: year	= RTC_ConvertFromBinDec(year);
      00866B 7B 10            [ 1] 1289 	ld	a, (0x10, sp)
      00866D 88               [ 1] 1290 	push	a
      00866E CD 85 64         [ 4] 1291 	call	_RTC_ConvertFromBinDec
      008671 5B 01            [ 2] 1292 	addw	sp, #1
      008673 6B 01            [ 1] 1293 	ld	(0x01, sp), a
                                   1294 ;	lib/rtc.c: 54: i2c_start();
      008675 CD 83 07         [ 4] 1295 	call	_i2c_start
                                   1296 ;	lib/rtc.c: 55: i2c_send_byte(0xD0);
      008678 4B D0            [ 1] 1297 	push	#0xd0
      00867A CD 83 BE         [ 4] 1298 	call	_i2c_send_byte
      00867D 84               [ 1] 1299 	pop	a
                                   1300 ;	lib/rtc.c: 56: i2c_send_byte(0x00);
      00867E 4B 00            [ 1] 1301 	push	#0x00
      008680 CD 83 BE         [ 4] 1302 	call	_i2c_send_byte
      008683 84               [ 1] 1303 	pop	a
                                   1304 ;	lib/rtc.c: 58: i2c_send_byte(sec);
      008684 7B 04            [ 1] 1305 	ld	a, (0x04, sp)
      008686 88               [ 1] 1306 	push	a
      008687 CD 83 BE         [ 4] 1307 	call	_i2c_send_byte
      00868A 84               [ 1] 1308 	pop	a
                                   1309 ;	lib/rtc.c: 59: i2c_send_byte(min);
      00868B 7B 05            [ 1] 1310 	ld	a, (0x05, sp)
      00868D 88               [ 1] 1311 	push	a
      00868E CD 83 BE         [ 4] 1312 	call	_i2c_send_byte
      008691 84               [ 1] 1313 	pop	a
                                   1314 ;	lib/rtc.c: 60: i2c_send_byte(hour);
      008692 7B 06            [ 1] 1315 	ld	a, (0x06, sp)
      008694 88               [ 1] 1316 	push	a
      008695 CD 83 BE         [ 4] 1317 	call	_i2c_send_byte
      008698 84               [ 1] 1318 	pop	a
                                   1319 ;	lib/rtc.c: 61: i2c_send_byte(day);
      008699 7B 07            [ 1] 1320 	ld	a, (0x07, sp)
      00869B 88               [ 1] 1321 	push	a
      00869C CD 83 BE         [ 4] 1322 	call	_i2c_send_byte
      00869F 84               [ 1] 1323 	pop	a
                                   1324 ;	lib/rtc.c: 62: i2c_send_byte(date);
      0086A0 7B 03            [ 1] 1325 	ld	a, (0x03, sp)
      0086A2 88               [ 1] 1326 	push	a
      0086A3 CD 83 BE         [ 4] 1327 	call	_i2c_send_byte
      0086A6 84               [ 1] 1328 	pop	a
                                   1329 ;	lib/rtc.c: 63: i2c_send_byte(month);
      0086A7 7B 02            [ 1] 1330 	ld	a, (0x02, sp)
      0086A9 88               [ 1] 1331 	push	a
      0086AA CD 83 BE         [ 4] 1332 	call	_i2c_send_byte
      0086AD 84               [ 1] 1333 	pop	a
                                   1334 ;	lib/rtc.c: 64: i2c_send_byte(year);
      0086AE 7B 01            [ 1] 1335 	ld	a, (0x01, sp)
      0086B0 88               [ 1] 1336 	push	a
      0086B1 CD 83 BE         [ 4] 1337 	call	_i2c_send_byte
      0086B4 84               [ 1] 1338 	pop	a
                                   1339 ;	lib/rtc.c: 65: i2c_stop();
      0086B5 CD 82 57         [ 4] 1340 	call	_i2c_stop
      0086B8 5B 07            [ 2] 1341 	addw	sp, #7
      0086BA 81               [ 4] 1342 	ret
                                   1343 ;	lib/rtc.c: 81: void conSec(long secin){
                                   1344 ;	-----------------------------------------
                                   1345 ;	 function conSec
                                   1346 ;	-----------------------------------------
      0086BB                       1347 _conSec:
      0086BB 52 10            [ 2] 1348 	sub	sp, #16
                                   1349 ;	lib/rtc.c: 87: con_day = secin/86400;
      0086BD 4B 80            [ 1] 1350 	push	#0x80
      0086BF 4B 51            [ 1] 1351 	push	#0x51
      0086C1 4B 01            [ 1] 1352 	push	#0x01
      0086C3 4B 00            [ 1] 1353 	push	#0x00
      0086C5 1E 19            [ 2] 1354 	ldw	x, (0x19, sp)
      0086C7 89               [ 2] 1355 	pushw	x
      0086C8 1E 19            [ 2] 1356 	ldw	x, (0x19, sp)
      0086CA 89               [ 2] 1357 	pushw	x
      0086CB CD 94 DD         [ 4] 1358 	call	__divslong
      0086CE 5B 08            [ 2] 1359 	addw	sp, #8
      0086D0 CF 00 37         [ 2] 1360 	ldw	_con_day+2, x
      0086D3 90 CF 00 35      [ 2] 1361 	ldw	_con_day+0, y
                                   1362 ;	lib/rtc.c: 88: secin = secin-(con_day*86400);
      0086D7 3B 00 38         [ 1] 1363 	push	_con_day+3
      0086DA 3B 00 37         [ 1] 1364 	push	_con_day+2
      0086DD 3B 00 36         [ 1] 1365 	push	_con_day+1
      0086E0 3B 00 35         [ 1] 1366 	push	_con_day+0
      0086E3 4B 80            [ 1] 1367 	push	#0x80
      0086E5 4B 51            [ 1] 1368 	push	#0x51
      0086E7 4B 01            [ 1] 1369 	push	#0x01
      0086E9 4B 00            [ 1] 1370 	push	#0x00
      0086EB CD 95 5E         [ 4] 1371 	call	__mullong
      0086EE 5B 08            [ 2] 1372 	addw	sp, #8
      0086F0 1F 07            [ 2] 1373 	ldw	(0x07, sp), x
      0086F2 17 05            [ 2] 1374 	ldw	(0x05, sp), y
      0086F4 16 15            [ 2] 1375 	ldw	y, (0x15, sp)
      0086F6 1E 13            [ 2] 1376 	ldw	x, (0x13, sp)
      0086F8 72 F2 07         [ 2] 1377 	subw	y, (0x07, sp)
      0086FB 9F               [ 1] 1378 	ld	a, xl
      0086FC 12 06            [ 1] 1379 	sbc	a, (0x06, sp)
      0086FE 02               [ 1] 1380 	rlwa	x
      0086FF 12 05            [ 1] 1381 	sbc	a, (0x05, sp)
      008701 95               [ 1] 1382 	ld	xh, a
      008702 17 15            [ 2] 1383 	ldw	(0x15, sp), y
      008704 1F 13            [ 2] 1384 	ldw	(0x13, sp), x
                                   1385 ;	lib/rtc.c: 90: con_hour = (secin/3600);
      008706 4B 10            [ 1] 1386 	push	#0x10
      008708 4B 0E            [ 1] 1387 	push	#0x0e
      00870A 5F               [ 1] 1388 	clrw	x
      00870B 89               [ 2] 1389 	pushw	x
      00870C 1E 19            [ 2] 1390 	ldw	x, (0x19, sp)
      00870E 89               [ 2] 1391 	pushw	x
      00870F 1E 19            [ 2] 1392 	ldw	x, (0x19, sp)
      008711 89               [ 2] 1393 	pushw	x
      008712 CD 94 DD         [ 4] 1394 	call	__divslong
      008715 5B 08            [ 2] 1395 	addw	sp, #8
      008717 CF 00 3B         [ 2] 1396 	ldw	_con_hour+2, x
      00871A 90 CF 00 39      [ 2] 1397 	ldw	_con_hour+0, y
                                   1398 ;	lib/rtc.c: 91: con_min	 = ((secin-(3600*con_hour))/60);
      00871E 3B 00 3C         [ 1] 1399 	push	_con_hour+3
      008721 3B 00 3B         [ 1] 1400 	push	_con_hour+2
      008724 3B 00 3A         [ 1] 1401 	push	_con_hour+1
      008727 3B 00 39         [ 1] 1402 	push	_con_hour+0
      00872A 4B 10            [ 1] 1403 	push	#0x10
      00872C 4B 0E            [ 1] 1404 	push	#0x0e
      00872E 5F               [ 1] 1405 	clrw	x
      00872F 89               [ 2] 1406 	pushw	x
      008730 CD 95 5E         [ 4] 1407 	call	__mullong
      008733 5B 08            [ 2] 1408 	addw	sp, #8
      008735 1F 03            [ 2] 1409 	ldw	(0x03, sp), x
      008737 17 01            [ 2] 1410 	ldw	(0x01, sp), y
      008739 16 15            [ 2] 1411 	ldw	y, (0x15, sp)
      00873B 17 0F            [ 2] 1412 	ldw	(0x0f, sp), y
      00873D 16 13            [ 2] 1413 	ldw	y, (0x13, sp)
      00873F 17 0D            [ 2] 1414 	ldw	(0x0d, sp), y
      008741 16 0F            [ 2] 1415 	ldw	y, (0x0f, sp)
      008743 72 F2 03         [ 2] 1416 	subw	y, (0x03, sp)
      008746 7B 0E            [ 1] 1417 	ld	a, (0x0e, sp)
      008748 12 02            [ 1] 1418 	sbc	a, (0x02, sp)
      00874A 97               [ 1] 1419 	ld	xl, a
      00874B 7B 0D            [ 1] 1420 	ld	a, (0x0d, sp)
      00874D 12 01            [ 1] 1421 	sbc	a, (0x01, sp)
      00874F 95               [ 1] 1422 	ld	xh, a
      008750 4B 3C            [ 1] 1423 	push	#0x3c
      008752 4B 00            [ 1] 1424 	push	#0x00
      008754 4B 00            [ 1] 1425 	push	#0x00
      008756 4B 00            [ 1] 1426 	push	#0x00
      008758 90 89            [ 2] 1427 	pushw	y
      00875A 89               [ 2] 1428 	pushw	x
      00875B CD 95 04         [ 4] 1429 	call	__divulong
      00875E 5B 08            [ 2] 1430 	addw	sp, #8
      008760 CF 00 3F         [ 2] 1431 	ldw	_con_min+2, x
      008763 90 CF 00 3D      [ 2] 1432 	ldw	_con_min+0, y
                                   1433 ;	lib/rtc.c: 92: con_sec	 = (secin-(((con_hour*60)*60)+(con_min*60)));
      008767 3B 00 40         [ 1] 1434 	push	_con_min+3
      00876A 3B 00 3F         [ 1] 1435 	push	_con_min+2
      00876D 3B 00 3E         [ 1] 1436 	push	_con_min+1
      008770 3B 00 3D         [ 1] 1437 	push	_con_min+0
      008773 4B 3C            [ 1] 1438 	push	#0x3c
      008775 5F               [ 1] 1439 	clrw	x
      008776 89               [ 2] 1440 	pushw	x
      008777 4B 00            [ 1] 1441 	push	#0x00
      008779 CD 95 5E         [ 4] 1442 	call	__mullong
      00877C 5B 08            [ 2] 1443 	addw	sp, #8
      00877E 51               [ 1] 1444 	exgw	x, y
      00877F 72 F9 03         [ 2] 1445 	addw	y, (0x03, sp)
      008782 9F               [ 1] 1446 	ld	a, xl
      008783 19 02            [ 1] 1447 	adc	a, (0x02, sp)
      008785 6B 0A            [ 1] 1448 	ld	(0x0a, sp), a
      008787 9E               [ 1] 1449 	ld	a, xh
      008788 19 01            [ 1] 1450 	adc	a, (0x01, sp)
      00878A 95               [ 1] 1451 	ld	xh, a
      00878B 7B 10            [ 1] 1452 	ld	a, (0x10, sp)
      00878D 90 89            [ 2] 1453 	pushw	y
      00878F 10 02            [ 1] 1454 	sub	a, (#2, sp)
      008791 90 85            [ 2] 1455 	popw	y
      008793 90 97            [ 1] 1456 	ld	yl, a
      008795 7B 0F            [ 1] 1457 	ld	a, (0x0f, sp)
      008797 90 89            [ 2] 1458 	pushw	y
      008799 12 01            [ 1] 1459 	sbc	a, (#1, sp)
      00879B 90 85            [ 2] 1460 	popw	y
      00879D 90 95            [ 1] 1461 	ld	yh, a
      00879F 7B 0E            [ 1] 1462 	ld	a, (0x0e, sp)
      0087A1 12 0A            [ 1] 1463 	sbc	a, (0x0a, sp)
      0087A3 97               [ 1] 1464 	ld	xl, a
      0087A4 7B 0D            [ 1] 1465 	ld	a, (0x0d, sp)
      0087A6 89               [ 2] 1466 	pushw	x
      0087A7 12 01            [ 1] 1467 	sbc	a, (#1, sp)
      0087A9 85               [ 2] 1468 	popw	x
      0087AA 95               [ 1] 1469 	ld	xh, a
      0087AB 90 CF 00 43      [ 2] 1470 	ldw	_con_sec+2, y
      0087AF CF 00 41         [ 2] 1471 	ldw	_con_sec+0, x
      0087B2 5B 10            [ 2] 1472 	addw	sp, #16
      0087B4 81               [ 4] 1473 	ret
                                   1474 ;	lib/rtc.c: 95: unsigned long transTime(unsigned long d, unsigned long h, unsigned long m, unsigned long s){ //d, h, m, s
                                   1475 ;	-----------------------------------------
                                   1476 ;	 function transTime
                                   1477 ;	-----------------------------------------
      0087B5                       1478 _transTime:
      0087B5 52 04            [ 2] 1479 	sub	sp, #4
                                   1480 ;	lib/rtc.c: 96: return ((d*86400)+(((h*60)+m)*60+s));
      0087B7 1E 09            [ 2] 1481 	ldw	x, (0x09, sp)
      0087B9 89               [ 2] 1482 	pushw	x
      0087BA 1E 09            [ 2] 1483 	ldw	x, (0x09, sp)
      0087BC 89               [ 2] 1484 	pushw	x
      0087BD 4B 80            [ 1] 1485 	push	#0x80
      0087BF 4B 51            [ 1] 1486 	push	#0x51
      0087C1 4B 01            [ 1] 1487 	push	#0x01
      0087C3 4B 00            [ 1] 1488 	push	#0x00
      0087C5 CD 95 5E         [ 4] 1489 	call	__mullong
      0087C8 5B 08            [ 2] 1490 	addw	sp, #8
      0087CA 1F 03            [ 2] 1491 	ldw	(0x03, sp), x
      0087CC 17 01            [ 2] 1492 	ldw	(0x01, sp), y
      0087CE 1E 0D            [ 2] 1493 	ldw	x, (0x0d, sp)
      0087D0 89               [ 2] 1494 	pushw	x
      0087D1 1E 0D            [ 2] 1495 	ldw	x, (0x0d, sp)
      0087D3 89               [ 2] 1496 	pushw	x
      0087D4 4B 3C            [ 1] 1497 	push	#0x3c
      0087D6 5F               [ 1] 1498 	clrw	x
      0087D7 89               [ 2] 1499 	pushw	x
      0087D8 4B 00            [ 1] 1500 	push	#0x00
      0087DA CD 95 5E         [ 4] 1501 	call	__mullong
      0087DD 5B 08            [ 2] 1502 	addw	sp, #8
      0087DF 51               [ 1] 1503 	exgw	x, y
      0087E0 72 F9 11         [ 2] 1504 	addw	y, (0x11, sp)
      0087E3 9F               [ 1] 1505 	ld	a, xl
      0087E4 19 10            [ 1] 1506 	adc	a, (0x10, sp)
      0087E6 02               [ 1] 1507 	rlwa	x
      0087E7 19 0F            [ 1] 1508 	adc	a, (0x0f, sp)
      0087E9 95               [ 1] 1509 	ld	xh, a
      0087EA 90 89            [ 2] 1510 	pushw	y
      0087EC 89               [ 2] 1511 	pushw	x
      0087ED 4B 3C            [ 1] 1512 	push	#0x3c
      0087EF 5F               [ 1] 1513 	clrw	x
      0087F0 89               [ 2] 1514 	pushw	x
      0087F1 4B 00            [ 1] 1515 	push	#0x00
      0087F3 CD 95 5E         [ 4] 1516 	call	__mullong
      0087F6 5B 08            [ 2] 1517 	addw	sp, #8
      0087F8 51               [ 1] 1518 	exgw	x, y
      0087F9 72 F9 15         [ 2] 1519 	addw	y, (0x15, sp)
      0087FC 9F               [ 1] 1520 	ld	a, xl
      0087FD 19 14            [ 1] 1521 	adc	a, (0x14, sp)
      0087FF 02               [ 1] 1522 	rlwa	x
      008800 19 13            [ 1] 1523 	adc	a, (0x13, sp)
      008802 95               [ 1] 1524 	ld	xh, a
      008803 72 F9 03         [ 2] 1525 	addw	y, (0x03, sp)
      008806 9F               [ 1] 1526 	ld	a, xl
      008807 19 02            [ 1] 1527 	adc	a, (0x02, sp)
      008809 02               [ 1] 1528 	rlwa	x
      00880A 19 01            [ 1] 1529 	adc	a, (0x01, sp)
      00880C 95               [ 1] 1530 	ld	xh, a
      00880D 51               [ 1] 1531 	exgw	x, y
      00880E 5B 04            [ 2] 1532 	addw	sp, #4
      008810 81               [ 4] 1533 	ret
                                   1534 ;	lib/eeprom.c: 3: void EEPROM_UNLOCK(void){
                                   1535 ;	-----------------------------------------
                                   1536 ;	 function EEPROM_UNLOCK
                                   1537 ;	-----------------------------------------
      008811                       1538 _EEPROM_UNLOCK:
                                   1539 ;	lib/eeprom.c: 5: FLASH_DUKR = 0xAE; // unlock EEPROM
      008811 35 AE 50 64      [ 1] 1540 	mov	0x5064+0, #0xae
                                   1541 ;	lib/eeprom.c: 6: FLASH_DUKR = 0x56;
      008815 35 56 50 64      [ 1] 1542 	mov	0x5064+0, #0x56
                                   1543 ;	lib/eeprom.c: 8: while (!(FLASH_IAPSR & (1<<3))); // check protection off
      008819                       1544 00101$:
      008819 AE 50 5F         [ 2] 1545 	ldw	x, #0x505f
      00881C F6               [ 1] 1546 	ld	a, (x)
      00881D A5 08            [ 1] 1547 	bcp	a, #0x08
      00881F 27 F8            [ 1] 1548 	jreq	00101$
      008821 81               [ 4] 1549 	ret
                                   1550 ;	clock.c: 97: void defStart(_Bool pos){ //"r__3" стандартная функция при загрузке 
                                   1551 ;	-----------------------------------------
                                   1552 ;	 function defStart
                                   1553 ;	-----------------------------------------
      008822                       1554 _defStart:
                                   1555 ;	clock.c: 99: switch(pos) {
      008822 7B 03            [ 1] 1556 	ld	a, (0x03, sp)
      008824 A1 00            [ 1] 1557 	cp	a, #0x00
      008826 27 06            [ 1] 1558 	jreq	00101$
      008828 A1 01            [ 1] 1559 	cp	a, #0x01
      00882A 27 05            [ 1] 1560 	jreq	00102$
      00882C 20 06            [ 2] 1561 	jra	00103$
                                   1562 ;	clock.c: 100: case 0: clock();
      00882E                       1563 00101$:
      00882E CD 8F 84         [ 4] 1564 	call	_clock
                                   1565 ;	clock.c: 101: case 1: dnClock();
      008831                       1566 00102$:
      008831 CD 90 5A         [ 4] 1567 	call	_dnClock
                                   1568 ;	clock.c: 102: default: clock();
      008834                       1569 00103$:
                                   1570 ;	clock.c: 103: }
      008834 CC 8F 84         [ 2] 1571 	jp	_clock
                                   1572 ;	clock.c: 109: _Bool setStat(_Bool st){
                                   1573 ;	-----------------------------------------
                                   1574 ;	 function setStat
                                   1575 ;	-----------------------------------------
      008837                       1576 _setStat:
      008837 52 06            [ 2] 1577 	sub	sp, #6
                                   1578 ;	clock.c: 111: TM1637_cleer();
      008839 CD 82 20         [ 4] 1579 	call	_TM1637_cleer
                                   1580 ;	clock.c: 112: Soft_Timer = 0x00;
      00883C 5F               [ 1] 1581 	clrw	x
      00883D CF 00 45         [ 2] 1582 	ldw	_Soft_Timer+0, x
                                   1583 ;	clock.c: 113: buff = st;
      008840 7B 09            [ 1] 1584 	ld	a, (0x09, sp)
      008842 C7 00 4B         [ 1] 1585 	ld	_buff+0, a
                                   1586 ;	clock.c: 115: while(1){
      008845 AE 00 2B         [ 2] 1587 	ldw	x, #_ASCI+0
      008848 1F 03            [ 2] 1588 	ldw	(0x03, sp), x
      00884A                       1589 00108$:
                                   1590 ;	clock.c: 117: if(button(up) | button(dn))buff =! buff;
      00884A 4B 05            [ 1] 1591 	push	#0x05
      00884C CD 89 15         [ 4] 1592 	call	_button
      00884F 5B 01            [ 2] 1593 	addw	sp, #1
      008851 6B 06            [ 1] 1594 	ld	(0x06, sp), a
      008853 4B 07            [ 1] 1595 	push	#0x07
      008855 CD 89 15         [ 4] 1596 	call	_button
      008858 5B 01            [ 2] 1597 	addw	sp, #1
      00885A 1A 06            [ 1] 1598 	or	a, (0x06, sp)
      00885C 4D               [ 1] 1599 	tnz	a
      00885D 27 0A            [ 1] 1600 	jreq	00102$
      00885F C6 00 4B         [ 1] 1601 	ld	a, _buff+0
      008862 A0 01            [ 1] 1602 	sub	a, #0x01
      008864 4F               [ 1] 1603 	clr	a
      008865 49               [ 1] 1604 	rlc	a
      008866 C7 00 4B         [ 1] 1605 	ld	_buff+0, a
      008869                       1606 00102$:
                                   1607 ;	clock.c: 119: if(button(ok)){
      008869 4B 06            [ 1] 1608 	push	#0x06
      00886B CD 89 15         [ 4] 1609 	call	_button
      00886E 5B 01            [ 2] 1610 	addw	sp, #1
      008870 6B 05            [ 1] 1611 	ld	(0x05, sp), a
      008872 0D 05            [ 1] 1612 	tnz	(0x05, sp)
      008874 27 05            [ 1] 1613 	jreq	00104$
                                   1614 ;	clock.c: 120: return buff;
      008876 C6 00 4B         [ 1] 1615 	ld	a, _buff+0
      008879 20 3B            [ 2] 1616 	jra	00110$
      00887B                       1617 00104$:
                                   1618 ;	clock.c: 123: Soft_Timer++;
      00887B CE 00 45         [ 2] 1619 	ldw	x, _Soft_Timer+0
      00887E 5C               [ 2] 1620 	incw	x
                                   1621 ;	clock.c: 124: if(Soft_Timer == 300){
      00887F CF 00 45         [ 2] 1622 	ldw	_Soft_Timer+0, x
      008882 A3 01 2C         [ 2] 1623 	cpw	x, #0x012c
      008885 26 C3            [ 1] 1624 	jrne	00108$
                                   1625 ;	clock.c: 125: TM1637_sendMASS(0x50,0x08,0x00,ASCI[buff]);
      008887 AE 00 27         [ 2] 1626 	ldw	x, #_TM1637_seg+0
      00888A 1F 01            [ 2] 1627 	ldw	(0x01, sp), x
      00888C 1E 01            [ 2] 1628 	ldw	x, (0x01, sp)
      00888E A6 50            [ 1] 1629 	ld	a, #0x50
      008890 F7               [ 1] 1630 	ld	(x), a
      008891 1E 01            [ 2] 1631 	ldw	x, (0x01, sp)
      008893 5C               [ 2] 1632 	incw	x
      008894 A6 08            [ 1] 1633 	ld	a, #0x08
      008896 F7               [ 1] 1634 	ld	(x), a
      008897 1E 01            [ 2] 1635 	ldw	x, (0x01, sp)
      008899 5C               [ 2] 1636 	incw	x
      00889A 5C               [ 2] 1637 	incw	x
      00889B 7F               [ 1] 1638 	clr	(x)
      00889C 16 01            [ 2] 1639 	ldw	y, (0x01, sp)
      00889E 72 A9 00 03      [ 2] 1640 	addw	y, #0x0003
      0088A2 5F               [ 1] 1641 	clrw	x
      0088A3 C6 00 4B         [ 1] 1642 	ld	a, _buff+0
      0088A6 97               [ 1] 1643 	ld	xl, a
      0088A7 72 FB 03         [ 2] 1644 	addw	x, (0x03, sp)
      0088AA F6               [ 1] 1645 	ld	a, (x)
      0088AB 90 F7            [ 1] 1646 	ld	(y), a
      0088AD CD 81 D9         [ 4] 1647 	call	_TM1637_send
                                   1648 ;	clock.c: 126: Soft_Timer = 0x00;
      0088B0 5F               [ 1] 1649 	clrw	x
      0088B1 CF 00 45         [ 2] 1650 	ldw	_Soft_Timer+0, x
      0088B4 20 94            [ 2] 1651 	jra	00108$
      0088B6                       1652 00110$:
      0088B6 5B 06            [ 2] 1653 	addw	sp, #6
      0088B8 81               [ 4] 1654 	ret
                                   1655 ;	clock.c: 131: void main(){
                                   1656 ;	-----------------------------------------
                                   1657 ;	 function main
                                   1658 ;	-----------------------------------------
      0088B9                       1659 _main:
                                   1660 ;	clock.c: 133: PC_DDR &= ~(1<<ok) | (1<<dn) | (1<<up); //инициализация кнопок
      0088B9 AE 50 0C         [ 2] 1661 	ldw	x, #0x500c
      0088BC F6               [ 1] 1662 	ld	a, (x)
      0088BD A4 BF            [ 1] 1663 	and	a, #0xbf
      0088BF F7               [ 1] 1664 	ld	(x), a
                                   1665 ;	clock.c: 135: CLK_CKDIVR= 0b00001000; //Настройка тактирования на 8MHz, 
      0088C0 35 08 50 C6      [ 1] 1666 	mov	0x50c6+0, #0x08
                                   1667 ;	clock.c: 137: TM1637_INIT();
      0088C4 AE 50 0C         [ 2] 1668 	ldw	x, #0x500c
      0088C7 F6               [ 1] 1669 	ld	a, (x)
      0088C8 AA 18            [ 1] 1670 	or	a, #0x18
      0088CA F7               [ 1] 1671 	ld	(x), a
      0088CB AE 50 0D         [ 2] 1672 	ldw	x, #0x500d
      0088CE F6               [ 1] 1673 	ld	a, (x)
      0088CF AA 18            [ 1] 1674 	or	a, #0x18
      0088D1 F7               [ 1] 1675 	ld	(x), a
      0088D2 CD 82 3F         [ 4] 1676 	call	_TM1637_initialization
                                   1677 ;	clock.c: 138: TM1637_brigh(EEPROM_DATA(setting_Brigh));
      0088D5 AE 40 00         [ 2] 1678 	ldw	x, #0x4000
      0088D8 F6               [ 1] 1679 	ld	a, (x)
      0088D9 88               [ 1] 1680 	push	a
      0088DA CD 81 C0         [ 4] 1681 	call	_TM1637_brigh
      0088DD 84               [ 1] 1682 	pop	a
                                   1683 ;	clock.c: 139: I2C_INIT();
      0088DE AE 50 07         [ 2] 1684 	ldw	x, #0x5007
      0088E1 F6               [ 1] 1685 	ld	a, (x)
      0088E2 AA 30            [ 1] 1686 	or	a, #0x30
      0088E4 F7               [ 1] 1687 	ld	(x), a
      0088E5 AE 50 08         [ 2] 1688 	ldw	x, #0x5008
      0088E8 F6               [ 1] 1689 	ld	a, (x)
      0088E9 AA 30            [ 1] 1690 	or	a, #0x30
      0088EB F7               [ 1] 1691 	ld	(x), a
      0088EC CD 83 9F         [ 4] 1692 	call	_i2c_init
                                   1693 ;	clock.c: 141: if(button(up) || button(dn))hard_Reset(); // Кнопки при включении зажать up + dn = hard reset
      0088EF 4B 05            [ 1] 1694 	push	#0x05
      0088F1 CD 89 15         [ 4] 1695 	call	_button
      0088F4 5B 01            [ 2] 1696 	addw	sp, #1
      0088F6 4D               [ 1] 1697 	tnz	a
      0088F7 26 0A            [ 1] 1698 	jrne	00101$
      0088F9 4B 07            [ 1] 1699 	push	#0x07
      0088FB CD 89 15         [ 4] 1700 	call	_button
      0088FE 5B 01            [ 2] 1701 	addw	sp, #1
      008900 4D               [ 1] 1702 	tnz	a
      008901 27 03            [ 1] 1703 	jreq	00105$
      008903                       1704 00101$:
      008903 CD 89 72         [ 4] 1705 	call	_hard_Reset
                                   1706 ;	clock.c: 144: while(1){
      008906                       1707 00105$:
                                   1708 ;	clock.c: 146: defStart(EEPROM_DATA(defStartER));
      008906 AE 40 08         [ 2] 1709 	ldw	x, #0x4008
      008909 F6               [ 1] 1710 	ld	a, (x)
      00890A 40               [ 1] 1711 	neg	a
      00890B 4F               [ 1] 1712 	clr	a
      00890C 49               [ 1] 1713 	rlc	a
      00890D 88               [ 1] 1714 	push	a
      00890E CD 88 22         [ 4] 1715 	call	_defStart
      008911 84               [ 1] 1716 	pop	a
      008912 20 F2            [ 2] 1717 	jra	00105$
      008914 81               [ 4] 1718 	ret
                                   1719 ;	clock.c: 154: char button(char but){ //Обработка кнопок
                                   1720 ;	-----------------------------------------
                                   1721 ;	 function button
                                   1722 ;	-----------------------------------------
      008915                       1723 _button:
      008915 52 04            [ 2] 1724 	sub	sp, #4
                                   1725 ;	clock.c: 156: if(!(PC_IDR&(1<<but))){
      008917 AE 50 0B         [ 2] 1726 	ldw	x, #0x500b
      00891A F6               [ 1] 1727 	ld	a, (x)
      00891B 95               [ 1] 1728 	ld	xh, a
      00891C 90 AE 00 01      [ 2] 1729 	ldw	y, #0x0001
      008920 17 03            [ 2] 1730 	ldw	(0x03, sp), y
      008922 7B 07            [ 1] 1731 	ld	a, (0x07, sp)
      008924 27 07            [ 1] 1732 	jreq	00117$
      008926                       1733 00116$:
      008926 08 04            [ 1] 1734 	sll	(0x04, sp)
      008928 09 03            [ 1] 1735 	rlc	(0x03, sp)
      00892A 4A               [ 1] 1736 	dec	a
      00892B 26 F9            [ 1] 1737 	jrne	00116$
      00892D                       1738 00117$:
      00892D 4F               [ 1] 1739 	clr	a
      00892E 97               [ 1] 1740 	ld	xl, a
                                   1741 ;	clock.c: 158: Buff_But &= ~(1 << but);
      00892F A6 01            [ 1] 1742 	ld	a, #0x01
      008931 90 97            [ 1] 1743 	ld	yl, a
      008933 7B 07            [ 1] 1744 	ld	a, (0x07, sp)
      008935 27 06            [ 1] 1745 	jreq	00119$
      008937                       1746 00118$:
      008937 61               [ 1] 1747 	exg	a, yl
      008938 48               [ 1] 1748 	sll	a
      008939 61               [ 1] 1749 	exg	a, yl
      00893A 4A               [ 1] 1750 	dec	a
      00893B 26 FA            [ 1] 1751 	jrne	00118$
      00893D                       1752 00119$:
                                   1753 ;	clock.c: 156: if(!(PC_IDR&(1<<but))){
      00893D 9E               [ 1] 1754 	ld	a, xh
      00893E 14 04            [ 1] 1755 	and	a, (0x04, sp)
      008940 6B 02            [ 1] 1756 	ld	(0x02, sp), a
      008942 9F               [ 1] 1757 	ld	a, xl
      008943 14 03            [ 1] 1758 	and	a, (0x03, sp)
      008945 6B 01            [ 1] 1759 	ld	(0x01, sp), a
      008947 1E 01            [ 2] 1760 	ldw	x, (0x01, sp)
      008949 26 1B            [ 1] 1761 	jrne	00104$
                                   1762 ;	clock.c: 157: if(Buff_But&(1 << but)){
      00894B C6 00 49         [ 1] 1763 	ld	a, _Buff_But+0
      00894E 95               [ 1] 1764 	ld	xh, a
      00894F 4F               [ 1] 1765 	clr	a
      008950 14 03            [ 1] 1766 	and	a, (0x03, sp)
      008952 02               [ 1] 1767 	rlwa	x
      008953 14 04            [ 1] 1768 	and	a, (0x04, sp)
      008955 95               [ 1] 1769 	ld	xh, a
      008956 5D               [ 2] 1770 	tnzw	x
      008957 27 15            [ 1] 1771 	jreq	00105$
                                   1772 ;	clock.c: 158: Buff_But &= ~(1 << but);
      008959 90 9F            [ 1] 1773 	ld	a, yl
      00895B 43               [ 1] 1774 	cpl	a
      00895C C4 00 49         [ 1] 1775 	and	a, _Buff_But+0
      00895F C7 00 49         [ 1] 1776 	ld	_Buff_But+0, a
                                   1777 ;	clock.c: 159: return but;
      008962 7B 07            [ 1] 1778 	ld	a, (0x07, sp)
      008964 20 09            [ 2] 1779 	jra	00106$
      008966                       1780 00104$:
                                   1781 ;	clock.c: 162: else Buff_But |= (1 << but);
      008966 90 9F            [ 1] 1782 	ld	a, yl
      008968 CA 00 49         [ 1] 1783 	or	a, _Buff_But+0
      00896B C7 00 49         [ 1] 1784 	ld	_Buff_But+0, a
      00896E                       1785 00105$:
                                   1786 ;	clock.c: 165: return 0;
      00896E 4F               [ 1] 1787 	clr	a
      00896F                       1788 00106$:
      00896F 5B 04            [ 2] 1789 	addw	sp, #4
      008971 81               [ 4] 1790 	ret
                                   1791 ;	clock.c: 168: void hard_Reset(){ //default setting
                                   1792 ;	-----------------------------------------
                                   1793 ;	 function hard_Reset
                                   1794 ;	-----------------------------------------
      008972                       1795 _hard_Reset:
      008972 52 02            [ 2] 1796 	sub	sp, #2
                                   1797 ;	clock.c: 170: EEPROM_UNLOCK();
      008974 CD 88 11         [ 4] 1798 	call	_EEPROM_UNLOCK
                                   1799 ;	clock.c: 171: EEPROM_DATA(setting_Brigh) = 7;
      008977 35 07 40 00      [ 1] 1800 	mov	0x4000+0, #0x07
                                   1801 ;	clock.c: 173: EEPROM_DATA(DnClock_hour_0) = 0x00;
      00897B 35 00 40 00      [ 1] 1802 	mov	0x4000+0, #0x00
                                   1803 ;	clock.c: 174: EEPROM_DATA(DnClock_min_0)	= 0x00;
      00897F 35 00 40 01      [ 1] 1804 	mov	0x4001+0, #0x00
                                   1805 ;	clock.c: 176: EEPROM_DATA(DnClock_hour_1) = 0x00;
      008983 35 00 40 02      [ 1] 1806 	mov	0x4002+0, #0x00
                                   1807 ;	clock.c: 177: EEPROM_DATA(DnClock_min_1)	= 0x00;
      008987 35 00 40 03      [ 1] 1808 	mov	0x4003+0, #0x00
                                   1809 ;	clock.c: 179: EEPROM_DATA(DnClock_hour_2) = 0x00;
      00898B 35 00 40 04      [ 1] 1810 	mov	0x4004+0, #0x00
                                   1811 ;	clock.c: 180: EEPROM_DATA(DnClock_min_2)	= 0x00;
      00898F 35 00 40 05      [ 1] 1812 	mov	0x4005+0, #0x00
                                   1813 ;	clock.c: 182: EEPROM_DATA(DnClock_hour_3) = 0x00;
      008993 35 00 40 06      [ 1] 1814 	mov	0x4006+0, #0x00
                                   1815 ;	clock.c: 183: EEPROM_DATA(DnClock_min_3)	= 0x00;		
      008997 35 00 40 07      [ 1] 1816 	mov	0x4007+0, #0x00
                                   1817 ;	clock.c: 184: EEPROM_LOCK();
      00899B AE 50 5F         [ 2] 1818 	ldw	x, #0x505f
      00899E F6               [ 1] 1819 	ld	a, (x)
      00899F A4 F7            [ 1] 1820 	and	a, #0xf7
      0089A1 F7               [ 1] 1821 	ld	(x), a
                                   1822 ;	clock.c: 186: RTC_Set(0, 0, 0, 1, 1, 1, 20); //reset RTC
      0089A2 4B 14            [ 1] 1823 	push	#0x14
      0089A4 4B 01            [ 1] 1824 	push	#0x01
      0089A6 4B 01            [ 1] 1825 	push	#0x01
      0089A8 4B 01            [ 1] 1826 	push	#0x01
      0089AA 4B 00            [ 1] 1827 	push	#0x00
      0089AC 4B 00            [ 1] 1828 	push	#0x00
      0089AE 4B 00            [ 1] 1829 	push	#0x00
      0089B0 CD 86 2D         [ 4] 1830 	call	_RTC_Set
      0089B3 5B 07            [ 2] 1831 	addw	sp, #7
                                   1832 ;	clock.c: 189: TM1637_cleer();
      0089B5 CD 82 20         [ 4] 1833 	call	_TM1637_cleer
                                   1834 ;	clock.c: 190: TM1637_sendMASS(0x50,0x6D,0x78,0x00); //RESET
      0089B8 AE 00 27         [ 2] 1835 	ldw	x, #_TM1637_seg+0
      0089BB 1F 01            [ 2] 1836 	ldw	(0x01, sp), x
      0089BD 1E 01            [ 2] 1837 	ldw	x, (0x01, sp)
      0089BF A6 50            [ 1] 1838 	ld	a, #0x50
      0089C1 F7               [ 1] 1839 	ld	(x), a
      0089C2 1E 01            [ 2] 1840 	ldw	x, (0x01, sp)
      0089C4 5C               [ 2] 1841 	incw	x
      0089C5 A6 6D            [ 1] 1842 	ld	a, #0x6d
      0089C7 F7               [ 1] 1843 	ld	(x), a
      0089C8 1E 01            [ 2] 1844 	ldw	x, (0x01, sp)
      0089CA 5C               [ 2] 1845 	incw	x
      0089CB 5C               [ 2] 1846 	incw	x
      0089CC A6 78            [ 1] 1847 	ld	a, #0x78
      0089CE F7               [ 1] 1848 	ld	(x), a
      0089CF 1E 01            [ 2] 1849 	ldw	x, (0x01, sp)
      0089D1 1C 00 03         [ 2] 1850 	addw	x, #0x0003
      0089D4 7F               [ 1] 1851 	clr	(x)
      0089D5 CD 81 D9         [ 4] 1852 	call	_TM1637_send
                                   1853 ;	clock.c: 191: delay(99999);
      0089D8 4B 9F            [ 1] 1854 	push	#0x9f
      0089DA 4B 86            [ 1] 1855 	push	#0x86
      0089DC 4B 01            [ 1] 1856 	push	#0x01
      0089DE 4B 00            [ 1] 1857 	push	#0x00
      0089E0 CD 80 A0         [ 4] 1858 	call	_delay
      0089E3 5B 04            [ 2] 1859 	addw	sp, #4
                                   1860 ;	clock.c: 193: WWDG_CR |= (1<<7); //software reset
      0089E5 AE 50 D1         [ 2] 1861 	ldw	x, #0x50d1
      0089E8 F6               [ 1] 1862 	ld	a, (x)
      0089E9 AA 80            [ 1] 1863 	or	a, #0x80
      0089EB F7               [ 1] 1864 	ld	(x), a
                                   1865 ;	clock.c: 194: WWDG_CR = 0x40; 
      0089EC 35 40 50 D1      [ 1] 1866 	mov	0x50d1+0, #0x40
                                   1867 ;	clock.c: 195: WWDG_CR = 0x3F;
      0089F0 35 3F 50 D1      [ 1] 1868 	mov	0x50d1+0, #0x3f
      0089F4 5B 02            [ 2] 1869 	addw	sp, #2
      0089F6 81               [ 4] 1870 	ret
                                   1871 ;	clock.c: 202: char Set_time(unsigned char hourset, unsigned char minset){
                                   1872 ;	-----------------------------------------
                                   1873 ;	 function Set_time
                                   1874 ;	-----------------------------------------
      0089F7                       1875 _Set_time:
      0089F7 52 0C            [ 2] 1876 	sub	sp, #12
                                   1877 ;	clock.c: 204: TM1637_cleer();
      0089F9 CD 82 20         [ 4] 1878 	call	_TM1637_cleer
                                   1879 ;	clock.c: 206: Soft_Timer = 0x00;
      0089FC 5F               [ 1] 1880 	clrw	x
      0089FD CF 00 45         [ 2] 1881 	ldw	_Soft_Timer+0, x
                                   1882 ;	clock.c: 209: while(1){
      008A00 AE 00 2B         [ 2] 1883 	ldw	x, #_ASCI+0
      008A03 1F 0A            [ 2] 1884 	ldw	(0x0a, sp), x
      008A05 AE 00 27         [ 2] 1885 	ldw	x, #_TM1637_seg+0
      008A08 1F 08            [ 2] 1886 	ldw	(0x08, sp), x
      008A0A 0F 01            [ 1] 1887 	clr	(0x01, sp)
      008A0C                       1888 00140$:
                                   1889 ;	clock.c: 211: if(button(up)){
      008A0C 4B 05            [ 1] 1890 	push	#0x05
      008A0E CD 89 15         [ 4] 1891 	call	_button
      008A11 5B 01            [ 2] 1892 	addw	sp, #1
      008A13 95               [ 1] 1893 	ld	xh, a
                                   1894 ;	clock.c: 216: if(Point == 1){
      008A14 7B 01            [ 1] 1895 	ld	a, (0x01, sp)
      008A16 A1 01            [ 1] 1896 	cp	a, #0x01
      008A18 26 06            [ 1] 1897 	jrne	00226$
      008A1A A6 01            [ 1] 1898 	ld	a, #0x01
      008A1C 6B 0C            [ 1] 1899 	ld	(0x0c, sp), a
      008A1E 20 02            [ 2] 1900 	jra	00227$
      008A20                       1901 00226$:
      008A20 0F 0C            [ 1] 1902 	clr	(0x0c, sp)
      008A22                       1903 00227$:
                                   1904 ;	clock.c: 211: if(button(up)){
      008A22 9E               [ 1] 1905 	ld	a, xh
      008A23 4D               [ 1] 1906 	tnz	a
      008A24 27 1C            [ 1] 1907 	jreq	00110$
                                   1908 ;	clock.c: 212: if(Point == 0){
      008A26 0D 01            [ 1] 1909 	tnz	(0x01, sp)
      008A28 26 0A            [ 1] 1910 	jrne	00104$
                                   1911 ;	clock.c: 213: hourset++;
      008A2A 0C 0F            [ 1] 1912 	inc	(0x0f, sp)
                                   1913 ;	clock.c: 214: if(hourset > 23)hourset = 0;
      008A2C 7B 0F            [ 1] 1914 	ld	a, (0x0f, sp)
      008A2E A1 17            [ 1] 1915 	cp	a, #0x17
      008A30 23 02            [ 2] 1916 	jrule	00104$
      008A32 0F 0F            [ 1] 1917 	clr	(0x0f, sp)
      008A34                       1918 00104$:
                                   1919 ;	clock.c: 216: if(Point == 1){
      008A34 0D 0C            [ 1] 1920 	tnz	(0x0c, sp)
      008A36 27 0A            [ 1] 1921 	jreq	00110$
                                   1922 ;	clock.c: 217: minset++;
      008A38 0C 10            [ 1] 1923 	inc	(0x10, sp)
                                   1924 ;	clock.c: 218: if(minset > 59)minset = 0;
      008A3A 7B 10            [ 1] 1925 	ld	a, (0x10, sp)
      008A3C A1 3B            [ 1] 1926 	cp	a, #0x3b
      008A3E 23 02            [ 2] 1927 	jrule	00110$
      008A40 0F 10            [ 1] 1928 	clr	(0x10, sp)
      008A42                       1929 00110$:
                                   1930 ;	clock.c: 221: if(button(dn)){
      008A42 4B 07            [ 1] 1931 	push	#0x07
      008A44 CD 89 15         [ 4] 1932 	call	_button
      008A47 5B 01            [ 2] 1933 	addw	sp, #1
      008A49 4D               [ 1] 1934 	tnz	a
      008A4A 27 20            [ 1] 1935 	jreq	00120$
                                   1936 ;	clock.c: 222: if(Point == 0){
      008A4C 0D 01            [ 1] 1937 	tnz	(0x01, sp)
      008A4E 26 0C            [ 1] 1938 	jrne	00114$
                                   1939 ;	clock.c: 223: hourset--;
      008A50 0A 0F            [ 1] 1940 	dec	(0x0f, sp)
                                   1941 ;	clock.c: 224: if(hourset > 23)hourset = 23;
      008A52 7B 0F            [ 1] 1942 	ld	a, (0x0f, sp)
      008A54 A1 17            [ 1] 1943 	cp	a, #0x17
      008A56 23 04            [ 2] 1944 	jrule	00114$
      008A58 A6 17            [ 1] 1945 	ld	a, #0x17
      008A5A 6B 0F            [ 1] 1946 	ld	(0x0f, sp), a
      008A5C                       1947 00114$:
                                   1948 ;	clock.c: 226: if(Point == 1){
      008A5C 0D 0C            [ 1] 1949 	tnz	(0x0c, sp)
      008A5E 27 0C            [ 1] 1950 	jreq	00120$
                                   1951 ;	clock.c: 227: minset--;
      008A60 0A 10            [ 1] 1952 	dec	(0x10, sp)
                                   1953 ;	clock.c: 228: if(minset > 59)minset = 59;
      008A62 7B 10            [ 1] 1954 	ld	a, (0x10, sp)
      008A64 A1 3B            [ 1] 1955 	cp	a, #0x3b
      008A66 23 04            [ 2] 1956 	jrule	00120$
      008A68 A6 3B            [ 1] 1957 	ld	a, #0x3b
      008A6A 6B 10            [ 1] 1958 	ld	(0x10, sp), a
      008A6C                       1959 00120$:
                                   1960 ;	clock.c: 231: if(button(ok)){
      008A6C 4B 06            [ 1] 1961 	push	#0x06
      008A6E CD 89 15         [ 4] 1962 	call	_button
      008A71 5B 01            [ 2] 1963 	addw	sp, #1
      008A73 4D               [ 1] 1964 	tnz	a
      008A74 27 02            [ 1] 1965 	jreq	00122$
                                   1966 ;	clock.c: 232: Point++;
      008A76 0C 01            [ 1] 1967 	inc	(0x01, sp)
      008A78                       1968 00122$:
                                   1969 ;	clock.c: 236: Soft_Timer++; //мигание
      008A78 CE 00 45         [ 2] 1970 	ldw	x, _Soft_Timer+0
      008A7B 5C               [ 2] 1971 	incw	x
                                   1972 ;	clock.c: 237: if(Soft_Timer == 80){			
      008A7C CF 00 45         [ 2] 1973 	ldw	_Soft_Timer+0, x
      008A7F A3 00 50         [ 2] 1974 	cpw	x, #0x0050
      008A82 26 0E            [ 1] 1975 	jrne	00124$
                                   1976 ;	clock.c: 238: dot = !dot;
      008A84 C6 00 08         [ 1] 1977 	ld	a, _dot+0
      008A87 A0 01            [ 1] 1978 	sub	a, #0x01
      008A89 4F               [ 1] 1979 	clr	a
      008A8A 49               [ 1] 1980 	rlc	a
      008A8B C7 00 08         [ 1] 1981 	ld	_dot+0, a
                                   1982 ;	clock.c: 239: Soft_Timer = 0;
      008A8E 5F               [ 1] 1983 	clrw	x
      008A8F CF 00 45         [ 2] 1984 	ldw	_Soft_Timer+0, x
      008A92                       1985 00124$:
                                   1986 ;	clock.c: 244: if(Point<2){ 
      008A92 7B 01            [ 1] 1987 	ld	a, (0x01, sp)
      008A94 A1 02            [ 1] 1988 	cp	a, #0x02
      008A96 2F 03            [ 1] 1989 	jrslt	00242$
      008A98 CC 8B 25         [ 2] 1990 	jp	00136$
      008A9B                       1991 00242$:
                                   1992 ;	clock.c: 247: TM1637_seg[1] = 0x00;					
      008A9B 1E 08            [ 2] 1993 	ldw	x, (0x08, sp)
      008A9D 5C               [ 2] 1994 	incw	x
      008A9E 1F 04            [ 2] 1995 	ldw	(0x04, sp), x
                                   1996 ;	clock.c: 245: if(Point == 0 && dot == 1){
      008AA0 0D 01            [ 1] 1997 	tnz	(0x01, sp)
      008AA2 26 0F            [ 1] 1998 	jrne	00128$
      008AA4 C6 00 08         [ 1] 1999 	ld	a, _dot+0
      008AA7 A1 01            [ 1] 2000 	cp	a, #0x01
      008AA9 26 08            [ 1] 2001 	jrne	00128$
                                   2002 ;	clock.c: 246: TM1637_seg[0] = 0x00;
      008AAB 1E 08            [ 2] 2003 	ldw	x, (0x08, sp)
      008AAD 7F               [ 1] 2004 	clr	(x)
                                   2005 ;	clock.c: 247: TM1637_seg[1] = 0x00;					
      008AAE 1E 04            [ 2] 2006 	ldw	x, (0x04, sp)
      008AB0 7F               [ 1] 2007 	clr	(x)
      008AB1 20 28            [ 2] 2008 	jra	00129$
      008AB3                       2009 00128$:
                                   2010 ;	clock.c: 250: if(hourset/10)TM1637_seg[0] = ASCI[hourset/10];
      008AB3 5F               [ 1] 2011 	clrw	x
      008AB4 7B 0F            [ 1] 2012 	ld	a, (0x0f, sp)
      008AB6 97               [ 1] 2013 	ld	xl, a
      008AB7 A6 0A            [ 1] 2014 	ld	a, #0x0a
      008AB9 62               [ 2] 2015 	div	x, a
      008ABA 9F               [ 1] 2016 	ld	a, xl
      008ABB 4D               [ 1] 2017 	tnz	a
      008ABC 27 0D            [ 1] 2018 	jreq	00126$
      008ABE 4F               [ 1] 2019 	clr	a
      008ABF 95               [ 1] 2020 	ld	xh, a
      008AC0 72 FB 0A         [ 2] 2021 	addw	x, (0x0a, sp)
      008AC3 1F 06            [ 2] 2022 	ldw	(0x06, sp), x
      008AC5 1E 06            [ 2] 2023 	ldw	x, (0x06, sp)
      008AC7 F6               [ 1] 2024 	ld	a, (x)
      008AC8 1E 08            [ 2] 2025 	ldw	x, (0x08, sp)
      008ACA F7               [ 1] 2026 	ld	(x), a
      008ACB                       2027 00126$:
                                   2028 ;	clock.c: 251: TM1637_seg[1] = ASCI[hourset%10];		
      008ACB 5F               [ 1] 2029 	clrw	x
      008ACC 7B 0F            [ 1] 2030 	ld	a, (0x0f, sp)
      008ACE 97               [ 1] 2031 	ld	xl, a
      008ACF A6 0A            [ 1] 2032 	ld	a, #0x0a
      008AD1 62               [ 2] 2033 	div	x, a
      008AD2 5F               [ 1] 2034 	clrw	x
      008AD3 97               [ 1] 2035 	ld	xl, a
      008AD4 72 FB 0A         [ 2] 2036 	addw	x, (0x0a, sp)
      008AD7 F6               [ 1] 2037 	ld	a, (x)
      008AD8 1E 04            [ 2] 2038 	ldw	x, (0x04, sp)
      008ADA F7               [ 1] 2039 	ld	(x), a
      008ADB                       2040 00129$:
                                   2041 ;	clock.c: 254: TM1637_seg[1] = TM1637_seg[1] +0x80;
      008ADB 1E 04            [ 2] 2042 	ldw	x, (0x04, sp)
      008ADD F6               [ 1] 2043 	ld	a, (x)
      008ADE AB 80            [ 1] 2044 	add	a, #0x80
      008AE0 1E 04            [ 2] 2045 	ldw	x, (0x04, sp)
      008AE2 F7               [ 1] 2046 	ld	(x), a
                                   2047 ;	clock.c: 257: TM1637_seg[2] = 0x00;
      008AE3 1E 08            [ 2] 2048 	ldw	x, (0x08, sp)
      008AE5 5C               [ 2] 2049 	incw	x
      008AE6 5C               [ 2] 2050 	incw	x
      008AE7 1F 02            [ 2] 2051 	ldw	(0x02, sp), x
                                   2052 ;	clock.c: 258: TM1637_seg[3] = 0x00;					
      008AE9 16 08            [ 2] 2053 	ldw	y, (0x08, sp)
      008AEB 72 A9 00 03      [ 2] 2054 	addw	y, #0x0003
                                   2055 ;	clock.c: 256: if(Point == 1 && dot == 1){
      008AEF 7B 01            [ 1] 2056 	ld	a, (0x01, sp)
      008AF1 A1 01            [ 1] 2057 	cp	a, #0x01
      008AF3 26 0E            [ 1] 2058 	jrne	00132$
      008AF5 C6 00 08         [ 1] 2059 	ld	a, _dot+0
      008AF8 A1 01            [ 1] 2060 	cp	a, #0x01
      008AFA 26 07            [ 1] 2061 	jrne	00132$
                                   2062 ;	clock.c: 257: TM1637_seg[2] = 0x00;
      008AFC 1E 02            [ 2] 2063 	ldw	x, (0x02, sp)
      008AFE 7F               [ 1] 2064 	clr	(x)
                                   2065 ;	clock.c: 258: TM1637_seg[3] = 0x00;					
      008AFF 90 7F            [ 1] 2066 	clr	(y)
      008B01 20 1F            [ 2] 2067 	jra	00133$
      008B03                       2068 00132$:
                                   2069 ;	clock.c: 261: TM1637_seg[2] = ASCI[minset/10];
      008B03 5F               [ 1] 2070 	clrw	x
      008B04 7B 10            [ 1] 2071 	ld	a, (0x10, sp)
      008B06 97               [ 1] 2072 	ld	xl, a
      008B07 A6 0A            [ 1] 2073 	ld	a, #0x0a
      008B09 62               [ 2] 2074 	div	x, a
      008B0A 4F               [ 1] 2075 	clr	a
      008B0B 95               [ 1] 2076 	ld	xh, a
      008B0C 72 FB 0A         [ 2] 2077 	addw	x, (0x0a, sp)
      008B0F F6               [ 1] 2078 	ld	a, (x)
      008B10 1E 02            [ 2] 2079 	ldw	x, (0x02, sp)
      008B12 F7               [ 1] 2080 	ld	(x), a
                                   2081 ;	clock.c: 262: TM1637_seg[3] = ASCI[minset%10];		
      008B13 5F               [ 1] 2082 	clrw	x
      008B14 7B 10            [ 1] 2083 	ld	a, (0x10, sp)
      008B16 97               [ 1] 2084 	ld	xl, a
      008B17 A6 0A            [ 1] 2085 	ld	a, #0x0a
      008B19 62               [ 2] 2086 	div	x, a
      008B1A 5F               [ 1] 2087 	clrw	x
      008B1B 97               [ 1] 2088 	ld	xl, a
      008B1C 72 FB 0A         [ 2] 2089 	addw	x, (0x0a, sp)
      008B1F F6               [ 1] 2090 	ld	a, (x)
      008B20 90 F7            [ 1] 2091 	ld	(y), a
      008B22                       2092 00133$:
                                   2093 ;	clock.c: 264: TM1637_send();				
      008B22 CD 81 D9         [ 4] 2094 	call	_TM1637_send
      008B25                       2095 00136$:
                                   2096 ;	clock.c: 267: if(Point == 2){
      008B25 7B 01            [ 1] 2097 	ld	a, (0x01, sp)
      008B27 A1 02            [ 1] 2098 	cp	a, #0x02
      008B29 27 03            [ 1] 2099 	jreq	00256$
      008B2B CC 8A 0C         [ 2] 2100 	jp	00140$
      008B2E                       2101 00256$:
                                   2102 ;	clock.c: 268: Clock_Temp[0] = hourset;
      008B2E AE 00 09         [ 2] 2103 	ldw	x, #_Clock_Temp+0
      008B31 7B 0F            [ 1] 2104 	ld	a, (0x0f, sp)
      008B33 F7               [ 1] 2105 	ld	(x), a
                                   2106 ;	clock.c: 269: Clock_Temp[1] = minset;
      008B34 5C               [ 2] 2107 	incw	x
      008B35 7B 10            [ 1] 2108 	ld	a, (0x10, sp)
      008B37 F7               [ 1] 2109 	ld	(x), a
                                   2110 ;	clock.c: 270: Soft_Timer = 0x00;
      008B38 5F               [ 1] 2111 	clrw	x
      008B39 CF 00 45         [ 2] 2112 	ldw	_Soft_Timer+0, x
                                   2113 ;	clock.c: 271: return 1;
      008B3C A6 01            [ 1] 2114 	ld	a, #0x01
      008B3E 5B 0C            [ 2] 2115 	addw	sp, #12
      008B40 81               [ 4] 2116 	ret
                                   2117 ;	clock.c: 277: char Set_Brigh(){
                                   2118 ;	-----------------------------------------
                                   2119 ;	 function Set_Brigh
                                   2120 ;	-----------------------------------------
      008B41                       2121 _Set_Brigh:
      008B41 52 04            [ 2] 2122 	sub	sp, #4
                                   2123 ;	clock.c: 278: TM1637_cleer();
      008B43 CD 82 20         [ 4] 2124 	call	_TM1637_cleer
                                   2125 ;	clock.c: 279: Soft_Timer = 0x00;
      008B46 5F               [ 1] 2126 	clrw	x
      008B47 CF 00 45         [ 2] 2127 	ldw	_Soft_Timer+0, x
                                   2128 ;	clock.c: 280: Point_Meny = EEPROM_DATA(setting_Brigh);
      008B4A AE 40 00         [ 2] 2129 	ldw	x, #0x4000
      008B4D F6               [ 1] 2130 	ld	a, (x)
      008B4E 97               [ 1] 2131 	ld	xl, a
      008B4F 49               [ 1] 2132 	rlc	a
      008B50 4F               [ 1] 2133 	clr	a
      008B51 A2 00            [ 1] 2134 	sbc	a, #0x00
      008B53 95               [ 1] 2135 	ld	xh, a
      008B54 CF 00 47         [ 2] 2136 	ldw	_Point_Meny+0, x
                                   2137 ;	clock.c: 282: auto_exit = 0;
      008B57 72 5F 00 4A      [ 1] 2138 	clr	_auto_exit+0
                                   2139 ;	clock.c: 284: while(1){
      008B5B AE 00 2B         [ 2] 2140 	ldw	x, #_ASCI+0
      008B5E 1F 01            [ 2] 2141 	ldw	(0x01, sp), x
      008B60                       2142 00116$:
                                   2143 ;	clock.c: 286: if(button(up)){
      008B60 4B 05            [ 1] 2144 	push	#0x05
      008B62 CD 89 15         [ 4] 2145 	call	_button
      008B65 5B 01            [ 2] 2146 	addw	sp, #1
      008B67 4D               [ 1] 2147 	tnz	a
      008B68 27 19            [ 1] 2148 	jreq	00104$
                                   2149 ;	clock.c: 287: Point_Meny++;
      008B6A CE 00 47         [ 2] 2150 	ldw	x, _Point_Meny+0
      008B6D 5C               [ 2] 2151 	incw	x
      008B6E CF 00 47         [ 2] 2152 	ldw	_Point_Meny+0, x
                                   2153 ;	clock.c: 288: auto_exit = 0;
      008B71 72 5F 00 4A      [ 1] 2154 	clr	_auto_exit+0
                                   2155 ;	clock.c: 289: if(Point_Meny > 7)Point_Meny = 7;
      008B75 CE 00 47         [ 2] 2156 	ldw	x, _Point_Meny+0
      008B78 A3 00 07         [ 2] 2157 	cpw	x, #0x0007
      008B7B 23 06            [ 2] 2158 	jrule	00104$
      008B7D AE 00 07         [ 2] 2159 	ldw	x, #0x0007
      008B80 CF 00 47         [ 2] 2160 	ldw	_Point_Meny+0, x
      008B83                       2161 00104$:
                                   2162 ;	clock.c: 292: if(button(dn)){
      008B83 4B 07            [ 1] 2163 	push	#0x07
      008B85 CD 89 15         [ 4] 2164 	call	_button
      008B88 5B 01            [ 2] 2165 	addw	sp, #1
      008B8A 4D               [ 1] 2166 	tnz	a
      008B8B 27 17            [ 1] 2167 	jreq	00108$
                                   2168 ;	clock.c: 293: Point_Meny--;
      008B8D CE 00 47         [ 2] 2169 	ldw	x, _Point_Meny+0
      008B90 5A               [ 2] 2170 	decw	x
      008B91 CF 00 47         [ 2] 2171 	ldw	_Point_Meny+0, x
                                   2172 ;	clock.c: 294: auto_exit = 0;
      008B94 72 5F 00 4A      [ 1] 2173 	clr	_auto_exit+0
                                   2174 ;	clock.c: 295: if(Point_Meny > 7)Point_Meny = 0;
      008B98 CE 00 47         [ 2] 2175 	ldw	x, _Point_Meny+0
      008B9B A3 00 07         [ 2] 2176 	cpw	x, #0x0007
      008B9E 23 04            [ 2] 2177 	jrule	00108$
      008BA0 5F               [ 1] 2178 	clrw	x
      008BA1 CF 00 47         [ 2] 2179 	ldw	_Point_Meny+0, x
      008BA4                       2180 00108$:
                                   2181 ;	clock.c: 297: if(button(ok)){
      008BA4 4B 06            [ 1] 2182 	push	#0x06
      008BA6 CD 89 15         [ 4] 2183 	call	_button
      008BA9 5B 01            [ 2] 2184 	addw	sp, #1
      008BAB 4D               [ 1] 2185 	tnz	a
      008BAC 27 1A            [ 1] 2186 	jreq	00110$
                                   2187 ;	clock.c: 298: auto_exit = 0;
      008BAE 72 5F 00 4A      [ 1] 2188 	clr	_auto_exit+0
                                   2189 ;	clock.c: 300: EEPROM_UNLOCK();
      008BB2 CD 88 11         [ 4] 2190 	call	_EEPROM_UNLOCK
                                   2191 ;	clock.c: 301: EEPROM_DATA(setting_Brigh) = Point_Meny;
      008BB5 C6 00 48         [ 1] 2192 	ld	a, _Point_Meny+1
      008BB8 AE 40 00         [ 2] 2193 	ldw	x, #0x4000
      008BBB F7               [ 1] 2194 	ld	(x), a
                                   2195 ;	clock.c: 302: EEPROM_LOCK();
      008BBC AE 50 5F         [ 2] 2196 	ldw	x, #0x505f
      008BBF F6               [ 1] 2197 	ld	a, (x)
      008BC0 A4 F7            [ 1] 2198 	and	a, #0xf7
      008BC2 F7               [ 1] 2199 	ld	(x), a
                                   2200 ;	clock.c: 304: return Point_Meny;
      008BC3 C6 00 48         [ 1] 2201 	ld	a, _Point_Meny+1
      008BC6 20 5F            [ 2] 2202 	jra	00118$
      008BC8                       2203 00110$:
                                   2204 ;	clock.c: 308: Soft_Timer++;
      008BC8 CE 00 45         [ 2] 2205 	ldw	x, _Soft_Timer+0
      008BCB 5C               [ 2] 2206 	incw	x
                                   2207 ;	clock.c: 309: if(Soft_Timer == 300){
      008BCC CF 00 45         [ 2] 2208 	ldw	_Soft_Timer+0, x
      008BCF A3 01 2C         [ 2] 2209 	cpw	x, #0x012c
      008BD2 26 3A            [ 1] 2210 	jrne	00112$
                                   2211 ;	clock.c: 310: TM1637_sendMASS(0x7C,0x50,0x00,ASCI[Point_Meny]);
      008BD4 AE 00 27         [ 2] 2212 	ldw	x, #_TM1637_seg+0
      008BD7 1F 03            [ 2] 2213 	ldw	(0x03, sp), x
      008BD9 1E 03            [ 2] 2214 	ldw	x, (0x03, sp)
      008BDB A6 7C            [ 1] 2215 	ld	a, #0x7c
      008BDD F7               [ 1] 2216 	ld	(x), a
      008BDE 1E 03            [ 2] 2217 	ldw	x, (0x03, sp)
      008BE0 5C               [ 2] 2218 	incw	x
      008BE1 A6 50            [ 1] 2219 	ld	a, #0x50
      008BE3 F7               [ 1] 2220 	ld	(x), a
      008BE4 1E 03            [ 2] 2221 	ldw	x, (0x03, sp)
      008BE6 5C               [ 2] 2222 	incw	x
      008BE7 5C               [ 2] 2223 	incw	x
      008BE8 7F               [ 1] 2224 	clr	(x)
      008BE9 16 03            [ 2] 2225 	ldw	y, (0x03, sp)
      008BEB 72 A9 00 03      [ 2] 2226 	addw	y, #0x0003
      008BEF 1E 01            [ 2] 2227 	ldw	x, (0x01, sp)
      008BF1 72 BB 00 47      [ 2] 2228 	addw	x, _Point_Meny+0
      008BF5 F6               [ 1] 2229 	ld	a, (x)
      008BF6 90 F7            [ 1] 2230 	ld	(y), a
      008BF8 CD 81 D9         [ 4] 2231 	call	_TM1637_send
                                   2232 ;	clock.c: 311: TM1637_brigh(Point_Meny);
      008BFB C6 00 48         [ 1] 2233 	ld	a, _Point_Meny+1
      008BFE 88               [ 1] 2234 	push	a
      008BFF CD 81 C0         [ 4] 2235 	call	_TM1637_brigh
      008C02 84               [ 1] 2236 	pop	a
                                   2237 ;	clock.c: 312: Soft_Timer = 0x00;
      008C03 5F               [ 1] 2238 	clrw	x
      008C04 CF 00 45         [ 2] 2239 	ldw	_Soft_Timer+0, x
                                   2240 ;	clock.c: 313: auto_exit++;
      008C07 C6 00 4A         [ 1] 2241 	ld	a, _auto_exit+0
      008C0A 4C               [ 1] 2242 	inc	a
      008C0B C7 00 4A         [ 1] 2243 	ld	_auto_exit+0, a
      008C0E                       2244 00112$:
                                   2245 ;	clock.c: 317: if(auto_exit == 100){
      008C0E C6 00 4A         [ 1] 2246 	ld	a, _auto_exit+0
      008C11 A1 64            [ 1] 2247 	cp	a, #0x64
      008C13 27 03            [ 1] 2248 	jreq	00162$
      008C15 CC 8B 60         [ 2] 2249 	jp	00116$
      008C18                       2250 00162$:
                                   2251 ;	clock.c: 319: TM1637_brigh(EEPROM_DATA(setting_Brigh));
      008C18 AE 40 00         [ 2] 2252 	ldw	x, #0x4000
      008C1B F6               [ 1] 2253 	ld	a, (x)
      008C1C 88               [ 1] 2254 	push	a
      008C1D CD 81 C0         [ 4] 2255 	call	_TM1637_brigh
      008C20 84               [ 1] 2256 	pop	a
                                   2257 ;	clock.c: 320: clock();
      008C21 CD 8F 84         [ 4] 2258 	call	_clock
      008C24 CC 8B 60         [ 2] 2259 	jp	00116$
      008C27                       2260 00118$:
      008C27 5B 04            [ 2] 2261 	addw	sp, #4
      008C29 81               [ 4] 2262 	ret
                                   2263 ;	clock.c: 329: void Set_DnTimer(){ //"r__1"
                                   2264 ;	-----------------------------------------
                                   2265 ;	 function Set_DnTimer
                                   2266 ;	-----------------------------------------
      008C2A                       2267 _Set_DnTimer:
      008C2A 52 02            [ 2] 2268 	sub	sp, #2
                                   2269 ;	clock.c: 330: TM1637_cleer();
      008C2C CD 82 20         [ 4] 2270 	call	_TM1637_cleer
                                   2271 ;	clock.c: 331: Point_Meny = 0;
      008C2F 5F               [ 1] 2272 	clrw	x
      008C30 CF 00 47         [ 2] 2273 	ldw	_Point_Meny+0, x
                                   2274 ;	clock.c: 332: Soft_Timer = 0x00;
      008C33 5F               [ 1] 2275 	clrw	x
      008C34 CF 00 45         [ 2] 2276 	ldw	_Soft_Timer+0, x
                                   2277 ;	clock.c: 334: while(1){
      008C37                       2278 00124$:
                                   2279 ;	clock.c: 335: if(button(up)){
      008C37 4B 05            [ 1] 2280 	push	#0x05
      008C39 CD 89 15         [ 4] 2281 	call	_button
      008C3C 5B 01            [ 2] 2282 	addw	sp, #1
      008C3E 4D               [ 1] 2283 	tnz	a
      008C3F 27 10            [ 1] 2284 	jreq	00104$
                                   2285 ;	clock.c: 336: Point_Meny++;
      008C41 CE 00 47         [ 2] 2286 	ldw	x, _Point_Meny+0
      008C44 5C               [ 2] 2287 	incw	x
                                   2288 ;	clock.c: 337: if(Point_Meny > 4)Point_Meny = 0;
      008C45 CF 00 47         [ 2] 2289 	ldw	_Point_Meny+0, x
      008C48 A3 00 04         [ 2] 2290 	cpw	x, #0x0004
      008C4B 23 04            [ 2] 2291 	jrule	00104$
      008C4D 5F               [ 1] 2292 	clrw	x
      008C4E CF 00 47         [ 2] 2293 	ldw	_Point_Meny+0, x
      008C51                       2294 00104$:
                                   2295 ;	clock.c: 340: if(button(dn)){
      008C51 4B 07            [ 1] 2296 	push	#0x07
      008C53 CD 89 15         [ 4] 2297 	call	_button
      008C56 5B 01            [ 2] 2298 	addw	sp, #1
      008C58 4D               [ 1] 2299 	tnz	a
      008C59 27 12            [ 1] 2300 	jreq	00108$
                                   2301 ;	clock.c: 341: Point_Meny--;
      008C5B CE 00 47         [ 2] 2302 	ldw	x, _Point_Meny+0
      008C5E 5A               [ 2] 2303 	decw	x
                                   2304 ;	clock.c: 342: if(Point_Meny > 4)Point_Meny = 4;
      008C5F CF 00 47         [ 2] 2305 	ldw	_Point_Meny+0, x
      008C62 A3 00 04         [ 2] 2306 	cpw	x, #0x0004
      008C65 23 06            [ 2] 2307 	jrule	00108$
      008C67 AE 00 04         [ 2] 2308 	ldw	x, #0x0004
      008C6A CF 00 47         [ 2] 2309 	ldw	_Point_Meny+0, x
      008C6D                       2310 00108$:
                                   2311 ;	clock.c: 345: if(button(ok)){
      008C6D 4B 06            [ 1] 2312 	push	#0x06
      008C6F CD 89 15         [ 4] 2313 	call	_button
      008C72 5B 01            [ 2] 2314 	addw	sp, #1
      008C74 4D               [ 1] 2315 	tnz	a
      008C75 26 03            [ 1] 2316 	jrne	00180$
      008C77 CC 8D 60         [ 2] 2317 	jp	00120$
      008C7A                       2318 00180$:
                                   2319 ;	clock.c: 348: if(Point_Meny == 0){
      008C7A CE 00 47         [ 2] 2320 	ldw	x, _Point_Meny+0
      008C7D 26 2E            [ 1] 2321 	jrne	00110$
                                   2322 ;	clock.c: 349: Set_time(EEPROM_DATA(DnClock_hour_0),EEPROM_DATA(DnClock_min_0));
      008C7F AE 40 01         [ 2] 2323 	ldw	x, #0x4001
      008C82 F6               [ 1] 2324 	ld	a, (x)
      008C83 AE 40 00         [ 2] 2325 	ldw	x, #0x4000
      008C86 88               [ 1] 2326 	push	a
      008C87 F6               [ 1] 2327 	ld	a, (x)
      008C88 95               [ 1] 2328 	ld	xh, a
      008C89 88               [ 1] 2329 	push	a
      008C8A CD 89 F7         [ 4] 2330 	call	_Set_time
      008C8D 5B 02            [ 2] 2331 	addw	sp, #2
                                   2332 ;	clock.c: 350: EEPROM_UNLOCK();
      008C8F CD 88 11         [ 4] 2333 	call	_EEPROM_UNLOCK
                                   2334 ;	clock.c: 351: EEPROM_DATA(DnClock_hour_0) = Clock_Temp[0];
      008C92 AE 00 09         [ 2] 2335 	ldw	x, #_Clock_Temp+0
      008C95 F6               [ 1] 2336 	ld	a, (x)
      008C96 90 AE 40 00      [ 2] 2337 	ldw	y, #0x4000
      008C9A 90 F7            [ 1] 2338 	ld	(y), a
                                   2339 ;	clock.c: 352: EEPROM_DATA(DnClock_min_0)	= Clock_Temp[1];
      008C9C E6 01            [ 1] 2340 	ld	a, (0x1, x)
      008C9E AE 40 01         [ 2] 2341 	ldw	x, #0x4001
      008CA1 F7               [ 1] 2342 	ld	(x), a
                                   2343 ;	clock.c: 353: EEPROM_LOCK();
      008CA2 AE 50 5F         [ 2] 2344 	ldw	x, #0x505f
      008CA5 F6               [ 1] 2345 	ld	a, (x)
      008CA6 A4 F7            [ 1] 2346 	and	a, #0xf7
      008CA8 F7               [ 1] 2347 	ld	(x), a
                                   2348 ;	clock.c: 354: Point_Meny = 0;
      008CA9 5F               [ 1] 2349 	clrw	x
      008CAA CF 00 47         [ 2] 2350 	ldw	_Point_Meny+0, x
      008CAD                       2351 00110$:
                                   2352 ;	clock.c: 357: if(Point_Meny == 1){
      008CAD CE 00 47         [ 2] 2353 	ldw	x, _Point_Meny+0
      008CB0 A3 00 01         [ 2] 2354 	cpw	x, #0x0001
      008CB3 26 30            [ 1] 2355 	jrne	00112$
                                   2356 ;	clock.c: 358: Set_time(EEPROM_DATA(DnClock_hour_1),EEPROM_DATA(DnClock_min_1));
      008CB5 AE 40 03         [ 2] 2357 	ldw	x, #0x4003
      008CB8 F6               [ 1] 2358 	ld	a, (x)
      008CB9 AE 40 02         [ 2] 2359 	ldw	x, #0x4002
      008CBC 88               [ 1] 2360 	push	a
      008CBD F6               [ 1] 2361 	ld	a, (x)
      008CBE 95               [ 1] 2362 	ld	xh, a
      008CBF 88               [ 1] 2363 	push	a
      008CC0 CD 89 F7         [ 4] 2364 	call	_Set_time
      008CC3 5B 02            [ 2] 2365 	addw	sp, #2
                                   2366 ;	clock.c: 359: EEPROM_UNLOCK();
      008CC5 CD 88 11         [ 4] 2367 	call	_EEPROM_UNLOCK
                                   2368 ;	clock.c: 360: EEPROM_DATA(DnClock_hour_1) = Clock_Temp[0];
      008CC8 AE 00 09         [ 2] 2369 	ldw	x, #_Clock_Temp+0
      008CCB F6               [ 1] 2370 	ld	a, (x)
      008CCC 90 AE 40 02      [ 2] 2371 	ldw	y, #0x4002
      008CD0 90 F7            [ 1] 2372 	ld	(y), a
                                   2373 ;	clock.c: 361: EEPROM_DATA(DnClock_min_1)	= Clock_Temp[1];
      008CD2 E6 01            [ 1] 2374 	ld	a, (0x1, x)
      008CD4 AE 40 03         [ 2] 2375 	ldw	x, #0x4003
      008CD7 F7               [ 1] 2376 	ld	(x), a
                                   2377 ;	clock.c: 362: EEPROM_LOCK();
      008CD8 AE 50 5F         [ 2] 2378 	ldw	x, #0x505f
      008CDB F6               [ 1] 2379 	ld	a, (x)
      008CDC A4 F7            [ 1] 2380 	and	a, #0xf7
      008CDE F7               [ 1] 2381 	ld	(x), a
                                   2382 ;	clock.c: 363: Point_Meny = 1;
      008CDF AE 00 01         [ 2] 2383 	ldw	x, #0x0001
      008CE2 CF 00 47         [ 2] 2384 	ldw	_Point_Meny+0, x
      008CE5                       2385 00112$:
                                   2386 ;	clock.c: 366: if(Point_Meny == 2){
      008CE5 CE 00 47         [ 2] 2387 	ldw	x, _Point_Meny+0
      008CE8 A3 00 02         [ 2] 2388 	cpw	x, #0x0002
      008CEB 26 30            [ 1] 2389 	jrne	00114$
                                   2390 ;	clock.c: 367: Set_time(EEPROM_DATA(DnClock_hour_2),EEPROM_DATA(DnClock_min_2));
      008CED AE 40 05         [ 2] 2391 	ldw	x, #0x4005
      008CF0 F6               [ 1] 2392 	ld	a, (x)
      008CF1 AE 40 04         [ 2] 2393 	ldw	x, #0x4004
      008CF4 88               [ 1] 2394 	push	a
      008CF5 F6               [ 1] 2395 	ld	a, (x)
      008CF6 95               [ 1] 2396 	ld	xh, a
      008CF7 88               [ 1] 2397 	push	a
      008CF8 CD 89 F7         [ 4] 2398 	call	_Set_time
      008CFB 5B 02            [ 2] 2399 	addw	sp, #2
                                   2400 ;	clock.c: 368: EEPROM_UNLOCK();
      008CFD CD 88 11         [ 4] 2401 	call	_EEPROM_UNLOCK
                                   2402 ;	clock.c: 369: EEPROM_DATA(DnClock_hour_2) = Clock_Temp[0];
      008D00 AE 00 09         [ 2] 2403 	ldw	x, #_Clock_Temp+0
      008D03 F6               [ 1] 2404 	ld	a, (x)
      008D04 90 AE 40 04      [ 2] 2405 	ldw	y, #0x4004
      008D08 90 F7            [ 1] 2406 	ld	(y), a
                                   2407 ;	clock.c: 370: EEPROM_DATA(DnClock_min_2)	= Clock_Temp[1];
      008D0A E6 01            [ 1] 2408 	ld	a, (0x1, x)
      008D0C AE 40 05         [ 2] 2409 	ldw	x, #0x4005
      008D0F F7               [ 1] 2410 	ld	(x), a
                                   2411 ;	clock.c: 371: EEPROM_LOCK();
      008D10 AE 50 5F         [ 2] 2412 	ldw	x, #0x505f
      008D13 F6               [ 1] 2413 	ld	a, (x)
      008D14 A4 F7            [ 1] 2414 	and	a, #0xf7
      008D16 F7               [ 1] 2415 	ld	(x), a
                                   2416 ;	clock.c: 372: Point_Meny = 2;
      008D17 AE 00 02         [ 2] 2417 	ldw	x, #0x0002
      008D1A CF 00 47         [ 2] 2418 	ldw	_Point_Meny+0, x
      008D1D                       2419 00114$:
                                   2420 ;	clock.c: 375: if(Point_Meny == 3){
      008D1D CE 00 47         [ 2] 2421 	ldw	x, _Point_Meny+0
      008D20 A3 00 03         [ 2] 2422 	cpw	x, #0x0003
      008D23 26 30            [ 1] 2423 	jrne	00116$
                                   2424 ;	clock.c: 376: Set_time(EEPROM_DATA(DnClock_hour_3),EEPROM_DATA(DnClock_min_3));
      008D25 AE 40 07         [ 2] 2425 	ldw	x, #0x4007
      008D28 F6               [ 1] 2426 	ld	a, (x)
      008D29 AE 40 06         [ 2] 2427 	ldw	x, #0x4006
      008D2C 88               [ 1] 2428 	push	a
      008D2D F6               [ 1] 2429 	ld	a, (x)
      008D2E 95               [ 1] 2430 	ld	xh, a
      008D2F 88               [ 1] 2431 	push	a
      008D30 CD 89 F7         [ 4] 2432 	call	_Set_time
      008D33 5B 02            [ 2] 2433 	addw	sp, #2
                                   2434 ;	clock.c: 377: EEPROM_UNLOCK();
      008D35 CD 88 11         [ 4] 2435 	call	_EEPROM_UNLOCK
                                   2436 ;	clock.c: 378: EEPROM_DATA(DnClock_hour_3) = Clock_Temp[0];
      008D38 AE 00 09         [ 2] 2437 	ldw	x, #_Clock_Temp+0
      008D3B F6               [ 1] 2438 	ld	a, (x)
      008D3C 90 AE 40 06      [ 2] 2439 	ldw	y, #0x4006
      008D40 90 F7            [ 1] 2440 	ld	(y), a
                                   2441 ;	clock.c: 379: EEPROM_DATA(DnClock_min_3)	= Clock_Temp[1];
      008D42 E6 01            [ 1] 2442 	ld	a, (0x1, x)
      008D44 AE 40 07         [ 2] 2443 	ldw	x, #0x4007
      008D47 F7               [ 1] 2444 	ld	(x), a
                                   2445 ;	clock.c: 380: EEPROM_LOCK();
      008D48 AE 50 5F         [ 2] 2446 	ldw	x, #0x505f
      008D4B F6               [ 1] 2447 	ld	a, (x)
      008D4C A4 F7            [ 1] 2448 	and	a, #0xf7
      008D4E F7               [ 1] 2449 	ld	(x), a
                                   2450 ;	clock.c: 381: Point_Meny = 3;
      008D4F AE 00 03         [ 2] 2451 	ldw	x, #0x0003
      008D52 CF 00 47         [ 2] 2452 	ldw	_Point_Meny+0, x
      008D55                       2453 00116$:
                                   2454 ;	clock.c: 387: if(Point_Meny == 4)clock(); //exit
      008D55 CE 00 47         [ 2] 2455 	ldw	x, _Point_Meny+0
      008D58 A3 00 04         [ 2] 2456 	cpw	x, #0x0004
      008D5B 26 03            [ 1] 2457 	jrne	00120$
      008D5D CD 8F 84         [ 4] 2458 	call	_clock
      008D60                       2459 00120$:
                                   2460 ;	clock.c: 394: Soft_Timer++;
      008D60 CE 00 45         [ 2] 2461 	ldw	x, _Soft_Timer+0
      008D63 5C               [ 2] 2462 	incw	x
                                   2463 ;	clock.c: 395: if(Soft_Timer == 300){
      008D64 CF 00 45         [ 2] 2464 	ldw	_Soft_Timer+0, x
      008D67 A3 01 2C         [ 2] 2465 	cpw	x, #0x012c
      008D6A 27 03            [ 1] 2466 	jreq	00196$
      008D6C CC 8C 37         [ 2] 2467 	jp	00124$
      008D6F                       2468 00196$:
                                   2469 ;	clock.c: 396: TM1637_sendMASS(0x5E,0x78,0x08,ASCI[Point_Meny]);
      008D6F AE 00 27         [ 2] 2470 	ldw	x, #_TM1637_seg+0
      008D72 1F 01            [ 2] 2471 	ldw	(0x01, sp), x
      008D74 1E 01            [ 2] 2472 	ldw	x, (0x01, sp)
      008D76 A6 5E            [ 1] 2473 	ld	a, #0x5e
      008D78 F7               [ 1] 2474 	ld	(x), a
      008D79 1E 01            [ 2] 2475 	ldw	x, (0x01, sp)
      008D7B 5C               [ 2] 2476 	incw	x
      008D7C A6 78            [ 1] 2477 	ld	a, #0x78
      008D7E F7               [ 1] 2478 	ld	(x), a
      008D7F 1E 01            [ 2] 2479 	ldw	x, (0x01, sp)
      008D81 5C               [ 2] 2480 	incw	x
      008D82 5C               [ 2] 2481 	incw	x
      008D83 A6 08            [ 1] 2482 	ld	a, #0x08
      008D85 F7               [ 1] 2483 	ld	(x), a
      008D86 16 01            [ 2] 2484 	ldw	y, (0x01, sp)
      008D88 72 A9 00 03      [ 2] 2485 	addw	y, #0x0003
      008D8C AE 00 2B         [ 2] 2486 	ldw	x, #_ASCI+0
      008D8F 72 BB 00 47      [ 2] 2487 	addw	x, _Point_Meny+0
      008D93 F6               [ 1] 2488 	ld	a, (x)
      008D94 90 F7            [ 1] 2489 	ld	(y), a
      008D96 CD 81 D9         [ 4] 2490 	call	_TM1637_send
                                   2491 ;	clock.c: 397: Soft_Timer = 0x00;
      008D99 5F               [ 1] 2492 	clrw	x
      008D9A CF 00 45         [ 2] 2493 	ldw	_Soft_Timer+0, x
      008D9D CC 8C 37         [ 2] 2494 	jp	00124$
      008DA0 5B 02            [ 2] 2495 	addw	sp, #2
      008DA2 81               [ 4] 2496 	ret
                                   2497 ;	clock.c: 402: void Set_Meny(){ //Настройки "C__2"
                                   2498 ;	-----------------------------------------
                                   2499 ;	 function Set_Meny
                                   2500 ;	-----------------------------------------
      008DA3                       2501 _Set_Meny:
      008DA3 52 02            [ 2] 2502 	sub	sp, #2
                                   2503 ;	clock.c: 404: TM1637_cleer();
      008DA5 CD 82 20         [ 4] 2504 	call	_TM1637_cleer
                                   2505 ;	clock.c: 405: Point_Meny = 0;
      008DA8 5F               [ 1] 2506 	clrw	x
      008DA9 CF 00 47         [ 2] 2507 	ldw	_Point_Meny+0, x
                                   2508 ;	clock.c: 406: Soft_Timer = 0x00;
      008DAC 5F               [ 1] 2509 	clrw	x
      008DAD CF 00 45         [ 2] 2510 	ldw	_Soft_Timer+0, x
                                   2511 ;	clock.c: 408: while(1){
      008DB0                       2512 00126$:
                                   2513 ;	clock.c: 410: if(button(up)){
      008DB0 4B 05            [ 1] 2514 	push	#0x05
      008DB2 CD 89 15         [ 4] 2515 	call	_button
      008DB5 5B 01            [ 2] 2516 	addw	sp, #1
      008DB7 4D               [ 1] 2517 	tnz	a
      008DB8 27 10            [ 1] 2518 	jreq	00104$
                                   2519 ;	clock.c: 411: Point_Meny++;
      008DBA CE 00 47         [ 2] 2520 	ldw	x, _Point_Meny+0
      008DBD 5C               [ 2] 2521 	incw	x
                                   2522 ;	clock.c: 412: if(Point_Meny > 5)Point_Meny = 0;
      008DBE CF 00 47         [ 2] 2523 	ldw	_Point_Meny+0, x
      008DC1 A3 00 05         [ 2] 2524 	cpw	x, #0x0005
      008DC4 23 04            [ 2] 2525 	jrule	00104$
      008DC6 5F               [ 1] 2526 	clrw	x
      008DC7 CF 00 47         [ 2] 2527 	ldw	_Point_Meny+0, x
      008DCA                       2528 00104$:
                                   2529 ;	clock.c: 415: if(button(dn)){
      008DCA 4B 07            [ 1] 2530 	push	#0x07
      008DCC CD 89 15         [ 4] 2531 	call	_button
      008DCF 5B 01            [ 2] 2532 	addw	sp, #1
      008DD1 4D               [ 1] 2533 	tnz	a
      008DD2 27 12            [ 1] 2534 	jreq	00108$
                                   2535 ;	clock.c: 416: Point_Meny--;
      008DD4 CE 00 47         [ 2] 2536 	ldw	x, _Point_Meny+0
      008DD7 5A               [ 2] 2537 	decw	x
                                   2538 ;	clock.c: 417: if(Point_Meny > 5)Point_Meny = 5;
      008DD8 CF 00 47         [ 2] 2539 	ldw	_Point_Meny+0, x
      008DDB A3 00 05         [ 2] 2540 	cpw	x, #0x0005
      008DDE 23 06            [ 2] 2541 	jrule	00108$
      008DE0 AE 00 05         [ 2] 2542 	ldw	x, #0x0005
      008DE3 CF 00 47         [ 2] 2543 	ldw	_Point_Meny+0, x
      008DE6                       2544 00108$:
                                   2545 ;	clock.c: 420: if(button(ok)){
      008DE6 4B 06            [ 1] 2546 	push	#0x06
      008DE8 CD 89 15         [ 4] 2547 	call	_button
      008DEB 5B 01            [ 2] 2548 	addw	sp, #1
      008DED 4D               [ 1] 2549 	tnz	a
      008DEE 26 03            [ 1] 2550 	jrne	00186$
      008DF0 CC 8E 8E         [ 2] 2551 	jp	00122$
      008DF3                       2552 00186$:
                                   2553 ;	clock.c: 422: if(Point_Meny == 0){ //тут настройка RTC
      008DF3 CE 00 47         [ 2] 2554 	ldw	x, _Point_Meny+0
      008DF6 26 2C            [ 1] 2555 	jrne	00110$
                                   2556 ;	clock.c: 423: RTC_Read();
      008DF8 CD 85 7E         [ 4] 2557 	call	_RTC_Read
                                   2558 ;	clock.c: 424: Set_time(hour,min);
      008DFB 3B 00 02         [ 1] 2559 	push	_min+0
      008DFE 3B 00 03         [ 1] 2560 	push	_hour+0
      008E01 CD 89 F7         [ 4] 2561 	call	_Set_time
      008E04 5B 02            [ 2] 2562 	addw	sp, #2
                                   2563 ;	clock.c: 425: RTC_Set(0, Clock_Temp[1], Clock_Temp[0], 1, 1, 1, 20);
      008E06 AE 00 09         [ 2] 2564 	ldw	x, #_Clock_Temp+0
      008E09 F6               [ 1] 2565 	ld	a, (x)
      008E0A 88               [ 1] 2566 	push	a
      008E0B E6 01            [ 1] 2567 	ld	a, (0x1, x)
      008E0D 97               [ 1] 2568 	ld	xl, a
      008E0E 84               [ 1] 2569 	pop	a
      008E0F 4B 14            [ 1] 2570 	push	#0x14
      008E11 4B 01            [ 1] 2571 	push	#0x01
      008E13 4B 01            [ 1] 2572 	push	#0x01
      008E15 4B 01            [ 1] 2573 	push	#0x01
      008E17 88               [ 1] 2574 	push	a
      008E18 9F               [ 1] 2575 	ld	a, xl
      008E19 88               [ 1] 2576 	push	a
      008E1A 4B 00            [ 1] 2577 	push	#0x00
      008E1C CD 86 2D         [ 4] 2578 	call	_RTC_Set
      008E1F 5B 07            [ 2] 2579 	addw	sp, #7
                                   2580 ;	clock.c: 426: clock();
      008E21 CD 8F 84         [ 4] 2581 	call	_clock
      008E24                       2582 00110$:
                                   2583 ;	clock.c: 429: if(Point_Meny == 1)Set_DnTimer();
      008E24 CE 00 47         [ 2] 2584 	ldw	x, _Point_Meny+0
      008E27 A3 00 01         [ 2] 2585 	cpw	x, #0x0001
      008E2A 26 03            [ 1] 2586 	jrne	00112$
      008E2C CD 8C 2A         [ 4] 2587 	call	_Set_DnTimer
      008E2F                       2588 00112$:
                                   2589 ;	clock.c: 431: if(Point_Meny == 3){ //Настройка загрузки при включении "r__3"
      008E2F CE 00 47         [ 2] 2590 	ldw	x, _Point_Meny+0
      008E32 A3 00 03         [ 2] 2591 	cpw	x, #0x0003
      008E35 26 1B            [ 1] 2592 	jrne	00114$
                                   2593 ;	clock.c: 432: EEPROM_UNLOCK();
      008E37 CD 88 11         [ 4] 2594 	call	_EEPROM_UNLOCK
                                   2595 ;	clock.c: 433: EEPROM_DATA(defStartER) = setStat(EEPROM_DATA(defStartER)); 
      008E3A AE 40 08         [ 2] 2596 	ldw	x, #0x4008
      008E3D F6               [ 1] 2597 	ld	a, (x)
      008E3E 40               [ 1] 2598 	neg	a
      008E3F 4F               [ 1] 2599 	clr	a
      008E40 49               [ 1] 2600 	rlc	a
      008E41 88               [ 1] 2601 	push	a
      008E42 CD 88 37         [ 4] 2602 	call	_setStat
      008E45 5B 01            [ 2] 2603 	addw	sp, #1
      008E47 AE 40 08         [ 2] 2604 	ldw	x, #0x4008
      008E4A F7               [ 1] 2605 	ld	(x), a
                                   2606 ;	clock.c: 434: EEPROM_LOCK();
      008E4B AE 50 5F         [ 2] 2607 	ldw	x, #0x505f
      008E4E F6               [ 1] 2608 	ld	a, (x)
      008E4F A4 F7            [ 1] 2609 	and	a, #0xf7
      008E51 F7               [ 1] 2610 	ld	(x), a
      008E52                       2611 00114$:
                                   2612 ;	clock.c: 437: if(Point_Meny == 4){ //Настройка выключение высшего разряда времени "r__4"
      008E52 CE 00 47         [ 2] 2613 	ldw	x, _Point_Meny+0
      008E55 A3 00 04         [ 2] 2614 	cpw	x, #0x0004
      008E58 26 1B            [ 1] 2615 	jrne	00116$
                                   2616 ;	clock.c: 438: EEPROM_UNLOCK();
      008E5A CD 88 11         [ 4] 2617 	call	_EEPROM_UNLOCK
                                   2618 ;	clock.c: 439: EEPROM_DATA(UpLevel) = setStat(EEPROM_DATA(UpLevel)); 
      008E5D AE 40 09         [ 2] 2619 	ldw	x, #0x4009
      008E60 F6               [ 1] 2620 	ld	a, (x)
      008E61 40               [ 1] 2621 	neg	a
      008E62 4F               [ 1] 2622 	clr	a
      008E63 49               [ 1] 2623 	rlc	a
      008E64 88               [ 1] 2624 	push	a
      008E65 CD 88 37         [ 4] 2625 	call	_setStat
      008E68 5B 01            [ 2] 2626 	addw	sp, #1
      008E6A AE 40 09         [ 2] 2627 	ldw	x, #0x4009
      008E6D F7               [ 1] 2628 	ld	(x), a
                                   2629 ;	clock.c: 440: EEPROM_LOCK();
      008E6E AE 50 5F         [ 2] 2630 	ldw	x, #0x505f
      008E71 F6               [ 1] 2631 	ld	a, (x)
      008E72 A4 F7            [ 1] 2632 	and	a, #0xf7
      008E74 F7               [ 1] 2633 	ld	(x), a
      008E75                       2634 00116$:
                                   2635 ;	clock.c: 444: if(Point_Meny == 5) clock();
      008E75 CE 00 47         [ 2] 2636 	ldw	x, _Point_Meny+0
      008E78 A3 00 05         [ 2] 2637 	cpw	x, #0x0005
      008E7B 26 03            [ 1] 2638 	jrne	00118$
      008E7D CD 8F 84         [ 4] 2639 	call	_clock
      008E80                       2640 00118$:
                                   2641 ;	clock.c: 445: if(Point_Meny == 2){
      008E80 CE 00 47         [ 2] 2642 	ldw	x, _Point_Meny+0
      008E83 A3 00 02         [ 2] 2643 	cpw	x, #0x0002
      008E86 26 06            [ 1] 2644 	jrne	00122$
                                   2645 ;	clock.c: 446: Set_Brigh();
      008E88 CD 8B 41         [ 4] 2646 	call	_Set_Brigh
                                   2647 ;	clock.c: 447: clock();
      008E8B CD 8F 84         [ 4] 2648 	call	_clock
      008E8E                       2649 00122$:
                                   2650 ;	clock.c: 453: Soft_Timer++;
      008E8E CE 00 45         [ 2] 2651 	ldw	x, _Soft_Timer+0
      008E91 5C               [ 2] 2652 	incw	x
                                   2653 ;	clock.c: 454: if(Soft_Timer == 300){
      008E92 CF 00 45         [ 2] 2654 	ldw	_Soft_Timer+0, x
      008E95 A3 01 2C         [ 2] 2655 	cpw	x, #0x012c
      008E98 27 03            [ 1] 2656 	jreq	00205$
      008E9A CC 8D B0         [ 2] 2657 	jp	00126$
      008E9D                       2658 00205$:
                                   2659 ;	clock.c: 455: TM1637_sendMASS(0x50,0x08,0x08,ASCI[Point_Meny]);
      008E9D AE 00 27         [ 2] 2660 	ldw	x, #_TM1637_seg+0
      008EA0 1F 01            [ 2] 2661 	ldw	(0x01, sp), x
      008EA2 1E 01            [ 2] 2662 	ldw	x, (0x01, sp)
      008EA4 A6 50            [ 1] 2663 	ld	a, #0x50
      008EA6 F7               [ 1] 2664 	ld	(x), a
      008EA7 1E 01            [ 2] 2665 	ldw	x, (0x01, sp)
      008EA9 5C               [ 2] 2666 	incw	x
      008EAA A6 08            [ 1] 2667 	ld	a, #0x08
      008EAC F7               [ 1] 2668 	ld	(x), a
      008EAD 1E 01            [ 2] 2669 	ldw	x, (0x01, sp)
      008EAF 5C               [ 2] 2670 	incw	x
      008EB0 5C               [ 2] 2671 	incw	x
      008EB1 A6 08            [ 1] 2672 	ld	a, #0x08
      008EB3 F7               [ 1] 2673 	ld	(x), a
      008EB4 16 01            [ 2] 2674 	ldw	y, (0x01, sp)
      008EB6 72 A9 00 03      [ 2] 2675 	addw	y, #0x0003
      008EBA AE 00 2B         [ 2] 2676 	ldw	x, #_ASCI+0
      008EBD 72 BB 00 47      [ 2] 2677 	addw	x, _Point_Meny+0
      008EC1 F6               [ 1] 2678 	ld	a, (x)
      008EC2 90 F7            [ 1] 2679 	ld	(y), a
      008EC4 CD 81 D9         [ 4] 2680 	call	_TM1637_send
                                   2681 ;	clock.c: 456: Soft_Timer = 0x00;
      008EC7 5F               [ 1] 2682 	clrw	x
      008EC8 CF 00 45         [ 2] 2683 	ldw	_Soft_Timer+0, x
      008ECB CC 8D B0         [ 2] 2684 	jp	00126$
      008ECE 5B 02            [ 2] 2685 	addw	sp, #2
      008ED0 81               [ 4] 2686 	ret
                                   2687 ;	clock.c: 462: void Meny(){ //Меню
                                   2688 ;	-----------------------------------------
                                   2689 ;	 function Meny
                                   2690 ;	-----------------------------------------
      008ED1                       2691 _Meny:
      008ED1 52 02            [ 2] 2692 	sub	sp, #2
                                   2693 ;	clock.c: 464: TM1637_cleer();
      008ED3 CD 82 20         [ 4] 2694 	call	_TM1637_cleer
                                   2695 ;	clock.c: 465: Point_Meny = 0;
      008ED6 5F               [ 1] 2696 	clrw	x
      008ED7 CF 00 47         [ 2] 2697 	ldw	_Point_Meny+0, x
                                   2698 ;	clock.c: 466: Soft_Timer = 0x00;
      008EDA 5F               [ 1] 2699 	clrw	x
      008EDB CF 00 45         [ 2] 2700 	ldw	_Soft_Timer+0, x
                                   2701 ;	clock.c: 468: while(1){
      008EDE                       2702 00121$:
                                   2703 ;	clock.c: 470: if(button(up)){
      008EDE 4B 05            [ 1] 2704 	push	#0x05
      008EE0 CD 89 15         [ 4] 2705 	call	_button
      008EE3 5B 01            [ 2] 2706 	addw	sp, #1
      008EE5 4D               [ 1] 2707 	tnz	a
      008EE6 27 10            [ 1] 2708 	jreq	00104$
                                   2709 ;	clock.c: 471: Point_Meny++;
      008EE8 CE 00 47         [ 2] 2710 	ldw	x, _Point_Meny+0
      008EEB 5C               [ 2] 2711 	incw	x
                                   2712 ;	clock.c: 472: if(Point_Meny > 3)Point_Meny = 0;
      008EEC CF 00 47         [ 2] 2713 	ldw	_Point_Meny+0, x
      008EEF A3 00 03         [ 2] 2714 	cpw	x, #0x0003
      008EF2 23 04            [ 2] 2715 	jrule	00104$
      008EF4 5F               [ 1] 2716 	clrw	x
      008EF5 CF 00 47         [ 2] 2717 	ldw	_Point_Meny+0, x
      008EF8                       2718 00104$:
                                   2719 ;	clock.c: 475: if(button(dn)){
      008EF8 4B 07            [ 1] 2720 	push	#0x07
      008EFA CD 89 15         [ 4] 2721 	call	_button
      008EFD 5B 01            [ 2] 2722 	addw	sp, #1
      008EFF 4D               [ 1] 2723 	tnz	a
      008F00 27 12            [ 1] 2724 	jreq	00108$
                                   2725 ;	clock.c: 476: Point_Meny--;
      008F02 CE 00 47         [ 2] 2726 	ldw	x, _Point_Meny+0
      008F05 5A               [ 2] 2727 	decw	x
                                   2728 ;	clock.c: 477: if(Point_Meny > 3)Point_Meny = 3;
      008F06 CF 00 47         [ 2] 2729 	ldw	_Point_Meny+0, x
      008F09 A3 00 03         [ 2] 2730 	cpw	x, #0x0003
      008F0C 23 06            [ 2] 2731 	jrule	00108$
      008F0E AE 00 03         [ 2] 2732 	ldw	x, #0x0003
      008F11 CF 00 47         [ 2] 2733 	ldw	_Point_Meny+0, x
      008F14                       2734 00108$:
                                   2735 ;	clock.c: 480: if(button(ok)){
      008F14 4B 06            [ 1] 2736 	push	#0x06
      008F16 CD 89 15         [ 4] 2737 	call	_button
      008F19 5B 01            [ 2] 2738 	addw	sp, #1
      008F1B 4D               [ 1] 2739 	tnz	a
      008F1C 27 26            [ 1] 2740 	jreq	00117$
                                   2741 ;	clock.c: 481: if(Point_Meny == 0)dnClock(); //обратные часы "С__0"
      008F1E CE 00 47         [ 2] 2742 	ldw	x, _Point_Meny+0
      008F21 26 03            [ 1] 2743 	jrne	00110$
      008F23 CD 90 5A         [ 4] 2744 	call	_dnClock
      008F26                       2745 00110$:
                                   2746 ;	clock.c: 482: if(Point_Meny == 1 || Point_Meny == 3)clock(); //Часы "C__1"
      008F26 CE 00 47         [ 2] 2747 	ldw	x, _Point_Meny+0
      008F29 A3 00 01         [ 2] 2748 	cpw	x, #0x0001
      008F2C 27 08            [ 1] 2749 	jreq	00111$
      008F2E CE 00 47         [ 2] 2750 	ldw	x, _Point_Meny+0
      008F31 A3 00 03         [ 2] 2751 	cpw	x, #0x0003
      008F34 26 03            [ 1] 2752 	jrne	00112$
      008F36                       2753 00111$:
      008F36 CD 8F 84         [ 4] 2754 	call	_clock
      008F39                       2755 00112$:
                                   2756 ;	clock.c: 483: if(Point_Meny == 2) Set_Meny(); //Настройки "C__2"
      008F39 CE 00 47         [ 2] 2757 	ldw	x, _Point_Meny+0
      008F3C A3 00 02         [ 2] 2758 	cpw	x, #0x0002
      008F3F 26 03            [ 1] 2759 	jrne	00117$
      008F41 CD 8D A3         [ 4] 2760 	call	_Set_Meny
      008F44                       2761 00117$:
                                   2762 ;	clock.c: 488: Soft_Timer++;
      008F44 CE 00 45         [ 2] 2763 	ldw	x, _Soft_Timer+0
      008F47 5C               [ 2] 2764 	incw	x
                                   2765 ;	clock.c: 489: if(Soft_Timer == 300){
      008F48 CF 00 45         [ 2] 2766 	ldw	_Soft_Timer+0, x
      008F4B A3 01 2C         [ 2] 2767 	cpw	x, #0x012c
      008F4E 26 8E            [ 1] 2768 	jrne	00121$
                                   2769 ;	clock.c: 490: TM1637_sendMASS(0x39,0x08,0x08,ASCI[Point_Meny]);
      008F50 AE 00 27         [ 2] 2770 	ldw	x, #_TM1637_seg+0
      008F53 1F 01            [ 2] 2771 	ldw	(0x01, sp), x
      008F55 1E 01            [ 2] 2772 	ldw	x, (0x01, sp)
      008F57 A6 39            [ 1] 2773 	ld	a, #0x39
      008F59 F7               [ 1] 2774 	ld	(x), a
      008F5A 1E 01            [ 2] 2775 	ldw	x, (0x01, sp)
      008F5C 5C               [ 2] 2776 	incw	x
      008F5D A6 08            [ 1] 2777 	ld	a, #0x08
      008F5F F7               [ 1] 2778 	ld	(x), a
      008F60 1E 01            [ 2] 2779 	ldw	x, (0x01, sp)
      008F62 5C               [ 2] 2780 	incw	x
      008F63 5C               [ 2] 2781 	incw	x
      008F64 A6 08            [ 1] 2782 	ld	a, #0x08
      008F66 F7               [ 1] 2783 	ld	(x), a
      008F67 16 01            [ 2] 2784 	ldw	y, (0x01, sp)
      008F69 72 A9 00 03      [ 2] 2785 	addw	y, #0x0003
      008F6D AE 00 2B         [ 2] 2786 	ldw	x, #_ASCI+0
      008F70 72 BB 00 47      [ 2] 2787 	addw	x, _Point_Meny+0
      008F74 F6               [ 1] 2788 	ld	a, (x)
      008F75 90 F7            [ 1] 2789 	ld	(y), a
      008F77 CD 81 D9         [ 4] 2790 	call	_TM1637_send
                                   2791 ;	clock.c: 491: Soft_Timer = 0x00;
      008F7A 5F               [ 1] 2792 	clrw	x
      008F7B CF 00 45         [ 2] 2793 	ldw	_Soft_Timer+0, x
      008F7E CC 8E DE         [ 2] 2794 	jp	00121$
      008F81 5B 02            [ 2] 2795 	addw	sp, #2
      008F83 81               [ 4] 2796 	ret
                                   2797 ;	clock.c: 497: void clock(void){
                                   2798 ;	-----------------------------------------
                                   2799 ;	 function clock
                                   2800 ;	-----------------------------------------
      008F84                       2801 _clock:
      008F84 52 06            [ 2] 2802 	sub	sp, #6
                                   2803 ;	clock.c: 499: TM1637_cleer();
      008F86 CD 82 20         [ 4] 2804 	call	_TM1637_cleer
                                   2805 ;	clock.c: 500: Soft_Timer = 0x00; //Сброс таймера
      008F89 5F               [ 1] 2806 	clrw	x
      008F8A CF 00 45         [ 2] 2807 	ldw	_Soft_Timer+0, x
                                   2808 ;	clock.c: 502: while(1){
      008F8D                       2809 00116$:
                                   2810 ;	clock.c: 504: Soft_Timer++;
      008F8D CE 00 45         [ 2] 2811 	ldw	x, _Soft_Timer+0
      008F90 5C               [ 2] 2812 	incw	x
      008F91 CF 00 45         [ 2] 2813 	ldw	_Soft_Timer+0, x
                                   2814 ;	clock.c: 509: if(button(up))Set_Brigh();
      008F94 4B 05            [ 1] 2815 	push	#0x05
      008F96 CD 89 15         [ 4] 2816 	call	_button
      008F99 5B 01            [ 2] 2817 	addw	sp, #1
      008F9B 4D               [ 1] 2818 	tnz	a
      008F9C 27 03            [ 1] 2819 	jreq	00102$
      008F9E CD 8B 41         [ 4] 2820 	call	_Set_Brigh
      008FA1                       2821 00102$:
                                   2822 ;	clock.c: 510: if(button(dn))Set_Brigh();
      008FA1 4B 07            [ 1] 2823 	push	#0x07
      008FA3 CD 89 15         [ 4] 2824 	call	_button
      008FA6 5B 01            [ 2] 2825 	addw	sp, #1
      008FA8 4D               [ 1] 2826 	tnz	a
      008FA9 27 03            [ 1] 2827 	jreq	00104$
      008FAB CD 8B 41         [ 4] 2828 	call	_Set_Brigh
      008FAE                       2829 00104$:
                                   2830 ;	clock.c: 511: if(button(ok))Meny();
      008FAE 4B 06            [ 1] 2831 	push	#0x06
      008FB0 CD 89 15         [ 4] 2832 	call	_button
      008FB3 5B 01            [ 2] 2833 	addw	sp, #1
      008FB5 4D               [ 1] 2834 	tnz	a
      008FB6 27 03            [ 1] 2835 	jreq	00106$
      008FB8 CD 8E D1         [ 4] 2836 	call	_Meny
      008FBB                       2837 00106$:
                                   2838 ;	clock.c: 513: if(Soft_Timer == 12000){ // Отображение времени при значении Программного таймера
      008FBB CE 00 45         [ 2] 2839 	ldw	x, _Soft_Timer+0
      008FBE A3 2E E0         [ 2] 2840 	cpw	x, #0x2ee0
      008FC1 26 CA            [ 1] 2841 	jrne	00116$
                                   2842 ;	clock.c: 514: RTC_Read();
      008FC3 CD 85 7E         [ 4] 2843 	call	_RTC_Read
                                   2844 ;	clock.c: 515: dot = !dot;
      008FC6 C6 00 08         [ 1] 2845 	ld	a, _dot+0
      008FC9 A0 01            [ 1] 2846 	sub	a, #0x01
      008FCB 4F               [ 1] 2847 	clr	a
      008FCC 49               [ 1] 2848 	rlc	a
      008FCD C7 00 08         [ 1] 2849 	ld	_dot+0, a
                                   2850 ;	clock.c: 518: TM1637_seg[0] = ASCI[hour/10];
      008FD0 AE 00 27         [ 2] 2851 	ldw	x, #_TM1637_seg+0
      008FD3 1F 05            [ 2] 2852 	ldw	(0x05, sp), x
      008FD5 AE 00 2B         [ 2] 2853 	ldw	x, #_ASCI+0
      008FD8 1F 03            [ 2] 2854 	ldw	(0x03, sp), x
      008FDA 5F               [ 1] 2855 	clrw	x
      008FDB C6 00 03         [ 1] 2856 	ld	a, _hour+0
      008FDE 97               [ 1] 2857 	ld	xl, a
      008FDF A6 0A            [ 1] 2858 	ld	a, #0x0a
      008FE1 62               [ 2] 2859 	div	x, a
      008FE2 4F               [ 1] 2860 	clr	a
      008FE3 95               [ 1] 2861 	ld	xh, a
      008FE4 72 FB 03         [ 2] 2862 	addw	x, (0x03, sp)
      008FE7 F6               [ 1] 2863 	ld	a, (x)
      008FE8 1E 05            [ 2] 2864 	ldw	x, (0x05, sp)
      008FEA F7               [ 1] 2865 	ld	(x), a
                                   2866 ;	clock.c: 519: TM1637_seg[1] = ASCI[hour%10];
      008FEB 1E 05            [ 2] 2867 	ldw	x, (0x05, sp)
      008FED 5C               [ 2] 2868 	incw	x
      008FEE 1F 01            [ 2] 2869 	ldw	(0x01, sp), x
      008FF0 5F               [ 1] 2870 	clrw	x
      008FF1 C6 00 03         [ 1] 2871 	ld	a, _hour+0
      008FF4 97               [ 1] 2872 	ld	xl, a
      008FF5 A6 0A            [ 1] 2873 	ld	a, #0x0a
      008FF7 62               [ 2] 2874 	div	x, a
      008FF8 5F               [ 1] 2875 	clrw	x
      008FF9 97               [ 1] 2876 	ld	xl, a
      008FFA 72 FB 03         [ 2] 2877 	addw	x, (0x03, sp)
      008FFD F6               [ 1] 2878 	ld	a, (x)
      008FFE 1E 01            [ 2] 2879 	ldw	x, (0x01, sp)
      009000 F7               [ 1] 2880 	ld	(x), a
                                   2881 ;	clock.c: 520: TM1637_seg[2] = ASCI[min/10];
      009001 16 05            [ 2] 2882 	ldw	y, (0x05, sp)
      009003 72 A9 00 02      [ 2] 2883 	addw	y, #0x0002
      009007 5F               [ 1] 2884 	clrw	x
      009008 C6 00 02         [ 1] 2885 	ld	a, _min+0
      00900B 97               [ 1] 2886 	ld	xl, a
      00900C A6 0A            [ 1] 2887 	ld	a, #0x0a
      00900E 62               [ 2] 2888 	div	x, a
      00900F 4F               [ 1] 2889 	clr	a
      009010 95               [ 1] 2890 	ld	xh, a
      009011 72 FB 03         [ 2] 2891 	addw	x, (0x03, sp)
      009014 F6               [ 1] 2892 	ld	a, (x)
      009015 90 F7            [ 1] 2893 	ld	(y), a
                                   2894 ;	clock.c: 521: TM1637_seg[3] = ASCI[min%10];
      009017 16 05            [ 2] 2895 	ldw	y, (0x05, sp)
      009019 72 A9 00 03      [ 2] 2896 	addw	y, #0x0003
      00901D 5F               [ 1] 2897 	clrw	x
      00901E C6 00 02         [ 1] 2898 	ld	a, _min+0
      009021 97               [ 1] 2899 	ld	xl, a
      009022 A6 0A            [ 1] 2900 	ld	a, #0x0a
      009024 62               [ 2] 2901 	div	x, a
      009025 5F               [ 1] 2902 	clrw	x
      009026 97               [ 1] 2903 	ld	xl, a
      009027 72 FB 03         [ 2] 2904 	addw	x, (0x03, sp)
      00902A F6               [ 1] 2905 	ld	a, (x)
      00902B 90 F7            [ 1] 2906 	ld	(y), a
                                   2907 ;	clock.c: 523: if(EEPROM_DATA(UpLevel))if(hour<10)	TM1637_seg[0] =  0x00; //Отключение первого разряда если в нем 0
      00902D AE 40 09         [ 2] 2908 	ldw	x, #0x4009
      009030 F6               [ 1] 2909 	ld	a, (x)
      009031 4D               [ 1] 2910 	tnz	a
      009032 27 0A            [ 1] 2911 	jreq	00110$
      009034 C6 00 03         [ 1] 2912 	ld	a, _hour+0
      009037 A1 0A            [ 1] 2913 	cp	a, #0x0a
      009039 24 03            [ 1] 2914 	jrnc	00110$
      00903B 1E 05            [ 2] 2915 	ldw	x, (0x05, sp)
      00903D 7F               [ 1] 2916 	clr	(x)
      00903E                       2917 00110$:
                                   2918 ;	clock.c: 524: if(dot) TM1637_seg[1] = TM1637_seg[1] + 0x80; //Включение секундных точек
      00903E 72 00 00 08 02   [ 2] 2919 	btjt	_dot+0, #0, 00160$
      009043 20 08            [ 2] 2920 	jra	00112$
      009045                       2921 00160$:
      009045 1E 01            [ 2] 2922 	ldw	x, (0x01, sp)
      009047 F6               [ 1] 2923 	ld	a, (x)
      009048 AB 80            [ 1] 2924 	add	a, #0x80
      00904A 1E 01            [ 2] 2925 	ldw	x, (0x01, sp)
      00904C F7               [ 1] 2926 	ld	(x), a
      00904D                       2927 00112$:
                                   2928 ;	clock.c: 526: TM1637_send();
      00904D CD 81 D9         [ 4] 2929 	call	_TM1637_send
                                   2930 ;	clock.c: 527: Soft_Timer = 0x00; //Сброс таймера
      009050 5F               [ 1] 2931 	clrw	x
      009051 CF 00 45         [ 2] 2932 	ldw	_Soft_Timer+0, x
      009054 CC 8F 8D         [ 2] 2933 	jp	00116$
      009057 5B 06            [ 2] 2934 	addw	sp, #6
      009059 81               [ 4] 2935 	ret
                                   2936 ;	clock.c: 535: void dnClock(void){
                                   2937 ;	-----------------------------------------
                                   2938 ;	 function dnClock
                                   2939 ;	-----------------------------------------
      00905A                       2940 _dnClock:
      00905A 52 42            [ 2] 2941 	sub	sp, #66
                                   2942 ;	clock.c: 537: TM1637_cleer();
      00905C CD 82 20         [ 4] 2943 	call	_TM1637_cleer
                                   2944 ;	clock.c: 538: Soft_Timer = 0x00; //Сброс таймера
      00905F 5F               [ 1] 2945 	clrw	x
      009060 CF 00 45         [ 2] 2946 	ldw	_Soft_Timer+0, x
                                   2947 ;	clock.c: 539: PointTimer = 0;
      009063 72 5F 00 23      [ 1] 2948 	clr	_PointTimer+0
                                   2949 ;	clock.c: 541: DnClock_Tim_0 = transTime(0,EEPROM_DATA(DnClock_hour_0),EEPROM_DATA(DnClock_min_0),0);
      009067 AE 40 01         [ 2] 2950 	ldw	x, #0x4001
      00906A F6               [ 1] 2951 	ld	a, (x)
      00906B 97               [ 1] 2952 	ld	xl, a
      00906C 49               [ 1] 2953 	rlc	a
      00906D 4F               [ 1] 2954 	clr	a
      00906E A2 00            [ 1] 2955 	sbc	a, #0x00
      009070 95               [ 1] 2956 	ld	xh, a
      009071 6B 35            [ 1] 2957 	ld	(0x35, sp), a
      009073 6B 34            [ 1] 2958 	ld	(0x34, sp), a
      009075 90 AE 40 00      [ 2] 2959 	ldw	y, #0x4000
      009079 90 F6            [ 1] 2960 	ld	a, (y)
      00907B 6B 2D            [ 1] 2961 	ld	(0x2d, sp), a
      00907D 7B 2D            [ 1] 2962 	ld	a, (0x2d, sp)
      00907F 49               [ 1] 2963 	rlc	a
      009080 4F               [ 1] 2964 	clr	a
      009081 A2 00            [ 1] 2965 	sbc	a, #0x00
      009083 6B 2C            [ 1] 2966 	ld	(0x2c, sp), a
      009085 90 97            [ 1] 2967 	ld	yl, a
      009087 90 95            [ 1] 2968 	ld	yh, a
      009089 4B 00            [ 1] 2969 	push	#0x00
      00908B 4B 00            [ 1] 2970 	push	#0x00
      00908D 4B 00            [ 1] 2971 	push	#0x00
      00908F 4B 00            [ 1] 2972 	push	#0x00
      009091 89               [ 2] 2973 	pushw	x
      009092 1E 3A            [ 2] 2974 	ldw	x, (0x3a, sp)
      009094 89               [ 2] 2975 	pushw	x
      009095 1E 34            [ 2] 2976 	ldw	x, (0x34, sp)
      009097 89               [ 2] 2977 	pushw	x
      009098 90 89            [ 2] 2978 	pushw	y
      00909A 5F               [ 1] 2979 	clrw	x
      00909B 89               [ 2] 2980 	pushw	x
      00909C 5F               [ 1] 2981 	clrw	x
      00909D 89               [ 2] 2982 	pushw	x
      00909E CD 87 B5         [ 4] 2983 	call	_transTime
      0090A1 5B 10            [ 2] 2984 	addw	sp, #16
      0090A3 CF 00 0D         [ 2] 2985 	ldw	_DnClock_Tim_0+2, x
      0090A6 90 CF 00 0B      [ 2] 2986 	ldw	_DnClock_Tim_0+0, y
                                   2987 ;	clock.c: 542: DnClock_Tim_1 = transTime(0,EEPROM_DATA(DnClock_hour_1),EEPROM_DATA(DnClock_min_1),0);
      0090AA AE 40 03         [ 2] 2988 	ldw	x, #0x4003
      0090AD F6               [ 1] 2989 	ld	a, (x)
      0090AE 97               [ 1] 2990 	ld	xl, a
      0090AF 49               [ 1] 2991 	rlc	a
      0090B0 4F               [ 1] 2992 	clr	a
      0090B1 A2 00            [ 1] 2993 	sbc	a, #0x00
      0090B3 95               [ 1] 2994 	ld	xh, a
      0090B4 6B 0A            [ 1] 2995 	ld	(0x0a, sp), a
      0090B6 6B 09            [ 1] 2996 	ld	(0x09, sp), a
      0090B8 90 AE 40 02      [ 2] 2997 	ldw	y, #0x4002
      0090BC 90 F6            [ 1] 2998 	ld	a, (y)
      0090BE 6B 41            [ 1] 2999 	ld	(0x41, sp), a
      0090C0 7B 41            [ 1] 3000 	ld	a, (0x41, sp)
      0090C2 49               [ 1] 3001 	rlc	a
      0090C3 4F               [ 1] 3002 	clr	a
      0090C4 A2 00            [ 1] 3003 	sbc	a, #0x00
      0090C6 6B 40            [ 1] 3004 	ld	(0x40, sp), a
      0090C8 90 97            [ 1] 3005 	ld	yl, a
      0090CA 90 95            [ 1] 3006 	ld	yh, a
      0090CC 4B 00            [ 1] 3007 	push	#0x00
      0090CE 4B 00            [ 1] 3008 	push	#0x00
      0090D0 4B 00            [ 1] 3009 	push	#0x00
      0090D2 4B 00            [ 1] 3010 	push	#0x00
      0090D4 89               [ 2] 3011 	pushw	x
      0090D5 1E 0F            [ 2] 3012 	ldw	x, (0x0f, sp)
      0090D7 89               [ 2] 3013 	pushw	x
      0090D8 1E 48            [ 2] 3014 	ldw	x, (0x48, sp)
      0090DA 89               [ 2] 3015 	pushw	x
      0090DB 90 89            [ 2] 3016 	pushw	y
      0090DD 5F               [ 1] 3017 	clrw	x
      0090DE 89               [ 2] 3018 	pushw	x
      0090DF 5F               [ 1] 3019 	clrw	x
      0090E0 89               [ 2] 3020 	pushw	x
      0090E1 CD 87 B5         [ 4] 3021 	call	_transTime
      0090E4 5B 10            [ 2] 3022 	addw	sp, #16
      0090E6 CF 00 11         [ 2] 3023 	ldw	_DnClock_Tim_1+2, x
      0090E9 90 CF 00 0F      [ 2] 3024 	ldw	_DnClock_Tim_1+0, y
                                   3025 ;	clock.c: 543: DnClock_Tim_2 = transTime(0,EEPROM_DATA(DnClock_hour_2),EEPROM_DATA(DnClock_min_2),0);
      0090ED AE 40 05         [ 2] 3026 	ldw	x, #0x4005
      0090F0 F6               [ 1] 3027 	ld	a, (x)
      0090F1 97               [ 1] 3028 	ld	xl, a
      0090F2 49               [ 1] 3029 	rlc	a
      0090F3 4F               [ 1] 3030 	clr	a
      0090F4 A2 00            [ 1] 3031 	sbc	a, #0x00
      0090F6 95               [ 1] 3032 	ld	xh, a
      0090F7 6B 27            [ 1] 3033 	ld	(0x27, sp), a
      0090F9 6B 26            [ 1] 3034 	ld	(0x26, sp), a
      0090FB 90 AE 40 04      [ 2] 3035 	ldw	y, #0x4004
      0090FF 90 F6            [ 1] 3036 	ld	a, (y)
      009101 6B 06            [ 1] 3037 	ld	(0x06, sp), a
      009103 7B 06            [ 1] 3038 	ld	a, (0x06, sp)
      009105 49               [ 1] 3039 	rlc	a
      009106 4F               [ 1] 3040 	clr	a
      009107 A2 00            [ 1] 3041 	sbc	a, #0x00
      009109 6B 05            [ 1] 3042 	ld	(0x05, sp), a
      00910B 90 97            [ 1] 3043 	ld	yl, a
      00910D 90 95            [ 1] 3044 	ld	yh, a
      00910F 4B 00            [ 1] 3045 	push	#0x00
      009111 4B 00            [ 1] 3046 	push	#0x00
      009113 4B 00            [ 1] 3047 	push	#0x00
      009115 4B 00            [ 1] 3048 	push	#0x00
      009117 89               [ 2] 3049 	pushw	x
      009118 1E 2C            [ 2] 3050 	ldw	x, (0x2c, sp)
      00911A 89               [ 2] 3051 	pushw	x
      00911B 1E 0D            [ 2] 3052 	ldw	x, (0x0d, sp)
      00911D 89               [ 2] 3053 	pushw	x
      00911E 90 89            [ 2] 3054 	pushw	y
      009120 5F               [ 1] 3055 	clrw	x
      009121 89               [ 2] 3056 	pushw	x
      009122 5F               [ 1] 3057 	clrw	x
      009123 89               [ 2] 3058 	pushw	x
      009124 CD 87 B5         [ 4] 3059 	call	_transTime
      009127 5B 10            [ 2] 3060 	addw	sp, #16
      009129 CF 00 15         [ 2] 3061 	ldw	_DnClock_Tim_2+2, x
      00912C 90 CF 00 13      [ 2] 3062 	ldw	_DnClock_Tim_2+0, y
                                   3063 ;	clock.c: 544: DnClock_Tim_3 = transTime(0,EEPROM_DATA(DnClock_hour_3),EEPROM_DATA(DnClock_min_3),0);
      009130 AE 40 07         [ 2] 3064 	ldw	x, #0x4007
      009133 F6               [ 1] 3065 	ld	a, (x)
      009134 97               [ 1] 3066 	ld	xl, a
      009135 49               [ 1] 3067 	rlc	a
      009136 4F               [ 1] 3068 	clr	a
      009137 A2 00            [ 1] 3069 	sbc	a, #0x00
      009139 95               [ 1] 3070 	ld	xh, a
      00913A 6B 0E            [ 1] 3071 	ld	(0x0e, sp), a
      00913C 6B 0D            [ 1] 3072 	ld	(0x0d, sp), a
      00913E 90 AE 40 06      [ 2] 3073 	ldw	y, #0x4006
      009142 90 F6            [ 1] 3074 	ld	a, (y)
      009144 6B 22            [ 1] 3075 	ld	(0x22, sp), a
      009146 7B 22            [ 1] 3076 	ld	a, (0x22, sp)
      009148 49               [ 1] 3077 	rlc	a
      009149 4F               [ 1] 3078 	clr	a
      00914A A2 00            [ 1] 3079 	sbc	a, #0x00
      00914C 6B 21            [ 1] 3080 	ld	(0x21, sp), a
      00914E 90 97            [ 1] 3081 	ld	yl, a
      009150 90 95            [ 1] 3082 	ld	yh, a
      009152 4B 00            [ 1] 3083 	push	#0x00
      009154 4B 00            [ 1] 3084 	push	#0x00
      009156 4B 00            [ 1] 3085 	push	#0x00
      009158 4B 00            [ 1] 3086 	push	#0x00
      00915A 89               [ 2] 3087 	pushw	x
      00915B 1E 13            [ 2] 3088 	ldw	x, (0x13, sp)
      00915D 89               [ 2] 3089 	pushw	x
      00915E 1E 29            [ 2] 3090 	ldw	x, (0x29, sp)
      009160 89               [ 2] 3091 	pushw	x
      009161 90 89            [ 2] 3092 	pushw	y
      009163 5F               [ 1] 3093 	clrw	x
      009164 89               [ 2] 3094 	pushw	x
      009165 5F               [ 1] 3095 	clrw	x
      009166 89               [ 2] 3096 	pushw	x
      009167 CD 87 B5         [ 4] 3097 	call	_transTime
      00916A 5B 10            [ 2] 3098 	addw	sp, #16
      00916C CF 00 19         [ 2] 3099 	ldw	_DnClock_Tim_3+2, x
      00916F 90 CF 00 17      [ 2] 3100 	ldw	_DnClock_Tim_3+0, y
                                   3101 ;	clock.c: 546: while(1){
      009173                       3102 00128$:
                                   3103 ;	clock.c: 548: Soft_Timer++;
      009173 CE 00 45         [ 2] 3104 	ldw	x, _Soft_Timer+0
      009176 5C               [ 2] 3105 	incw	x
      009177 CF 00 45         [ 2] 3106 	ldw	_Soft_Timer+0, x
                                   3107 ;	clock.c: 550: if(button(ok))Meny();
      00917A 4B 06            [ 1] 3108 	push	#0x06
      00917C CD 89 15         [ 4] 3109 	call	_button
      00917F 5B 01            [ 2] 3110 	addw	sp, #1
      009181 4D               [ 1] 3111 	tnz	a
      009182 27 03            [ 1] 3112 	jreq	00102$
      009184 CD 8E D1         [ 4] 3113 	call	_Meny
      009187                       3114 00102$:
                                   3115 ;	clock.c: 552: if(button(up)){
      009187 4B 05            [ 1] 3116 	push	#0x05
      009189 CD 89 15         [ 4] 3117 	call	_button
      00918C 5B 01            [ 2] 3118 	addw	sp, #1
      00918E 6B 19            [ 1] 3119 	ld	(0x19, sp), a
      009190 0D 19            [ 1] 3120 	tnz	(0x19, sp)
      009192 27 39            [ 1] 3121 	jreq	00104$
                                   3122 ;	clock.c: 553: TM1637_sendMASS(0x78,0x50,0x08,ASCI[PointTimer]);
      009194 AE 00 27         [ 2] 3123 	ldw	x, #_TM1637_seg+0
      009197 1F 01            [ 2] 3124 	ldw	(0x01, sp), x
      009199 1E 01            [ 2] 3125 	ldw	x, (0x01, sp)
      00919B A6 78            [ 1] 3126 	ld	a, #0x78
      00919D F7               [ 1] 3127 	ld	(x), a
      00919E 1E 01            [ 2] 3128 	ldw	x, (0x01, sp)
      0091A0 5C               [ 2] 3129 	incw	x
      0091A1 A6 50            [ 1] 3130 	ld	a, #0x50
      0091A3 F7               [ 1] 3131 	ld	(x), a
      0091A4 1E 01            [ 2] 3132 	ldw	x, (0x01, sp)
      0091A6 5C               [ 2] 3133 	incw	x
      0091A7 5C               [ 2] 3134 	incw	x
      0091A8 A6 08            [ 1] 3135 	ld	a, #0x08
      0091AA F7               [ 1] 3136 	ld	(x), a
      0091AB 16 01            [ 2] 3137 	ldw	y, (0x01, sp)
      0091AD 72 A9 00 03      [ 2] 3138 	addw	y, #0x0003
      0091B1 AE 00 2B         [ 2] 3139 	ldw	x, #_ASCI+0
      0091B4 9F               [ 1] 3140 	ld	a, xl
      0091B5 CB 00 23         [ 1] 3141 	add	a, _PointTimer+0
      0091B8 02               [ 1] 3142 	rlwa	x
      0091B9 A9 00            [ 1] 3143 	adc	a, #0x00
      0091BB 95               [ 1] 3144 	ld	xh, a
      0091BC F6               [ 1] 3145 	ld	a, (x)
      0091BD 90 F7            [ 1] 3146 	ld	(y), a
      0091BF CD 81 D9         [ 4] 3147 	call	_TM1637_send
                                   3148 ;	clock.c: 554: delay(9000);
      0091C2 4B 28            [ 1] 3149 	push	#0x28
      0091C4 4B 23            [ 1] 3150 	push	#0x23
      0091C6 5F               [ 1] 3151 	clrw	x
      0091C7 89               [ 2] 3152 	pushw	x
      0091C8 CD 80 A0         [ 4] 3153 	call	_delay
      0091CB 5B 04            [ 2] 3154 	addw	sp, #4
      0091CD                       3155 00104$:
                                   3156 ;	clock.c: 558: if(Soft_Timer == 15000){ // Отображение времени при значении Программного таймера
      0091CD CE 00 45         [ 2] 3157 	ldw	x, _Soft_Timer+0
      0091D0 A3 3A 98         [ 2] 3158 	cpw	x, #0x3a98
      0091D3 26 9E            [ 1] 3159 	jrne	00128$
                                   3160 ;	clock.c: 559: RTC_Read();
      0091D5 CD 85 7E         [ 4] 3161 	call	_RTC_Read
                                   3162 ;	clock.c: 562: timeToSec = transTime(0,hour,min,sec);
      0091D8 5F               [ 1] 3163 	clrw	x
      0091D9 C6 00 01         [ 1] 3164 	ld	a, _sec+0
      0091DC 97               [ 1] 3165 	ld	xl, a
      0091DD 0F 31            [ 1] 3166 	clr	(0x31, sp)
      0091DF 0F 30            [ 1] 3167 	clr	(0x30, sp)
      0091E1 C6 00 02         [ 1] 3168 	ld	a, _min+0
      0091E4 6B 18            [ 1] 3169 	ld	(0x18, sp), a
      0091E6 0F 17            [ 1] 3170 	clr	(0x17, sp)
      0091E8 90 5F            [ 1] 3171 	clrw	y
      0091EA C6 00 03         [ 1] 3172 	ld	a, _hour+0
      0091ED 6B 3B            [ 1] 3173 	ld	(0x3b, sp), a
      0091EF 0F 3A            [ 1] 3174 	clr	(0x3a, sp)
      0091F1 0F 39            [ 1] 3175 	clr	(0x39, sp)
      0091F3 0F 38            [ 1] 3176 	clr	(0x38, sp)
      0091F5 89               [ 2] 3177 	pushw	x
      0091F6 1E 32            [ 2] 3178 	ldw	x, (0x32, sp)
      0091F8 89               [ 2] 3179 	pushw	x
      0091F9 1E 1B            [ 2] 3180 	ldw	x, (0x1b, sp)
      0091FB 89               [ 2] 3181 	pushw	x
      0091FC 90 89            [ 2] 3182 	pushw	y
      0091FE 1E 42            [ 2] 3183 	ldw	x, (0x42, sp)
      009200 89               [ 2] 3184 	pushw	x
      009201 1E 42            [ 2] 3185 	ldw	x, (0x42, sp)
      009203 89               [ 2] 3186 	pushw	x
      009204 5F               [ 1] 3187 	clrw	x
      009205 89               [ 2] 3188 	pushw	x
      009206 5F               [ 1] 3189 	clrw	x
      009207 89               [ 2] 3190 	pushw	x
      009208 CD 87 B5         [ 4] 3191 	call	_transTime
      00920B 5B 10            [ 2] 3192 	addw	sp, #16
      00920D CF 00 1D         [ 2] 3193 	ldw	_timeToSec+2, x
      009210 90 CF 00 1B      [ 2] 3194 	ldw	_timeToSec+0, y
                                   3195 ;	clock.c: 563: dot = !dot;
      009214 C6 00 08         [ 1] 3196 	ld	a, _dot+0
      009217 A0 01            [ 1] 3197 	sub	a, #0x01
      009219 4F               [ 1] 3198 	clr	a
      00921A 49               [ 1] 3199 	rlc	a
      00921B C7 00 08         [ 1] 3200 	ld	_dot+0, a
                                   3201 ;	clock.c: 564: PointTimer = 0x00;
      00921E 72 5F 00 23      [ 1] 3202 	clr	_PointTimer+0
                                   3203 ;	clock.c: 567: if( timeToSec+1 > DnClock_Tim_0 & timeToSec < DnClock_Tim_1) PointTimer = 1; //От начало смены до начало обеда
      009222 CE 00 1D         [ 2] 3204 	ldw	x, _timeToSec+2
      009225 1C 00 01         [ 2] 3205 	addw	x, #0x0001
      009228 1F 1D            [ 2] 3206 	ldw	(0x1d, sp), x
      00922A C6 00 1C         [ 1] 3207 	ld	a, _timeToSec+1
      00922D A9 00            [ 1] 3208 	adc	a, #0x00
      00922F 6B 1C            [ 1] 3209 	ld	(0x1c, sp), a
      009231 C6 00 1B         [ 1] 3210 	ld	a, _timeToSec+0
      009234 A9 00            [ 1] 3211 	adc	a, #0x00
      009236 6B 1B            [ 1] 3212 	ld	(0x1b, sp), a
      009238 CE 00 0D         [ 2] 3213 	ldw	x, _DnClock_Tim_0+2
      00923B 13 1D            [ 2] 3214 	cpw	x, (0x1d, sp)
      00923D C6 00 0C         [ 1] 3215 	ld	a, _DnClock_Tim_0+1
      009240 12 1C            [ 1] 3216 	sbc	a, (0x1c, sp)
      009242 C6 00 0B         [ 1] 3217 	ld	a, _DnClock_Tim_0+0
      009245 12 1B            [ 1] 3218 	sbc	a, (0x1b, sp)
      009247 25 04            [ 1] 3219 	jrc	00193$
      009249 0F 1A            [ 1] 3220 	clr	(0x1a, sp)
      00924B 20 04            [ 2] 3221 	jra	00194$
      00924D                       3222 00193$:
      00924D A6 01            [ 1] 3223 	ld	a, #0x01
      00924F 6B 1A            [ 1] 3224 	ld	(0x1a, sp), a
      009251                       3225 00194$:
      009251 CE 00 1D         [ 2] 3226 	ldw	x, _timeToSec+2
      009254 C3 00 11         [ 2] 3227 	cpw	x, _DnClock_Tim_1+2
      009257 C6 00 1C         [ 1] 3228 	ld	a, _timeToSec+1
      00925A C2 00 10         [ 1] 3229 	sbc	a, _DnClock_Tim_1+1
      00925D C6 00 1B         [ 1] 3230 	ld	a, _timeToSec+0
      009260 C2 00 0F         [ 1] 3231 	sbc	a, _DnClock_Tim_1+0
      009263 25 03            [ 1] 3232 	jrc	00195$
      009265 4F               [ 1] 3233 	clr	a
      009266 20 02            [ 2] 3234 	jra	00196$
      009268                       3235 00195$:
      009268 A6 01            [ 1] 3236 	ld	a, #0x01
      00926A                       3237 00196$:
      00926A 14 1A            [ 1] 3238 	and	a, (0x1a, sp)
      00926C 4D               [ 1] 3239 	tnz	a
      00926D 27 04            [ 1] 3240 	jreq	00106$
      00926F 35 01 00 23      [ 1] 3241 	mov	_PointTimer+0, #0x01
      009273                       3242 00106$:
                                   3243 ;	clock.c: 569: if( timeToSec+1 > DnClock_Tim_1 & timeToSec < DnClock_Tim_2) PointTimer = 2; //от начала обеда до  конца обеда;
      009273 CE 00 11         [ 2] 3244 	ldw	x, _DnClock_Tim_1+2
      009276 13 1D            [ 2] 3245 	cpw	x, (0x1d, sp)
      009278 C6 00 10         [ 1] 3246 	ld	a, _DnClock_Tim_1+1
      00927B 12 1C            [ 1] 3247 	sbc	a, (0x1c, sp)
      00927D C6 00 0F         [ 1] 3248 	ld	a, _DnClock_Tim_1+0
      009280 12 1B            [ 1] 3249 	sbc	a, (0x1b, sp)
      009282 25 04            [ 1] 3250 	jrc	00198$
      009284 0F 23            [ 1] 3251 	clr	(0x23, sp)
      009286 20 04            [ 2] 3252 	jra	00199$
      009288                       3253 00198$:
      009288 A6 01            [ 1] 3254 	ld	a, #0x01
      00928A 6B 23            [ 1] 3255 	ld	(0x23, sp), a
      00928C                       3256 00199$:
      00928C CE 00 1D         [ 2] 3257 	ldw	x, _timeToSec+2
      00928F C3 00 15         [ 2] 3258 	cpw	x, _DnClock_Tim_2+2
      009292 C6 00 1C         [ 1] 3259 	ld	a, _timeToSec+1
      009295 C2 00 14         [ 1] 3260 	sbc	a, _DnClock_Tim_2+1
      009298 C6 00 1B         [ 1] 3261 	ld	a, _timeToSec+0
      00929B C2 00 13         [ 1] 3262 	sbc	a, _DnClock_Tim_2+0
      00929E 25 03            [ 1] 3263 	jrc	00200$
      0092A0 4F               [ 1] 3264 	clr	a
      0092A1 20 02            [ 2] 3265 	jra	00201$
      0092A3                       3266 00200$:
      0092A3 A6 01            [ 1] 3267 	ld	a, #0x01
      0092A5                       3268 00201$:
      0092A5 14 23            [ 1] 3269 	and	a, (0x23, sp)
      0092A7 4D               [ 1] 3270 	tnz	a
      0092A8 27 04            [ 1] 3271 	jreq	00108$
      0092AA 35 02 00 23      [ 1] 3272 	mov	_PointTimer+0, #0x02
      0092AE                       3273 00108$:
                                   3274 ;	clock.c: 571: if( timeToSec+1 > DnClock_Tim_2 & timeToSec < DnClock_Tim_3) PointTimer = 3; //от конца  обеда до  конца смены
      0092AE CE 00 15         [ 2] 3275 	ldw	x, _DnClock_Tim_2+2
      0092B1 13 1D            [ 2] 3276 	cpw	x, (0x1d, sp)
      0092B3 C6 00 14         [ 1] 3277 	ld	a, _DnClock_Tim_2+1
      0092B6 12 1C            [ 1] 3278 	sbc	a, (0x1c, sp)
      0092B8 C6 00 13         [ 1] 3279 	ld	a, _DnClock_Tim_2+0
      0092BB 12 1B            [ 1] 3280 	sbc	a, (0x1b, sp)
      0092BD 25 04            [ 1] 3281 	jrc	00203$
      0092BF 0F 42            [ 1] 3282 	clr	(0x42, sp)
      0092C1 20 04            [ 2] 3283 	jra	00204$
      0092C3                       3284 00203$:
      0092C3 A6 01            [ 1] 3285 	ld	a, #0x01
      0092C5 6B 42            [ 1] 3286 	ld	(0x42, sp), a
      0092C7                       3287 00204$:
      0092C7 CE 00 1D         [ 2] 3288 	ldw	x, _timeToSec+2
      0092CA C3 00 19         [ 2] 3289 	cpw	x, _DnClock_Tim_3+2
      0092CD C6 00 1C         [ 1] 3290 	ld	a, _timeToSec+1
      0092D0 C2 00 18         [ 1] 3291 	sbc	a, _DnClock_Tim_3+1
      0092D3 C6 00 1B         [ 1] 3292 	ld	a, _timeToSec+0
      0092D6 C2 00 17         [ 1] 3293 	sbc	a, _DnClock_Tim_3+0
      0092D9 25 03            [ 1] 3294 	jrc	00205$
      0092DB 4F               [ 1] 3295 	clr	a
      0092DC 20 02            [ 2] 3296 	jra	00206$
      0092DE                       3297 00205$:
      0092DE A6 01            [ 1] 3298 	ld	a, #0x01
      0092E0                       3299 00206$:
      0092E0 14 42            [ 1] 3300 	and	a, (0x42, sp)
      0092E2 4D               [ 1] 3301 	tnz	a
      0092E3 27 04            [ 1] 3302 	jreq	00110$
      0092E5 35 03 00 23      [ 1] 3303 	mov	_PointTimer+0, #0x03
      0092E9                       3304 00110$:
                                   3305 ;	clock.c: 574: switch (PointTimer) {
      0092E9 C6 00 23         [ 1] 3306 	ld	a, _PointTimer+0
      0092EC A1 01            [ 1] 3307 	cp	a, #0x01
      0092EE 27 10            [ 1] 3308 	jreq	00111$
      0092F0 C6 00 23         [ 1] 3309 	ld	a, _PointTimer+0
      0092F3 A1 02            [ 1] 3310 	cp	a, #0x02
      0092F5 27 28            [ 1] 3311 	jreq	00112$
      0092F7 C6 00 23         [ 1] 3312 	ld	a, _PointTimer+0
      0092FA A1 03            [ 1] 3313 	cp	a, #0x03
      0092FC 27 40            [ 1] 3314 	jreq	00113$
      0092FE 20 5D            [ 2] 3315 	jra	00114$
                                   3316 ;	clock.c: 575: case 1: timeRes = DnClock_Tim_1 - timeToSec; break;
      009300                       3317 00111$:
      009300 90 CE 00 11      [ 2] 3318 	ldw	y, _DnClock_Tim_1+2
      009304 72 B2 00 1D      [ 2] 3319 	subw	y, _timeToSec+2
      009308 C6 00 10         [ 1] 3320 	ld	a, _DnClock_Tim_1+1
      00930B C2 00 1C         [ 1] 3321 	sbc	a, _timeToSec+1
      00930E 97               [ 1] 3322 	ld	xl, a
      00930F C6 00 0F         [ 1] 3323 	ld	a, _DnClock_Tim_1+0
      009312 C2 00 1B         [ 1] 3324 	sbc	a, _timeToSec+0
      009315 95               [ 1] 3325 	ld	xh, a
      009316 90 CF 00 21      [ 2] 3326 	ldw	_timeRes+2, y
      00931A CF 00 1F         [ 2] 3327 	ldw	_timeRes+0, x
      00931D 20 45            [ 2] 3328 	jra	00115$
                                   3329 ;	clock.c: 576: case 2: timeRes = DnClock_Tim_2 - timeToSec; break;
      00931F                       3330 00112$:
      00931F 90 CE 00 15      [ 2] 3331 	ldw	y, _DnClock_Tim_2+2
      009323 72 B2 00 1D      [ 2] 3332 	subw	y, _timeToSec+2
      009327 C6 00 14         [ 1] 3333 	ld	a, _DnClock_Tim_2+1
      00932A C2 00 1C         [ 1] 3334 	sbc	a, _timeToSec+1
      00932D 97               [ 1] 3335 	ld	xl, a
      00932E C6 00 13         [ 1] 3336 	ld	a, _DnClock_Tim_2+0
      009331 C2 00 1B         [ 1] 3337 	sbc	a, _timeToSec+0
      009334 95               [ 1] 3338 	ld	xh, a
      009335 90 CF 00 21      [ 2] 3339 	ldw	_timeRes+2, y
      009339 CF 00 1F         [ 2] 3340 	ldw	_timeRes+0, x
      00933C 20 26            [ 2] 3341 	jra	00115$
                                   3342 ;	clock.c: 577: case 3: timeRes = DnClock_Tim_3 - timeToSec; break;
      00933E                       3343 00113$:
      00933E 90 CE 00 19      [ 2] 3344 	ldw	y, _DnClock_Tim_3+2
      009342 72 B2 00 1D      [ 2] 3345 	subw	y, _timeToSec+2
      009346 C6 00 18         [ 1] 3346 	ld	a, _DnClock_Tim_3+1
      009349 C2 00 1C         [ 1] 3347 	sbc	a, _timeToSec+1
      00934C 97               [ 1] 3348 	ld	xl, a
      00934D C6 00 17         [ 1] 3349 	ld	a, _DnClock_Tim_3+0
      009350 C2 00 1B         [ 1] 3350 	sbc	a, _timeToSec+0
      009353 95               [ 1] 3351 	ld	xh, a
      009354 90 CF 00 21      [ 2] 3352 	ldw	_timeRes+2, y
      009358 CF 00 1F         [ 2] 3353 	ldw	_timeRes+0, x
      00935B 20 07            [ 2] 3354 	jra	00115$
                                   3355 ;	clock.c: 579: default: timeRes = 0; break;
      00935D                       3356 00114$:
      00935D 5F               [ 1] 3357 	clrw	x
      00935E CF 00 21         [ 2] 3358 	ldw	_timeRes+2, x
      009361 CF 00 1F         [ 2] 3359 	ldw	_timeRes+0, x
                                   3360 ;	clock.c: 580: }
      009364                       3361 00115$:
                                   3362 ;	clock.c: 583: if(timeRes>0){
      009364 CE 00 21         [ 2] 3363 	ldw	x, _timeRes+2
      009367 26 08            [ 1] 3364 	jrne	00217$
      009369 CE 00 1F         [ 2] 3365 	ldw	x, _timeRes+0
      00936C 26 03            [ 1] 3366 	jrne	00217$
      00936E CC 94 43         [ 2] 3367 	jp	00123$
      009371                       3368 00217$:
                                   3369 ;	clock.c: 584: conSec(timeRes);
      009371 3B 00 22         [ 1] 3370 	push	_timeRes+3
      009374 3B 00 21         [ 1] 3371 	push	_timeRes+2
      009377 3B 00 20         [ 1] 3372 	push	_timeRes+1
      00937A 3B 00 1F         [ 1] 3373 	push	_timeRes+0
      00937D CD 86 BB         [ 4] 3374 	call	_conSec
      009380 5B 04            [ 2] 3375 	addw	sp, #4
                                   3376 ;	clock.c: 585: TM1637_seg[0] = ASCI[con_hour/10];
      009382 AE 00 27         [ 2] 3377 	ldw	x, #_TM1637_seg+0
      009385 1F 24            [ 2] 3378 	ldw	(0x24, sp), x
      009387 AE 00 2B         [ 2] 3379 	ldw	x, #_ASCI+0
      00938A 1F 2E            [ 2] 3380 	ldw	(0x2e, sp), x
      00938C 4B 0A            [ 1] 3381 	push	#0x0a
      00938E 5F               [ 1] 3382 	clrw	x
      00938F 89               [ 2] 3383 	pushw	x
      009390 4B 00            [ 1] 3384 	push	#0x00
      009392 3B 00 3C         [ 1] 3385 	push	_con_hour+3
      009395 3B 00 3B         [ 1] 3386 	push	_con_hour+2
      009398 3B 00 3A         [ 1] 3387 	push	_con_hour+1
      00939B 3B 00 39         [ 1] 3388 	push	_con_hour+0
      00939E CD 95 04         [ 4] 3389 	call	__divulong
      0093A1 5B 08            [ 2] 3390 	addw	sp, #8
      0093A3 72 FB 2E         [ 2] 3391 	addw	x, (0x2e, sp)
      0093A6 F6               [ 1] 3392 	ld	a, (x)
      0093A7 1E 24            [ 2] 3393 	ldw	x, (0x24, sp)
      0093A9 F7               [ 1] 3394 	ld	(x), a
                                   3395 ;	clock.c: 586: TM1637_seg[1] = ASCI[con_hour%10];
      0093AA 1E 24            [ 2] 3396 	ldw	x, (0x24, sp)
      0093AC 5C               [ 2] 3397 	incw	x
      0093AD 1F 11            [ 2] 3398 	ldw	(0x11, sp), x
      0093AF 4B 0A            [ 1] 3399 	push	#0x0a
      0093B1 5F               [ 1] 3400 	clrw	x
      0093B2 89               [ 2] 3401 	pushw	x
      0093B3 4B 00            [ 1] 3402 	push	#0x00
      0093B5 3B 00 3C         [ 1] 3403 	push	_con_hour+3
      0093B8 3B 00 3B         [ 1] 3404 	push	_con_hour+2
      0093BB 3B 00 3A         [ 1] 3405 	push	_con_hour+1
      0093BE 3B 00 39         [ 1] 3406 	push	_con_hour+0
      0093C1 CD 94 6D         [ 4] 3407 	call	__modulong
      0093C4 5B 08            [ 2] 3408 	addw	sp, #8
      0093C6 72 FB 2E         [ 2] 3409 	addw	x, (0x2e, sp)
      0093C9 F6               [ 1] 3410 	ld	a, (x)
      0093CA 1E 11            [ 2] 3411 	ldw	x, (0x11, sp)
      0093CC F7               [ 1] 3412 	ld	(x), a
                                   3413 ;	clock.c: 587: TM1637_seg[2] = ASCI[con_min/10];
      0093CD 1E 24            [ 2] 3414 	ldw	x, (0x24, sp)
      0093CF 5C               [ 2] 3415 	incw	x
      0093D0 5C               [ 2] 3416 	incw	x
      0093D1 1F 3C            [ 2] 3417 	ldw	(0x3c, sp), x
      0093D3 4B 0A            [ 1] 3418 	push	#0x0a
      0093D5 5F               [ 1] 3419 	clrw	x
      0093D6 89               [ 2] 3420 	pushw	x
      0093D7 4B 00            [ 1] 3421 	push	#0x00
      0093D9 3B 00 40         [ 1] 3422 	push	_con_min+3
      0093DC 3B 00 3F         [ 1] 3423 	push	_con_min+2
      0093DF 3B 00 3E         [ 1] 3424 	push	_con_min+1
      0093E2 3B 00 3D         [ 1] 3425 	push	_con_min+0
      0093E5 CD 95 04         [ 4] 3426 	call	__divulong
      0093E8 5B 08            [ 2] 3427 	addw	sp, #8
      0093EA 72 FB 2E         [ 2] 3428 	addw	x, (0x2e, sp)
      0093ED F6               [ 1] 3429 	ld	a, (x)
      0093EE 1E 3C            [ 2] 3430 	ldw	x, (0x3c, sp)
      0093F0 F7               [ 1] 3431 	ld	(x), a
                                   3432 ;	clock.c: 588: TM1637_seg[3] = ASCI[con_min%10];
      0093F1 1E 24            [ 2] 3433 	ldw	x, (0x24, sp)
      0093F3 1C 00 03         [ 2] 3434 	addw	x, #0x0003
      0093F6 1F 13            [ 2] 3435 	ldw	(0x13, sp), x
      0093F8 4B 0A            [ 1] 3436 	push	#0x0a
      0093FA 5F               [ 1] 3437 	clrw	x
      0093FB 89               [ 2] 3438 	pushw	x
      0093FC 4B 00            [ 1] 3439 	push	#0x00
      0093FE 3B 00 40         [ 1] 3440 	push	_con_min+3
      009401 3B 00 3F         [ 1] 3441 	push	_con_min+2
      009404 3B 00 3E         [ 1] 3442 	push	_con_min+1
      009407 3B 00 3D         [ 1] 3443 	push	_con_min+0
      00940A CD 94 6D         [ 4] 3444 	call	__modulong
      00940D 5B 08            [ 2] 3445 	addw	sp, #8
      00940F 72 FB 2E         [ 2] 3446 	addw	x, (0x2e, sp)
      009412 F6               [ 1] 3447 	ld	a, (x)
      009413 1E 13            [ 2] 3448 	ldw	x, (0x13, sp)
      009415 F7               [ 1] 3449 	ld	(x), a
                                   3450 ;	clock.c: 589: if(EEPROM_DATA(UpLevel))if(con_hour<10)	TM1637_seg[0] =  0x00; //Отключение первого разряда если в нем 0
      009416 AE 40 09         [ 2] 3451 	ldw	x, #0x4009
      009419 F6               [ 1] 3452 	ld	a, (x)
      00941A 4D               [ 1] 3453 	tnz	a
      00941B 27 15            [ 1] 3454 	jreq	00119$
      00941D CE 00 3B         [ 2] 3455 	ldw	x, _con_hour+2
      009420 A3 00 0A         [ 2] 3456 	cpw	x, #0x000a
      009423 C6 00 3A         [ 1] 3457 	ld	a, _con_hour+1
      009426 A2 00            [ 1] 3458 	sbc	a, #0x00
      009428 C6 00 39         [ 1] 3459 	ld	a, _con_hour+0
      00942B A2 00            [ 1] 3460 	sbc	a, #0x00
      00942D 24 03            [ 1] 3461 	jrnc	00119$
      00942F 1E 24            [ 2] 3462 	ldw	x, (0x24, sp)
      009431 7F               [ 1] 3463 	clr	(x)
      009432                       3464 00119$:
                                   3465 ;	clock.c: 590: if(dot) TM1637_seg[1] = TM1637_seg[1] + 0x80; //Включение секундных точек
      009432 72 00 00 08 02   [ 2] 3466 	btjt	_dot+0, #0, 00220$
      009437 20 27            [ 2] 3467 	jra	00124$
      009439                       3468 00220$:
      009439 1E 11            [ 2] 3469 	ldw	x, (0x11, sp)
      00943B F6               [ 1] 3470 	ld	a, (x)
      00943C AB 80            [ 1] 3471 	add	a, #0x80
      00943E 1E 11            [ 2] 3472 	ldw	x, (0x11, sp)
      009440 F7               [ 1] 3473 	ld	(x), a
      009441 20 1D            [ 2] 3474 	jra	00124$
      009443                       3475 00123$:
                                   3476 ;	clock.c: 593: TM1637_seg[0] = 0x40;
      009443 AE 00 27         [ 2] 3477 	ldw	x, #_TM1637_seg+0
      009446 1F 07            [ 2] 3478 	ldw	(0x07, sp), x
      009448 1E 07            [ 2] 3479 	ldw	x, (0x07, sp)
      00944A A6 40            [ 1] 3480 	ld	a, #0x40
      00944C F7               [ 1] 3481 	ld	(x), a
                                   3482 ;	clock.c: 594: TM1637_seg[1] = 0x40;
      00944D 1E 07            [ 2] 3483 	ldw	x, (0x07, sp)
      00944F 5C               [ 2] 3484 	incw	x
      009450 A6 40            [ 1] 3485 	ld	a, #0x40
      009452 F7               [ 1] 3486 	ld	(x), a
                                   3487 ;	clock.c: 595: TM1637_seg[2] = 0x40;
      009453 1E 07            [ 2] 3488 	ldw	x, (0x07, sp)
      009455 5C               [ 2] 3489 	incw	x
      009456 5C               [ 2] 3490 	incw	x
      009457 A6 40            [ 1] 3491 	ld	a, #0x40
      009459 F7               [ 1] 3492 	ld	(x), a
                                   3493 ;	clock.c: 596: TM1637_seg[3] = 0x40;
      00945A 1E 07            [ 2] 3494 	ldw	x, (0x07, sp)
      00945C A6 40            [ 1] 3495 	ld	a, #0x40
      00945E E7 03            [ 1] 3496 	ld	(0x0003, x), a
      009460                       3497 00124$:
                                   3498 ;	clock.c: 598: TM1637_send();
      009460 CD 81 D9         [ 4] 3499 	call	_TM1637_send
                                   3500 ;	clock.c: 600: Soft_Timer = 0x00; //Сброс таймера
      009463 5F               [ 1] 3501 	clrw	x
      009464 CF 00 45         [ 2] 3502 	ldw	_Soft_Timer+0, x
      009467 CC 91 73         [ 2] 3503 	jp	00128$
      00946A 5B 42            [ 2] 3504 	addw	sp, #66
      00946C 81               [ 4] 3505 	ret
                                   3506 	.area CODE
                                   3507 	.area INITIALIZER
      0095E5                       3508 __xinit__brigh:
      0095E5 07                    3509 	.db #0x07	; 7
      0095E6                       3510 __xinit__command1:
      0095E6 40                    3511 	.db #0x40	; 64
      0095E7                       3512 __xinit__command2:
      0095E7 C0                    3513 	.db #0xC0	; 192
      0095E8                       3514 __xinit__TM1637_seg:
      0095E8 FF                    3515 	.db #0xFF	; 255
      0095E9 FF                    3516 	.db #0xFF	; 255
      0095EA FF                    3517 	.db #0xFF	; 255
      0095EB FF                    3518 	.db #0xFF	; 255
      0095EC                       3519 __xinit__ASCI:
      0095EC 3F                    3520 	.db #0x3F	; 63
      0095ED 06                    3521 	.db #0x06	; 6
      0095EE 5B                    3522 	.db #0x5B	; 91
      0095EF 4F                    3523 	.db #0x4F	; 79	'O'
      0095F0 66                    3524 	.db #0x66	; 102	'f'
      0095F1 6D                    3525 	.db #0x6D	; 109	'm'
      0095F2 7D                    3526 	.db #0x7D	; 125
      0095F3 07                    3527 	.db #0x07	; 7
      0095F4 7F                    3528 	.db #0x7F	; 127
      0095F5 6F                    3529 	.db #0x6F	; 111	'o'
      0095F6                       3530 __xinit__con_day:
      0095F6 00 00 00 00           3531 	.byte #0x00,#0x00,#0x00,#0x00	; 0
      0095FA                       3532 __xinit__con_hour:
      0095FA 00 00 00 00           3533 	.byte #0x00,#0x00,#0x00,#0x00	; 0
      0095FE                       3534 __xinit__con_min:
      0095FE 00 00 00 00           3535 	.byte #0x00,#0x00,#0x00,#0x00	; 0
      009602                       3536 __xinit__con_sec:
      009602 00 00 00 00           3537 	.byte #0x00,#0x00,#0x00,#0x00	; 0
      009606                       3538 __xinit__Soft_Timer:
      009606 00 00                 3539 	.dw #0x0000
      009608                       3540 __xinit__Point_Meny:
      009608 00 00                 3541 	.dw #0x0000
      00960A                       3542 __xinit__Buff_But:
      00960A FF                    3543 	.db #0xFF	; 255
      00960B                       3544 __xinit__auto_exit:
      00960B 00                    3545 	.db #0x00	; 0
      00960C                       3546 __xinit__buff:
      00960C 00                    3547 	.db #0x00	;  0
                                   3548 	.area CABS (ABS)
