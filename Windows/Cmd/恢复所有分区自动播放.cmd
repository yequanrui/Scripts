@ ECHO OFF
@ ECHO.
@ ECHO.                     ��      ��      ˵       ��  
@ ECHO.
@ ECHO.                      (WWW.ANKTY.COM ͳһ����)
@ ECHO -------------------------------------------------------------------------------
@ ECHO �ر��������������Զ����Ź��ܿ��ܻ�Ϊ���Ĳ�������һЩ����,���������Ի�ԭXPĬ��
@ ECHO ���Զ����Ź���,�����������������ò����ķ�������!
@ ECHO -------------------------------------------------------------------------------
@ ECHO.
echo. & pause
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoDriveTypeAutoRun /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoDriveTypeAutoRun /t REG_DWORD /d 223 /f
cls
echo.
echo.
echo.
echo.
echo                 ��ԭ�����������Զ����ųɹ�!
echo.
echo                  WWW.ANKTY.COMлл����ʹ��!
echo. & pause


