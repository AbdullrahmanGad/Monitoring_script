# 🖥️ System Monitor Script:-
This Bash script monitors system health by checking disk usage, CPU usage, memory usage, and top running processes. It also sends an email alert when disk usage exceeds a user-defined threshold.
##🚀 Features:-
✔️ Disk Usage Monitoring (with configurable threshold).  
✔️ CPU Usage Check.  
✔️ Memory Usage Report.  
✔️ Top 5 Running Processes.  
✔️ Email Alert for High Disk Usage.  

## 📌 Prerequisites:-  
Ensure you have the following installed on your system:
mailutils (for sending email alerts)
```
sudo apt update && sudo apt install mailutils -y  # Ubuntu/Debian
```
## ⚙️ Usage:-
Run the script using:
```
chmod +x monitor.sh
./monitor.sh
```
## 🛠 Customization:-
You can set a custom threshold and log file name using options:
```
./monitor.sh -t 85 -f custom_log.log
```
-t: Set disk usage threshold (default: 80%)
-f: Specify log file name (default: system_monitor.log)  

## 📧 Email Alert Configuration:-
Edit the TO_EMAIL variable in the script to set your email:
```
TO_EMAIL="your_email@example.com"
```
## 📋 Output Example:-  

![Screenshot 2025-02-17 200945](https://github.com/user-attachments/assets/8d550842-ce96-4430-b473-254896c870f4)  

![Email](https://github.com/user-attachments/assets/3dfa6e82-61fa-463e-a059-8baaa7628791)  

## Note:-
### ⏰ Automating with a Cron Job:-  
To run this script automatically at regular intervals, add it to cron jobs:
Open the crontab editor:
```
crontab -e
```
Add the following line to run the script every hour:  
```
0 * * * * /path/to/monitor.sh -t 85 -f /var/log/system_monitor.log
```
Replace /path/to/monitor.sh with the actual path to your script.
Logs will be stored in /var/log/system_monitor.log.
