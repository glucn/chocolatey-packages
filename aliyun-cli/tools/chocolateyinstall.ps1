$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://aliyuncli.alicdn.com/aliyun-cli-windows-3.0.252-amd64.zip'
$checksum64 = 'e7ad573e49678d418daed19f36562fcae241428414e5d41adf6dcac5b91965a2'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
