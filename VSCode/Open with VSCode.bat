@echo off

title VSCode�Ҽ��˵����ù���
setlocal enabledelayedexpansion

set SourceFile=Code.exe

if exist !cd!\!SourceFile! (
  echo 1.��װ�Ҽ��˵�
  echo 2.ж���Ҽ��˵�
  echo 0.�˳�
  echo=

  :start
  set /p u=���������ֲ���Enterȷ��:

  IF !u!==1 (
    @echo off

    reg add>nul 2>nul "HKEY_CLASSES_ROOT\*\shell\VSCode" /d "Open with VSCode" /t "REG_EXPAND_SZ" /f
    reg add>nul 2>nul "HKEY_CLASSES_ROOT\*\shell\VSCode" /v "Icon" /d "!cd!\!SourceFile!" /t "REG_EXPAND_SZ" /f
    reg add>nul 2>nul "HKEY_CLASSES_ROOT\*\shell\VSCode\command" /d "\"!cd!\!SourceFile!\" \"%%1\"" /t "REG_EXPAND_SZ" /f

    reg add>nul 2>nul "HKEY_CLASSES_ROOT\directory\background\shell\VSCode" /d "Open with VSCode" /t "REG_EXPAND_SZ" /f
    reg add>nul 2>nul "HKEY_CLASSES_ROOT\directory\background\shell\VSCode" /v "Icon" /d "!cd!\!SourceFile!" /t "REG_EXPAND_SZ" /f
    reg add>nul 2>nul "HKEY_CLASSES_ROOT\directory\background\shell\VSCode\command"  /d "\"!cd!\!SourceFile!\" \"%%V\"" /t "REG_EXPAND_SZ" /f

    reg add>nul 2>nul "HKEY_CLASSES_ROOT\directory\shell\VSCode" /d "Open with VSCode" /t "REG_EXPAND_SZ" /f
    reg add>nul 2>nul "HKEY_CLASSES_ROOT\directory\shell\VSCode" /v "Icon" /d "!cd!\!SourceFile!" /t "REG_EXPAND_SZ" /f
    reg add>nul 2>nul "HKEY_CLASSES_ROOT\directory\shell\VSCode\command" /d "\"!cd!\!SourceFile!\" \"%%V\"" /t "REG_EXPAND_SZ" /f

    set u=<nul
    echo=
    echo ��װ�ɹ�
    goto start
  ) ELSE IF !u!==2 (
    @echo off

    reg delete>nul 2>nul "HKEY_CLASSES_ROOT\*\shell\VSCode" /f
    reg delete>nul 2>nul "HKEY_CLASSES_ROOT\directory\background\shell\VSCode" /f
    reg delete>nul 2>nul "HKEY_CLASSES_ROOT\directory\shell\VSCode" /f

    set u=<nul
    echo=
    echo ж�سɹ�
    goto start
  ) ELSE IF !u!==0 (
    exit
  ) ELSE (
    goto start
  )
) else (
  set /p=��Ѹýű�������!SourceFile!����Ŀ¼������...<nul&pause;>nul
)
endlocal