set fs  = CreateObject("Scripting.FileSystemObject")
set ws = WScript.CreateObject("WScript.Shell" )
set arg = Wscript.Arguments
linkFile = arg(0)
strDesktop = ws.SpecialFolders("AllUsersDesktop" )
set oShellLink = ws.CreateShortcut(linkfile)
oShellLink.TargetPath = fs.BuildPath(ws.CurrentDirectory, arg(1))
oShellLink.WindowStyle = 1
oShellLink.IconLocation = fs.BuildPath(ws.CurrentDirectory, arg(2))
oShellLink.Description = "Shortcut Script"
oShellLink.WorkingDirectory = ws.CurrentDirectory
oShellLink.Save 
