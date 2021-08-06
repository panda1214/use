<!-- :
@echo off
start "" mshta.exe "%~f0"
exit /b
-->


<html>
<head><title>訊息_MSG_USE_ALARM_定時提醒視窗</title></head>
<meta http-equiv="Content-Type" content="text/html; charset=Big5">
<body bgcolor=black>
	

<script type="text/javascript">
while (true) {
    try {
	var w = 900, h = 520;
        window.resizeTo(w, h);
        window.moveTo((window.screen.width - w) / 2, (window.screen.height - h) / 2);
        break;
    } catch (e) { continue; }
}
</script>	


	
	
		<h1>
		<font size="10" color="#00F0F0" <p style="font-family: verdana">
			<p>    (1)整理工作，寫好工作日誌 </P>
			<p>    (2)清空水杯，重整心情，收拾背包</P>
			<p>    (3)下班記得打卡，準備離開 </P>
		</font>
		</h1>
		
		<h2>	
		<CENTER>
		<font size="3" color="#C4C4C4" > 			
		<p> [ 收拾好所有工作情緒，不要帶回家，家人才是最重要 !!! ] </P>
		</center>
		</font>
		</h2>

</body>
	

<br>
<CENTER><font size="5" color="#FF0DFF" "font-family: verdana" ;>
<div id="clockshow"></div>
</center>

<p>
<CENTER>
<div style="display:inline ;font size:12 ;color:#C4C4C4; font-weight:bold;"
id="datnow"></div> 
</center>


<center><input type="button" value="離開訊息" onclick="myFunction()" 
		style="width:200px;height:46px;border:5px #007cd1 double;font-size:30px;color:blue;">
</center>






<!-- :  Show Clock  -->

<script>
setInterval("clockshow.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
</script>

<script>
datnow.innerHTML="訊息送出時間: "+new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());
</script>

<script>
function myFunction() {
    window.close();
}
</script>


</html>
