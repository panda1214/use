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
	var w = 920, h = 700;
        window.resizeTo(w, h);
        window.moveTo((window.screen.width - w) / 2, (window.screen.height - h) / 2);
        break;
    } catch (e) { continue; }
}
</script>	


	
	
		<h1>
		<font size="7" color="#00F0F0" <p style="font-family: verdana">
			<br> 回覆:大雄在CTeam 上建立的問卷調查 </br>
			<p>  						           </p>
			<p> 防疫調查投票了沒，防疫調查投票了沒 </p>
			<br>  						           </br>
		</font>
		</h1>
		
		<h2>	
		<CENTER>
		<font size="3" color="#C4C4C4" > 			
		<p> [ 明日的氣力，都靠這罐保力達！  明日的氣力，都靠這罐保力達！ 啊..隨意.. ] </P>
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
