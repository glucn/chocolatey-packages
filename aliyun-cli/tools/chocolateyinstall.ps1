$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://aliyuncli.alicdn.com/aliyun-cli-windows-3.0.280-amd64.zip'
$checksum64 = '58bd3c3df9c3a247c55e2e347e54bac77ef8b4583363c710e954a72e250e6ef5'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
