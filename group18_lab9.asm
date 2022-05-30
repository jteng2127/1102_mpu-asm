		ORG	0H          	;系統開機的執行位址為0
		JMP	MAIN
		ORG	30H
MAIN:
START:
		MOV	DPTR, #TABLE	;DPTR points to TABLE
		MOV	R1, #0
LOOP:
		MOV	A, R1
		MOVC	A, @A+DPTR
DISPLAY:
		MOV	P1, A
		INC	R1
		CALL	DELAY
		CJNE	R1, #10, LOOP
		MOV	R1, #0
		JMP	LOOP

DELAY:
		MOV	R0, #200
DELAY1:
		MOV	R7, #250
		DJNZ	R7,$
		DJNZ	R0,DELAY1
		RET

TABLE:
		DB	0C0H, 0F9H, 0A4H, 0B0H
		DB	99H, 92H, 82H, 0F8H
		DB	80H, 98H
		END

; 需要清除溢位旗標
; 產生 65.536 ms
