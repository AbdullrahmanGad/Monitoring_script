#!/bin/bash
Log_File="system_monitor.log"
{
#First Check Disk Usage:
echo "Disk Usage Check:"
df -h / | grep / # -h for readable format

echo "------------------------------------"

# setting a threshold=80%
TH=80
#allowing user to decide the Threshold AND The path:
while getopts ":t:f:" opt; do
  case $opt in
    t)
      TH=$OPTARG
      ;;
    f)
      Log_File=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

echo "------------------------------------"

# storing the percentage in a variable
Usage_percent=$(df --output=pcent / | awk 'NR==2 {print $1}' | tr -d '%')
TO_EMAIL="bodeygad99@gmail.com"  
SUBJECT="🚨 Disk Usage Warning!"
BODY="Warning: Disk usage has exceeded $TH%! on $(hostname). Please check the system."

if (( Usage_percent > TH )) 
then 
   echo -e "$BODY"
   echo -e "$BODY" | mail -s "$SUBJECT" "$TO_EMAIL"
	
    echo "Alert email sent to $TO_EMAIL!"
#Make sure to install mailutils.
else 
   echo "Disk usage is stable $Usage_percent% "
fi
echo "------------------------------------"

#Check CPU Usage:
top -n 1 | grep "Cpu(s)" | awk 'NR==1 {print "CPU Usage",  100 - $8 "%"}'

echo "------------------------------------"

#To show Memory Usage:
echo " Memory Usage "
free -h
echo "------------------------------------"

# Check top 5 Running Processes:
echo top 5 Running Processes
ps aux --sort=-%mem | head -n 6

echo "------------------------------------"


} > $Log_File 
