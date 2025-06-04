$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-525.0.0-windows-x86_64.zip'
$checksum64 = 'A8242AD3EC734FF68DD36D5B84A49E5A23E54F32CE4F67BB6D845934DE449608'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-525.0.0-windows-x86.zip'
$checksum32 = '9D5F6DB776330C4D95E5063259562E641115DDC1734C67616D4DEC9A298E613B'

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
