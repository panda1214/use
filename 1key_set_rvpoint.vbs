

'CreateRestorePoint Method of the SystemRestore Class 
'Creates a restore point. Specifies the beginning and 
'the ending of a set of changes so that System Restore 
'can create a restore point.This method is the 
'scriptable equivalent of the SRSetRestorePoint function. 

Set Args = wscript.Arguments 
If Args.Count() > 0 Then 
    RpName = Args.item(0) 
Else 
    RpName = "Vbscript" 
End If 

Set obj = GetObject("winmgmts:{impersonationLevel=impersonate}!root/default:SystemRestore") 

If (obj.CreateRestorePoint("1key_set_rvpoint.vbs", 0, 100)) = 0 Then 
wscript.Echo "Success" 
Else 
    wscript.Echo "Failed" 
End If 



'Set IRP=getobject("winmgmts:\\.\root\default:Systemrestore") 
'MYRP=IRP.createrestorepoint("�@��إ��٭��I",0,100) 