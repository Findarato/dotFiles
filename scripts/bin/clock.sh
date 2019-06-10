#!/bin/bash
clear

function rainbowTime (){
  date +%T | figlet 
}

#while true;
#do 
#rainbowTime;
#done;

#rainbowTime;


watch -c -t -n 1 "date +%T | figlet -f future"
