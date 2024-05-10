$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://aliyuncli.alicdn.com/aliyun-cli-windows-3.0.205-amd64.zip'
$checksum64 = '261e0c587a93aa534d225726756ae95096cf68fe19c89e89d940a07ed11beb56'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
