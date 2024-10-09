$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-496.0.0-windows-x86_64.zip'
$checksum64   = '645B4FDEE23DCD47E388A96963F4FB2C1EE7ADA638F64151BFFE89CA7079EAAF'
$url32        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-496.0.0-windows-x86.zip'
$checksum32   = 'A78D5AA0F5A0D281F035C5171ABE10ED8FD72C108DE40F09BFE67130106D7469'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = $url32
  url64bit       = $url64
  checksum       = $checksum32
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyPath -Path "$($toolsDir)\google-cloud-sdk\bin"
