$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-495.0.0-windows-x86_64.zip'
$checksum64   = '148D33E4A4887FFAA1022159025E6E2DC0ED2A76DFE3AEBD8047AD0AD8F98AF3'
$url32        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-495.0.0-windows-x86.zip'
$checksum32   = 'FB604260B85138CBEACF22457581B3C830FB96748368FD6B5699781B1BDB05B7'

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
