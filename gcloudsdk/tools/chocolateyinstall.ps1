$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-523.0.1-windows-x86_64.zip'
$checksum64 = 'E3108FC1BE76FDD4B497BF75341E20B5089121AE8F4FDE16E3E5E2EE5B2842B3'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-523.0.1-windows-x86.zip'
$checksum32 = '00A2998A6E86A6FDB7FDA8CBC4EF729E096FC19677BF4845D4807C275A6DE0F3'

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
