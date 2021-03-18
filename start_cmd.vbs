
'REM start.vbs 
'REM Wscript.Arguments.Item(i)

'Wscript.echo Wscript.Arguments.Item(i)  & " /start"
set ws=wscript.CreateObject("wscript.Shell")
ws.run Wscript.Arguments.Item(i)  & " /start",0,false


