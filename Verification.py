#!/usr/bin/env python

import RPi.GPIO as GPIO
from mfrc522 import SimpleMFRC522
from time import sleep
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
buzzer=3
GPIO.setup(buzzer,GPIO.OUT) 
reader = SimpleMFRC522()
id, text = reader.read()
if id==210463107982 :
   print ("badge correcte")

while id!=210463107982 :
          print ("badge non correcte")
          print ("acces interdit")
          GPIO.output(buzzer,GPIO.HIGH)



