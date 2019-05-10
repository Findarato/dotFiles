#!/bin/bash
clear

function rainbowTime (){

  date +%T | figlet 
#  date +%T | figlet | lolcat -t -f
#  date +%T | figlet | lolcat -t -S $(date +%U);

}

#while true;
#do 
#rainbowTime;
#done;

#rainbowTime;


watch -c -t -n1 "date +%T | figlet -f future"
