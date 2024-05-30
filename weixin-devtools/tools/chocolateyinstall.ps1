$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://servicewechat.com/wxa-dev-logic/download_redirect?type=win32_x64&from=mpwiki&download_version=1062405010&version_type=1'
$checksum64   = 'DAC98F887320F29D3E2B899888E476FF9D05E0955C0969125198F50996FE3B2A'
$url32        = 'https://servicewechat.com/wxa-dev-logic/download_redirect?type=win32_ia32&from=mpwiki&download_version=1062405010&version_type=1'
$checksum32   = '13153394BB85C2856254CA2658BC3AED42751082CCA464A2F2C468A0568E0CC5'

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
