@echo.
@echo           -----------------------------------------
@echo            本命令将自动为“本地连接”填写以下内容:
@echo               IP地址：192.168.1.118
@echo               网关：  192.168.1.1
@echo               DNS:    202.96.128.86
@echo           -----------------------------------------
@echo. 
@echo.
@echo 没有接入局域网的用户，开机时，系统因搜索不到IP地址，进系统的速度稍慢，请在
@echo 本地连接填上IP地址(任意)，就可加快系统的启动速度。所以本批处理仅是为单机拨
@echo 号上网的用户准备的，局域网用户请不要理会本批处理，乱改可能导致您上不了网。
@echo.
@echo.
@ pause
@echo off
netsh interface ip set address name="本地连接" source=static addr=192.168.1.118 mask=255.255.255.0 gateway=192.168.1.1 1
netsh interface ip set dns name="本地连接" source=static addr=202.96.128.86