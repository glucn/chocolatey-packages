$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-499.0.0-windows-x86_64.zip'
$checksum64   = 'B6C42C0A34D08ED3AA09DBCF1BB05BE57571A8F068A22FDCF908F959A631E225'
$url32        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-499.0.0-windows-x86.zip'
$checksum32   = 'E423C6BA647EB3D33109416611A2F339C2608F2F2C63F51BB26EDB7C4F269CB6'

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
