$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://aliyuncli.alicdn.com/aliyun-cli-windows-3.3.3-amd64.zip'
$checksum64 = 'dce13df098a3b7b3874a0473724852e99e6b456bc9cc4dc6591eebde0fd46545'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
