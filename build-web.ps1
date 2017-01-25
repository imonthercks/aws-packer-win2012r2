Param(
	[string]$region = "us-east-1",
	[int]$revision = 1
)

Set-DefaultAWSRegion -Region $region

$osImage = .\aws\getWin2012R2x64Image.ps1
$base_ami_name = $osImage.Name + "_base_*"

Write-Host "Looking for existing private AMI with name: $base_ami_name"

$existingImages = @(Get-EC2Image -Owner self -Filter @{ Name="name"; Values="$base_ami_name"}) | Sort-Object CreationDate -Descending

if (!$existingImages){ 
	Write-Host "The following base image does not exist: $base_ami_name"
	exit
}
$startingImage = $existingImages[0]
$new_ami_id = $startingImage.ImageId
$new_ami_name = $image.Name + "_base_" + $revision

packer build -var "ami_id=$new_ami_id" -var "ami_name=$new_ami_name" "web.json"