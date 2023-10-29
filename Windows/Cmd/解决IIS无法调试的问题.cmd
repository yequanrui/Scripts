cd %windir%/system32/inetsrv
msdtc -resetlog
rundll32 wamreg.dll, CreateIISPackage
regsvr32 asptxn.dll


;网友提供。是否有效需要您亲自测试。
;由于这个批处理必须要在装了IIS之后才能使用，所以系统安装时，它没被运行！请先装了IIS，再运行本批处理。
;装IIS需要插XP源盘，就是这样的。不要把这个也当成问题哦！
;电脑公司特别版集成的迅雷界面中的“垃圾箱”内有IIS独立安装包的下载链接。所以您也不用找XP源盘了！
