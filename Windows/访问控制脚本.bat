
@echo off


title ��ȫ���ʿ���
netsh advfirewall set allprofiles state on
:fhq


cls
color a
echo =========================
echo         �˵�
echo   1.���÷��ʿ��ƵĶ˿�
echo   2.��ʽ������ǽ����
echo   3.�رշ���ǽ
ECHO   4.���ð������˿�
ECHO   5.�˳�����
ECHO   �ó�����Ҫ����ԱȨ������
echo =========================


set /p fhq=������ѡ�
if "%fhq%"=="1" goto a
if "%fhq%"=="2" goto b
if "%fhq%"=="3" goto c
if "%fhq%"=="4" goto d
IF "%fhq%"=="5" GOTO e


echo ��������ȷ��ѡ��1.2.3�����������������
pause
goto   fhq


:a
set /p kz= ����Ҫ�����ʿ��ƵĶ˿ڣ�
netsh advfirewall firewall add rule name=%kz% dir=in protocol=tcp localport=%kz% action=block
pause
echo �Ѿ��Ըö˿����˷��ʿ���!!
ECHO ����������ز˵�.
goto fhq


:b
 netsh advfirewall reset
 echo �Ѿ�Ĭ�ϻָ�������ã����������÷��ʿ��ƶ˿ڣ�
 ECHO ���ⰴ�����أ�����
 pause
 goto fhq


 :c
 netsh advfirewall set allprofiles state OFF
 ECHO �Ѿ��ر��˷���ǽ����
 ECHO ���������
 PAUSE
 GOTO fhq
 :d
 set /p bmd= ����������Ķ˿ڣ�
 netsh advfirewall firewall add rule name=baidujingyan dir=in action=allow protocol=TCP localport=%bmd% 
pause
echo �Ѿ��Ըö˿����˰���������!!
echo ����������ز˵�
goto fhq
 :e
 exit