.ORIG x3000

AND R3, R3, #0

; Insertion Sort
SORT
; R3 stores the current index of input array
ADD R5, R3, #-16
BRzp GRADE
LD R1, DATA
ADD R1, R1, R3
LDR R1, R1, #0 ; R1 = input_array[R3]

; R4 stores the current index of result array
ADD R4, R3, #-1
BRn BREAK

INNER
LD R2, RESULT
ADD R2, R2, R4
LDR R6, R2, #0 ; R6 = result_array[R4]
NOT R5, R6
ADD R5, R5, #1
ADD R5, R1, R5
BRnz BREAK
STR R6, R2, #1 ; result_array[R4 + 1] = result_array[R4]
ADD R4, R4, #-1
BRzp INNER

BREAK
ADD R4, R4, #1
LD R2, RESULT
ADD R2, R2, R4
STR R1, R2, #0
ADD R3, R3, #1
BRnzp SORT



GRADE
; grade A
AND R2, R2, #0
LD R6, M85

AND R4, R4, #0

COUNTA
ADD R5, R4, #-4
BRzp SAVEA
LD R1, RESULT
ADD R1, R1, R4
LDR R5, R1, #0
ADD R5, R5, R6
BRn SAVEA
ADD R2, R2, #1
ADD R4, R4, #1
BRnzp COUNTA

SAVEA
LD R1, GRADEA
STR R2, R1, #0

; grade B
AND R2, R2, #0
LD R6, M75

COUNTB
ADD R5, R4, #-8
BRzp SAVEB
LD R1, RESULT
ADD R1, R1, R4
LDR R5, R1, #0
ADD R5, R5, R6
BRn SAVEB
ADD R2, R2, #1
ADD R4, R4, #1
BRnzp COUNTB

SAVEB
LD R1, GRADEB
STR R2, R1, #0

LD R1, GRADEC
ADD R4, R4, #-16
NOT R4, R4
ADD R4, R4, #1
STR R4, R1, #0 

DONE HALT

DATA .FILL x3200
RESULT .FILL x4000
GRADEA .FILL x4100
GRADEB .FILL x4101
GRADEC .FILL x4102
M85 .FILL xffab
M75 .FILL xffb5

; Test Case
PAD .BLKW 446
D1 .FILL #100
D2 .FILL #45
D15 .FILL #38
D14 .FILL #34
D13 .FILL #30
D3 .FILL #28
D4 .FILL #27
D5 .FILL #26
D6 .FILL #25
D7 .FILL #24
D12 .FILL #23
D11 .FILL #22
D9 .FILL #22
D10 .FILL #21
D8 .FILL #21
D16 .FILL #19
.END