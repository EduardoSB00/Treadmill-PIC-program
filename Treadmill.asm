
_delay_var:

;ExamenParcial1.c,33 :: 		void delay_var (int timex){
;ExamenParcial1.c,34 :: 		int cont = 0;
	CLRF        delay_var_cont_L0+0 
	CLRF        delay_var_cont_L0+1 
;ExamenParcial1.c,35 :: 		while(cont<timex){
L_delay_var0:
	MOVLW       128
	XORWF       delay_var_cont_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_delay_var_timex+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__delay_var71
	MOVF        FARG_delay_var_timex+0, 0 
	SUBWF       delay_var_cont_L0+0, 0 
L__delay_var71:
	BTFSC       STATUS+0, 0 
	GOTO        L_delay_var1
;ExamenParcial1.c,36 :: 		delay_ms(1);
	MOVLW       11
	MOVWF       R12, 0
	MOVLW       98
	MOVWF       R13, 0
L_delay_var2:
	DECFSZ      R13, 1, 1
	BRA         L_delay_var2
	DECFSZ      R12, 1, 1
	BRA         L_delay_var2
	NOP
;ExamenParcial1.c,37 :: 		cont++;
	INFSNZ      delay_var_cont_L0+0, 1 
	INCF        delay_var_cont_L0+1, 1 
;ExamenParcial1.c,38 :: 		}
	GOTO        L_delay_var0
L_delay_var1:
;ExamenParcial1.c,39 :: 		}
L_end_delay_var:
	RETURN      0
; end of _delay_var

_Servo:

;ExamenParcial1.c,42 :: 		void Servo( int ang )  //Servo en el Puerto C Pin 0
;ExamenParcial1.c,45 :: 		max = 2.58*ang;
	MOVF        FARG_Servo_ang+0, 0 
	MOVWF       R0 
	MOVF        FARG_Servo_ang+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVLW       184
	MOVWF       R4 
	MOVLW       30
	MOVWF       R5 
	MOVLW       37
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       Servo_max_L0+0 
	MOVF        R1, 0 
	MOVWF       Servo_max_L0+1 
;ExamenParcial1.c,46 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;ExamenParcial1.c,47 :: 		delay_ms(1);
	MOVLW       11
	MOVWF       R12, 0
	MOVLW       98
	MOVWF       R13, 0
L_Servo3:
	DECFSZ      R13, 1, 1
	BRA         L_Servo3
	DECFSZ      R12, 1, 1
	BRA         L_Servo3
	NOP
;ExamenParcial1.c,48 :: 		for( n=0; n<max; n++ )
	CLRF        Servo_n_L0+0 
	CLRF        Servo_n_L0+1 
L_Servo4:
	MOVF        Servo_max_L0+1, 0 
	SUBWF       Servo_n_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Servo73
	MOVF        Servo_max_L0+0, 0 
	SUBWF       Servo_n_L0+0, 0 
L__Servo73:
	BTFSC       STATUS+0, 0 
	GOTO        L_Servo5
;ExamenParcial1.c,49 :: 		delay_us(1);
	MOVLW       2
	MOVWF       R13, 0
L_Servo7:
	DECFSZ      R13, 1, 1
	BRA         L_Servo7
	NOP
;ExamenParcial1.c,48 :: 		for( n=0; n<max; n++ )
	INFSNZ      Servo_n_L0+0, 1 
	INCF        Servo_n_L0+1, 1 
;ExamenParcial1.c,49 :: 		delay_us(1);
	GOTO        L_Servo4
L_Servo5:
;ExamenParcial1.c,50 :: 		PORTC.F0=0;
	BCF         PORTC+0, 0 
;ExamenParcial1.c,51 :: 		delay_ms(18);
	MOVLW       188
	MOVWF       R12, 0
	MOVLW       1
	MOVWF       R13, 0
L_Servo8:
	DECFSZ      R13, 1, 1
	BRA         L_Servo8
	DECFSZ      R12, 1, 1
	BRA         L_Servo8
	NOP
	NOP
;ExamenParcial1.c,52 :: 		}
L_end_Servo:
	RETURN      0
; end of _Servo

_setpoints:

