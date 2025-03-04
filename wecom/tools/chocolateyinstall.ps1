$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://work.weixin.qq.com/wework_admin/commdownload?platform=win'
$checksum   = '065F56C41514451820C8F4A1037133321106B7026F00991492B2F7AA235414A5'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = $url
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "/S /allusers"
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
