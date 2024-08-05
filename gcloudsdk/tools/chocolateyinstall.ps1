$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-windows-x86_64.zip'
$checksum64   = '9FD851D29CEB23145E002B6E2E5D349B423224C6A9FF8FDE0E65458E66CEF1E1'
$url32        = 'https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-windows-x86.zip'
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

Write-Host "Adding to PATH if needed"
Install-ChocolateyPath -Path "$($toolsDir)\google-cloud-sdk\bin" -PathType 'User'
