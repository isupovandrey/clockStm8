FILE= clock

Param =  

all: compile stlink

compile: $(FILE).c
	@echo Compile..
	@sdcc -mstm8 -o debug/ $(FILE).c $(Param) -I lib/

stlink:
	@echo Program..
	@stm8flash -c stlinkv2 -p stm8s003f3 -w debug/$(FILE).ihx