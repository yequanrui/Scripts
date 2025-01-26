@echo off

rem 声明采用UTF-8编码
chcp 65001

title Git一键设置Git配置

echo /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo   通过此脚本可以方便设置以下内容
echo   1. Email邮箱：如果同目录下有email.ini文件则读取其内容，否则用户手动输入
echo   2. 用户名：如果同目录下有username.ini文件则读取其内容，否则用户手动输入
echo   3. 设置本地存储密码，无需每次输入
echo /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\

:hand_input_email
if exist email.ini goto auto_config_email
echo.
set /p email=请输入您的Email邮箱地址, 回车确认:
echo.
echo "您输入的邮箱地址是: %email%, 如果有误, 请重新执行此脚本"
echo.

:hand_input_username
if exist username.ini goto auto_config_username
echo.
set /p username=请输入您的用户名, 回车确认:
echo.
echo "您输入的用户名是: %username%, 如果有误, 请重新执行此脚本"
echo.

:store_password
echo.
echo /\/\/\/\/\/\/\/\/\/\/\/\
echo   密码是否存储
echo   1. 存储明文密码
echo   2. 不存储密码
echo /\/\/\/\/\/\/\/\/\/\/\/\
set /p store_pass=请输入前面的数字选择是否保存密码:

if "%store_pass%" == "2" ( set password="false" ) else ( set password=store )

rem 存储到配置文件中，以便下次执行自动配置
echo %email% >email.ini
echo %username% >username.ini

rem 通过Git命令设置配置
"C:\Program Files\Git\cmd\git.exe" config --global user.name "%username%"
"C:\Program Files\Git\cmd\git.exe" config --global user.email "%email%"
"C:\Program Files\Git\cmd\git.exe" config --global credential.helper %password%

echo.
echo.
echo 配置完成, 脚本将在5s后自动退出
echo.
echo.
ping 127.0.0.1 -n 5 >nul
exit

:auto_config_email
echo.
echo 发现邮箱配置文件, 已经自动获取邮箱地址
echo.
set /p email=<email.ini
set email=%email: =%
echo 获取的邮箱地址为: %email%
echo.
echo 如果信息有误, 请手工修改本目录下email.ini, 重新执行此脚本
echo.
goto hand_input_username

:auto_config_username
echo.
echo 发现用户名配置文件, 已经自动获取用户名
echo.
set /p username=<username.ini
set username=%username: =%
echo 获取的用户名为: %username%
echo.
echo 如果信息有误, 请手工修改本目录下username.ini, 重新执行此脚本
echo.
goto store_password