$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-503.0.0-windows-x86_64.zip'
$checksum64   = 'CC650DF87A0406B1227AC658F4D0F350DAF2E8B52F6C50D5A429792D682BB206'
$url32        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-503.0.0-windows-x86.zip'
$checksum32   = 'E7C916C4FDA64A4C18E503D8256FA07BBEBA6179582B960F6EBE7B2D6D3B6166'

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
