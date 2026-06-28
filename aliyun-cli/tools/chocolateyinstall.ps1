$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://aliyuncli.alicdn.com/aliyun-cli-windows-3.4.0-amd64.zip'
$checksum64 = 'b01282f17cc88f75f9f49d3bbfb075efa3381e5d074702875541014f37b9519e'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
