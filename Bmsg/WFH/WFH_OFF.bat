<!-- :
:::REM ****** START bat & call mshta ***************
D:\Msg\Use\Msg_choice_box.exe "_***D-1830-�ǳ������A�W�Z�ϥε{��-�ǳ������A�W�Z�ϥε{��" 600 300
START /min "" mshta.exe "%~f0"
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
REM D:
REM CD "D:\MSG\USE\WFH"
REM call WFH_OFF_MSG.bat



exit /b



:::REM ****** START bat & call mshta ***************
-->

<html>
<head>
<hta:application 
APPLICATIONNAME = "Program ALERT"
ID = "Program ALERT"
BORDERSTYLE = "Normal"
CAPTION = "No"
CONTEXTMENU = "No"
INNERBORDER = "No"
MAXIMIZEBUTTON = "No"
MINIMIZEBUTTON = "No"
NAVIGABLE = "No"
SCROLL = "No"
SCROLLFLAT = "No"
SELECTION = "No"
SHOWINTASKBAR = "No"
SINGLEINSTANCE = "Yes"
SYSMENU = "No"/> <STYLE>
html, body {
background color: #000
 
 font-size: 90%;
 line-height: 2.1em;
 margin: 10;
 padding: 0;
}

<!-- :   �X��  https://www.wibibi.com/info.php?tid=372 -->
<!-- :   H1   -   H4	-->

h1 {font-family: Arial;
 color: #007cd1;
 font-size: 3em;
 text-transform: uppercase;
 text-align: center;
}
h2 {font-family: Arial;
 color: #fff;
 font-size: 2.2em;
 text-transform: uppercase;
 text-align: left;
}
h3 
{font-family: Arial;
 color: #666;
 font-size: 0.8 em;
 text-transform: uppercase;
 text-align: center;
}
h4
{font-family: Arial;
 color: #FF00FF;
 font-size: 1 em;
 text-transform: uppercase;
 text-align: center;
}


</STYLE> <script type='text/vbscript'> 
Sub Window_onload()
	Me.ResizeTo 660,480
	Me.MoveTo Screen.Width /2 - 300,Screen.Height / 2 - 300
	<!-- :   REM��ܤ��eREM  Me.Close()" 30000=30������  -->
	Me.SetTimeout "Me.Close()",30000
	End Sub
</script>

</head>
<body scroll="no">
<br>

<!-- :   ��ܤ��e   -->
		<h1>�q���T������ !</h1>
		<h2>(1)��z���q�w����	<br>
		    (2)�W�Z�ϥε{���Ҥw�����õ���.<br>
		</h2> 
		<h3><br>
			[ OUTLOOK,ask_Speaker,FreeAlarmClock ]<br>
			[ Rainlendar2,Rainmeter ,lync ,caffeine64 ]
			<br>
		</h3>
		<center><input type="button" value="�T  �w" onclick="myFunction()" 
		style="width:120px;height:40px;border:5px #007cd1 double;font-size:30px;color:blue;">
		</center>
		<h4>��T�޲z�B_����w - [ �p�����U "�T  �w"�A�ӱ����T���A <span id="timer"></span>��] ��۰��������T�� </h4> 

<!-- :   Button
<input type="button" value="�ڬO���s" style="width:120px;height:40px;border:2px #9999FF dashed;background-color:pink;">
<input type="button" value="�ڬO���s" style="width:120px;height:40px;border:3px orange double;background-color:pink;">
<input type="button" value="�ڬO���s" style="width:120px;height:40px;border:2px blue none;background-color:pink;">
-->	

	 
<script type="text/javascript">
<!-- :   REM��ܤ��e����REM  count=1��1��  -->
var count=30; // seconds 
var counter=setInterval(timer, 1000); 

function timer()
{
 count=count-1;
 if (count <= 0)
 {
 clearInterval(counter);
 return;
 } document.getElementById("timer").innerHTML=count + " "; // 
}

function myFunction() {
    window.close();
}

</script>
</body>
</html>





