@echo off

title Notepad++右键菜单设置工具
setlocal enabledelayedexpansion

set SourceFile=notepad++.exe

if exist !cd!\!SourceFile! (
  echo 1.安装右键菜单
  echo 2.卸载右键菜单
  echo 0.退出
  echo=

  :start
  set /p u=请输入数字并按Enter确定:

  IF !u!==1 (
    @echo off

    reg add>nul 2>nul "HKEY_CLASSES_ROOT\*\shell\Open with Notepad++" /v "Icon" /d "!cd!\!SourceFile!" /t "REG_EXPAND_SZ" /f
    reg add>nul 2>nul "HKEY_CLASSES_ROOT\*\shell\Open with Notepad++\command" /d "\"!cd!\!SourceFile!\" \"%%1\"" /t "REG_EXPAND_SZ" /f

    set u=<nul
    echo=
    echo 安装成功
    goto start
  ) ELSE IF !u!==2 (
    @echo off

    reg delete>nul 2>nul "HKEY_CLASSES_ROOT\*\shell\Open with Notepad++" /f

    set u=<nul
    echo=
    echo 卸载成功
    goto start
  ) ELSE IF !u!==0 (
    exit
  ) ELSE (
    goto start
  )
) else (
  set /p=请把该脚本放置在!SourceFile!所在目录下运行...<nul&pause;>nul
)
endlocal