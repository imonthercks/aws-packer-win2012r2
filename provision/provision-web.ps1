# Ensure that Web Server and ASP.NET are installed
if (!(Get-WindowsFeature -Name Web-Server).Installed) {
    Add-WindowsFeature Web-Server
}
 
if (!(Get-WindowsFeature -Name Web-Asp-Net45).Installed) {
    Add-WindowsFeature Web-Asp-Net45
}
 
# Start the web server
Start-Service w3svc
