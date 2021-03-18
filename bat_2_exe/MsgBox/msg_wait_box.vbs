
Set objShell = CreateObject("WScript.Shell") 
x=objShell.PopUp( "Test Me", 10, "Dialog Test", vbQuestion + vbOkCancel ) 
wscript.quit X