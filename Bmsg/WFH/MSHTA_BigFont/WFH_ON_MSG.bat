<!-- :
@echo off
start /min "" mshta.exe "%~f0"
timeout 60
"C:\WINDOWS\system32\taskkill.exe" /F /IM mshta.exe /T 
exit /b
-->


<html>
<head><title>�T����������</title></head>
<meta http-equiv="Content-Type" content="text/html; charset=Big5">
	<body bgcolor=#FFFF3B>
		<h1>
		<br><br/>
		<font size="7" color="#00F0F0" <p style="font-family: verdana">
		<p> (1)��z���q�w���}		</P>
		<p>  						</P>
		<p> (2)�W�Z�ϥε{���Ҥw�}�� </P>
		<p>  						</P>	
			<font size="3">			
			<p> [ OUTLOOK,ask_Speaker,FreeAlarmClock,Rainlendar2,Rainmeter ,lync ,caffeine64 ] </P>
			</font >	
		</font >
		</h1>
	</body>
	
<CENTER>
<div id="clockshow"></div>
<input type="button" value="�T�w" onclick="myFunction()" style="width:120px;height:40px;font-size:20px;">
</CENTER>


<!-- :  Show Clock  -->

<script>
setInterval("clockshow.innerHTML=new Date().toLocaleString()+' �P��'+'��@�G�T�|����'.charAt(new Date().getDay());",1000);
</script>


<script>
function myFunction() {
    window.close();
}

</script>
</html>
