@echo off
REM *******************************************
REM	Main Func
REM **********************************************

D:
CD "D:\MSG\USE"
start nircmd.exe mutesysvolume 1

"C:\WINDOWS\system32\taskkill.exe" /F /IM OUTLOOK.EXE /T 			
"C:\WINDOWS\system32\taskkill.exe" /F /IM ask_Speaker.exe /T 		
"C:\WINDOWS\system32\taskkill.exe" /F /IM FreeAlarmClock.exe /T 	
"C:\WINDOWS\system32\taskkill.exe" /F /IM Rainlendar2.exe /T 	
"C:\WINDOWS\system32\taskkill.exe" /F /IM Rainmeter.exe /T 	
"C:\WINDOWS\system32\taskkill.exe" /F /IM lync.exe /T 	
"C:\WINDOWS\system32\taskkill.exe" /F /IM caffeine64.exe /T 

REM *******************************************
REM	SHOW Message
REM **********************************************
D:
CD "D:\MSG\USE\WFH"
call WFH_OFF_MSG.bat

EXIT 


:: REM D:
:: REM CD "D:\"
:: REM echo. > D:\on_msg.txt
:: REM echo. (1)��z���q�w���}		>> D:\on_msg.txt
:: REM echo. 							>> D:\on_msg.txt
:: REM echo. (2)�W�Z�ϥε{���Ҥw�}��	>> D:\on_msg.txt
:: REM echo. 							>> D:\on_msg.txt
:: REM echo. (OUTLOOK,ask_Speaker,FreeAlarmClock,Rainlendar2,Rainmeter ,lync ,caffeine64) >> D:\on_msg.txt	
:: REM echo. 							>> D:\on_msg.txt
:: REM msg 01000845 < D:\on_msg.txt	
:: REM del on_msg.txt



