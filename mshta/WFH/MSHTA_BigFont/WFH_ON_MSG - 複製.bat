<!-- :
@echo off
start "" mshta.exe "%~f0"
exit /b
-->


<html>
<head><title>�T����������</title></head>
<meta http-equiv="Content-Type" content="text/html; charset=Big5">
	<body bgcolor=#FFFF3B>
	<body �jnl�jad="show()"> <!-- �������J�ɰ���@�� �H��N��??�ΤF-->
	<div id="nowDiv"></div> 
		<h1>
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
<div id="linkweb"></div>
<input type="button" value="�T�w" onclick="myFunction()" style="width:120px;height:40px;font-size:20px;">
</CENTER>



<!-- :  Show Clock  -->

<script>
setInterval("linkweb.innerHTML=new Date().toLocaleString()+' �P��'+'��@�G�T�|����'.charAt(new Date().getDay());",1000);
</script>

<script>
function myFunction() {
    window.close();
}				

function show(){
	var date = new Date(); //���?�H
	var now = "";
	now = date.getFullYear()+"�~"; //?�^��N��F
	now = now + (date.getMonth()+1)+"��"; //���몺?�Ԩ����O?�e��-1�p�G�Q��?�e��+1�N�i�H�F
	now = now + date.getDate()+"��";
	now = now + date.getHours()+"?";
	now = now + date.getMinutes()+"��";
	now = now + date.getSeconds()+"��";
	document.getElementById("nowDiv").innerHTML = now; //div��html�Onow??�r�Ŧ�
	setTimeout("show()",1000); //?�m?1000�@��N�O1��A?��show��k
}

</script>
</html>
