$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-515.0.0-windows-x86_64.zip'
$checksum64 = '0EF1E06481450E76164D3FBBB5CFAC00B38ABCBF536B88D1E162E40CCF76B44F'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-515.0.0-windows-x86.zip'
$checksum32 = '2E12127FB58222D4A45F66F71E6BDD11ED25E546A42524403EB4AEE50FC7899F'

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
