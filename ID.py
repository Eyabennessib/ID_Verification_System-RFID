#!/usr/bin/env python

import RPi.GPIO as GPIO
from mfrc522 import SimpleMFRC522

GPIO.setwarnings(False)
 
reader = SimpleMFRC522()

id, text = reader.read()
print (id)

GPIO.cleanup()

