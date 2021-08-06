<!-- :
@echo off
start "" mshta.exe "%~f0"
exit /b
-->


<html>
<head><title>訊息提醒視窗</title></head>
<meta http-equiv="Content-Type" content="text/html; charset=Big5">
<body bgcolor=black>
	

<script type="text/javascript">
while (true) {
    try {
	var w = 920, h = 500;
        window.resizeTo(w, h);
        window.moveTo((window.screen.width - w) / 2, (window.screen.height - h) / 2);
        break;
    } catch (e) { continue; }
}
</script>	


	
	
		<h1>
		<font size="7" color="#00F0F0" style="font-family: verdana">
			<p align=left>回覆:大雄在CTeam 上建立的問卷調查 	</p>
			<p>  						          				</p>
			<p align=left>防疫調查投票了沒，防疫調查投票了沒	</p>
			<p>  						      			    	</p>
		</font>
		</h1>
		
		<h2>	
		<CENTER>
		<font size="3" color="#C4C4C4" > 			
		<p> [ 人在逆境裏比在順境裏更能堅持不屈。遭厄運時比交好運時更容易保全身心。」-雨果  ] </P>
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

<center>
<input type="button" value="離開訊息" onclick="myEXIT()" 
style="width:200px;height:46px;border:5px #007cd1 double;font-size:30px;color:blue;">

<input type="button" value="貪睡(9分)" onclick="mySLEEP()"
style="width:200px;height:46px;border:5px #007cd1 double;font-size:30px;color:blue;">

<font size="3" color="#FF0DFF" "font-family: verdana" ;>
<p> [ 如未按下 "貪睡"，來休眠接收訊息， <span id="timer"></span>秒，後自動離開並結束程式!!!]  </p>
</center>

<object type="audio/x-wav" data="D:\Msg\Use\Alarm\台灣阿龍.mp3" width="320" height="260">
<param name="autostart" value="true" />
<param name="controller" value="true" />
<param name="src" value="D:\Msg\Use\Alarm\台灣阿龍.mp3">
</object>




<!-- :  Show Clock  -->

<script>
setInterval("clockshow.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
</script>

<script>
datnow.innerHTML="訊息送出時間: "+new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());
</script>



<script type="text/javascript">

button_manual=0;
<!-- : 第1次Call Function ， 300秒結束  -->
count=300; // seconds 

<!-- :   REM顯示內容次數REM  count=1秒1次  -->
counter=setInterval(timer, 1000); 

function timer()
{
 count=count-1;
 if (count <= 0)
 {
	if ( button_manual <= 0)
         <!-- : 未按下 貪睡  300秒結束  -->
		  window.close();
	{
	}	
	<!-- :   已經按過貪睡一次 (1) Windows 縮小或消失 (2) 等待mySLEEP (3)重新RESET計時300秒結束  -->
	count=300; // seconds  
	button_manual=0;
	 while (true) {
		try {
		var w = 900, h = 520;
			window.resizeTo(w, h);
			window.moveTo((window.screen.width - w) / 2, (window.screen.height - h) / 2);
			break;
		} catch (e) { continue; }
     }

 } document.getElementById("timer").innerHTML=count + " "; // 
}
</script>

<script>
function myEXIT() {
    window.close();
}
</script>

<script>
function mySLEEP() {
	<!-- :   休眠(9分)接收訊息  -->
	button_manual=1;
	count=540; // seconds 
    window.resizeTo(0, 0);
	window.moveTo(3600 ,3600);
	return;
}
</script>


</html>


