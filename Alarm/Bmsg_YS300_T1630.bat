<!-- :
@echo off
start "" mshta.exe "%~f0"
exit /b
-->


<html>
<head><title>�T����������</title></head>
<meta http-equiv="Content-Type" content="text/html; charset=Big5">
<body bgcolor=black>
	

<script type="text/javascript">
while (true) {
    try {
	var w = 820, h = 600;
        window.resizeTo(w, h);
        window.moveTo((window.screen.width - w) / 2, (window.screen.height - h) / 2);
        break;
    } catch (e) { continue; }
}
</script>	


	
	
		<h1>
		<font size="7" color="#00F0F0" style="font-family: verdana">
			<p align=Left>�U�P�@(����W�Z)�A���ƥ��?  </P>
			<p>  						               </P>
			<p align=Left>(1)���s�]�w�x���A�Ƶ{    	   </P>
			<p align=Left>(2)�H�X EMAIL ����¾�N�ΥD�� </P>	
		</font>
		</h1>
		
		<h2>	
		<CENTER>
		<font size="3" color="#C4C4C4" > 			
		<p> [ �u�𮧡v���u�O���F������������I�u�𮧡v��O���F�ۧڪ֩w ] </P>
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
<input type="button" value="���}�T��" onclick="myEXIT()" 
style="width:200px;height:46px;border:5px #007cd1 double;font-size:30px;color:blue;">

<input type="button" value="�g��(9��)" onclick="mySLEEP()"
style="width:200px;height:46px;border:5px #007cd1 double;font-size:30px;color:blue;">

<font size="3" color="#FF0DFF" "font-family: verdana" ;>
<p> [ �p�����U "�g��"�A�ӥ�v�����T���A <span id="timer"></span>��A��۰����}�õ����{��!!!]  </p>
</center>






<!-- :  Show Clock  -->

<script>
setInterval("clockshow.innerHTML=new Date().toLocaleString()+' �P��'+'��@�G�T�|����'.charAt(new Date().getDay());",1000);
</script>

<script>
datnow.innerHTML="�T���e�X�ɶ�: "+new Date().toLocaleString()+' �P��'+'��@�G�T�|����'.charAt(new Date().getDay());
</script>



<script type="text/javascript">

button_manual=0;
<!-- : ��1��Call Function �A 300����  -->
count=300; // seconds 

<!-- :   REM��ܤ��e����REM  count=1��1��  -->
counter=setInterval(timer, 1000); 

function timer()
{
 count=count-1;
 if (count <= 0)
 {
	if ( button_manual <= 0)
         <!-- : �����U �g��  300����  -->
		  window.close();
	{
	}	
	<!-- :   �w�g���L�g�Τ@�� (1) Windows �Y�p�ή��� (2) ����mySLEEP (3)���sRESET�p��300����  -->
	count=300; // seconds  
	button_manual=0;
	 while (true) {
		try {
		var w = 820, h = 600;
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
	<!-- :   ��v(9��)�����T��  -->
	button_manual=1;
	count=540; // seconds 
    window.resizeTo(0, 0);
	window.moveTo(3600 ,3600);
	return;
}
</script>


</html>


