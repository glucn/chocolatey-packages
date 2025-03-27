$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-516.0.0-windows-x86_64.zip'
$checksum64 = '5CF75A32A3191402394331F9A94725DFB965187E6F8FC5E9C2E3703B0F6B431F'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-516.0.0-windows-x86.zip'
$checksum32 = 'B162C0BB9395C273D781EA182A5DC2118046BFB3BBB84E565FEACD25CFC74BCD'

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
