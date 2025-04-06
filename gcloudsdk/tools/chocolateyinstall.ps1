$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-517.0.0-windows-x86_64.zip'
$checksum64 = '828E781847EB165C98CF34A2025A351A705E41C8DA5185853F6D8359E8021657'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-517.0.0-windows-x86.zip'
$checksum32 = '41025FD0CEEC2E8D2B9492A7BDB9A5740CF48D4F65B49453826461AEB74E1E29'

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
