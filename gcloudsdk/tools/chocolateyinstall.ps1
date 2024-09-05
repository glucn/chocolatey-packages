$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-491.0.0-windows-x86_64.zip'
$checksum64   = '2DF9654E5886220D5308663D7175C88A1EF75C3DBEA6EE635914139E153ADA0B'
$url32        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-491.0.0-windows-x86.zip'
$checksum32   = '9F1FC5EEC20A9BD813193957DDF935CD341A48D67EEFD5E3AB250DD38B0A3817'

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
