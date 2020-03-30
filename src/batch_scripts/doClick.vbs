Set objShell = WScript.CreateObject("Wscript.Shell")
set objFSO = WScript.CreateObject("scripting.Filesystemobject")
objShell.Run objFSO.BuildPath(Wscript.Arguments(0), Wscript.Arguments(1))
Set objShell = Nothing