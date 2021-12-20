#!/usr/bin/env python

import RPi.GPIO as GPIO
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
GPIO.setup(3,GPIO.OUT)
 
if (GPIO.output(3,GPIO.HIGH)) :
     print ("Alarme ON")
else:
     print ("Alarme OFF")

GPIO.cleanup()
