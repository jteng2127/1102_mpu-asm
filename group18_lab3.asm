  ORG 0H  ;The execution address of the system boot is 0
  JMP INIT ;Jump to the initialization routine

  LENGTH EQU 40H ;Length
  ARRAY EQU 41H 
  I EQU R2 ;I is the index of the array
  CUR EQU R0
  TAIL EQU R1
  ORG 30H

INIT: ;Initialization routine, KeilA51
  MOV LENGTH, #7 ;Set the length of the array
  MOV 41H, #'K' ;4B
  MOV 42H, #'e' ;65
  MOV 43H, #'i' ;69
  MOV 44H, #'l' ;6C
  MOV 45H, #'A' ;41
  MOV 46H, #'5' ;35
  MOV 47H, #'1' ;31

; Reverse array
MAIN:

  MOV I, LENGTH
  MOV A, I
  MOV B, #02H 
  DIV AB ; i divides by 2
  MOV I, A
  MOV CUR, #ARRAY ; CUR is the current starting of the array
  MOV A, #ARRAY
  ADD A, LENGTH
  DEC A
  MOV TAIL, A ; TAIL is the current end of the array

  ; while(i > 0)
  LOOP:
    MOV A, @CUR ; A is the value at the current of the array
    XCH A, @TAIL ; Exchange the value at the current of the array with the value at the end of the array
    MOV @CUR, A ; Set the value at the current of the array to the value at the end of the array
    INC CUR ; Increment the current of the array
    DEC TAIL ; Decrement the end of the array
    DJNZ I, LOOP
  JMP $
