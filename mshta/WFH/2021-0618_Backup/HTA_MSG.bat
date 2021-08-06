<!-- :
@echo off
start /min "" mshta.exe "%~f0"

exit /b
-->


<html>
<head>
<hta:application 
APPLICATIONNAME = "Program ALERT"
ID = "Program ALERT"
BORDERSTYLE = "Normal"
CAPTION = "No"
CONTEXTMENU = "No"
INNERBORDER = "No"
MAXIMIZEBUTTON = "No"
MINIMIZEBUTTON = "No"
NAVIGABLE = "No"
SCROLL = "No"
SCROLLFLAT = "No"
SELECTION = "No"
SHOWINTASKBAR = "No"
SINGLEINSTANCE = "Yes"
SYSMENU = "No"/> <STYLE>
html, body {
background color: #000
 
 font-size: 90%;
 line-height: 2.1em;
 margin: 10;
 padding: 0;
}
h1 {font-family: Arial;
 color: #007cd1;
 font-size: 3em;
 text-transform: uppercase;
 text-align: center;
}
h2 {font-family: Arial;
 color: #fff;
 font-size: 1.5em;
 text-transform: uppercase;
 text-align: left;
}
h3 
{font-family: Arial;
 color: #666;
 font-size: 1em;
 text-transform: uppercase;
 text-align: center;
}
</STYLE> <script type='text/vbscript'> Sub Window_onload()
Me.ResizeTo 600,380
Me.MoveTo Screen.Width /2 - 300,Screen.Height / 2 - 300
Me.SetTimeout "Me.Close()",30000
End Sub
</script>
</head>
<body scroll="no">
<br>
		<h1>PROGRAM UPDATE!</h1>
		<h2>Your computer is about to install an important system update.<br>
		Please save and close all applications.<br>
		A system reboot might occur between 5 and 10 minutes.</h2> 
		<h3>IT DEPT - [auto close in <span id="timer"></span>secs]</h3> 
<script type="text/javascript">
var count=30; // seconds 
var counter=setInterval(timer, 1000); 
function timer()
{
 count=count-1;
 if (count <= 0)
 {
 clearInterval(counter);
 return;
 } document.getElementById("timer").innerHTML=count + " "; // 
}
</script>
</body>
</html>