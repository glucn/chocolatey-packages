$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-494.0.0-windows-x86_64.zip'
$checksum64   = '6EBC7069DB26253F8B7BD20D023BD442FDECD8259C9E711EAAEDC816A48B760C'
$url32        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-494.0.0-windows-x86.zip'
$checksum32   = '3DFF03C6BABA9A6DC487551D99A3F1D3CE686F4A89B05BEEFB253FE93E7E9872'

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
