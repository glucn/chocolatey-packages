$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-523.0.0-windows-x86_64.zip'
$checksum64 = 'FE6FDC84474622A1E5B24D8424BC41A8549CCEA8954365BCE1FDF44D57ED699F'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-523.0.0-windows-x86.zip'
$checksum32 = '19A7CA5A9B09BD1DC72B5D28B7952D7A44CA77E50F406DFD5C1283C08C8B04E7'

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
