$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-486.0.0-windows-x86_64.zip'
$checksum64   = '9FD851D29CEB23145E002B6E2E5D349B423224C6A9FF8FDE0E65458E66CEF1E1'
$url32        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-486.0.0-windows-x86.zip'
$checksum32   = '5668956C3F9A5F713B2BE5812F1544454E54AF4550EAEC64314DDCA749B97717'

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
