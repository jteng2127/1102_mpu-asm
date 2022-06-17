
		ORG	0000H	;Reset 
		LJMP	MAIN

		ORG	000BH 	;Timer0 interrupt vector 
		JMP	T0ISR

		ORG 0013H
		JMP EX1ISR

		ORG	0030H	;Program Start

T0ISR:
		DJNZ	R6, NOTHING
		MOV	R6, 07H	;AR7
		CPL	P1.1	;Toggle port bit 
NOTHING:
		RETI		;Return to main program

EX1ISR:
		MOV R3, #12
		JNB	P0.4, UP_PERIOD
		JNB	P0.5, STOP_GO
		JNB	P0.6, DOWN_PERIOD
		RETI
DOWN_PERIOD:
		CJNE R7, #5, DEC1
		RETI
DEC1:
		DEC	R7
		RETI
UP_PERIOD:
		CJNE R7, #15, INC1
		RETI
INC1:
		INC	R7
		RETI
STOP_GO:
		CPL	TR0
		RETI

MAIN:
		MOV	SP, #40H	;Init SP
		MOV	TMOD, #02H 	;timer0, mode 2 
		MOV	TH0, #-30 	;10 us delay 
		MOV	TL0, #-30 	;10 us delay

		MOV	R7, #10	;R7 = Initial Value of Counter
		MOV	R6, 07H	;R6 = Counter

		MOV	P0, #0FBH	;= '1', except row2

		MOV IE, #87H	;enable timer0 and Ext. interrupt 
		SETB IT0
		SETB IT1
		
		SETB TR0 	;Start timer 
		JB P3.3, SKIP
		CLR TR0
SKIP:
		SJMP $
		END

