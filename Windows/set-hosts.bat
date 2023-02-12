@echo off
REM 声明采用UTF-8编码
chcp 65001
@attrib -r "%windir%\system32\drivers\etc\hosts"
@echo # host start>>"%windir%\system32\drivers\etc\hosts"
@echo 127.0.0.1 localhost>>"%windir%\system32\drivers\etc\hosts"
@echo # host end>>"%windir%\system32\drivers\etc\hosts"
@attrib +r "%windir%\system32\drivers\etc\hosts"