$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-502.0.0-windows-x86_64.zip'
$checksum64   = '82270AB11E486C50E552A8EC4E4152A234DDD97D23D062DEB85D5D91FAA8E5E7'
$url32        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-502.0.0-windows-x86.zip'
$checksum32   = '19FD1D359D4EFD0824F89E568B08D58D734D78C1BEE66F34B0E29DD9C43B1CE2'

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
