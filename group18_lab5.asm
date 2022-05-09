START:
        MOV	DPTR, #TABLE ;DPTR points to TABLE
        MOV R0, #0
UPDATE:
        MOV A, R0
        MOVC A, @A+DPTR
        MOV P1, A
        INC R0
        CALL DELAY
        CJNE R0, #10, UPDATE
        JMP START
DELAY:
        MOV R1, #200
DELAY1:
        MOV R2, #250
        DJNZ R2, $
        DJNZ R1, DELAY1
        RET
TABLE:
        DB 0C0H, 0F9H, 0A4H, 0B0H
        DB 99H, 92H, 82H, 0F8H
        DB 80H, 98H