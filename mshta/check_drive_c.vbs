WScript.Echo ReportDriveStatus("C") 


Function ReportDriveStatus(drv)
   Dim fso, msg
   Set fso = CreateObject("Scripting.FileSystemObject")
   If fso.DriveExists(drv) Then
      msg = ("Drive " & UCase(drv) & " exists.")
   Else
      msg = ("Drive " & UCase(drv) & " doesn't exist.")
   End If
   ReportDriveStatus = msg
End Function