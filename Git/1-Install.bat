@echo off

rem 声明采用UTF-8编码
chcp 65001

title Git一键静默安装脚本
mode con cols=60 lines=14

if /i "%PROCESSOR_IDENTIFIER:~0,3%" == "X86" (
echo 当前系统为32位系统
set git_install=Git-2.47.1-64-bit.exe
set tortoiseGit_install=TortoiseGit-2.17.0.2-64bit.msi
set tortoiseGit_lang_install=TortoiseGit-LanguagePack-2.17.0.0-64bit-zh_CN.msi
) else (
echo 当前系统为64位系统
set git_install=Git-2.47.1-64-bit.exe
set tortoiseGit_install=TortoiseGit-2.17.0.2-64bit.msi
set tortoiseGit_lang_install=TortoiseGit-LanguagePack-2.17.0.0-64bit-zh_CN.msi
)

echo.
echo 开始自动安装Git, 请稍等...
.\%git_install% /VERYSILENT /SP- /LOADINF=".\install.inf"

echo.
echo Git安装完成, 开始安装TortoiseGit客户端和汉化包...(注: 如提示是否运行, 请选择允许)
.\%tortoiseGit_install% /QUIET /NORESTART
.\%tortoiseGit_lang_install% /QUIET /NORESTART

echo.
echo 安装已完成，重启资源管理器
taskkill /f /im explorer.exe >nul 2>nul
start "" explorer

echo.
echo 请检查右键菜单
echo 1. Git GUI Here
echo 2. Git Bash Here
echo 3. TortoiseGit
echo 是否存在
echo.

echo.
echo 脚本5s后自动启动windows配置脚本
ping 127.0.0.1 -n 5>null
call "2-Config.bat"
echo 脚本将在5s后自动退出
ping 127.0.0.1 -n 5>null
exit
pause >null