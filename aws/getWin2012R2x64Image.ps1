$imageName = "Windows_Server-2012-R2_RTM-English-64Bit-Base-"

$accessKeyExists = Test-Path Env:\AWS_ACCESS_KEY_ID
$accessSecretExists = Test-Path Env:\AWS_SECRET_ACCESS_KEY

if (!$accessKeyExists -Or !$accessSecretExists){ 
	Write-Host "Ensure that your AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables are set"
	exit
}

Write-Host "Default Region has been set to:  $region"
Write-HOst "Searching for latest version of image: '$imageName'"
$amis = Get-EC2ImageByName -Names "$imageName*" | Sort-Object CreationDate -Descending
$latestImage = $amis[0]

return $latestImage