@echo off
REM 声明采用UTF-8编码
chcp 65001
REM 拖动要删除的文件/文件夹到此脚本文件上
DEL /F /A /Q \\?\%1
RD /S /Q \\?\%1
