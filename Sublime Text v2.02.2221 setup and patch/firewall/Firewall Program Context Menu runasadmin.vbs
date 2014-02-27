On Error Resume Next
Dim WshShell, objFSO, Stream, Shell, Folder, File
Set WshShell = WScript.CreateObject("WScript.Shell")
Set objFSO = Wscript.CreateObject("Scripting.FileSystemObject")
SourcePath = objFSO.GetParentFolderName(WScript.ScriptFullName)
WinDir = WshShell.ExpandEnvironmentStrings("%SystemRoot%")
Temp = WshShell.ExpandEnvironmentStrings("%temp%")
wfai = "%SystemRoot%\system32\FirewallControlPanel.dll"
wfmsc = "mmc.exe %SystemRoot%\System32\wf.msc"
fpa = """%SystemRoot%\firewall program allow.bat"""
fpb = """%SystemRoot%\firewall program block.bat"""
Const TristateFalse = 0
Const frwlalwbat = "firewall program allow.bat"
Const alwfrwlbat = "firewall allow program.bat"
Const frwlblkbat = "firewall program block.bat"
Const blkfrwlbat = "firewall block program.bat"
Const addrunasreg = "add vbs runasadmin.reg"
Const frwlprgmrunas = "firewall program runasadmin.bat"

