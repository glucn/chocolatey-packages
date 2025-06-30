$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-528.0.0-windows-x86_64.zip'
$checksum64 = '76D2401FC69A73B4D9B5CA5DBBB47BD7E86B4CD5ECAE5335A26062558ED43E15'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-528.0.0-windows-x86.zip'
$checksum32 = 'BF2C974E48920AD0CB7EDE46A6D2C27F92DFD8782E4133AA18DEE2F7CEC41164'

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
