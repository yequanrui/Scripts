@echo off
PUSHD %~DP0 & cd /d "%~dp0"
%1 %2
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :runas","","runas",1)(window.close)&goto :eof

:runas
CHCP 65001
@echo hosts默认目录为：
SET hosts=C:\Windows\System32\drivers\etc\hosts

if exist %hosts% goto hosts
goto nofile

:hosts
@xcopy %hosts% %hosts%_bak\ /d /c /i /y
@echo hosts文件已备份，备份目录为%hosts%_bak
@echo 64.233.189.191 translate.googleapis.com >>%hosts%
@echo 64.233.189.191 translate.google.com >>%hosts%
@echo 刷新DNS解析缓存
ipconfig /flushdns
echo hosts文件已修改，请按任意键退出
@pause > nul
@exit

:nofile
set /p a= 请输入hosts地址（例如：C:\Windows\System32\drivers\etc）:
@xcopy %a%\hosts %a%\hosts_bak\ /d /c /i /y
@echo HOSTS文件已备份，hosts文件已备份，备份目录为%a%\hosts_bak
@echo 64.233.189.191 translate.googleapis.com >>%a%\hosts
@echo 64.233.189.191 translate.google.com >>%a%\hosts
@echo 刷新DNS解析存
ipconfig /flushdns
echo hosts文件已修改，请按任意键退出
@pause > nul
@exit
