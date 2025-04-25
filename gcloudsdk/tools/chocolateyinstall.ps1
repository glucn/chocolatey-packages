$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-519.0.0-windows-x86_64.zip'
$checksum64 = 'B88B32979DEFCD078688418165F937BF0F4AFCF6DE965237EF226E57BFA84DE1'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-519.0.0-windows-x86.zip'
$checksum32 = '5C9F79624A16E808AAA21F83F75F1D21394901242156FE22D51BF4489AF636B6'

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
