<!-- :
:L1_MAIN_START
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
	

	msg /time:10 "%username%" "�z����ܨ���(���B�z)�A�G������������@�~ !!!"
	GOTO L1_EXIT
	
:L1_CHOICE_0
	IF NOT EXIST F: GOTO L1_CHECK_BACKUP_DRIVE
	call D:\Msg\use\0600-ck_HardDisk_Space.bat
	nircmd cmdwait 1000 win setsize ititle "cmd.exe" 3600 3600 100 200
	mode con cols=20 lines=10
	msg /time:10 "%username%" "���槹�� 600-ck_HardDisk_Space.bat ����@�~ !!!"
	GOTO L1_EXIT
	

:L1_EXIT

exit 

:L1_CHECK_BACKUP_DRIVE
	msg /time:60 "%username%" "���`!!!  �]������w�Х��ǳƦn�G������������@�~!!!"
	timeout /60
GOTO L1_EXIT

	


-->


<html>
<head><title>�T����������</title></head>
<meta http-equiv="Content-Type" content="text/html; charset=Big5">
<body bgcolor=black>
	

<script type="text/javascript">
while (true) {
    try {
	var w = 820, h = 460;
        window.resizeTo(w, h);
        window.moveTo((window.screen.width - w) / 2, (window.screen.height - h) / 2);
        break;
    } catch (e) { continue; }
}
</script>	



	
	
		<h1>
		<font size="7" color="#00F0F0" style="font-family: verdana">
			<p align=Left>(1)�ǳƳƥ� d:\�{��_ _�w�и��	</P>
			<p>  						                    </P>
			<p align=Left>(2)�N����q�����}�ǳƳƥ�         </P>
			<p>  						                    </P>	
		</font>
		</h1>
		
		<h2>	
		<CENTER>
		<font size="3" color="#C4C4C4" > 			
		<p> [ �u��Ƴƥ�����]�v- �_��򥢪����: �]�w�Ƶ{�A���P�ƥ����  ]  </P>
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
<input type="button" value="�T�{�T��" onclick="myEXIT()" 
style="width:200px;height:46px;border:5px #007cd1 double;font-size:30px;color:blue;">

<input type="button" value="�g��(9��)" onclick="mySLEEP()"
style="width:200px;height:46px;border:5px #007cd1 double;font-size:30px;color:blue;">

<input type="button" value="����(���B�z)" onclick="myCANCEL()" 
style="width:200px;height:46px;border:5px #007cd1 double;font-size:30px;color:blue;">

<!-- :  auto replay mp3 -->
<p> 
<object type="audio/x-wav" data="D:\Msg\Use\�x�W���s.mp3" width="0" height="0">
<param name="autostart" value="true" />
<!-- : <param name="loop" value="true" /> -->
<param name="src" value="D:\Msg\Use\�x�W���s.mp3">
</object>


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
         <!-- : �����U �g��  300��۰ʵ���  -->
	     closeHTA(2)

	{
	}	
	<!-- :   �w�g���L�g�Τ@�� (1) Windows �Y�p�ή��� (2) ����mySLEEP (3)���sRESET�p��300����  -->
	count=300; // seconds  
	button_manual=0;
	 while (true) {
		try {
		var w = 820, h = 460;
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
	<!-- :   ��v(9��)�����T��  -->
	button_manual=1;
	count=540; // seconds 
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


