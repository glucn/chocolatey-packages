$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-504.0.0-windows-x86_64.zip'
$checksum64 = '2EC75547D389566A20BB8A368A20A9746A0602777DFF5E5CD196599EED602A61'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-504.0.0-windows-x86.zip'
$checksum32 = '0A7DB375C8CC0E6B0608CFDABB6E6C3B94689A4B6F443EEB3697D8A7DD5A1379'

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
