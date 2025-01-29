$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-508.0.0-windows-x86_64.zip'
$checksum64 = 'CC4892AEAB7FC8E5802B24C1D3EF3D0B2148947A798A7B54982527AF96715EF0'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-508.0.0-windows-x86.zip'
$checksum32 = 'F811FE8B034FEB74AE135AF83C2536F5C49F007FCEF4A029665EB06B53264F9B'

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
