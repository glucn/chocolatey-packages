$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-488.0.0-windows-x86_64.zip'
$checksum64   = '8451F269F753418FA03B8D2900E3E2932CDCF803C771AB286944CC8345674E54'
$url32        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-488.0.0-windows-x86.zip'
$checksum32   = '8714C309C6116CDA6677ECE6C51E875D2F9F09F3599C8ABC0A58F7AF7C98A32A'

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
