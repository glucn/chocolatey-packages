$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-489.0.0-windows-x86_64.zip'
$checksum64   = '87A35FE9B7237C5F60A2B029B8F36020EA890B17EC2F926D4C33FE3B0EF59676'
$url32        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-489.0.0-windows-x86.zip'
$checksum32   = 'C2CCF35DF748E1A678D6254A8F91AF19E6C4583C07186F61B704120CE258270F'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = $url32
  url64bit       = $url64
  checksum       = $checksum32
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyPath -Path "$($toolsDir)\google-cloud-sdk\bin"
