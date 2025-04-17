$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-518.0.0-windows-x86_64.zip'
$checksum64 = '69CA0179A72F47053AB49F2F1A0F9D2F2233E28BC236A76F0DB0872B5E2FDD60'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-518.0.0-windows-x86.zip'
$checksum32 = 'F8B8970A42E77433D6CDD55C443C185FFBC78B139D685712BD2DF98AA61A9472'

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
