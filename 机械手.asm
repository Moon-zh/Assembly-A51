YS1S:	MOV	B,#160
YS1:	LCALL	MY
	DJNZ	B,YS1
	RET

ZYX:	CLR	ZY
	SETB	YY
	LCALL	MY
	RET

YYX:	CLR	YY	
	SETB	ZY
	LCALL	MY
	RET

SYX:	SETB	SX
	LCALL	YS1S
	RET

XYX:	CLR	SX
	LCALL	YS1S
	RET

TZX:	SETB	ZY
	SETB	YY	
	RET

//s245��

ZYX:	CLR	ZY
	SETB	YY
	LCALL	S245
	RET

YYX:	CLR	YY	
	SETB	ZY
	LCALL	S245
	RET

SYX:	SETB	SX
	LCALL	YS1S
	RET

XYX:	CLR	SX
	LCALL	YS1S
	RET

TZX:	SETB	ZY
	SETB	YY	
	RET