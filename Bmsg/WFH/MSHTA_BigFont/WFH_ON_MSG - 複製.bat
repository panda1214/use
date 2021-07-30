<!-- :
@echo off
start "" mshta.exe "%~f0"
exit /b
-->


<html>
<head><title>訊息提醒視窗</title></head>
<meta http-equiv="Content-Type" content="text/html; charset=Big5">
	<body bgcolor=#FFFF3B>
	<body οnlοad="show()"> <!-- 網頁載入時執行一次 以後就自??用了-->
	<div id="nowDiv"></div> 
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
<div id="linkweb"></div>
<input type="button" value="確定" onclick="myFunction()" style="width:120px;height:40px;font-size:20px;">
</CENTER>



<!-- :  Show Clock  -->

<script>
setInterval("linkweb.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
</script>

<script>
function myFunction() {
    window.close();
}				

function show(){
	var date = new Date(); //日期?象
	var now = "";
	now = date.getFullYear()+"年"; //?英文就行了
	now = now + (date.getMonth()+1)+"月"; //取月的?候取的是?前月-1如果想取?前月+1就可以了
	now = now + date.getDate()+"日";
	now = now + date.getHours()+"?";
	now = now + date.getMinutes()+"分";
	now = now + date.getSeconds()+"秒";
	document.getElementById("nowDiv").innerHTML = now; //div的html是now??字符串
	setTimeout("show()",1000); //?置?1000毫秒就是1秒，?用show方法
}

</script>
</html>
