@ ECHO OFF
@ ECHO.
@ ECHO.                     ��      ��      ˵       ��  
@ ECHO.
@ ECHO.                      (WWW.ANKTY.COM ͳһ����)
@ ECHO -------------------------------------------------------------------------------
@ ECHO ����кܶ��ֲ��������������Զ����Ź������⴫��,��ʱ�������Ƿ���ʤ��,��͸�Խ�,��
@ ECHO ��˵ʱ�������е��������!������������׹ر��������������Զ����Ź���,�����ʹ��!
@ ECHO -------------------------------------------------------------------------------
@ ECHO.
echo. & pause
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoDriveTypeAutoRun /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoDriveTypeAutoRun /t REG_DWORD /d 255 /f
cls
echo.
echo.
echo.
echo.
echo                 �ر������������Զ����ųɹ�!
echo.
echo                  WWW.ANKTY.COMлл����ʹ��!
echo. & pause


