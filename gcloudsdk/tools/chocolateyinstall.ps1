$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-493.0.0-windows-x86_64.zip'
$checksum64   = 'C35FE8B8A1EEB446B35990A803A7A38D34EC77D9E80E6A9F5EED7C3A27B1B937'
$url32        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-493.0.0-windows-x86.zip'
$checksum32   = 'D319986B3C592350C9D68BD5E5CFE24999059D0C846CFE4182F7BA238B541F85'

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
