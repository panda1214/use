@echo off
REM *******************************************
REM	Main Func
REM **********************************************

D:
CD "D:\MSG\USE"

start nircmd.exe mutesysvolume 0
start nircmd.exe setsysvolume 65535 

C:
CD "C:\Program Files\Microsoft Office\Office16"
start /min OUTLOOK.EXE

C:
CD "C:\Program Files\Microsoft Office\Office15\"
start /min lync.exe

C:
CD "C:\Program Files (x86)\FreeAlarmClock\"
start /min FreeAlarmClock.exe

C:
cd "C:\Program Files (x86)\Rainlndar"
start /min Rainlendar2.exe

C:
CD "C:\Program Files\Rainmeter\"
start /min Rainmeter.exe

D:
CD "D:\Win10_64_APP\caffeine(�n��C�j�@�q�ɶ�������L�ާ@�A�i���קK����)\"
start /min caffeine64.exe 


REM *******************************************
REM	SHOW Message
REM **********************************************
D:
CD "D:\MSG\USE\WFH"
call  WFH_ON_MSG.bat

EXIT 



REM	D:
REM	CD "D:\"
REM	echo. > D:\on_msg.txt
REM	echo. (1)��z���q�w���}		>> D:\on_msg.txt
REM	echo. 							>> D:\on_msg.txt
REM	echo. (2)�W�Z�ϥε{���Ҥw�}��	>> D:\on_msg.txt
REM	echo. 							>> D:\on_msg.txt
REM	echo. (OUTLOOK,ask_Speaker,FreeAlarmClock,Rainlendar2,Rainmeter ,lync ,caffeine64) >> D:\on_msg.txt	
REM	echo. 							>> D:\on_msg.txt
REM	msg 01000845 < D:\on_msg.txt	
REM	del on_msg.txt



