@echo off
net stop SysMain
sc config SysMain  start= disabled

net stop DusmSvc
sc config DusmSvc start= disabled

net stop autotimesvc
sc config autotimesvc start= disabled

net stop RetailDemo
sc config RetailDemo start= disabled

net stop bthserv
sc config bthserv start= disabled

net stop BTAGService
sc config BTAGService start= disabled

net stop SharedRealitySvc
sc config SharedRealitySvc start= disabled

net stop TroubleshootingSvc
sc config TroubleshootingSvc start= disabled

net stop WpcMonSvc
sc config WpcMonSvc start= disabled

net stop UsoSvc
sc config UsoSvc start= disabled

net stop SEMgrSvc
sc config SEMgrSvc start= disabled

net stop XblGameSave
sc config XblGameSave start= disabled

net stop XboxNetApiSvc
sc config XboxNetApiSvc start= disabled

net stop XblAuthManager
sc config XblAuthManager start= disabled

net stop XboxGipSvc
sc config XboxGipSvc start= disabled

net stop wisvc
sc config wisvc start= disabled

net stop icssvc
sc config icssvc start= disabled

net stop perceptionsimulation
sc config perceptionsimulation start= disabled

net stop spectrum
sc config spectrum start= disabled

net stop wuauserv
sc config wuauserv start= disabled

net stop WSearch
sc config WSearch start= disabled

net stop WalletService
sc config WalletService start= disabled

net stop LanmanServer
sc config LanmanServer start= disabled

net stop RemoteRegistry
sc config RemoteRegistry start= disabled

net stop PrintNotify
sc config PrintNotify start= disabled

net stop Spooler
sc config Spooler start= disabled

net stop PhoneSvc
sc config PhoneSvc start= disabled

net stop CscService
sc config CscService start= disabled

net stop NcbService
sc config NcbService start= disabled

net stop MsKeyboardFilter
sc config MsKeyboardFilter start= disabled

net stop edgeupdatem
sc config edgeupdatem start= disabled

net stop edgeupdate
sc config edgeupdate start= disabled

net stop HvHost
sc config HvHost start= disabled

net stop Fax
sc config Fax start= disabled

net stop MapsBroker
sc config MapsBroker start= disabled

net stop DoSvc
sc config DoSvc start= disabled

net stop DiagTrack
sc config DiagTrack start= disabled

net stop SDRSVC
sc config SDRSVC start= disabled
pause