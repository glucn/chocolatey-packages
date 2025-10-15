$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://servicewechat.com/wxa-dev-logic/download_redirect?type=win32_x64&from=mpwiki&download_version=1062504040&version_type=1'
$checksum64 = '5D88DE563D322B5DB1476597D94BB12076976F7DF99A292ED3F0C73865E33AAA'
$url32 = 'https://servicewechat.com/wxa-dev-logic/download_redirect?type=win32_ia32&from=mpwiki&download_version=1062504040&version_type=1'
$checksum32 = 'BAF5FFAB53858C73B18218856ADF6F9BC9B1FF8269F76C4E0CBB5CCA9AF5B75A'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = $url32
  url64bit       = $url64
  checksum       = $checksum32
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  silentArgs     = "/S /allusers"
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
