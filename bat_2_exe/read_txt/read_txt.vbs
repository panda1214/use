' run cmd 
' wscript read_txt.vbs Daily_rebort.log


 '檢查是否有輸入參數
if WScript.Arguments.Count = 0 then 
   WScript.Echo "Missing parameters & return errorlevel 1"
   WScript.Quit 1
   'return 1 means error
end if 
'''WScript.Echo Wscript.Arguments.Item(0) 

Dim strPath,strText
strPath =  Wscript.Arguments.Item(0) 
'呼叫函式
Call CreateFile(strPath)
  
Sub CreateFile(strPath)
  Dim objFso,objStream,str
  '建立FileSystemObject物件
  Set objFso = CreateObject ("Scripting.FileSystemObject")
  '以只讀的方式開啟檔案，如果檔案不存在則建立它
  Set objStream = objFso.OpenTextFile(strPath,1,true)
  '如果當前的指標不在行末，則讀取文字內容
  'Do While objStream.AtEndOfLine <> true
  '  str = str + objStream.Read(1)
  'Loop
  'msgbox str
  str = ""
  Set objStream = objFso.OpenTextFile(strPath,1,true)
  '如果當前的指標不在文字末端，則讀取文字內容
  Do While objStream.AtEndOfStream <> true
    str = str + objStream.Read(1)
  Loop
  MsgBox str
  '關閉TextStream物件
  objStream.Close
End Sub