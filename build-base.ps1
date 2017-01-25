Param(
	[string]$region = "us-east-1",
	[int]$revision = 1
)

Set-DefaultAWSRegion -Region $region

$image = .\aws\getWin2012R2x64Image.ps1
$ami_id = $image.ImageId
$ami_name = $image.Name + "_base_" + $revision

Write-Host "Looking for existing private AMI with name: $ami_name"

$existingImage = Get-EC2Image -Owner self -Filter @{ Name="name"; Values="$ami_name"}
if ($existingImage){ 
	Write-Host "This image already exists!"
	exit
}
packer build -var "ami_id=$ami_Id" -var "ami_name=$ami_name" "base.json"