#include <SoftwareSerial.h>    //Software Serial library
const int ProxSensor1=7;
const int ProxSensor2=8;
const int ProxSensor3=10;
int inputVal = 0;
SoftwareSerial mySerial(12, 13);
SoftwareSerial espSerial(2, 3);   //Pin 2 and 3 act as RX and TX. Connect them to TX and RX of ESP8266      
#define DEBUG true
String mySSID = "ASUS_XO1BDA";       // WiFi SSID
String myPWD = "12345678"; // WiFi Password
String myAPI = "8C7SVI2CIPWHEZON";   // API Key
String myHOST = "api.thingspeak.com";
String myPORT = "80";
String myFIELD1 = "field1";
String myFIELD2 = "field2";
String myFIELD3 = "field3"; 
int sendVal1;int sendVal2;int sendVal3;
int k=0;


void setup()
{
  Serial.begin(96000);
  mySerial.begin(115200);
  espSerial.begin(115200);
  pinMode(ProxSensor1,INPUT);    //Pin 2 is connected to the output of proximity sensor
  pinMode(ProxSensor2,INPUT); 
  pinMode(ProxSensor3,INPUT); 
 
  espData("AT+RST", 1000, DEBUG);                      //Reset the ESP8266 module
  espData("AT+CWMODE=1", 1000, DEBUG);                 //Set the ESP mode as station mode
  espData("AT+CWJAP=\""+ mySSID +"\",\""+ myPWD +"\"", 1000, DEBUG);   //Connect to WiFi network
  /*while(!esp.find("OK")) 
  {          
      //Wait for connection
  }*/
  delay(1000);
  
}

  void loop()
  {
    
    
    sendVal1=digitalRead(ProxSensor1);
    sendVal2=digitalRead(ProxSensor2);
    sendVal3=digitalRead(ProxSensor3); 
    String sendData1 = "GET /update?api_key="+ myAPI +"&"+ myFIELD1 +"="+String(sendVal1);
    String sendData2 = "GET /update?api_key="+ myAPI +"&"+ myFIELD2 +"="+String(sendVal2);
    String sendData3 = "GET /update?api_key="+ myAPI +"&"+ myFIELD3 +"="+String(sendVal3);
    espData("AT+CIPMUX=1", 1000, DEBUG);       //Allow multiple connections
    espData("AT+CIPSTART=0,\"TCP\",\""+ myHOST +"\","+ myPORT, 1000, DEBUG);
    espData("AT+CIPSEND=0," +String(sendData1.length()+4),1000,DEBUG);  
    espSerial.find(">"); 
    espSerial.println(sendData1);
    espData("AT+CIPMUX=1", 1000, DEBUG);       //Allow multiple connections
    espData("AT+CIPSTART=0,\"TCP\",\""+ myHOST +"\","+ myPORT, 1000, DEBUG);
    espData("AT+CIPSEND=0," +String(sendData2.length()+4),1000,DEBUG);  
    espSerial.find(">"); 
    espSerial.println(sendData2);
    espData("AT+CIPMUX=1", 1000, DEBUG);       //Allow multiple connections
    espData("AT+CIPSTART=0,\"TCP\",\""+ myHOST +"\","+ myPORT, 1000, DEBUG);
    espData("AT+CIPSEND=0," +String(sendData3.length()+4),1000,DEBUG);  
    espSerial.find(">"); 
    espSerial.println(sendData3);
    Serial.print("Value to be sent: ");
    Serial.println(sendVal1);
    Serial.print("Value to be sent: ");
    Serial.println(sendVal2);
    Serial.print("Value to be sent: ");
    Serial.println(sendVal3);
    if(k==0&&sendVal1==1&&sendVal2==1&&sendVal3==1)
    {
      SendMessage();
      k=1;
    }

 if (mySerial.available()>0)
   Serial.write(mySerial.read()); 
    espData("AT+CIPCLOSE=0",1000,DEBUG);
    //delay(100);
  }

  String espData(String command, const int timeout, boolean debug)
{
  Serial.print("AT Command ==> ");
  Serial.print(command);
  Serial.println("     ");
  
  String response = "";
  espSerial.println(command);
  long int time = millis();
  while ( (time + timeout) > millis())
  {
    while (espSerial.available())
    {
      char c = espSerial.read();
      response += c;
    }
  }
  if (debug)
  {
    //Serial.print(response);
  }
  return response;
}
void SendMessage()
{
  mySerial.println("AT+CMGF=1");    //Sets the GSM Module in Text Mode
  delay(1000);  // Delay of 1000 milli seconds or 1 second
    Serial.print("SENDING MESSAGE\n");
  mySerial.println("AT+CMGS=\"+918778403025\"\r"); 
  delay(1000);
  mySerial.println("Slot is available! ");// The SMS text you want to send
  delay(100);
   mySerial.println((char)26);// ASCII code of CTRL+Z
  delay(1000);
}
