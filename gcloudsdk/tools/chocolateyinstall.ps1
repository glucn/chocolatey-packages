$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-514.0.0-windows-x86_64.zip'
$checksum64 = '60F120D1FB0F01833335DC951AF7D4C102A14055B8F832A2054EA0F80DFFE8C6'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-514.0.0-windows-x86.zip'
$checksum32 = '15FB634800E9F488D38752DCD64AAD8073B8088329E9870B2132209412D12104'

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
