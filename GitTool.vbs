Option Explicit
On Error Resume Next

Dim intMax
Dim PathName
Dim wArray
Dim objWshShell     ' WshShell オブジェクト

Set objWshShell = WScript.CreateObject("WScript.Shell")

If Err.Number = 0 Then
    PathName = objWshShell.CurrentDirectory 
    wArray=Split(PathName, "\")
    intMax=UBound(wArray)

    PathName =wArray(intMax)		

    CreateObject("WScript.Shell").Run "GitTool.bat " & PathName 	
Else
    PathName =""
End If

Set objWshShell = Nothing

