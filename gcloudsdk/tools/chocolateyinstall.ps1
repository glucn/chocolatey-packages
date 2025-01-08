$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-505.0.0-windows-x86_64.zip'
$checksum64 = 'D258C1495CC2AEBDFFB07306A240C0FBCAD6F630795B20A5A5F3AFB0CF6D7C0B'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-505.0.0-windows-x86.zip'
$checksum32 = 'F3388A9A5D12B5AC790605D5CD04CCB5D2E3D66485AE06E79329786E3E6214F5'

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
