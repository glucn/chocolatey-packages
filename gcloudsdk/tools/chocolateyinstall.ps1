$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-510.0.0-windows-x86_64.zip'
$checksum64 = '3EEF2AF555EFA44C968DAC35EF747EFA48AB4C951D18FE41BD6E863418AB809A'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-510.0.0-windows-x86.zip'
$checksum32 = '722696C72B2C49D3FE180B14665EF6A476E99FEFB6DAB1AC3358DBCA15C27341'

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
