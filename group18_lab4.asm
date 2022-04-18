ORG 0H ;系統開機的執行位址為0
  JMP MAIN
  ORG 30H
MAIN:
  MOV DPTR, #TABLE
  MOV A, #0
  MOVC A, @A+DPTR
  MOV R0, A
  DEC R0 ; loop end
INIT:
  MOV A, R0
  MOV R1, A
LOOP:
  MOV A, R0
  SUBB A, R1
  INC A
  MOVC A, @A+DPTR
  MOV P1, A
  DJNZ R1, LOOP
  JMP INIT
TABLE:
  DB 41 ;length
  DB 0xFE, 0xFD, 0xFB, 0xF7, 0xEF, 0xDF, 0xBF, 0x7F ;1st
  DB 0x7E, 0x7D, 0x7B, 0x77, 0x6F, 0x5F, 0x3F ;2nd
  DB 0x3E, 0x3D, 0x3B, 0x37, 0x2F, 0x1F ;3rd
  DB 0x1E, 0x1D, 0x1B, 0x17, 0x0F ;4th
  DB 0x0E, 0x0D, 0x0B, 0x07 ;5th
  DB 0x06, 0x05, 0x03 ; 6th
  DB 0x02, 0x01 ;7th
  DB 0x00 ;8th
  DB 0xFF, 0x00, 0xFF, 0x00 ;hooray
  END