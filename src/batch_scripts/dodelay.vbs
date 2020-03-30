Dim objResult
Set objShell = WScript.CreateObject("Wscript.Shell")
objResult = objShell.sendkeys("{NUMLOCK}")
WScript.sleep 200
objResult = objShell.sendkeys("{NUMLOCK}")

