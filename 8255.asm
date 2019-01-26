CS8255:	LCALL	YS
	MOV	DPTR,#3FFH
	MOV	A,#91H
	MOVX	DPTR,A
	RET
PDA:	MOV	DPTR,#0FFH
	MOVX	A,@A+DPTR
	MOV	20H,A
	RET

PDB:	MOV	A,21H
	MOV	DPTR,#2FFH
	MOVX	@DPTR,A
	RET

PDC:	MOV	A,22H
	MOV	DPTR,#1FFH
	MOVX	@DPTR,A
PC1:	MOV	DPTR,#1FFH
	MOVX	A,@DPTR
	MOV	22H,A
	LCALL	YS10MS
	MOVX	A,@A+DPTR
	CJNE	A,22H,PC1
	RET

YS10MS:	MOV	R5,#250
	DJNZ	R5,$
	RET

YS1S:	MOV	R5,#8
YS1:	MOV	R6,#250
YS2:	MOV	R7,#250
	DJNZ	R7,$
	DJNZ	R6,YS2
	DJNZ	R5,YS1
	RET


INIT_8255:
	MOV	A,#98H
	SETB	A1
	SETB	A0
	MOV	DPL,#0FFH
	MOV	DPH,P2
	MOVX	@DPTR,A
	RET
PAK:	CLR	A0
	CLR	A1
	MOV	DPL,#0FFH
	MOV	DPH,P2
	MOVX	A,@DPTR
	MOV	GW,A
	LCALL	YS1
	MOVX	A,@DPTR
	CJNE	A,GW,PAK
	RET

PCK:	MOV	A,AJ
	CLR	A0
	SETB	A1
	MOV	DPL,#0FFH
	MOV	DPH,P2
	MOVX	@DPTR,A
PCK1:
	CLR	A0
	SETB	A1
	MOV	DPL,#0FFH
	MOV	DPH,P2
	MOVX	A,@DPTR
	MOV	AJ,A
	LCALL	YS1
	MOVX	A,@DPTR
	CJNE	A,AJ,PCK1
	RET