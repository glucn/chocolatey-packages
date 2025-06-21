$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-527.0.0-windows-x86_64.zip'
$checksum64 = '1B3A4989F23053537320836864819F95C022F1D6EDCF5E52D01FC3D0CC328BB2'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-527.0.0-windows-x86.zip'
$checksum32 = 'AED9706E5A6F8E0A40FE59F975683E461BC03473C312616556C7EA6B3443CC2B'

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
