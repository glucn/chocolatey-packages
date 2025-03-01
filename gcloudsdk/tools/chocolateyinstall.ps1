$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-512.0.0-windows-x86_64.zip'
$checksum64 = '86EB014934EA4D44902A23E1864A44876D0A7C5A3BEF05AFC479CB19268FC06C'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-512.0.0-windows-x86.zip'
$checksum32 = 'E5285BDB5E60D0C4511396B8A61DFA9411070330247D1403C3CA5ACAA2D588DF'

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
