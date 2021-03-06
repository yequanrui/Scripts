@ ECHO OFF
@ ECHO.
@ ECHO.                            说      明
@ ECHO --------------------------------------------------------------------
@ ECHO 本批处理执行后，将作以下一些设置：
@ ECHO 1、允许SAM帐户和共享的匿名枚举(原版系统允许，本系统默认是禁用)。
@ ECHO 2、本机帐户若空密码，允许其它机访问本机。
@ ECHO 3、Windows防火墙：允许文件和打印机共享。
@ ECHO 4、共享方式：本地用户以自己的身份验证。
@ ECHO 5、来宾帐户：不启用。
@ ECHO --------------------------------------------------------------------
@ ECHO.
@ ECHO 采用这种共享方式，访问本机时必须要输入正确的用户名和密码，才能访问。
@ ECHO.
@ ECHO 无论采用哪一种共享方式，共享只是方便内部使用，在用路由器上网的场合，
@ ECHO 外网不能访问到您的机，无需担心共享了就会被入侵。您只需记住，单机拨号
@ ECHO 上网时，不要打开共享就可以了。
@ ECHO --------------------------------------------------------------------
@ ECHO.
PAUSE
regedit /s 开通局域网共享(访问本机要填用户名和密码).reg
net user Guest /active:no
cls
@ ECHO.
@ ECHO -------------------------------------------------------------------
@ ECHO 操作完成。
@ ECHO 无需重启，其它机现在就可以访问本机了。
@ ECHO.
@ ECHO 硬盘各分区的默认共享仍未打开。如需要打开，
@ ECHO 请到本目录找到注册表文件，双击导入即可。
@ ECHO -------------------------------------------------------------------
@ ECHO.
@ ECHO 常见疑问：
@ ECHO    经上述处理后，访问本机，如果仍然是直接就进去了，没出现提示输入帐
@ ECHO 号和密码的对话框，那是因为其他电脑的帐户名称跟本机帐户名一样(比如双
@ ECHO 方都是administrator)，且本机无密码。您应该把本机帐户改名，或加密码。
@ ECHO 这样，未经授权的用户就不能随意访问您共享的资源了。
@ ECHO -------------------------------------------------------------------
PAUSE

;《GhostXP_SP2电脑公司特别版》作者编。