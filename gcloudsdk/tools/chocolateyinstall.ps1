$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-526.0.0-windows-x86_64.zip'
$checksum64 = '7E897EE568B90520D12756C8E122EA181E3530668FCD484756D71BD3D2C45BA6'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-526.0.0-windows-x86.zip'
$checksum32 = 'A49451C60D8CF8F0296594C071F0D38D573358A2E786E667AA518D8B9F1E5464'

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
