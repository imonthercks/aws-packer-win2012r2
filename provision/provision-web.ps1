# Set Time Zone
Invoke-Expression "tzutil.exe /s 'Eastern Standard Time'"

# Install Chocolatey, BoxStarter and other reboot dependent dependencies
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

choco feature enable -n=allowGlobalConfirmation

cinst Boxstarter

cinst DotNet4.5

#Enable Web Services
cinst IIS-WebServerRole -source WindowsFeatures
cinst IIS-ISAPIFilter -source WindowsFeatures
cinst IIS-ISAPIExtensions -source WindowsFeatures

#Enable ASP.NET on win 2012/8
cinst IIS-NetFxExtensibility45 -source WindowsFeatures
cinst NetFx4Extended-ASPNET45 -source WindowsFeatures
cinst IIS-ASPNet45 -source WindowsFeatures

#Install the applicable Windows Updates for the above installed packages
#Install-WindowsUpdate -getUpdatesFromMS -acceptEula