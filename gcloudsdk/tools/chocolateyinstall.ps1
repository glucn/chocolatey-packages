$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-490.0.0-windows-x86_64.zip'
$checksum64   = 'B872AEAA625803D4AE1099CEA24BB945435D64E220DEA559AA2C05191FDAAB79'
$url32        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-490.0.0-windows-x86.zip'
$checksum32   = 'E924E936754BD274B76B22B7BE4DD3E762BB9BA7973B8CB62FB598A8E77D78B0'

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
