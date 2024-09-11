$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-492.0.0-windows-x86_64.zip'
$checksum64   = '25EB5C71F4F9625F4D1DF0AF19BC5DD16113257E740CA56A7E8AC0ADCF1E5E66'
$url32        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-492.0.0-windows-x86.zip'
$checksum32   = '6D5F4240F2F0178191E1459B4CDEA33BD552B4E792BBD9FA620826551B91E19E'

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
