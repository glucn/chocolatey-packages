$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-509.0.0-windows-x86_64.zip'
$checksum64 = '724297A539E2D05D69FE52692731BB0904A35747337F593B1D3EA7D3C29F8B08'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-509.0.0-windows-x86.zip'
$checksum32 = '8A1D1D4CBDB62BC94F72D399F0043A0D5F3C509A3F9B775C6FDF4144A5393CC2'

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
