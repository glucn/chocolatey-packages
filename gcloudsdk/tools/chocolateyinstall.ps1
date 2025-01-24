$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-507.0.0-windows-x86_64.zip'
$checksum64 = 'C0B45E6E0B8ACF7A9217841F0E2E9412DF68DF8DCFEC760BEA23A30743BFFEAB'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-507.0.0-windows-x86.zip'
$checksum32 = '439D14ED5B60AEBFC6F5B619658CB524E81759FD1F0E8629BD3B6D65FAA7AE8B'

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
