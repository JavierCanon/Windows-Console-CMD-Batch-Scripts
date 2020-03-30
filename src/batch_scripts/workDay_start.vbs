'* purpose:		create file to capture date/time info
'* author:		Paul Roberts updated by adamActual 20170614
'* notes:		this file is called from a batch file -> workDay_start.bat
'*
Dim fso 
Dim txtStream 
Set fso = CreateObject("Scripting.FileSystemObject")
set txtStream = fso.OpenTextFile("activity_log.txt", 8)
txtStream.WriteLine FormatDateTime(DateAdd("n",-5,Now), 0)' & vbCrLf & "hello world"
txtStream.Close