@ ECHO OFF
@ ECHO.
@ ECHO.                             说   明
@ ECHO -----------------------------------------------------------------------------
@ ECHO NTFS是一种非常先进而稳定的磁盘格式。该格式能存放大于4G的单个文件(如电影文件),
@ ECHO 并可对文件夹进行加密,而且磁盘读写速度明显比FAT32格式更快更稳定，但是通过此程序
@ ECHO 转换得来的NTFS格式并非原生NTFS格式，而且在纯DOS下需要使用工具进行访问。通常大
@ ECHO 家不会把巨型文件或重要文件放C盘。建议：C盘不转换，仍用FAT32格式，以便需要时
@ ECHO 可以进DOS维护系统。
@ ECHO -----------------------------------------------------------------------------
@ ECHO.
pause
convert c:/fs:ntfs
