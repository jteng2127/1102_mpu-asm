        ORG 0H      ;系統開機的執行位址為0
        JMP INIT
        ORG 30H
INIT:   ;填入測試資料
        MOV R4, #20H
        MOV 20H, #2
        MOV 21H, #4
        MOV 22H, #6
        MOV 23H, #2
        MOV 24H, #2
        MOV 25H, #1
        MOV 26H, #9
        MOV 27H, #2
MAIN:   ;使用者主程式
        MOV DPTR, #TABLE ;DPTR points to TABLE
        MOV R0, #0
LOOP:
        SETB P3.3
        SETB P3.4
        CALL LIGHT
        CLR P3.3
        CALL LIGHT
        CLR P3.4
        SETB P3.3
        CALL LIGHT
        CLR P3.3
        CALL LIGHT
        MOV R5, #3
        CALL DELAY 
        CJNE R0, #8, LOOP
        JMP MAIN
LIGHT:
        MOV A, R4
        ADD A, R0
        MOV R1, A
        MOV A, @R1
        MOVC A, @A+DPTR
        MOV P1, A
        INC R0
        MOV R5, #1
        CALL DELAY
        RET
DELAY:
        MOV R2, #200
DELAY1:
        MOV R3, #250
        DJNZ R3, $
        DJNZ R2, DELAY1
        DJNZ R5, DELAY
        RET
TABLE:
        DB 0C0H, 0F9H, 0A4H, 0B0H
        DB 99H, 92H, 82H, 0F8H
        DB 80H, 98H
        END