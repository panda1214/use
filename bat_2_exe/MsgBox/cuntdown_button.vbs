rem msgbox now 'now is the system para
REM RUN :	 wscript.exe cuntdown_button.vbs
REM dim answer
REM answer=MsgBox("Hello everyone!",65,"Example")
REM document.write(answer)

msgbox "Timer Setup !!! ",,"msgbox now 'now is the system para"
dim limit
limit = int(inputbox("Set your time in minutes!",,Setting))

dim a,b,c '保證只提醒一次
a=0
b=0
c=0

dim cur
cur = 0

m = hour(now)*60 + minute(now)

while cur<limit
	cur = hour(now)*60+minute(now) - m
	Wscript.sleep 10000

	if limit-cur=10 and a=0 then
		msgbox "10 Minutes Left!",,"Warnning"
		a=1
	elseif limit-cur=5 and b=0 then
		msgbox "5 Minutes Left!",,"Warnning"
		b=1
	elseif limit-cur=1 and c=0 then
		msgbox "1 Minute Left!",,"Warnning"
		c=1
	end if
wend
 
msgbox "Time is up！",,"OVER"