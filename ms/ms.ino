#include <AFMotor.h>

AF_DCMotor motor1(1);
AF_DCMotor motor2(2);
AF_DCMotor motor3(3);
AF_DCMotor motor4(4);

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
 
  motor1.run(BACKWARD);
  delay(1000);
  motor1.run(RELEASE);

  motor2.run(BACKWARD);
  delay(1000);
  motor2.run(RELEASE);
  
  motor3.run(BACKWARD);
  delay(1000);
  motor3.run(RELEASE);
  
  motor4.run(BACKWARD);
  delay(1000);
  motor4.run(RELEASE);
  
  delay(2000); ///****************************

    motor1.run(FORWARD);
  delay(1000);
  motor1.run(RELEASE);

  motor2.run(FORWARD);
  delay(1000);
  motor2.run(RELEASE);
  
  motor3.run(FORWARD);
  delay(1000);
  motor3.run(RELEASE);
  
  motor4.run(FORWARD);
  delay(1000);
  motor4.run(RELEASE);

 delay(2000);
  //while(1){}
}

