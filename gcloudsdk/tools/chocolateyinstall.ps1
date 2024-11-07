$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-500.0.0-windows-x86_64.zip'
$checksum64   = '5EC1E53BAD3D56669215A2A39606BF07D4724AA6F7B3D4F07544D09A74D27072'
$url32        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-500.0.0-windows-x86.zip'
$checksum32   = '90B5D94C182866F8A15F8390E3AFEC01871B41B94ABB8CEF1FB086B83F10F7F4'

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