;ExamenParcial1.c,54 :: 		int setpoints (int setpoint, int spmax){
;ExamenParcial1.c,55 :: 		if (PORTA.B2){
	BTFSS       PORTA+0, 2 
	GOTO        L_setpoints9
;ExamenParcial1.c,56 :: 		setpoint =  setpoint + 5;
	MOVLW       5
	ADDWF       FARG_setpoints_setpoint+0, 1 
	MOVLW       0
	ADDWFC      FARG_setpoints_setpoint+1, 1 
;ExamenParcial1.c,57 :: 		delay_ms(380);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       108
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_setpoints10:
	DECFSZ      R13, 1, 1
	BRA         L_setpoints10
	DECFSZ      R12, 1, 1
	BRA         L_setpoints10
	DECFSZ      R11, 1, 1
	BRA         L_setpoints10
	NOP
	NOP
	NOP
;ExamenParcial1.c,58 :: 		}
L_setpoints9:
;ExamenParcial1.c,59 :: 		if (PORTA.B3){
	BTFSS       PORTA+0, 3 
	GOTO        L_setpoints11
;ExamenParcial1.c,60 :: 		setpoint =  setpoint - 5;
	MOVLW       5
	SUBWF       FARG_setpoints_setpoint+0, 1 
	MOVLW       0
	SUBWFB      FARG_setpoints_setpoint+1, 1 
;ExamenParcial1.c,61 :: 		delay_ms(380);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       108
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_setpoints12:
	DECFSZ      R13, 1, 1
	BRA         L_setpoints12
	DECFSZ      R12, 1, 1
	BRA         L_setpoints12
	DECFSZ      R11, 1, 1
	BRA         L_setpoints12
	NOP
	NOP
	NOP
;ExamenParcial1.c,62 :: 		}
L_setpoints11:
;ExamenParcial1.c,63 :: 		if (setpoint > spmax){
	MOVLW       128
	XORWF       FARG_setpoints_spmax+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_setpoints_setpoint+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__setpoints75
	MOVF        FARG_setpoints_setpoint+0, 0 
	SUBWF       FARG_setpoints_spmax+0, 0 
L__setpoints75:
	BTFSC       STATUS+0, 0 
	GOTO        L_setpoints13
;ExamenParcial1.c,64 :: 		setpoint = 0;
	CLRF        FARG_setpoints_setpoint+0 
	CLRF        FARG_setpoints_setpoint+1 
;ExamenParcial1.c,65 :: 		}
L_setpoints13:
;ExamenParcial1.c,66 :: 		if (setpoint < 0){
	MOVLW       128
	XORWF       FARG_setpoints_setpoint+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__setpoints76
	MOVLW       0
	SUBWF       FARG_setpoints_setpoint+0, 0 
L__setpoints76:
	BTFSC       STATUS+0, 0 
	GOTO        L_setpoints14
;ExamenParcial1.c,67 :: 		setpoint = spmax;
	MOVF        FARG_setpoints_spmax+0, 0 
	MOVWF       FARG_setpoints_setpoint+0 
	MOVF        FARG_setpoints_spmax+1, 0 
	MOVWF       FARG_setpoints_setpoint+1 
;ExamenParcial1.c,68 :: 		}
L_setpoints14:
;ExamenParcial1.c,69 :: 		return setpoint;
	MOVF        FARG_setpoints_setpoint+0, 0 
	MOVWF       R0 
	MOVF        FARG_setpoints_setpoint+1, 0 
	MOVWF       R1 
;ExamenParcial1.c,70 :: 		}
L_end_setpoints:
	RETURN      0
; end of _setpoints

_main:

