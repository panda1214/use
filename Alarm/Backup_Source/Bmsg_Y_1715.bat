<!-- :
@echo off
start "" mshta.exe "%~f0"
exit /b
-->


<html>
<head><title>�T��_MSG_USE_ALARM_�w�ɴ�������</title></head>
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
			<p>    (1)��z�u�@�A�g�n�u�@��x </P>
			<p>    (2)�M�Ť��M�A����߱��A���B�I�]</P>
			<p>    (3)�U�Z�O�o���d�A�ǳ����} </P>
		</font>
		</h1>
		
		<h2>	
		<CENTER>
		<font size="3" color="#C4C4C4" > 			
		<p> [ ���B�n�Ҧ��u�@�����A���n�a�^�a�A�a�H�~�O�̭��n !!! ] </P>
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


<center><input type="button" value="���}�T��" onclick="myFunction()" 
		style="width:200px;height:46px;border:5px #007cd1 double;font-size:30px;color:blue;">
</center>






<!-- :  Show Clock  -->

<script>
setInterval("clockshow.innerHTML=new Date().toLocaleString()+' �P��'+'��@�G�T�|����'.charAt(new Date().getDay());",1000);
</script>

<script>
datnow.innerHTML="�T���e�X�ɶ�: "+new Date().toLocaleString()+' �P��'+'��@�G�T�|����'.charAt(new Date().getDay());
</script>

<script>
function myFunction() {
    window.close();
}
</script>


</html>
