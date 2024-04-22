
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://aliyuncli.alicdn.com/aliyun-cli-windows-3.0.202-amd64.zip'
$checksum64 = '996bf2c0ba21ebf711c4bb441a720c347926a75bd6292756fb2af99df56f87a4'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'ZIP'
  url64bit      = $url64
  softwareName  = 'aliyun-cli*'

  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs










    