;ExamenParcial1.c,72 :: 		void main() {
;ExamenParcial1.c,74 :: 		TRISA = 0xff;
	MOVLW       255
	MOVWF       TRISA+0 
;ExamenParcial1.c,75 :: 		ANSELA = 0;
	CLRF        ANSELA+0 
;ExamenParcial1.c,78 :: 		LCD_INIT();
	CALL        _Lcd_Init+0, 0
;ExamenParcial1.c,79 :: 		ADC_INIT();
	CALL        _ADC_Init+0, 0
;ExamenParcial1.c,80 :: 		LCD_CMD(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ExamenParcial1.c,81 :: 		PWM1_INIT(5000);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;ExamenParcial1.c,83 :: 		while(1){
L_main15:
;ExamenParcial1.c,88 :: 		while(menu==1){ //Menu1
L_main17:
	MOVLW       0
	XORWF       _menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main78
	MOVLW       1
	XORWF       _menu+0, 0 
L__main78:
	BTFSS       STATUS+0, 2 
	GOTO        L_main18
;ExamenParcial1.c,89 :: 		while(menua==0){
L_main19:
	MOVLW       0
	XORWF       _menua+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main79
	MOVLW       0
	XORWF       _menua+0, 0 
L__main79:
	BTFSS       STATUS+0, 2 
	GOTO        L_main20
;ExamenParcial1.c,90 :: 		LCD_OUT(1,1,"Set Velocidad");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_ExamenParcial1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_ExamenParcial1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ExamenParcial1.c,91 :: 		PWM1_START();
	CALL        _PWM1_Start+0, 0
;ExamenParcial1.c,93 :: 		velocidadO= ADC_READ(15);
	MOVLW       15
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _velocidadO+0 
	MOVF        R1, 0 
	MOVWF       _velocidadO+1 
;ExamenParcial1.c,94 :: 		velocidad = ADC_READ(15);
	MOVLW       15
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _velocidad+0 
	MOVF        R1, 0 
	MOVWF       _velocidad+1 
;ExamenParcial1.c,95 :: 		banda=velocidad*0.2493;
	CALL        _int2double+0, 0
	MOVLW       128
	MOVWF       R4 
	MOVLW       72
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _banda+0 
	MOVF        R1, 0 
	MOVWF       _banda+1 
;ExamenParcial1.c,97 :: 		IntToStr(banda,txt);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ExamenParcial1.c,98 :: 		LCD_OUT(2,1,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ExamenParcial1.c,99 :: 		PWM1_SET_DUTY(banda);
	MOVF        _banda+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;ExamenParcial1.c,101 :: 		if(PORTA.B0){
	BTFSS       PORTA+0, 0 
	GOTO        L_main21
;ExamenParcial1.c,102 :: 		menua=1;
	MOVLW       1
	MOVWF       _menua+0 
	MOVLW       0
	MOVWF       _menua+1 
;ExamenParcial1.c,103 :: 		delay_ms(380);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       108
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_main22:
	DECFSZ      R13, 1, 1
	BRA         L_main22
	DECFSZ      R12, 1, 1
	BRA         L_main22
	DECFSZ      R11, 1, 1
	BRA         L_main22
	NOP
	NOP
	NOP
;ExamenParcial1.c,104 :: 		}
L_main21:
;ExamenParcial1.c,105 :: 		}
	GOTO        L_main19
L_main20:
;ExamenParcial1.c,106 :: 		LCD_CMD(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ExamenParcial1.c,107 :: 		while (menua==1){
L_main23:
	MOVLW       0
	XORWF       _menua+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main80
	MOVLW       1
	XORWF       _menua+0, 0 
L__main80:
	BTFSS       STATUS+0, 2 
	GOTO        L_main24
;ExamenParcial1.c,108 :: 		LCD_OUT(1,1,"Tiempo");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_ExamenParcial1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_ExamenParcial1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ExamenParcial1.c,109 :: 		IntToStr(tiempoO,txt);
	MOVF        _tiempoO+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _tiempoO+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ExamenParcial1.c,110 :: 		LCD_OUT(2,1,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ExamenParcial1.c,111 :: 		LCD_OUT_CP(" min");
	MOVLW       ?lstr3_ExamenParcial1+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr3_ExamenParcial1+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;ExamenParcial1.c,113 :: 		tiempoO = ADC_READ(15);
	MOVLW       15
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _tiempoO+0 
	MOVF        R1, 0 
	MOVWF       _tiempoO+1 
;ExamenParcial1.c,114 :: 		tiempo = ADC_READ(15);
	MOVLW       15
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _tiempo+0 
	MOVF        R1, 0 
	MOVWF       _tiempo+1 
;ExamenParcial1.c,116 :: 		if(PORTA.B0){
	BTFSS       PORTA+0, 0 
	GOTO        L_main25
;ExamenParcial1.c,117 :: 		menua=0;
	CLRF        _menua+0 
	CLRF        _menua+1 
;ExamenParcial1.c,118 :: 		menu=2;
	MOVLW       2
	MOVWF       _menu+0 
	MOVLW       0
	MOVWF       _menu+1 
;ExamenParcial1.c,119 :: 		delay_ms(380);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       108
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_main26:
	DECFSZ      R13, 1, 1
	BRA         L_main26
	DECFSZ      R12, 1, 1
	BRA         L_main26
	DECFSZ      R11, 1, 1
	BRA         L_main26
	NOP
	NOP
	NOP
;ExamenParcial1.c,120 :: 		}
L_main25:
;ExamenParcial1.c,121 :: 		}
	GOTO        L_main23
L_main24:
;ExamenParcial1.c,123 :: 		if(PORTA.B0){
	BTFSS       PORTA+0, 0 
	GOTO        L_main27
;ExamenParcial1.c,124 :: 		menu=2;
	MOVLW       2
	MOVWF       _menu+0 
	MOVLW       0
	MOVWF       _menu+1 
;ExamenParcial1.c,125 :: 		delay_ms(380);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       108
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_main28:
	DECFSZ      R13, 1, 1
	BRA         L_main28
	DECFSZ      R12, 1, 1
	BRA         L_main28
	DECFSZ      R11, 1, 1
	BRA         L_main28
	NOP
	NOP
	NOP
;ExamenParcial1.c,126 :: 		}
L_main27:
;ExamenParcial1.c,127 :: 		}
	GOTO        L_main17
L_main18:
;ExamenParcial1.c,128 :: 		LCD_CMD(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ExamenParcial1.c,132 :: 		while(menu==2){ //Menu2
L_main29:
	MOVLW       0
	XORWF       _menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main81
	MOVLW       2
	XORWF       _menu+0, 0 
L__main81:
	BTFSS       STATUS+0, 2 
	GOTO        L_main30
;ExamenParcial1.c,133 :: 		while(pantalla==0){
L_main31:
	MOVLW       0
	XORWF       _pantalla+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main82
	MOVLW       0
	XORWF       _pantalla+0, 0 
L__main82:
	BTFSS       STATUS+0, 2 
	GOTO        L_main32
;ExamenParcial1.c,135 :: 		if(PORTA.B0){
	BTFSS       PORTA+0, 0 
	GOTO        L_main33
;ExamenParcial1.c,136 :: 		menu=4;
	MOVLW       4
	MOVWF       _menu+0 
	MOVLW       0
	MOVWF       _menu+1 
;ExamenParcial1.c,137 :: 		pantalla=9;
	MOVLW       9
	MOVWF       _pantalla+0 
	MOVLW       0
	MOVWF       _pantalla+1 
;ExamenParcial1.c,138 :: 		}
L_main33:
;ExamenParcial1.c,139 :: 		temperatura = 0.4875*ADC_Read(16) - 0.1387;
	MOVLW       16
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       154
	MOVWF       R4 
	MOVLW       153
	MOVWF       R5 
	MOVLW       121
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       95
	MOVWF       R4 
	MOVLW       7
	MOVWF       R5 
	MOVLW       14
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _temperatura+0 
	MOVF        R1, 0 
	MOVWF       _temperatura+1 
;ExamenParcial1.c,140 :: 		if(temperatura>40){
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main83
	MOVF        R0, 0 
	SUBLW       40
L__main83:
	BTFSC       STATUS+0, 0 
	GOTO        L_main34
;ExamenParcial1.c,142 :: 		while(velocidad>0){
L_main35:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _velocidad+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main84
	MOVF        _velocidad+0, 0 
	SUBLW       0
L__main84:
	BTFSC       STATUS+0, 0 
	GOTO        L_main36
;ExamenParcial1.c,143 :: 		PWM1_SET_DUTY(velocidad);
	MOVF        _velocidad+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;ExamenParcial1.c,144 :: 		velocidad--;
	MOVLW       1
	SUBWF       _velocidad+0, 1 
	MOVLW       0
	SUBWFB      _velocidad+1, 1 
;ExamenParcial1.c,145 :: 		delay_ms(50);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main37:
	DECFSZ      R13, 1, 1
	BRA         L_main37
	DECFSZ      R12, 1, 1
	BRA         L_main37
	DECFSZ      R11, 1, 1
	BRA         L_main37
;ExamenParcial1.c,148 :: 		}
	GOTO        L_main35
L_main36:
;ExamenParcial1.c,149 :: 		}
L_main34:
;ExamenParcial1.c,151 :: 		timer++;
	INFSNZ      _timer+0, 1 
	INCF        _timer+1, 1 
;ExamenParcial1.c,152 :: 		if(timer==10){
	MOVLW       0
	XORWF       _timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main85
	MOVLW       10
	XORWF       _timer+0, 0 
L__main85:
	BTFSS       STATUS+0, 2 
	GOTO        L_main38
;ExamenParcial1.c,153 :: 		tiempo--;
	MOVLW       1
	SUBWF       _tiempo+0, 1 
	MOVLW       0
	SUBWFB      _tiempo+1, 1 
;ExamenParcial1.c,154 :: 		timer=0;
	CLRF        _timer+0 
	CLRF        _timer+1 
;ExamenParcial1.c,155 :: 		}
L_main38:
;ExamenParcial1.c,156 :: 		LCD_OUT(1,1,"Temperatura");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_ExamenParcial1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_ExamenParcial1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ExamenParcial1.c,157 :: 		temperatura = 0.4875*ADC_Read(16) - 0.1387;
	MOVLW       16
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       154
	MOVWF       R4 
	MOVLW       153
	MOVWF       R5 
	MOVLW       121
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       95
	MOVWF       R4 
	MOVLW       7
	MOVWF       R5 
	MOVLW       14
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _temperatura+0 
	MOVF        R1, 0 
	MOVWF       _temperatura+1 
;ExamenParcial1.c,158 :: 		IntToStr(temperatura,txt);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ExamenParcial1.c,159 :: 		LCD_OUT(2,1,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ExamenParcial1.c,161 :: 		delay_ms(2000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_main39:
	DECFSZ      R13, 1, 1
	BRA         L_main39
	DECFSZ      R12, 1, 1
	BRA         L_main39
	DECFSZ      R11, 1, 1
	BRA         L_main39
	NOP
;ExamenParcial1.c,162 :: 		pantalla=1;
	MOVLW       1
	MOVWF       _pantalla+0 
	MOVLW       0
	MOVWF       _pantalla+1 
;ExamenParcial1.c,164 :: 		}
	GOTO        L_main31
L_main32:
;ExamenParcial1.c,165 :: 		LCD_CMD(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ExamenParcial1.c,166 :: 		while(pantalla==1){
L_main40:
	MOVLW       0
	XORWF       _pantalla+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main86
	MOVLW       1
	XORWF       _pantalla+0, 0 
L__main86:
	BTFSS       STATUS+0, 2 
	GOTO        L_main41
;ExamenParcial1.c,168 :: 		if(PORTA.B0){
	BTFSS       PORTA+0, 0 
	GOTO        L_main42
;ExamenParcial1.c,169 :: 		menu=4;
	MOVLW       4
	MOVWF       _menu+0 
	MOVLW       0
	MOVWF       _menu+1 
;ExamenParcial1.c,170 :: 		pantalla=9;
	MOVLW       9
	MOVWF       _pantalla+0 
	MOVLW       0
	MOVWF       _pantalla+1 
;ExamenParcial1.c,171 :: 		}
L_main42:
;ExamenParcial1.c,172 :: 		temperatura = 0.4875*ADC_Read(16) - 0.1387;
	MOVLW       16
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       154
	MOVWF       R4 
	MOVLW       153
	MOVWF       R5 
	MOVLW       121
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       95
	MOVWF       R4 
	MOVLW       7
	MOVWF       R5 
	MOVLW       14
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _temperatura+0 
	MOVF        R1, 0 
	MOVWF       _temperatura+1 
;ExamenParcial1.c,173 :: 		if(temperatura>40){
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main87
	MOVF        R0, 0 
	SUBLW       40
L__main87:
	BTFSC       STATUS+0, 0 
	GOTO        L_main43
;ExamenParcial1.c,174 :: 		while(velocidad>0){
L_main44:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _velocidad+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main88
	MOVF        _velocidad+0, 0 
	SUBLW       0
L__main88:
	BTFSC       STATUS+0, 0 
	GOTO        L_main45
;ExamenParcial1.c,175 :: 		PWM1_SET_DUTY(velocidad);
	MOVF        _velocidad+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;ExamenParcial1.c,176 :: 		velocidad--;
	MOVLW       1
	SUBWF       _velocidad+0, 1 
	MOVLW       0
	SUBWFB      _velocidad+1, 1 
;ExamenParcial1.c,177 :: 		delay_ms(50);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main46:
	DECFSZ      R13, 1, 1
	BRA         L_main46
	DECFSZ      R12, 1, 1
	BRA         L_main46
	DECFSZ      R11, 1, 1
	BRA         L_main46
;ExamenParcial1.c,180 :: 		}
	GOTO        L_main44
L_main45:
;ExamenParcial1.c,181 :: 		}
L_main43:
;ExamenParcial1.c,183 :: 		LCD_OUT(1,1,"Tiempo Res.");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_ExamenParcial1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_ExamenParcial1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ExamenParcial1.c,184 :: 		IntToStr(tiempo,txt);
	MOVF        _tiempo+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _tiempo+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ExamenParcial1.c,185 :: 		LCD_OUT(2,1,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ExamenParcial1.c,187 :: 		delay_ms(2000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_main47:
	DECFSZ      R13, 1, 1
	BRA         L_main47
	DECFSZ      R12, 1, 1
	BRA         L_main47
	DECFSZ      R11, 1, 1
	BRA         L_main47
	NOP
;ExamenParcial1.c,188 :: 		pantalla=2;
	MOVLW       2
	MOVWF       _pantalla+0 
	MOVLW       0
	MOVWF       _pantalla+1 
;ExamenParcial1.c,190 :: 		}
	GOTO        L_main40
L_main41:
;ExamenParcial1.c,191 :: 		LCD_CMD(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ExamenParcial1.c,195 :: 		while(pantalla==2){
L_main48:
	MOVLW       0
	XORWF       _pantalla+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main89
	MOVLW       2
	XORWF       _pantalla+0, 0 
L__main89:
	BTFSS       STATUS+0, 2 
	GOTO        L_main49
;ExamenParcial1.c,197 :: 		if(PORTA.B0){
	BTFSS       PORTA+0, 0 
	GOTO        L_main50
;ExamenParcial1.c,198 :: 		menu=4;
	MOVLW       4
	MOVWF       _menu+0 
	MOVLW       0
	MOVWF       _menu+1 
;ExamenParcial1.c,199 :: 		pantalla=9;
	MOVLW       9
	MOVWF       _pantalla+0 
	MOVLW       0
	MOVWF       _pantalla+1 
;ExamenParcial1.c,200 :: 		}
L_main50:
;ExamenParcial1.c,201 :: 		temperatura = 0.4875*ADC_Read(16) - 0.1387;
	MOVLW       16
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       154
	MOVWF       R4 
	MOVLW       153
	MOVWF       R5 
	MOVLW       121
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       95
	MOVWF       R4 
	MOVLW       7
	MOVWF       R5 
	MOVLW       14
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _temperatura+0 
	MOVF        R1, 0 
	MOVWF       _temperatura+1 
;ExamenParcial1.c,202 :: 		if(temperatura>40){
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main90
	MOVF        R0, 0 
	SUBLW       40
L__main90:
	BTFSC       STATUS+0, 0 
	GOTO        L_main51
;ExamenParcial1.c,203 :: 		while(velocidad>0){
L_main52:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _velocidad+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main91
	MOVF        _velocidad+0, 0 
	SUBLW       0
L__main91:
	BTFSC       STATUS+0, 0 
	GOTO        L_main53
;ExamenParcial1.c,204 :: 		PWM1_SET_DUTY(velocidad);
	MOVF        _velocidad+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;ExamenParcial1.c,205 :: 		velocidad--;
	MOVLW       1
	SUBWF       _velocidad+0, 1 
	MOVLW       0
	SUBWFB      _velocidad+1, 1 
;ExamenParcial1.c,206 :: 		delay_ms(50);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main54:
	DECFSZ      R13, 1, 1
	BRA         L_main54
	DECFSZ      R12, 1, 1
	BRA         L_main54
	DECFSZ      R11, 1, 1
	BRA         L_main54
;ExamenParcial1.c,209 :: 		}
	GOTO        L_main52
L_main53:
;ExamenParcial1.c,210 :: 		}
L_main51:
;ExamenParcial1.c,212 :: 		if (tiempo>tiempoO*0.7){
	MOVF        _tiempoO+0, 0 
	MOVWF       R0 
	MOVF        _tiempoO+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVLW       51
	MOVWF       R4 
	MOVLW       51
	MOVWF       R5 
	MOVLW       51
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVF        R2, 0 
	MOVWF       FLOC__main+2 
	MOVF        R3, 0 
	MOVWF       FLOC__main+3 
	MOVF        _tiempo+0, 0 
	MOVWF       R0 
	MOVF        _tiempo+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        FLOC__main+0, 0 
	MOVWF       R0 
	MOVF        FLOC__main+1, 0 
	MOVWF       R1 
	MOVF        FLOC__main+2, 0 
	MOVWF       R2 
	MOVF        FLOC__main+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main55
;ExamenParcial1.c,213 :: 		LCD_OUT(1,1,"Vamos Iniciando");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_ExamenParcial1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_ExamenParcial1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ExamenParcial1.c,214 :: 		} else if (tiempo>tiempoO*0.4){
	GOTO        L_main56
L_main55:
	MOVF        _tiempoO+0, 0 
	MOVWF       R0 
	MOVF        _tiempoO+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVF        R2, 0 
	MOVWF       FLOC__main+2 
	MOVF        R3, 0 
	MOVWF       FLOC__main+3 
	MOVF        _tiempo+0, 0 
	MOVWF       R0 
	MOVF        _tiempo+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        FLOC__main+0, 0 
	MOVWF       R0 
	MOVF        FLOC__main+1, 0 
	MOVWF       R1 
	MOVF        FLOC__main+2, 0 
	MOVWF       R2 
	MOVF        FLOC__main+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main57
;ExamenParcial1.c,215 :: 		LCD_OUT(1,1,"Vamos por la Mitad");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_ExamenParcial1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_ExamenParcial1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ExamenParcial1.c,216 :: 		} else {
	GOTO        L_main58
L_main57:
;ExamenParcial1.c,217 :: 		LCD_OUT(1,1,"Si se Puede");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_ExamenParcial1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_ExamenParcial1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ExamenParcial1.c,219 :: 		}
L_main58:
L_main56:
;ExamenParcial1.c,220 :: 		delay_ms(2000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_main59:
	DECFSZ      R13, 1, 1
	BRA         L_main59
	DECFSZ      R12, 1, 1
	BRA         L_main59
	DECFSZ      R11, 1, 1
	BRA         L_main59
	NOP
;ExamenParcial1.c,221 :: 		pantalla=0;
	CLRF        _pantalla+0 
	CLRF        _pantalla+1 
;ExamenParcial1.c,222 :: 		}
	GOTO        L_main48
L_main49:
;ExamenParcial1.c,223 :: 		LCD_CMD(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ExamenParcial1.c,227 :: 		}
	GOTO        L_main29
L_main30:
;ExamenParcial1.c,228 :: 		LCD_CMD(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ExamenParcial1.c,229 :: 		pantalla=0;
	CLRF        _pantalla+0 
	CLRF        _pantalla+1 
;ExamenParcial1.c,237 :: 		while(menu==4){ //yey
L_main60:
	MOVLW       0
	XORWF       _menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main92
	MOVLW       4
	XORWF       _menu+0, 0 
L__main92:
	BTFSS       STATUS+0, 2 
	GOTO        L_main61
;ExamenParcial1.c,238 :: 		while(pantallaf==0){
L_main62:
	MOVLW       0
	XORWF       _pantallaF+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main93
	MOVLW       0
	XORWF       _pantallaF+0, 0 
L__main93:
	BTFSS       STATUS+0, 2 
	GOTO        L_main63
;ExamenParcial1.c,239 :: 		LCD_OUT(1,1,"FELICIDADES");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_ExamenParcial1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_ExamenParcial1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ExamenParcial1.c,240 :: 		PWM1_SET_DUTY(0.2*velocidadO);
	MOVF        _velocidadO+0, 0 
	MOVWF       R0 
	MOVF        _velocidadO+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;ExamenParcial1.c,241 :: 		delay_ms(1000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_main64:
	DECFSZ      R13, 1, 1
	BRA         L_main64
	DECFSZ      R12, 1, 1
	BRA         L_main64
	DECFSZ      R11, 1, 1
	BRA         L_main64
;ExamenParcial1.c,242 :: 		pantallaf=1;
	MOVLW       1
	MOVWF       _pantallaF+0 
	MOVLW       0
	MOVWF       _pantallaF+1 
;ExamenParcial1.c,244 :: 		}
	GOTO        L_main62
L_main63:
;ExamenParcial1.c,245 :: 		LCD_CMD(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ExamenParcial1.c,247 :: 		while(pantallaf==1){
L_main65:
	MOVLW       0
	XORWF       _pantallaF+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main94
	MOVLW       1
	XORWF       _pantallaF+0, 0 
L__main94:
	BTFSS       STATUS+0, 2 
	GOTO        L_main66
;ExamenParcial1.c,248 :: 		temperatura = 0.4875*ADC_Read(16) - 0.1387;
	MOVLW       16
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       154
	MOVWF       R4 
	MOVLW       153
	MOVWF       R5 
	MOVLW       121
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       95
	MOVWF       R4 
	MOVLW       7
	MOVWF       R5 
	MOVLW       14
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _temperatura+0 
	MOVF        R1, 0 
	MOVWF       _temperatura+1 
;ExamenParcial1.c,249 :: 		LCD_OUT(1,1,"Temp:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr10_ExamenParcial1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr10_ExamenParcial1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ExamenParcial1.c,250 :: 		IntToStr(temperatura,txt);
	MOVF        _temperatura+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _temperatura+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ExamenParcial1.c,251 :: 		LCD_OUT_CP(txt);
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;ExamenParcial1.c,253 :: 		tiempoF=tiempoO-tiempo;
	MOVF        _tiempo+0, 0 
	SUBWF       _tiempoO+0, 0 
	MOVWF       _tiempoF+0 
	MOVF        _tiempo+1, 0 
	SUBWFB      _tiempoO+1, 0 
	MOVWF       _tiempoF+1 
;ExamenParcial1.c,254 :: 		LCD_OUT(2,1,"Tiempo: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr11_ExamenParcial1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr11_ExamenParcial1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ExamenParcial1.c,255 :: 		IntToStr(tiempoF,txt);
	MOVF        _tiempoF+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _tiempoF+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ExamenParcial1.c,256 :: 		LCD_OUT_CP(txt);
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;ExamenParcial1.c,258 :: 		delay_ms(15000);
	MOVLW       3
	MOVWF       R10, 0
	MOVLW       97
	MOVWF       R11, 0
	MOVLW       195
	MOVWF       R12, 0
	MOVLW       142
	MOVWF       R13, 0
L_main67:
	DECFSZ      R13, 1, 1
	BRA         L_main67
	DECFSZ      R12, 1, 1
	BRA         L_main67
	DECFSZ      R11, 1, 1
	BRA         L_main67
	DECFSZ      R10, 1, 1
	BRA         L_main67
	NOP
;ExamenParcial1.c,259 :: 		PWM1_SET_DUTY(0.2*velocidadO);
	MOVF        _velocidadO+0, 0 
	MOVWF       R0 
	MOVF        _velocidadO+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;ExamenParcial1.c,261 :: 		}
	GOTO        L_main65
L_main66:
;ExamenParcial1.c,265 :: 		if(PORTA.B0){
	BTFSS       PORTA+0, 0 
	GOTO        L_main68
;ExamenParcial1.c,266 :: 		menu=0;
	CLRF        _menu+0 
	CLRF        _menu+1 
;ExamenParcial1.c,267 :: 		delay_ms(380);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       108
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_main69:
	DECFSZ      R13, 1, 1
	BRA         L_main69
	DECFSZ      R12, 1, 1
	BRA         L_main69
	DECFSZ      R11, 1, 1
	BRA         L_main69
	NOP
	NOP
	NOP
;ExamenParcial1.c,268 :: 		}
L_main68:
;ExamenParcial1.c,269 :: 		}
	GOTO        L_main60
L_main61:
;ExamenParcial1.c,270 :: 		LCD_CMD(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ExamenParcial1.c,271 :: 		}
	GOTO        L_main15
;ExamenParcial1.c,273 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
