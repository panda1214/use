' run cmd 
' wscript read_txt.vbs Daily_rebort.log


 '�ˬd�O�_����J�Ѽ�
if WScript.Arguments.Count = 0 then 
   WScript.Echo "Missing parameters & return errorlevel 1"
   WScript.Quit 1
   'return 1 means error
end if 
'''WScript.Echo Wscript.Arguments.Item(0) 

Dim strPath,strText
strPath =  Wscript.Arguments.Item(0) 
'�I�s�禡
Call CreateFile(strPath)
  
Sub CreateFile(strPath)
  Dim objFso,objStream,str
  '�إ�FileSystemObject����
  Set objFso = CreateObject ("Scripting.FileSystemObject")
  '�H�uŪ���覡�}���ɮסA�p�G�ɮפ��s�b�h�إߥ�
  Set objStream = objFso.OpenTextFile(strPath,1,true)
  '�p�G��e�����Ф��b�楽�A�hŪ����r���e
  'Do While objStream.AtEndOfLine <> true
  '  str = str + objStream.Read(1)
  'Loop
  'msgbox str
  str = ""
  Set objStream = objFso.OpenTextFile(strPath,1,true)
  '�p�G��e�����Ф��b��r���ݡA�hŪ����r���e
  Do While objStream.AtEndOfStream <> true
    str = str + objStream.Read(1)
  Loop
  MsgBox str
  '����TextStream����
  objStream.Close
End Sub