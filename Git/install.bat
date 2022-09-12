@echo off
title Git一键静默安装脚本
mode con cols=60 lines=14
if exist "%SystemRoot%\SysWOW64" path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0
bcdedit >nul&&goto UACAdmin||goto UACPrompt

:UACPrompt
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit

:UACAdmin
echo %PROCESSOR_ARCHITECTURE%|find "64">nul&&call :x64||call :x86
reg add HKEY_CURRENT_USER\Software\TortoiseGit /v "LanguageID" /t REG_DWORD /d 2052 /f
reg add HKEY_CURRENT_USER\Software\TortoiseGit /v "MSysGit" /t REG_SZ /d "C:\Program Files\Git\bin" /f
setx HOME "%USERPROFILE%"
set HOME=%USERPROFILE%

taskkill /f /im explorer.exe >nul 2>nul
start "" explorer

@REM 自动配置提交用户名及email，默认QQ邮箱，如果用其他用户名或邮箱请自行更改
"C:\Program Files\Git\cmd\git.exe" config --global user.name "%username%"
"C:\Program Files\Git\cmd\git.exe" config --global user.email "%username%@qq.com"

@REM 公钥自助生成
choice /t 10 /d N /m "是否需要生成Git公钥及秘钥[Y/N]，10秒后默认不生成" /n
if %errorlevel% == 1 (
echo 如果不需要设置私钥密码，连续按三次回车即可
"C:\Program Files\Git\usr\bin\ssh-keygen.exe" -f "%USERPROFILE%\.ssh\id_rsa" -C %username%
echo 秘钥生成完毕。
start "" %USERPROFILE%\.ssh
)
timeout 5
exit

:x86
@REM 程序名变更需要同步变更以下引号内名字
echo.正在安装Git(32位)...
"Git-2.37.3-32-bit.exe" /VERYSILENT /SP- /loadinf=./install.inf
echo.正在安装Git客户端&汉化包...
msiexec /package "TortoiseGit-2.13.0.1-32bit.msi" /quiet /norestart
msiexec /package "TortoiseGit-LanguagePack-2.13.0.0-32bit-zh_CN.msi" /quiet /norestart
goto :eof

:x64
@REM 程序名变更需要同步变更以下引号内名字
echo.正在安装Git(64位)...
"Git-2.37.3-64-bit.exe" /VERYSILENT /SP- /loadinf=./install.inf
echo.正在安装Git客户端&汉化包...
msiexec /package "TortoiseGit-2.13.0.1-64bit.msi" /quiet /norestart
msiexec /package "TortoiseGit-LanguagePack-2.13.0.0-64bit-zh_CN.msi" /quiet /norestart
goto :eof
