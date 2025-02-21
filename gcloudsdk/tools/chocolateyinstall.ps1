$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-511.0.0-windows-x86_64.zip'
$checksum64 = '44003CF9812E9CEFCEA7D9FC8D2F5BE862749FE606115A8E034CC46867FA6AD7'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-511.0.0-windows-x86.zip'
$checksum32 = '21E47FB0196523477275BC334475167445E9E0482CBED6F9FBFC9F5640D14520'

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
