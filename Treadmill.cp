#line 1 "C:/Users/Usuario/Desktop/Examen Micro Primer Parcial/Ejercicio 1/ExamenParcial1.c"

char txt[7];
int menu = 1;
int menua = 0;
int velocidad = 0;
int banda = 0;
int tiempo=0;
int pantalla=0;
int temperatura=0;
int tiempoO = 0;
int velocidadO = 0;
int pantallaF = 0;
int tiempoF=0 ;
int timer = 0;



sbit LCD_RS at LATB4_bit;
sbit LCD_EN at LATB5_bit;
sbit LCD_D7 at LATB3_bit;
sbit LCD_D6 at LATB2_bit;
sbit LCD_D5 at LATB1_bit;
sbit LCD_D4 at LATB0_bit;


sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB0_bit;

void delay_var (int timex){
int cont = 0;
while(cont<timex){
 delay_ms(1);
 cont++;
 }
}


void Servo( int ang )
{
 unsigned int n, max;
 max = 2.58*ang;
 PORTC.F0 = 1;
 delay_ms(1);
 for( n=0; n<max; n++ )
 delay_us(1);
 PORTC.F0=0;
 delay_ms(18);
}

int setpoints (int setpoint, int spmax){
 if (PORTA.B2){
 setpoint = setpoint + 5;
 delay_ms(380);
 }
 if (PORTA.B3){
 setpoint = setpoint - 5;
 delay_ms(380);
 }
 if (setpoint > spmax){
 setpoint = 0;
 }
 if (setpoint < 0){
 setpoint = spmax;
 }
 return setpoint;
}

void main() {

TRISA = 0xff;
ANSELA = 0;


LCD_INIT();
ADC_INIT();
LCD_CMD(_LCD_CURSOR_OFF);
PWM1_INIT(5000);

while(1){




while(menu==1){
while(menua==0){
LCD_OUT(1,1,"Set Velocidad");
PWM1_START();

velocidadO= ADC_READ(15);
velocidad = ADC_READ(15);
banda=velocidad*0.2493;

IntToStr(banda,txt);
LCD_OUT(2,1,txt);
PWM1_SET_DUTY(banda);

if(PORTA.B0){
 menua=1;
 delay_ms(380);
 }
}
 LCD_CMD(_LCD_CLEAR);
while (menua==1){
 LCD_OUT(1,1,"Tiempo");
 IntToStr(tiempoO,txt);
LCD_OUT(2,1,txt);
LCD_OUT_CP(" min");

 tiempoO = ADC_READ(15);
 tiempo = ADC_READ(15);

 if(PORTA.B0){
 menua=0;
 menu=2;
 delay_ms(380);
 }
 }

if(PORTA.B0){
 menu=2;
 delay_ms(380);
 }
}
LCD_CMD(_LCD_CLEAR);



while(menu==2){
while(pantalla==0){

if(PORTA.B0){
menu=4;
pantalla=9;
}
temperatura = 0.4875*ADC_Read(16) - 0.1387;
if(temperatura>40){

while(velocidad>0){
PWM1_SET_DUTY(velocidad);
velocidad--;
delay_ms(50);


}
}

timer++;
if(timer==10){
tiempo--;
timer=0;
}
LCD_OUT(1,1,"Temperatura");
temperatura = 0.4875*ADC_Read(16) - 0.1387;
IntToStr(temperatura,txt);
LCD_OUT(2,1,txt);

delay_ms(2000);
pantalla=1;

}
 LCD_CMD(_LCD_CLEAR);
while(pantalla==1){

if(PORTA.B0){
menu=4;
pantalla=9;
}
 temperatura = 0.4875*ADC_Read(16) - 0.1387;
if(temperatura>40){
while(velocidad>0){
PWM1_SET_DUTY(velocidad);
velocidad--;
delay_ms(50);


}
}

LCD_OUT(1,1,"Tiempo Res.");
IntToStr(tiempo,txt);
LCD_OUT(2,1,txt);

delay_ms(2000);
pantalla=2;

}
LCD_CMD(_LCD_CLEAR);



while(pantalla==2){

if(PORTA.B0){
menu=4;
pantalla=9;
}
 temperatura = 0.4875*ADC_Read(16) - 0.1387;
if(temperatura>40){
while(velocidad>0){
PWM1_SET_DUTY(velocidad);
velocidad--;
delay_ms(50);


}
}

if (tiempo>tiempoO*0.7){
 LCD_OUT(1,1,"Vamos Iniciando");
} else if (tiempo>tiempoO*0.4){
 LCD_OUT(1,1,"Vamos por la Mitad");
} else {
 LCD_OUT(1,1,"Si se Puede");

}
 delay_ms(2000);
pantalla=0;
}
LCD_CMD(_LCD_CLEAR);



}
LCD_CMD(_LCD_CLEAR);
pantalla=0;







while(menu==4){
while(pantallaf==0){
LCD_OUT(1,1,"FELICIDADES");
PWM1_SET_DUTY(0.2*velocidadO);
delay_ms(1000);
pantallaf=1;

}
LCD_CMD(_LCD_CLEAR);

while(pantallaf==1){
 temperatura = 0.4875*ADC_Read(16) - 0.1387;
LCD_OUT(1,1,"Temp:");
IntToStr(temperatura,txt);
LCD_OUT_CP(txt);

 tiempoF=tiempoO-tiempo;
LCD_OUT(2,1,"Tiempo: ");
IntToStr(tiempoF,txt);
LCD_OUT_CP(txt);

delay_ms(15000);
PWM1_SET_DUTY(0.2*velocidadO);

}



if(PORTA.B0){
 menu=0;
 delay_ms(380);
 }
}
LCD_CMD(_LCD_CLEAR);
}

}
