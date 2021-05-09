LXI H,8000H  	;Point to the starting bit
MVI C,0AH    	;Initialise count to 10(0AH)
MVI D,00H    	;Clear register D
LOOP2: MOV A,M	;Load item from the memory
RAR             ;Rotate the content of accumulator toward right
JC LOOP1	;If carry = 1 , jump to LOOP1
JMP LOOP3	;Else jump directly to LOOP3
LOOP1: INR D	;Increase the odd number count
LOOP3: INX H	;Point to next location 
DCR C		;Decrease C by 1
JNZ LOOP2	;If C != 0, go to LOOP2
MOV A,D		;Load the count to A
STA 8050H	;Store the result at 8050H
HLT		;Terminate the program