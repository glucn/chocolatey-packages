$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-520.0.0-windows-x86_64.zip'
$checksum64 = '47510F6340D98F7E46DF69A4FB6CBE71EEFF4B9D5A297D87474B9EAA42A89D9C'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-520.0.0-windows-x86.zip'
$checksum32 = '2C5897A12F0BBA9B25A6F12E6DE90C5BC4E047892FAA455D361B359C9A2C67F4'

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
