$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://aliyuncli.alicdn.com/aliyun-cli-windows-3.0.207-amd64.zip'
$checksum64 = '287e5d049d1dd78856a74b5d68c5a72111cccb90a0596ef0c235c854a7873fd7'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
