$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://work.weixin.qq.com/wework_admin/commdownload?platform=win'
$checksum   = '3CF8EDB8309E165C6E6D09D5B2AD90902C33D1A0518AABD9BF6F358B740F80E9'

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
