$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://aliyuncli.alicdn.com/aliyun-cli-windows-3.0.220-amd64.zip'
$checksum64 = '73cf697b409359ba1b2446c687fce2f59e2d141101af95db8436599aea081bcf'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
