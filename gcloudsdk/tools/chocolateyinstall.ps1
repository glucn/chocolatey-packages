$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-521.0.0-windows-x86_64.zip'
$checksum64 = '63BBE7B5B93C3F407304F9794611D792055BC2704E880F485F651D07545F3496'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-521.0.0-windows-x86.zip'
$checksum32 = '7346E3325BB73A33D8A704672191559E2CECE32AD870FB43B000CB9A2E49F4F0'

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
