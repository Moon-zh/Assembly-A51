//查询方式
CXSZ:	MOV	SP,#80H
	MOV	TMOD,#20H
	MOV	TH1,#0FDH
	MOV	TL1,#0FDH
	MOV	SCON,#50H
	SETB	EA
	SETB	TR1
	RET


FS:	MOV	SBUF,A
	JNB	TI,$
	CLR	TI
	RET

SS:	JNB	RI,$
	CLR	RI
	MOV	A,SBUF
	RET


//中断方式40H中断单元
CXSZ:	MOV	SP,#80H
	MOV	TMOD,#20H
	MOV	TH1,#0FDH
	MOV	TL1,#0FDH
	MOV	PCON,#00H
	MOV	SCON,#50H
	MOV	40H,#0
	SETB	EA
	SETB	TR1
	SETB	ES
	RET	

CXZD:	CLR	RS
	CLR	RI
	MOV	A,SBUF
	MOV	40H,A
	MOV	SBUF,A
	JNB	TI,$
	CLR	TI
	SETB	ES
	RETI