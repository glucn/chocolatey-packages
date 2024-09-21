$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://aliyuncli.alicdn.com/aliyun-cli-windows-3.0.222-amd64.zip'
$checksum64 = 'c6e3a0cb4b1076154875ca9bd81cc2fd0abde1c6461b7273018ce8d2f15e4a85'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
