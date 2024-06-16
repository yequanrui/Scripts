
@echo off


title 安全访问控制
netsh advfirewall set allprofiles state on
:fhq


cls
color a
echo =========================
echo         菜单
echo   1.设置访问控制的端口
echo   2.格式化防火墙配置
echo   3.关闭防火墙
ECHO   4.设置白名单端口
ECHO   5.退出程序
ECHO   该程序需要管理员权限运行
echo =========================


set /p fhq=请输入选项：
if "%fhq%"=="1" goto a
if "%fhq%"=="2" goto b
if "%fhq%"=="3" goto c
if "%fhq%"=="4" goto d
IF "%fhq%"=="5" GOTO e


echo 请输入正确的选择【1.2.3】，按任意键继续！
pause
goto   fhq


:a
set /p kz= 输入要做访问控制的端口：
netsh advfirewall firewall add rule name=%kz% dir=in protocol=tcp localport=%kz% action=block
pause
echo 已经对该端口做了访问控制!!
ECHO 按任意键返回菜单.
goto fhq


:b
 netsh advfirewall reset
 echo 已经默认恢复最初设置，请重新设置访问控制端口，
 ECHO 任意按键返回！！！
 pause
 goto fhq


 :c
 netsh advfirewall set allprofiles state OFF
 ECHO 已经关闭了防火墙功能
 ECHO 任意键返回
 PAUSE
 GOTO fhq
 :d
 set /p bmd= 输入白名单的端口：
 netsh advfirewall firewall add rule name=baidujingyan dir=in action=allow protocol=TCP localport=%bmd% 
pause
echo 已经对该端口做了白名单处理!!
echo 按任意键返回菜单
goto fhq
 :e
 exit