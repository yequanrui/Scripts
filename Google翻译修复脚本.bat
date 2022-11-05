:: Copyright (c)2022 https://bookfere.com
:: This is a batch script for fixing Google Translate and making it available
:: in the Chinese mainland. If you experience any problem, visit the page below:
:: https://bookfere.com/post/1020.html

@setlocal enabledelayedexpansion
@echo off

set "source_domain=google.cn"
set "target_domain=translate.googleapis.com"

set "hosts_file=C:\Windows\System32\drivers\etc\hosts"

for /f "skip=4 tokens=2" %%a in ('"nslookup %source_domain% 2>NUL"') do set ip=%%a
set "old_rule=null"
set "new_rule=%ip% %target_domain%"

for /f "tokens=*" %%i in ('type %hosts_file%') do (
    set "line=%%i"
    :: Retrieve the rule If the target domain has been exists in the line.
    if not "!line:%target_domain%=!"=="%%i" set "old_rule=%%i"
)

if not "%old_rule%"=="null" (
    if not "%old_rule%"=="%new_rule%" (
        echo Deleting the rule "%old_rule%"
        echo Adding the rule "%new_rule%"
        for /f "tokens=*" %%i in ('type "%hosts_file%" ^| find /v /n "" ^& break ^> "%hosts_file%"') do (
            set "rule=%%i"
            set "rule=!rule:*]=!"
            if "%old_rule%"=="!rule!" set "rule=%new_rule%"
            >>%hosts_file% echo(!rule!
        )
    ) else (
        echo The rule already exists, nothing to do.
    )
) else (
    echo Adding the rule "%new_rule%"
    echo.>>%hosts_file%
    echo.>>%hosts_file%
    echo # Fix Google Translate CN>>%hosts_file%
    echo %new_rule%>>%hosts_file%
)

echo Done.
pause
