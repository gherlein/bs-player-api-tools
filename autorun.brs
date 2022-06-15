mode=CreateObject("roVideoMode")
rect1 = CreateObject("roRectangle", mode.GetSafeWidth()/4, mode.GetSafeHeight()/2, 500, 40)
rect2 = CreateObject("roRectangle", mode.GetSafeWidth()/4, mode.GetSafeHeight()/2+42, 500, 40)
text1 = CreateObject("roTextWidget", rect1, 1, 1, 0)
text2 = CreateObject("roTextWidget", rect2, 2, 1, 0)
text1.Show()
text2.Show()
text1.PushString("Enabling Services")
registrySection = CreateObject("roRegistrySection", "networking")
if type(registrySection) = "roRegistrySection" then 
  registrySection.Write("http_server", "80")
  registrySection.Write("syslog", "rsyslog.herlein.me")
  registrySection.Write("ssh", "22")
  n=CreateObject("roNetworkConfiguration",0)
  n.SetLoginPassword("xt4")
  n.Apply()
endif
registrySection = CreateObject("roRegistrySection", "brightscript")
if type(registrySection) = "roRegistrySection" then 
  registrySection.Write("debug", "1")
endif
text2.PushString("Enabled. Rebooting.")
sleep(10000)
DeleteFile("autorun.brs")
RebootSystem()

