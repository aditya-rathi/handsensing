import processing.serial.*;
import java.awt.Robot;
import java.awt.AWTException;
import java.awt.event.KeyEvent;
import java.io.IOException;
Serial myPort;
Robot robot;
String val;
int x;
int y;
int z;
int p=0;
int q=0;
int t=0;
int s=0;
int r=0;

void setup() {
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 19600);
  try { 
    robot = new Robot();
  } catch (AWTException e) {
    e.printStackTrace();
    exit();
  }
}

void draw()
{
  if ( myPort.available() > 0) 
  {  // If data is available,
  val = myPort.readStringUntil('\n'); // read it and store it in val
  int[] nums = int(split(val, '\t'));
  x=nums[0];
  y=nums[1];
  z=nums[2];
  if(x>355)
  {
    robot.keyPress(KeyEvent.VK_W);
    p=1;
  }
  else
  {
    if(p==1)
    {
    robot.keyRelease(KeyEvent.VK_W);
  }}
  if(x<300)
  {
    robot.keyPress(KeyEvent.VK_S);
    q=1;
  }
  else
  {
    if(q==1)
    {
    robot.keyRelease(KeyEvent.VK_S);
  }}
  }
  if(y>360)
  {
    robot.keyPress(KeyEvent.VK_A);
    s=1;
  }
  else
  {
    if(s==1)
    {
    robot.keyRelease(KeyEvent.VK_A);
  }}
  if(y<310)
  {
    robot.keyPress(KeyEvent.VK_D);
    t=1;
  }
  else
  {
    if(t==1)
    {
    robot.keyRelease(KeyEvent.VK_D);
  }}
 if(x>385)
  {
    robot.keyPress(KeyEvent.VK_B);
    r=1;
  }
  else
  {
    if(r==1)
    {
    robot.keyRelease(KeyEvent.VK_B);
  }}
}