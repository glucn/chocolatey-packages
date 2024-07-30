$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://servicewechat.com/wxa-dev-logic/download_redirect?type=win32_x64&from=mpwiki&download_version=1062405020&version_type=1'
$checksum64   = 'C5F71BC808FE92F9F17F9320555FC94E39B6DB4DB78492BDA1F484C2C9630BC7'
$url32        = 'https://servicewechat.com/wxa-dev-logic/download_redirect?type=win32_ia32&from=mpwiki&download_version=1062405020&version_type=1'
$checksum32   = '52CC0BD75116356D7F7535E08B60E44C16F9AD0378AD15581F7497E53604F223'

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
