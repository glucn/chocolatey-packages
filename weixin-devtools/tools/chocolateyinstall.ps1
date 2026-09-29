$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://devtools.wxqcloud.qq.com.cn/WechatWebDev/release/be1ec64cf6184b0fa64091919793f068/wechat_devtools_2.02.2608070_win32_x64.exe'
$checksum64 = 'A502DEAD2E4FB6DCB0B5E157E1F2B9AC00C10A20F1940917112A1F8481ED5ED9'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url64bit       = $url64
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  silentArgs     = "/S /allusers"
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