Message = InputBox("Enter apply to install or enter remove to uninstall" & chr(13) & "     firewall program script with windows" & _
         " firewall" & chr(13) & "     extended context menus (shift+rightclick)" & chr(13) & "" & chr(13) & "Enter runas to" & _
         " write add vbs runasadmin registry file," & chr(13) & "     write context menu registry values and restart" & chr(13) & _
         "     this firewall program script as administrator" & chr(13) & "" & chr(13) & "Enter about or info for more information", _
         "Install Or Uninstall Firewall Program Context Menu", "apply")

   If Message = "apply" Then
      Set Stream = objFSO.CreateTextFile(WinDir & "\" & frwlalwbat, True, TristateFalse)
      With Stream
         .WriteLine "@echo off"
         .WriteLine "title Firewall Program Allow"
         .WriteLine "cd /d %windir%\system32"
         .WriteLine "if not exist ""%temp%"" md ""%temp%"""
         .WriteLine "echo Dim WshShell, objFSO, Stream, Shell, Folder, File>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo Set WshShell = WScript.CreateObject(""WScript.Shell"")>>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo Set objFSO = Wscript.CreateObject(""Scripting.FileSystemObject"")>>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo Temp = WshShell.ExpandEnvironmentStrings(""%%temp%%"")>>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo FrwlApp = %1>>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo Const TristateFalse = ^0>>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo Const alwfrwlbat = ""firewall allow program.bat"">>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo Set Stream = objFSO.CreateTextFile(Temp ^& ""\"" ^& alwfrwlbat, True, TristateFalse)" & _
            ">>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo With Stream>>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo .WriteLine ""@echo off"">>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo .WriteLine ""title Firewall Allow Program"">>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo .WriteLine ""for %%%%a in ("""""" ^& FrwlApp ^& """""") do ("">>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo .WriteLine ""netsh advfirewall firewall delete rule name=""""%%%%~na""""""" & _
            ">>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo .WriteLine "")"">>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo .WriteLine ""exit"">>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo .Close>>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo End With>>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo Set Shell = CreateObject(""Shell.Application"")>>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo Set Folder = Shell.Namespace(Temp)>>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo Set File = Folder.ParseName(""firewall allow program.bat"")>>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo File.InvokeVerb(""Runas"")>>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo Set WshShell = Nothing>>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo Set objFSO = Nothing>>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo Set Stream = Nothing>>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo Set Shell = Nothing>>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo Set Folder = Nothing>>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo Set File = Nothing>>""%temp%\firewall program allow.vbs"""
         .WriteLine "echo Wscript.Quit>>""%temp%\firewall program allow.vbs"""
         .WriteLine "wscript.exe ""%temp%\firewall program allow.vbs"""
         .WriteLine "exit"
         .Close
      End With
      Set Stream = objFSO.CreateTextFile(WinDir & "\" & frwlblkbat, True, TristateFalse)
      With Stream
         .WriteLine "@echo off"
         .WriteLine "title Firewall Program Block"
         .WriteLine "cd /d %windir%\system32"
         .WriteLine "if not exist ""%temp%"" md ""%temp%"""
         .WriteLine "echo Dim WshShell, objFSO, Stream, Shell, Folder, File>""%temp%\firewall program block.vbs"""
         .WriteLine "echo Set WshShell = WScript.CreateObject(""WScript.Shell"")>>""%temp%\firewall program block.vbs"""
         .WriteLine "echo Set objFSO = Wscript.CreateObject(""Scripting.FileSystemObject"")>>""%temp%\firewall program block.vbs"""
         .WriteLine "echo Temp = WshShell.ExpandEnvironmentStrings(""%%temp%%"")>>""%temp%\firewall program block.vbs"""
         .WriteLine "echo FrwlApp = %1>>""%temp%\firewall program block.vbs"""
         .WriteLine "echo Const TristateFalse = ^0>>""%temp%\firewall program block.vbs"""
         .WriteLine "echo Const blkfrwlbat = ""firewall block program.bat"">>""%temp%\firewall program block.vbs"""
         .WriteLine "echo Set Stream = objFSO.CreateTextFile(Temp ^& ""\"" ^& blkfrwlbat, True, TristateFalse)" & _
            ">>""%temp%\firewall program block.vbs"""
         .WriteLine "echo With Stream>>""%temp%\firewall program block.vbs"""
         .WriteLine "echo .WriteLine ""@echo off"">>""%temp%\firewall program block.vbs"""
         .WriteLine "echo .WriteLine ""title Firewall Block Program"">>""%temp%\firewall program block.vbs"""
         .WriteLine "echo .WriteLine ""for %%%%a in ("""""" ^& FrwlApp ^& """""") do ("">>""%temp%\firewall program block.vbs"""
         .WriteLine "echo .WriteLine ""netsh advfirewall firewall add rule name=""""%%%%~na"""" dir=in action=block program=%%%%a""" & _
            ">>""%temp%\firewall program block.vbs"""
         .WriteLine "echo .WriteLine ""netsh advfirewall firewall add rule name=""""%%%%~na"""" dir=out action=block program=%%%%a""" & _
            ">>""%temp%\firewall program block.vbs"""
         .WriteLine "echo .WriteLine "")"">>""%temp%\firewall program block.vbs"""
         .WriteLine "echo .WriteLine ""exit"">>""%temp%\firewall program block.vbs"""
         .WriteLine "echo .Close>>""%temp%\firewall program block.vbs"""
         .WriteLine "echo End With>>""%temp%\firewall program block.vbs"""
         .WriteLine "echo Set Shell = CreateObject(""Shell.Application"")>>""%temp%\firewall program block.vbs"""
         .WriteLine "echo Set Folder = Shell.Namespace(Temp)>>""%temp%\firewall program block.vbs"""
         .WriteLine "echo Set File = Folder.ParseName(""firewall block program.bat"")>>""%temp%\firewall program block.vbs"""
         .WriteLine "echo File.InvokeVerb(""Runas"")>>""%temp%\firewall program block.vbs"""
         .WriteLine "echo Set WshShell = Nothing>>""%temp%\firewall program block.vbs"""
         .WriteLine "echo Set objFSO = Nothing>>""%temp%\firewall program block.vbs"""
         .WriteLine "echo Set Stream = Nothing>>""%temp%\firewall program block.vbs"""
         .WriteLine "echo Set Shell = Nothing>>""%temp%\firewall program block.vbs"""
         .WriteLine "echo Set Folder = Nothing>>""%temp%\firewall program block.vbs"""
         .WriteLine "echo Set File = Nothing>>""%temp%\firewall program block.vbs"""
         .WriteLine "echo Wscript.Quit>>""%temp%\firewall program block.vbs"""
         .WriteLine "wscript.exe ""%temp%\firewall program block.vbs"""
         .WriteLine "exit"
         .Close
      End With
      WshShell.RegWrite "HKCR\Directory\Background\shell\Windows Firewall Advanced\", "Windows Firewall Advanced", "REG_SZ"
      WshShell.RegWrite "HKCR\Directory\Background\shell\Windows Firewall Advanced\Extended", "", "REG_SZ"
      WshShell.RegWrite "HKCR\Directory\Background\shell\Windows Firewall Advanced\Icon", wfai & ",-1", "REG_EXPAND_SZ"
      WshShell.RegWrite "HKCR\Directory\Background\shell\Windows Firewall Advanced\command\", wfmsc, "REG_EXPAND_SZ"
      WshShell.RegWrite "HKCR\exefile\shell\Firewall Program Allow\Extended", "", "REG_SZ"
      WshShell.RegWrite "HKCR\exefile\shell\Firewall Program Allow\Icon", wfai & ",-1800", "REG_EXPAND_SZ"
      WshShell.RegWrite "HKCR\exefile\shell\Firewall Program Allow\command\", fpa & " ""%1""", "REG_EXPAND_SZ"
      WshShell.RegWrite "HKCR\exefile\shell\Firewall Program Block\Extended", "", "REG_SZ"
      WshShell.RegWrite "HKCR\exefile\shell\Firewall Program Block\Icon", wfai & ",-1800", "REG_EXPAND_SZ"
      WshShell.RegWrite "HKCR\exefile\shell\Firewall Program Block\command\", fpb & " ""%1""", "REG_EXPAND_SZ"
      WshShell.RegWrite "HKCR\exefile\shell\Windows Firewall Advanced\", "Windows Firewall Advanced", "REG_SZ"
      WshShell.RegWrite "HKCR\exefile\shell\Windows Firewall Advanced\Extended", "", "REG_SZ"
      WshShell.RegWrite "HKCR\exefile\shell\Windows Firewall Advanced\Icon", wfai & ",-1", "REG_EXPAND_SZ"
      WshShell.RegWrite "HKCR\exefile\shell\Windows Firewall Advanced\command\", wfmsc, "REG_EXPAND_SZ"
      WshShell.RegWrite "HKCR\LibraryFolder\Background\shell\Windows Firewall Advanced\", "Windows Firewall Advanced", "REG_SZ"
      WshShell.RegWrite "HKCR\LibraryFolder\Background\shell\Windows Firewall Advanced\Extended", "", "REG_SZ"
      WshShell.RegWrite "HKCR\LibraryFolder\Background\shell\Windows Firewall Advanced\Icon", wfai & ",-1", "REG_EXPAND_SZ"
      WshShell.RegWrite "HKCR\LibraryFolder\Background\shell\Windows Firewall Advanced\command\", wfmsc, "REG_EXPAND_SZ"
   End If

   If Message = "remove" Then
      If objFSO.FileExists(WinDir & "\firewall program allow.bat") Then
         objFSO.DeleteFile WinDir & "\firewall program allow.bat", True
      End If
      If objFSO.FileExists(WinDir & "\firewall program block.bat") Then
         objFSO.DeleteFile WinDir & "\firewall program block.bat", True
      End If
      If objFSO.FileExists(Temp & "\firewall allow program.bat") Then
         objFSO.DeleteFile Temp & "\firewall allow program.bat", True
      End If
      If objFSO.FileExists(Temp & "\firewall block program.bat") Then
         objFSO.DeleteFile Temp & "\firewall block program.bat", True
      End If
      If objFSO.FileExists(Temp & "\firewall program allow.vbs") Then
         objFSO.DeleteFile Temp & "\firewall program allow.vbs", True
      End If
      If objFSO.FileExists(Temp & "\firewall program block.vbs") Then
         objFSO.DeleteFile Temp & "\firewall program block.vbs", True
      End If
      WshShell.RegDelete "HKCR\Directory\Background\shell\Windows Firewall Advanced\command\"
      WshShell.RegDelete "HKCR\Directory\Background\shell\Windows Firewall Advanced\"
      WshShell.RegDelete "HKCR\exefile\shell\Firewall Program Allow\command\"
      WshShell.RegDelete "HKCR\exefile\shell\Firewall Program Allow\"
      WshShell.RegDelete "HKCR\exefile\shell\Firewall Program Block\command\"
      WshShell.RegDelete "HKCR\exefile\shell\Firewall Program Block\"
      WshShell.RegDelete "HKCR\exefile\shell\Windows Firewall Advanced\command\"
      WshShell.RegDelete "HKCR\exefile\shell\Windows Firewall Advanced\"
      WshShell.RegDelete "HKCR\LibraryFolder\Background\shell\Windows Firewall Advanced\command\"
      WshShell.RegDelete "HKCR\LibraryFolder\Background\shell\Windows Firewall Advanced\"
   End If

   If Message = "runas" Then
      Set Stream = objFSO.CreateTextFile(SourcePath & "\" & addrunasreg, True, TristateFalse)
      With Stream
         .WriteLine "Windows Registry Editor Version 5.00"
         .WriteLine ""
         .WriteLine "[HKEY_CLASSES_ROOT\VBSFile\Shell\runas]"
         .WriteLine """HasLUAShield""="""""
         .WriteLine ""
         .WriteLine "[HKEY_CLASSES_ROOT\VBSFile\Shell\runas\command]"
         .WriteLine "@=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\"
         .WriteLine "00,5c,00,53,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,57,00,53,00,\"
         .WriteLine "63,00,72,00,69,00,70,00,74,00,2e,00,65,00,78,00,65,00,20,00,22,00,25,00,31,\"
         .WriteLine "00,22,00,20,00,25,00,2a,00,00,00"
         .WriteLine ""
         .Close
      End With
      If not objFSO.FolderExists(Temp) Then
         objFSO.CreateFolder Temp
      End If
      Set Stream = objFSO.CreateTextFile(Temp & "\" & frwlprgmrunas, True, TristateFalse)
      With Stream
         .WriteLine "@echo off"
         .WriteLine "title Firewall Program RunAsAdmin"
         .WriteLine "cd /d %windir%\system32"
         .WriteLine "reg add ""HKCR\VBSFile\Shell\runas"" /v HasLUAShield /f>nul"
         .WriteLine "reg add ""HKCR\VBSFile\Shell\runas\command"" /t REG_EXPAND_SZ /d " _
            & """%%SystemRoot%%\System32\WScript.exe \""%%1\"" %%*"" /f>nul"
         .WriteLine "start ""FPCM"" /d " & "%windir%\system32 " & "Wscript.exe " & """" & SourcePath & _
            "\Firewall Program Context Menu runasadmin.vbs" & """"
         .WriteLine "exit"
         .Close
      End With
      Set Shell = CreateObject("Shell.Application")
      Set Folder = Shell.Namespace(Temp)
      Set File = Folder.ParseName(frwlprgmrunas)
      File.InvokeVerb("Runas")
      Wscript.Sleep 500
      If objFSO.FileExists(Temp & "\" & frwlprgmrunas) Then
         objFSO.DeleteFile Temp & "\" & frwlprgmrunas, True
      End If
   End If

   If Message = "about" Then
      MsgBox "                Firewall Program" & chr(13) & "      add or remove context menu" & chr(13) & "" & chr(13) & _
             "              script by 1n0n1m0s" & chr(13) & "                   Dec 14, 2012", 0, "About Firewall Program"
      WshShell.Run "Wscript.exe " & """" & SourcePath & "\Firewall Program Context Menu runasadmin.vbs" & """"
   End If

   If Message = "info" Then
      MsgBox "this vbscript will install or uninstall context menu network management for executable files through windows" & _
      " firewall rules.  it is necessary to run the vbscript installer as an administrator, context menu 'Run as administrator'" & _
      " registry settings are readily available.  allow will delete the program from windows firewall, block will add the program" & _
      " to windows firewall." & chr(13) & "" & chr(13) & "the vbs installer will write 'firewall program allow.bat' and 'firewall" & _
      " program block.bat' files to the 'c:\windows' folder, those files will write two more files to the windows '%temp%' folder" & _
      " when they are used: 'firewall program allow.vbs' and 'firewall program block.vbs'.  those temporary folder vbscript files" & _
      " finally write 'firewall allow program.bat' and 'firewall block program.bat' and run the batch scripts through their context" & _
      " menu option 'Run as administrator'.  the final temporary folder batch scripts use 'netsh advfirewall firewall add' or" & _
      " 'netsh advfirewall firewall delete' to apply firewall rules for the selected program.", 0, "Firewall Program Information"
      WshShell.Run "Wscript.exe " & """" & SourcePath & "\Firewall Program Context Menu runasadmin.vbs" & """"
   End If

Set WshShell = Nothing
Set objFSO = Nothing
Set Stream = Nothing
Set Shell = Nothing
Set Folder = Nothing
Set File = Nothing
Wscript.Quit
