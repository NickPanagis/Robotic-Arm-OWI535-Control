#include <AFMotor.h>

AF_DCMotor motor1(1);
AF_DCMotor motor2(2);
AF_DCMotor motor3(3);
AF_DCMotor motor4(4);

#define potIn1 A1
#define potIn2 A2
#define potIn3 A3
#define potIn4 A4
int val1 =0;
int val2 =0;
int val3 =0;
int val4 =0;

void setup() {
  Serial.begin(9600);               // set up Serial library at 9600 bps
  Serial.println("Motor test!");
  motor1.setSpeed(200);      // set motor speed
  motor2.setSpeed(200);      // set motor speed
  motor3.setSpeed(200);      // set motor speed
  motor4.setSpeed(200);      // set motor speed
  motor1.run(RELEASE);       // stop
  motor2.run(RELEASE);
  motor3.run(RELEASE);
  motor4.run(RELEASE);
}

void loop() {

  val1 = analogRead(potIn1);
  val2 = analogRead(potIn2);
  val3 = analogRead(potIn3);
  val4 = analogRead(potIn4);

  // theoritikes times 0-1023
  // peiramatikes     (min-max , center)
    
//  Serial.print(val1); // 333-673 , 490
//  Serial.print('\t');
//  Serial.print(val2); // 0-1022 , 514
//  Serial.print('\t');
//  Serial.print(val3); // 0-693 , 416
//  Serial.print('\t');
//  Serial.print(val4); // 148-778 , 528
//  Serial.print('\n');
//  delay(500);

 if(val1>400){
    
    motor1.run(BACKWARD);
    delay(400);
    motor1.run(RELEASE);
    val1 = analogRead(potIn1);
    Serial.print(val1); // 333-673 , 490
    
 }
    motor1.run(RELEASE);
 

//  motor2.run(BACKWARD);
//  delay(1000);
//  motor2.run(RELEASE);
//  
//  motor3.run(BACKWARD);
//  delay(1000);
//  motor3.run(RELEASE);
//  
//  motor4.run(BACKWARD);
//  delay(1000);
//  motor4.run(RELEASE);
  
  delay(2000); ///****************************

  if(val1<630){
    motor1.run(FORWARD);
    delay(400);
    motor1.run(RELEASE);
    val1 = analogRead(potIn1);
    Serial.print(val1); // 333-673 , 490
  }
    motor1.run(RELEASE);

//  motor2.run(FORWARD);
//  delay(1000);
//  motor2.run(RELEASE);
//  
//  motor3.run(FORWARD);
//  delay(1000);
//  motor3.run(RELEASE);
//  
//  motor4.run(FORWARD);
//  delay(1000);
//  motor4.run(RELEASE);

 delay(2000);
  //while(1){}
}

