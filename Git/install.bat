@echo off
title Gitһ����Ĭ��װ�ű�
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

@REM �Զ������ύ�û�����email��Ĭ��QQ���䣬����������û��������������и���
"C:\Program Files\Git\cmd\git.exe" config --global user.name "%username%"
"C:\Program Files\Git\cmd\git.exe" config --global user.email "%username%@qq.com"

@REM ��Կ��������
choice /t 10 /d N /m "�Ƿ���Ҫ����Git��Կ����Կ[Y/N]��10���Ĭ�ϲ�����" /n
if %errorlevel% == 1 (
echo �������Ҫ����˽Կ���룬���������λس�����
"C:\Program Files\Git\usr\bin\ssh-keygen.exe" -f "%USERPROFILE%\.ssh\id_rsa" -C %username%
echo ��Կ������ϡ�
start "" %USERPROFILE%\.ssh
)
timeout 5
exit

:x86
@REM �����������Ҫͬ�������������������
echo.���ڰ�װGit(32λ)...
"Git-2.37.3-32-bit.exe" /VERYSILENT /SP- /loadinf=./install.inf
echo.���ڰ�װGit�ͻ���&������...
msiexec /package "TortoiseGit-2.13.0.1-32bit.msi" /quiet /norestart
msiexec /package "TortoiseGit-LanguagePack-2.13.0.0-32bit-zh_CN.msi" /quiet /norestart
goto :eof

:x64
@REM �����������Ҫͬ�������������������
echo.���ڰ�װGit(64λ)...
"Git-2.37.3-64-bit.exe" /VERYSILENT /SP- /loadinf=./install.inf
echo.���ڰ�װGit�ͻ���&������...
msiexec /package "TortoiseGit-2.13.0.1-64bit.msi" /quiet /norestart
msiexec /package "TortoiseGit-LanguagePack-2.13.0.0-64bit-zh_CN.msi" /quiet /norestart
goto :eof
