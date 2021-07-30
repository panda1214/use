<!-- :
@echo off
start "" mshta.exe "%~f0"
exit /b
-->


<html>
<head><title>訊息提醒視窗</title></head>
<meta http-equiv="Content-Type" content="text/html; charset=Big5">
	<body bgcolor=#FFFF3B>
		<h1>
		<font size="7" color="#00F0F0" <p style="font-family: verdana">
		<p> (1)喇叭音量已打開		</P>
		<p>  						</P>
		<p> (2)上班使用程式皆已開啟 </P>
		<p>  						</P>	
			<font size="3">			
			<p> [ OUTLOOK,ask_Speaker,FreeAlarmClock,Rainlendar2,Rainmeter ,lync ,caffeine64 ] </P>
			</font >	
		</font >
		</h1>
	</body>
	
<CENTER>
<div id="clockshow"></div>
<input type="button" value="確定" onclick="myFunction()" style="width:120px;height:40px;font-size:20px;">
</CENTER>



<!-- :  Show Clock  -->

<script>
setInterval("clockshow.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
</script>

<script>
function myFunction() {
    window.close();
}

</script>
</html>
