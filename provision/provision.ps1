# Set Time Zone
Invoke-Expression "tzutil.exe /s 'Eastern Standard Time'"

iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

choco feature enable -n=allowGlobalConfirmation

