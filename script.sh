#!/bin/bash

IPc=`curl ifconfig.me`
echo "adresse public :"
echo "$IPc"
mosquitto_pub -r -h localhost -t ip_pc -m " $IPc" 

IPp=`hostname -I | cut -d " " -f1`
echo "adresse privée :"
echo "$IPp"
mosquitto_pub -r -h localhost -t ip_pp -m " $IPp" 

Cpu=`top -d 0.5 -b -n2 | grep "Cpu(s)"|tail -n 1 | awk '{print $2  + $4}'`
echo "cpu load"
echo "$Cpu"
mosquitto_pub -r -h localhost -t cpu_load -m " $Cpu"

d=`date`
echo "la date : "
echo "$d"
mosquitto_pub -r -h localhost -t date  -m " $d"

Name=`hostname -s`
echo "le nom de RPI :" 
echo "$Name"
mosquitto_pub -r -h localhost -t nRPI  -m " $Name" 

temp=`vcgencmd measure_temp`
echo "$temp "
mosquitto_pub -r -h localhost -t tempr -m " $temp" 

echo "le nom du capteur : RFID RC522"
mosquitto_pub -r -h localhost -t nCap  -m " RFID RC522" 


echo "le nom de l'actionneur : Module buzzer actif GT1143"
mosquitto_pub -r -h localhost -t nAct  -m "Buzzer GT1143"


echo "ID USER :"
echo "placez votre badge"
ID=$(python3 ID.py)
echo "$ID" 

mosquitto_pub -h localhost -t Vef  -m  "$ID" 

echo "verification"
Ver=$(python3 Verification.py)
mosquitto_pub -h localhost -t check  -m  "$Ver" 


etat=$(python3 ReadAct.py)
echo "etat Alarme: "
echo "$etat"
mosquitto_pub -h localhost -t eAct  -m " $etat" 

echo "Appuyez sur ctrl + c pour quitter"


bol=`mosquitto_sub -h localhost -t "stop"`

if [ $bol = "X" ]
then
        echo "SYSTEM STOPPED"
fi

