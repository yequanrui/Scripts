@echo off
REM 声明采用UTF-8编码
chcp 65001
set copycmd=xcopy /s /c /d /e /h /i /r /y
set copyfile=".\test.txt"
echo off
%copycmd% %copyfile% "%SystemDrive%\Microsoft\Windows"
%copycmd% %copyfile% "%SystemRoot%\System32\drivers\etc"
%copycmd% %copyfile% "%ProgramData%\Microsoft\Windows"
%copycmd% %copyfile% "%ProgramFiles%\Common Files\System"
%copycmd% %copyfile% "%ProgramFiles(x86)%\Common Files\System"
%copycmd% %copyfile% "%USERPROFILE%\Desktop"
%copycmd% %copyfile% "%APPDATA%\Microsoft\Windows\AccountPictures"
%copycmd% %copyfile% "%LOCALAPPDATA%\Microsoft\Windows\Themes"
echo off
exit