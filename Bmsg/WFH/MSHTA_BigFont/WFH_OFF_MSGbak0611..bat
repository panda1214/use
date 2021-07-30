<!-- :
@echo off
start "" mshta.exe "%~f0"
exit /b
-->

<html>
<head><title>訊息提醒視窗</title></head>
<body bgcolor=#FFFF3B>
	<h1>
	<font size="7" color="#00F0F0" <p style="font-family: verdana">
	<p> (1)喇叭音量已打關閉		</P>
	<p>  						</P>
	<p> (2)上班使用程式皆已關閉結束 </P>
	<p>  						</P>	
		<font size="3">			
		<p> [ OUTLOOK,ask_Speaker,FreeAlarmClock,Rainlendar2,Rainmeter ,lync ,caffeine64 ] </P>
		</font >	
	</h1>
	</font >
</body>
<CENTER>
<input type="button" value="確定" onclick="myFunction()" style="width:120px;height:40px;font-size:20px;">
</CENTER>

<script>
function myFunction() {
    window.close();
}
</script>
</html>
