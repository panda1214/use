<!-- :
@echo off

nircmd cmdwait 1000 win setsize ititle "cmd.exe" 3600 3600 100 200
mode con cols=20 lines=10
setlocal enableextensions disabledelayedexpansion

START /wait "" mshta.exe "%~f0"


if errorlevel 2 (
     GOTO L1_CHOICE_2 

) else if errorlevel 1 (
    GOTO L1_CHOICE_1

) else (
    GOTO L1_CHOICE_0

)


	
:L1_CHOICE_2
	

	msg /time:10 "%username%" "system ERROR!!!"
	GOTO L1_EXIT

:L1_CHOICE_1
	

	msg /time:10 "%username%" "您剛剛選擇取消(不處理)，故未執行任何後續作業 !!!"
	GOTO L1_EXIT
	
:L1_CHOICE_0
	c:
	cd C:\CTYAP
	start C:\CTYAP\daqCTYAP.exe
	nircmd cmdwait 1000 win setsize ititle "cmd.exe" 3600 3600 100 200
	mode con cols=20 lines=10
	MSG * /TIME:3 執行C:\CTYAP\daqCTYAP.exe
	GOTO L1_EXIT
	

:L1_EXIT
exit



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
		<font size="7" color="#00F0F0"  style="font-family: verdana">
			<p>  						    </p>
			<p align=center>打開嘉實看盤_AP </p>
			<p>  						    </p>
			<p align=center>打開嘉實看盤_AP </br>
		</font>
		</h1>
		<h2>	
		<CENTER>
		<font size="3" color="#C4C4C4" > 			
		<p> [ 在逆境的時候，你要問自己是否有足夠的條件。當我自己逆境的時候，我認為我夠！  ]  </P>
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
<input type="button" value="確認並執行" onclick="myEXIT()" 
style="width:200px;height:46px;border:5px #007cd1 double;font-size:30px;color:blue;">

<input type="button" value="貪睡(5分)" onclick="mySLEEP()"
style="width:200px;height:46px;border:5px #007cd1 double;font-size:30px;color:blue;">

<input type="button" value="取消(不處理)" onclick="myCANCEL()" 
style="width:200px;height:46px;border:5px #007cd1 double;font-size:30px;color:blue;">


<!-- :  auto replay mp3 -->
<p> 
<object type="audio/x-wav" data="D:\Msg\Use\台灣阿龍.mp3" width="0" height="0">
<param name="autostart" value="true" />
<!-- : <param name="loop" value="true" /> -->
<param name="src" value="D:\Msg\Use\台灣阿龍.mp3">
</object>

<font size="3" color="#FF0DFF" "font-family: verdana" ;>
<p> [ 如未按下 "貪睡"，來休眠接收訊息， <span id="timer"></span>秒，後自動離開並結束程式!!!]  </p>
</center>





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
count=1800; // seconds 

<!-- :   REM顯示內容次數REM  count=1秒1次  -->
counter=setInterval(timer, 1000); 

function timer()
{
 count=count-1;
 if (count <= 0)
 {
	if ( button_manual <= 0)
         <!-- : 未按下 貪睡  300秒自動結束  -->
	     closeHTA(2)

	{
	}	
	<!-- :   已經按過貪睡一次 (1) Windows 縮小或消失 (2) 等待mySLEEP (3)重新RESET計時1800秒結束  -->
	count=1800; // seconds  
	button_manual=0;
	 while (true) {
		try {
		var w = 920, h = 500;
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
	closeHTA(0)

}
</script>

<script>
function myCANCEL() {
	closeHTA(1)

}
</script>


<script>
function mySLEEP() {
	<!-- :   休眠(5分)接收訊息  -->
	button_manual=1;
	count=300; // seconds 
    window.resizeTo(0, 0);
	window.moveTo(3600 ,3600);
	return;
}
</script>


		
<SCRIPT language="Javascript">
            function closeWithErrorlevel(errorlevel){
                var colProcesses = GetObject('winmgmts:{impersonationLevel=impersonate}!\\\\.\\root\\cimv2').ExecQuery('Select * from Win32_Process Where Name = \'mshta.exe\'');
                var myPath = (''+location.pathname).toLowerCase();
                var enumProcesses = new Enumerator(colProcesses);
                for ( var process = null ; !enumProcesses.atEnd() ; enumProcesses.moveNext() ) {
                    process = enumProcesses.item();
                    if ( (''+process.CommandLine).toLowerCase().indexOf(myPath) > 0 ){
                        process.Terminate(errorlevel);
                    }
                }
            }

            function closeHTA(value){
                // test close of window. Use default value
                if (typeof value === 'undefined') value = 0; 
                try { closeWithErrorlevel(value) } catch (e) {};
            }
</SCRIPT>

    <script language="Javascript">
            window.attachEvent('onbeforeunload',closeHTA);
    </script>

</html>


