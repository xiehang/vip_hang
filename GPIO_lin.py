# Lin Yang 10/8/2013
# The following code can turn on/off the LED that connected to GPIP pin
# can Blinking an LED. And controll the input pin of GPIO. whhen the status of
#input pin is on, then turn on the LED
#Turn on/off the LED
sudo python #Installing GPIO in Python
import RPi.GPIO as GPIO #import RPI module
GPIO.setmode(GPIO.BCM)#import the pin numbering of the GPIO
GPIO.setup(25, GPIO.OUT) #set the direction of pin 25 to output
GPIO.setup(25, GPIO.HIGH) #turn on the LED
GPIO.setup(25, GPIO.LOW) #turn off the LED
exit()#exit the python interactive interpreter
#Blinking an LED
import RPi.GPIO as RPIO #import the code needed for GPIO control
import time # import the code needed for the sleep function
GPIO.setmode(GPIO.BCM) #use the chip's signal numbers
GPIO.setup(25, GPIO.OUT) #set pin 25 as an output
while True: #create an infinite loop sonsisting of the indented code below it
    GPIO.output(25, GPIO.HIGH)#Turn the LED on
    time.sleep(1)#wait for one second
    GPIO.output(25,GPIO.LOW) #turn the LED off
    time.sleep(1) #wait for one second
#open LXTerminal
cd~
sudo python blink.py # import the code needed for LED blinking

#control the input pin of GPIO
GPIO.setup(4, GPIO.IN)# set the direction of pin 4 to input
while True # start a loop that cant end
GPIO.imput(4, GPIO. HIGH) # if the input 4 is 1
time.sleep(2)#wait for 2 second
else
#echo out email if input pin is 0

