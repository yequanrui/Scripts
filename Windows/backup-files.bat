@echo off
REM 声明采用UTF-8编码
chcp 65001
set backupcmd=xcopy /s /c /d /e /h /i /r /y
set backupdir=".\backup"
echo off
%backupcmd% "%SystemDrive%\Microsoft\Windows" %backupdir%
%backupcmd% "%SystemRoot%\System32\drivers\etc" %backupdir%
%backupcmd% "%ProgramData%\Microsoft\Windows" %backupdir%
%backupcmd% "%ProgramFiles%\Common Files\System" %backupdir%
%backupcmd% "%ProgramFiles(x86)%\Common Files\System" %backupdir%
%backupcmd% "%USERPROFILE%\Desktop" %backupdir%
%backupcmd% "%APPDATA%\Microsoft\Windows\AccountPictures" %backupdir%
%backupcmd% "%LOCALAPPDATA%\Microsoft\Windows\Themes" %backupdir%
@echo off
exit
