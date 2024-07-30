$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://aliyuncli.alicdn.com/aliyun-cli-windows-3.0.216-amd64.zip'
$checksum64 = '38e60ddf852354a52d8c1a24ed4194620f25d350f54d7779a3180651c3fbe9f2'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
