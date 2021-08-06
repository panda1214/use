<!-- :
@echo off
start /min "" mshta.exe "%~f0"

exit /b
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

<!-- :   碼表  https://www.wibibi.com/info.php?tid=372 -->
<!-- :   H1   -   H4	-->

h1 {font-family: Arial;
 color: #007cd1;
 font-size: 3em;
 text-transform: uppercase;
 text-align: center;
}
h2 {font-family: Arial;
 color: #fff;
 font-size: 1.5em;
 text-transform: uppercase;
 text-align: left;
}
h3 
{font-family: Arial;
 color: #666;
 font-size: 1em;
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

</STYLE> <script type='text/vbscript'> Sub Window_onload()
Me.ResizeTo 600,380
Me.MoveTo Screen.Width /2 - 300,Screen.Height / 2 - 300
<!-- :   REM顯示內容REM  Me.Close()" 30000=30秒關閉  -->
Me.SetTimeout "Me.Close()",30000
End Sub
</script>
</head>
<body scroll="no">
<br>

<!-- :   顯示內容   -->
		<h1>電腦訊息提醒 !</h1>
		<h2>(1)喇叭音量已關閉	<br>
		    (2)上班使用程式皆已關閉結束.<br>
		</h2> 
		<h3><br>
			[ OUTLOOK,ask_Speaker,FreeAlarmClock]<br>
			Rainlendar2,Rainmeter ,lync ,caffeine64 ]
			<br>
		</h3>
		<h4>資訊管理處_董國安 - [ 訊息將在 <span id="timer"></span>秒] 後自動關閉 </h4> 
		
		
<script type="text/javascript">
<!-- :   REM顯示內容次數REM  count=1秒1次  -->
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
</script>
</body>
</html>