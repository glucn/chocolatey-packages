$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://servicewechat.com/wxa-dev-logic/download_redirect?type=win32_x64&from=mpwiki&download_version=1062504020&version_type=1'
$checksum64   = '34C0FC442656FD271B4CC211B1D8DA7BF6A4F6341E587153918238EDF6E7CA8E'
$url32        = 'https://servicewechat.com/wxa-dev-logic/download_redirect?type=win32_ia32&from=mpwiki&download_version=1062504020&version_type=1'
$checksum32   = 'E11F66D5711AD1F9FDCBE2960FB3D8957884FE1569D41A2F6E4B677C62F87AD2'

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
