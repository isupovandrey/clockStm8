# clockStm8
Часы на STM8 + TM1637 + ds2331.
Компилятор SDCC.


<h1>Структура меню</h1>
	Меню при нажатии кнопки "OK"

- <b>Рабочие таймерные часы "C__0"</b>
- <b>Часы "C__1"</b>
- <b>Настройки "C__2"</b>
    - Настройка RTC "r__0"
    - Настройка Рабочих таймерных часов "r__1"
        - Начало смены
        - Начало обеда
        - Конец обеда
        - Конец смены
    - Настройка яркости "r__2"
    - Настройка загрузки при включении "r__3"
        - Часы
        - Таймерные часы
    - Настройка выключение высшего разряда времени "r__4"
    - Выход в часы "r__5"
- <b>Выход в часы "C__3"</b>
<br><br><br>
Рабочие таймерные часы- Часы которые запраграммированы показывать время в трех режимах

	Режимы:
		1-Таймер от начало смены до обеда
		2-Таймер от начало обеда до конца обеда
		3-От конца обеда до конца смены


Схема подключения
![Image alt](https://github.com/isupovandrey/clockStm8/blob/master/shem.jpg)
