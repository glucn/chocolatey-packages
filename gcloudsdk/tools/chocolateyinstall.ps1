$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-530.0.0-windows-x86_64.zip'
$checksum64 = '9653B04CF9042C8A2875E18B052F042D35287E246B988A5E59CF16860BFE16CC'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-530.0.0-windows-x86.zip'
$checksum32 = 'FC23DE35972B920A059006652591B2F76BE10941A88595A79D057424DAADDF9A'

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
