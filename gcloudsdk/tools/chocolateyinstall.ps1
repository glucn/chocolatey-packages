$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-487.0.0-windows-x86_64.zip'
$checksum64   = '2AF1FAB9D015E6A90AD0CA5D8241A417A2793098414C26873CE874FB457D0F16'
$url32        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-487.0.0-windows-x86.zip'
$checksum32   = '3E8C497C75A38DD5818182E3881CFC0657C88432C954EAE1153E7A3F78348F86'

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
