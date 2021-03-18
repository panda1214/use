REm Beep.bat Bat_To_Exe_Converter_(x64).exe ->beep_bat.exe
REM ¥´¶}³â¤Ú
	
	nircmd.exe mutesysvolume 0
	mutesysvolume 0
	setsysvolume 65535 

set/A m0__playtime=60
:L0__start_beep  
	IF %m0__playtime% EQU 0 GOTO L0__end_beep  
	::D:\Msg\use\nircmd.exe mediaplay 10000 "D:\Msg\use\Alarm01.wav" 
	D:\Msg\use\nircmd.exe stdbeep  
	SET /A m0__playtime=%m0__playtime%-1
	echo %m0__playtime%
	timeout /t 1
goto L0__start_beep 



:L0__end_beep 
echo %m0__playtime%
