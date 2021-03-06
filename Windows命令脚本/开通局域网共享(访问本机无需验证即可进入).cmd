@ ECHO OFF
@ ECHO.
@ ECHO.                            说      明
@ ECHO --------------------------------------------------------------------
@ ECHO 本批处理执行后，将作以下一些设置：
@ ECHO 1、允许SAM帐户和共享的匿名枚举(原版系统允许，本系统默认是禁用)。
@ ECHO 2、本机帐户若空密码，允许其它机访问本机。
@ ECHO 3、Windows防火墙：允许文件和打印机共享。
@ ECHO 4、共享方式：本地用户以来宾身份验证。
@ ECHO 5、来宾帐户：启用。
@ ECHO --------------------------------------------------------------------
@ ECHO.
@ ECHO 采用这种共享方式，其它机访问本机都不用输用户名和密码。举例来说，家庭
@ ECHO 局域网，彼此都是可以信任的，请使用这种方式。
@ ECHO.
@ ECHO 无论采用哪一种共享方式，共享只是方便内部使用，在用路由器上网的场合，
@ ECHO 外网不能访问到您的机，无需担心共享了就会被入侵。您只需记住，单机拨号
@ ECHO 上网时，不要打开共享就可以了。
@ ECHO --------------------------------------------------------------------
@ ECHO.
PAUSE
regedit /s 开通局域网共享(访问本机无需验证即可进入).reg
net user Guest /active:yes
cls
@ ECHO.
@ ECHO --------------------------------------------------------------------
@ ECHO 操作完成。
@ ECHO 注意：本机要重启后才会生效。
@ ECHO.
@ ECHO 硬盘各分区的默认共享仍未打开。如需要打开，
@ ECHO 请到本目录找到注册表文件，双击导入即可。
@ ECHO --------------------------------------------------------------------
@ ECHO.
@ ECHO 疑难问题补充：
@ ECHO   如果以前的共享方式是“本地用户以自己自己身份验证”时共享了文件夹，
@ ECHO 则现在改为以来宾身份验证后再访问该文件夹,会弹出错误：“无法访问，您
@ ECHO 没有权限使用网络资源.”解决办法是：在该文件夹属性上把原共享取消，然
@ ECHO 后重新共享，就行了。
@ ECHO --------------------------------------------------------------------
PAUSE

;《GhostXP_SP2电脑公司特别版》作者编。