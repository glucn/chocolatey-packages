$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-504.0.1-windows-x86_64.zip'
$checksum64 = '02665DC0B9C76C154029E921CECD493DA8023DE491439C99557CF36FD4B4D954'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-504.0.1-windows-x86.zip'
$checksum32 = 'C5C00ECAC095E60FA347B124C024496E7AF3CF3D61DE5A68BE766EE7C997B987'

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
