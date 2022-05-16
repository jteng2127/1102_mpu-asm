  ORG 0H      ;系統開機的執行位址為0
  JMP INIT
  ORG 30H
init: ; 初始化資料
  MOV DPTR, #table ; DPTR points to TABLE
scan:
  MOV R0, #0

  ; scan row0
  SETB P0.3
  CLR P0.0
  CALL colScan
  JB F0, show

  ; scan row1
  SETB P0.0
  CLR P0.1
  CALL colScan
  JB F0, show

  ; scan row2
  SETB P0.1
  CLR P0.2
  CALL colScan
  JB F0, show

  ; scan row3
  SETB P0.2
  CLR P0.3
  CALL colScan
  JB F0, show

  ; 沒有按下的話就把七段顯示器清除
  CALL clear
  JMP scan

show: ; 顯示七段顯示器的值與清除P0、F0
  SETB P0.0
  SETB P0.1
  SETB P0.2
  SETB P0.3
  CLR F0
  MOV A, R0
  MOVC A, @A+DPTR
  MOV P1, A
  
  JMP scan

clear: ; 清除七段顯示器
  MOV P1, #0FFH
  RET

; column-scan subroutine
colScan:
  JNB P0.4, gotKey
  INC R0
  JNB P0.5, gotKey
  INC R0
  JNB P0.6, gotKey
  INC R0
  RET
gotKey:
  SETB F0
  RET

table:
  DB 83H, 0C0H, 88H
  DB 98H, 80H, 0F8H
  DB 82H, 92H, 99H
  DB 0B0H, 0A4H, 0F9H
  END