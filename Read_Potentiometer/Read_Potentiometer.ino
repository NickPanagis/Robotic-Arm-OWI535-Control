/*** Read Potentiometer ***/

#include <AFMotor.h>

#define potIn1 A1
#define potIn2 A2
#define potIn3 A3
#define potIn4 A4
#define led A5
int val1 =0;
int val2 =0;
int val3 =0;
int val4 =0;

//AF_DCMotor motor(2, MOTOR12_64KHZ);
AF_DCMotor motor(1);

void setup() {
  Serial.begin(9600);

  motor.setSpeed(200);
}

void loop() {
  analogWrite(led,1000);
  val1 = analogRead(potIn1);
  val2 = analogRead(potIn2);
  val3 = analogRead(potIn3);
  val4 = analogRead(potIn4);
  
  // theoretical values 0-1023
  // real values     (min-max , center)
    
  Serial.print(val1); // 333-673 , 490
  Serial.print('\t');
  Serial.print(val2); // 0-1022 , 514
  Serial.print('\t');
  Serial.print(val3); // 0-693 , 416
  Serial.print('\t');
  Serial.print(val4); // 148-778 , 528
  Serial.print('\n');
  delay(500);

  /*motor.run(FORWARD);      // forward
  delay(1000);
  motor.run(BACKWARD);     // backward
  delay(1000);
  motor.run(RELEASE);      // stop
  delay(1000);*/
}
