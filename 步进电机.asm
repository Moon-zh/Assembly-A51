BJDJ:	SETB	DIR
	CPL	CP
	LCALL	YS
	JNB	PRO,MAIN
	CLR	DIR
	MOV	R4,#10H
M1:	MOV	R2,#0D0H
M2:	CPL	CP
	LCALL	YS
	DJNZ	R2,M2
	DJNZ	R4,M1
	LCALL	YS
	LCALL	RUN_CW
	RET

RUN_CW:	MOV	R5,#0BH
CW2:	MOV	R4,#0FFH
CW1:	CPL	CP
	LCALL	YS
	DJNZ	R4,CW1
	DJNZ	R5,CW2
	RET

YS:	MOV	R6,#20H
YS1:	DJNZ	R6,$
	RET